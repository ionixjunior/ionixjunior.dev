---
layout: post
title:  "Customizando SeparatorInset do UITableView do iOS – Xamarin.Forms"
date:   2018-07-30
---

<p class="intro"><span class="dropcap">A</span>viso importante: este é um post destinado para pessoas desenvolvedoras perfeccionistas. Olá, pessoal! Hoje trouxe uma pequena dica de como customizar o SeparatorInset de um UITableView do iOS em uma aplicação com Xamarin.Forms. Mas afinal, o que é isso? Do que estamos falando? Vamos conferir neste post!</p>

Como mencionei no início do post, somente irá perceber este detalhe quem realmente é perfeccionista, então, vamos mostrar algumas coisas que acontecem no desenvolvimento **iOS** com **Xamarin.Forms** antes de chegar no assunto principal do post.

Falando no desenvolvimento de uma tela com **ListView**, podemos construir os itens do mesmo utilizando built-in cells – lembra deles? **TextCell**, **ImageCell**, **SwichCell**, **EntryCell** – ou então com um **ViewCell** contendo a customização que você deseja.

Olhando para um **ListView** populado com um **TextCell** em seus itens, temos o seguinte resultado:

<figure>
	<img src="/assets/img/text-cell-577x1024.png" width="300" alt="ListView usando TextCell em cada item"> 
	<figcaption>ListView usando TextCell em cada item</figcaption>
</figure>

Agora, vamos popular essa mesma lista utilizando um **ImageCell**, teremos o seguinte resultado:

<figure>
	<img src="/assets/img/image-cell-577x1024.png" width="300" alt="ListView usando ImageCell em cada item"> 
	<figcaption>ListView usando ImageCell em cada item</figcaption>
</figure>

Comparando as duas imagens, podemos ver que a linha separadora de cada item tem uma margem definida à esquerda do elemento. Essa margem tem um valor padrão do **iOS** quando utilizado o **TextCell**, diferente do **ImageCell** que tem a margem em relação a imagem inserida.

Provavelmente você já havia notado isso. Agora, vamos para a parte que talvez você nunca havia prestado atenção ou dado importância: Vamos customizar este mesmo **ListView** utilizando o **ViewCell** nos itens:

<figure>
	<img src="/assets/img/view-cell-577x1024.png" width="300" alt="ListView usando ViewCell em cada item"> 
	<figcaption>ListView usando ViewCell em cada item</figcaption>
</figure>

Veja o que aconteceu: A margem do separador dos itens agora não respeita a imagem inserida, está com o mesmo espaçamento do exemplo do **TextCell**. Confira abaixo a comparação dos exemplos mostrados:

<figure>
	<img src="/assets/img/comparacao-cells.png" width="600" alt="Comparação entre TextCell, ImageCell e ViewCell"> 
	<figcaption>Comparação entre TextCell, ImageCell e ViewCell</figcaption>
</figure>

Isso acontece pois como a inserção dos controles no **ViewCell** é dinâmica, o **Xamarin.Forms** não consegue descobrir de forma automática qual deve ser o espaçamento da margem esquerda do separador da lista.

Antes de falar em "como resolver isso", apenas gostaria de deixar claro que isso não é um problema ou erro. Na minha opinião, é apenas um capricho que, quem for muito detalhista, vai querer customizar para ficar com a aparência do comportamento padrão do **iOS**.

Legal, mas como "resolver"? Simples, basta criar um render para o **ViewCell** e fazer a sobrecarga do **GetCell** para customizar manualmente o atributo **SeparatorInset** do **UITableView**, como pode ser visto abaixo:

{%- highlight cs -%}
using Core.Controls;
using Core.iOS.Renderers;
using UIKit;
using Xamarin.Forms;
using Xamarin.Forms.Platform.iOS;

[assembly: ExportRenderer(typeof(CustomViewCell), typeof(CustomViewCellRenderer))]
namespace Core.iOS.Renderers
{
    public class CustomViewCellRenderer : ViewCellRenderer
    {
        public override UITableViewCell GetCell(Cell item, UITableViewCell reusableCell, UITableView tv)
        {
            tv.SeparatorInset = new UIEdgeInsets(0, 66, 0, 0);

            return base.GetCell(item, reusableCell, tv);
        }
    }
}
{%- endhighlight -%}

Note que o valor inserido para a margem foi manual e dependerá do tamanho da imagem contida no item.

Por tratar-se de um render do **ViewCell**, provavelmente, você não desejará configurar este valor para todos os **ViewCells** da aplicação, então, criei um **ViewCell** específico da lista e o utilizei no **ListView**.

Abaixo o custom control:

{%- highlight cs -%}
using Xamarin.Forms;

namespace Core.Controls
{
    public class CustomViewCell : ViewCell
    {
    }
}
{%- endhighlight -%}

Abaixo a tela:

{%- highlight xml -%}
<?xml version="1.0" encoding="UTF-8"?>
<ContentPage 
    ...
    xmlns:controls="clr-namespace:Core.Controls"
    ...
>
    <ContentPage.Content>
        <ListView
            x:Name="lvlItem"
            HasUnevenRows="true"
            RowHeight="60"
        >
            <ListView.ItemTemplate>
                <DataTemplate>
                    <controls:CustomViewCell>
                        <controls:CustomViewCell.View>
                            ...
                        </controls:CustomViewCell.View>
                    </controls:CustomViewCell>
                </DataTemplate>
            </ListView.ItemTemplate>
        </ListView>
    </ContentPage.Content>
</ContentPage>
{%- endhighlight -%}

Agora sim, o resultado final ficou mais agradável:

<figure>
	<img src="/assets/img/custom-view-cell-577x1024.png" width="300" alt="ListView usando CustomViewCell em cada item"> 
	<figcaption>ListView usando CustomViewCell em cada item</figcaption>
</figure>

Pronto! Agora o **ViewCell** com imagem está com o espaçamento padrão da margem esquerda.

O projeto de exemplo utilizado neste artigo está no [GitHub][projeto].

É isso galera, espero que tenham gostado da dica de hoje.

Um abraço e até a próxima!

[projeto]: https://github.com/ionixjunior/XamarinPlayground/tree/master/XFViewCellRenderer