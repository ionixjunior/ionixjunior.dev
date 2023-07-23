---
layout: post
title:  "Xamarin.Forms – Corrigindo a renderização do ImageCell no Android"
date:   2016-04-27
translations: ["en"]
image: imagecell-ios-and-android.png
redirect_from:
    - /xamarin-forms-corrigindo-a-renderizacao-do-imagecell-no-android/
---

<p class="intro"><span class="dropcap">A</span>o utilizar TableView no Xamarin Forms temos algumas opções de elementos para utilizar, tais como, TextCell, ImageCell, SwitchCell, EntryCell. Estes elementos citados são chamados de built-in cells. Neste artigo, vamos falar um pouco sobre o ImageCell.</p>

Com ImageCell, podemos facilmente adicionar uma imagem e textos. Vejamos uma simples utilização.

{%- highlight xml -%}
<TableView Intent="Menu">
    <TableRoot>
        <TableSection>
            <ImageCell ImageSource="location.png" Text="Localização" />
            <ImageCell ImageSource="settings.png" Text="Configurações" />
            <ImageCell ImageSource="email.png" Text="E-mail" />
        </TableSection>
    </TableRoot>
</TableView>
{%- endhighlight -%}

### O problema

Existe algumas diferenças na renderização deste componente entre as plataformas Android e iOS. No Android, quando utilizamos uma imagem muito pequena no ImageCell, esta imagem fica esticada, ocupando todo o container da imagem, que é de 60×60, confira:

<figure>
	<img src="/assets/img/default-imagecell-ios-and-android.png" alt="Exibição padrão do ImageCell no iOS e Android."> 
	<figcaption>Exibição padrão do ImageCell no iOS e Android.</figcaption>
</figure>

### A solução

Bom, felizmente temos duas soluções para resolver este problema. Vamos explora-las.

Para os exemplos que serão mostrados, foi adicionado uma página contendo um TableView com três opções, cada um contendo uma imagem e um texto descritivo.

### Solução 1 – Customizando o ViewCell

Uma das maneiras mais fáceis é não utilizar o ImageCell e customizar a célula a ser renderizada, tendo assim flexibilidade para manipular cada elemento adicionado.

{%- highlight xml -%}
<TableView Intent="Menu">
    <TableRoot>
        <TableSection>
            <ViewCell>
                <StackLayout Padding="15, 5, 15, 5" Orientation="Horizontal">
                    <Image Source="location.png" />
                    <Label Text="Localização" VerticalOptions="Center" />
                </StackLayout>
            </ViewCell>
            
            <ViewCell>
                <StackLayout Padding="15, 5, 15, 5" Orientation="Horizontal">
                    <Image Source="settings.png" />
                    <Label Text="Configurações" VerticalOptions="Center" />
                </StackLayout>
            </ViewCell>

            <ViewCell>
                <StackLayout Padding="15, 5, 15, 5" Orientation="Horizontal">
                    <Image Source="email.png" />
                    <Label Text="E-mail" VerticalOptions="Center" />
                </StackLayout>
            </ViewCell>
        </TableSection>
    </TableRoot>
</TableView>
{%- endhighlight -%}

Desta forma, conseguimos obter um resultado satisfatório, vejamos:

<figure>
	<img src="/assets/img/viewcell-ios-and-android.png" alt="Exibição com ViewCell no iOS e Android."> 
	<figcaption>Exibição com ViewCell no iOS e Android.</figcaption>
</figure>

Funcionou para o Android, porém, acredito que essa solução ainda não seja a ideal. Se prestarmos atenção, iremos perceber que na renderização do iOS houve uma pequena diferença. Vamos analisar a renderização do ImageCell padrão e do ViewCell customizado, recém criado.

Note que na imagem da esquerda ( renderizado com ImageCell ) a linha que delimita as células começa a partir do texto, enquanto na imagem da direita ( renderizado com ViewCell customizado ) essa linha começa juntamente com a imagem.

<figure>
	<img src="/assets/img/comparacao-imagecell-e-viewcell-no-ios.jpg" alt="Comparação do ImageCell com o ViewCell no iOS."> 
	<figcaption>Comparação do ImageCell com o ViewCell no iOS.</figcaption>
</figure>

Isso parece ser um detalhe simples, mas na minha opinião, é uma evidência clara de que não estamos utilizando o padrão que a plataforma propõe. Além disso, em grandes listas, poderemos ter problemas com performance na renderização destas células customizadas. Se você conferir na documentação, a sugestão do Xamarin é sempre utilizar built-in cells, ou seja, ImageCell, TextCell…

Então, o que fazer? Vamos analisar a solução 2 para descobrir.

### Solução 2 – Implementando ImageCellRenderer no Android

Vamos ter um pouco mais de trabalho para essa implementação, mas iremos garantir um melhor comportamento em ambas as plataformas.

Primeiro, vamos criar nosso próprio custom control do ImageCell:

{%- highlight cs -%}
using System;
using Xamarin.Forms;

namespace Core.Controls
{
    public class CustomImageCell : ImageCell
    {
    }
}
{%- endhighlight -%}

Em seguida, vamos atualizar o XAML para referenciar o custom control recém criado:

{%- highlight xml -%}
<?xml version="1.0" encoding="UTF-8"?>
<ContentPage xmlns="http://xamarin.com/schemas/2014/forms" 
             xmlns:x="http://schemas.microsoft.com/winfx/2009/xaml" 
             xmlns:control="clr-namespace:Core.Controls;assembly=Core"  
             x:Class="Core.Views.HomeView" 
             Title="Home">
    <ContentPage.Content>
        <TableView Intent="Menu">
            <TableRoot>
                <TableSection>
                    <control:CustomImageCell ImageSource="location.png" Text="Localização" />
                    <control:CustomImageCell ImageSource="settings.png" Text="Configurações" />
                    <control:CustomImageCell ImageSource="email.png" Text="E-mail" />
                </TableSection>
            </TableRoot>
        </TableView>
    </ContentPage.Content>
</ContentPage>
{%- endhighlight -%}

Agora, basta personalizarmos a aparência do nosso custom control na plataforma Android.

{%- highlight cs -%}
using System;
using Xamarin.Forms.Platform.Android;
using Xamarin.Forms;
using Core.Droid.Renders;
using Core.Controls;
using Android.Widget;

[assembly: ExportRenderer (typeof (CustomImageCell), typeof (CustomImageCellRenderer))]
namespace Core.Droid.Renders
{
    public class CustomImageCellRenderer : ImageCellRenderer
    {
        protected override Android.Views.View GetCellCore (Cell item, Android.Views.View convertView, Android.Views.ViewGroup parent, Android.Content.Context context)
        {
            LinearLayout cell = (LinearLayout)base.GetCellCore (item, convertView, parent, context);
            ImageView image = (ImageView)cell.GetChildAt (0);
            image.SetScaleType (ImageView.ScaleType.Center);
            return cell;
        }
    }
}
{%- endhighlight -%}

O mais importante aqui é a configuração que estamos aplicando para a imagem, onde configuramos o ScaleType Center. Com isso, já conseguimos realizar a renderização mais adequada no Android:

<figure>
	<img src="/assets/img/imagecell-ios-and-android.png" alt="Exibição padrão no iOS e custom renderer no Android."> 
	<figcaption>Exibição padrão no iOS e custom renderer no Android.</figcaption>
</figure>

Note que não personalizamos a aparência no iOS, somente especificamos a aparência no Android, portanto, no iOS continua a renderização do ImageCell padrão, que já estava adequada.

Pronto! O que achou? Deixe seu comentário, sendo critica ou sugestão.

Você também pode baixar o projeto e testar cada cenário relatado no post. O repositório está no [GitHub][projeto].

Por hoje é só, abraço!

[projeto]: https://github.com/ionixjunior/XFImageCellApp