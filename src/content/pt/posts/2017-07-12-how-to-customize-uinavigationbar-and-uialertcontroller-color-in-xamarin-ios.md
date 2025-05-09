+++
layout: post
title = "Como customizar cor do UINavigationBar e UIAlertController no Xamarin.iOS"
date:   2017-07-12
translations: ["en"]
tags: ["xamarin", "ios"]
redirect_from:
    - /como-customizar-cor-do-uinavigationbar-e-uialertcontroller-no-xamarin-ios/
+++

<p class="intro"><span class="dropcap">F</span>ala galera, beleza? Já faz um tempo que queria escrever aqui no blog. Felizmente, hoje tive a oportunidade de compartilhar com vocês mais uma coisa que aprendi nos últimos dias. Este post fala sobre como customizar os estilos de alguns elementos de UI no Xamarin.iOS em apps desenvolvidos com Xamarin.Forms. Vamos lá!</p>

Para exemplificar, criei um novo app com **Xamarin.Forms**. Nele, adicionei uma página de início com uma barra de navegação e inseri dois botões no corpo da página e mais um botão na barra de navegação, e obti este maravilhoso resultado compilando no **iOS**:

<figure>
	<img src="/assets/img/como-customizar-cor-do-uinavigationbar-e-uialertcontroller-no-xamarin-ios-exemplo-01-577x1024.png" width="300" alt="Navigation bar com cor padrão"> 
	<figcaption>Navigation bar com cor padrão</figcaption>
</figure>

Lindo né? Então experimente mostrar isso para alguém que espera que o aplicativo seja bonito. Provavelmente será um desastre! Qual será o próximo passo então? Acertou quem disse customizar as cores. Mas como fazer?
A maneira mais simples e mais rápida é adicionar um style nos resources do nosso projeto compartilhado e customizar a cor de fundo da barra de navegação e a cor da letra da mesma. O arquivo que estamos falando é o **App.xaml**. Customizamos da seguinte maneira:

{%- highlight xml -%}
<?xml version="1.0" encoding="utf-8"?>
<Application xmlns="http://xamarin.com/schemas/2014/forms" xmlns:x="http://schemas.microsoft.com/winfx/2009/xaml" x:Class="Core.App">
    <Application.Resources>
        <ResourceDictionary>
            <Color x:Key="MainColor">#48bb6f</Color>
            <Color x:Key="MainBarTextColor">White</Color>

            <Style TargetType="NavigationPage">
                <Setter Property="BarBackgroundColor" Value="{StaticResource MainColor}" />
                <Setter Property="BarTextColor" Value="{StaticResource MainBarTextColor}" />
            </Style>
        </ResourceDictionary>
    </Application.Resources>
</Application>
{%- endhighlight -%}

Como resultado, temos:

<figure>
	<img src="/assets/img/como-customizar-cor-do-uinavigationbar-e-uialertcontroller-no-xamarin-ios-exemplo-02-577x1024.png" width="300" alt="Navigation bar com cor customizada"> 
	<figcaption>Navigation bar com cor customizada</figcaption>
</figure>

Nossa! Já sou designer! rsrs
Porém, ainda existem aqueles botões que continuam com o estilo padrão do **iOS**, em azul. Vamos customiza-los também, apenas adicionando mais um estilo aos resources:

{%- highlight xml -%}
<?xml version="1.0" encoding="utf-8"?>
<Application xmlns="http://xamarin.com/schemas/2014/forms" xmlns:x="http://schemas.microsoft.com/winfx/2009/xaml" x:Class="Core.App">
    <Application.Resources>
        <ResourceDictionary>
            <Color x:Key="MainColor">#48bb6f</Color>
            <Color x:Key="MainBarTextColor">White</Color>

            <Style TargetType="NavigationPage">
                <Setter Property="BarBackgroundColor" Value="{StaticResource MainColor}" />
                <Setter Property="BarTextColor" Value="{StaticResource MainBarTextColor}" />
            </Style>

            <Style TargetType="Button">
                <Setter Property="TextColor" Value="{StaticResource MainColor}" />
            </Style>
        </ResourceDictionary>
    </Application.Resources>
</Application>
{%- endhighlight -%}

Agora sim, bem melhor...

<figure>
	<img src="/assets/img/como-customizar-cor-do-uinavigationbar-e-uialertcontroller-no-xamarin-ios-exemplo-03-577x1024.png" width="300" alt="Botões da tela com cor customizada"> 
	<figcaption>Botões da tela com cor customizada</figcaption>
</figure>

Agora você sai animado com seu app "todo estilizado" e vai implementar um botão que deve fazer uma pergunta ao usuário. Então, após implementar vamos testar e...

<figure>
	<img src="/assets/img/como-customizar-cor-do-uinavigationbar-e-uialertcontroller-no-xamarin-ios-exemplo-04-577x1024.png" width="300" alt="Dialog exibido com botões na cor padrão"> 
	<figcaption>Dialog exibido com botões na cor padrão</figcaption>
</figure>

Olha o botão azul, padrão, novamente… Dai a pessoa fala:

<blockquote>...mas eu alterei a cor dos botões, eu juro...</blockquote>

A pessoa programadora não está errada, porém, acontece que este botão pertence ao **UIAlertController** e está fora do alcance da estilização do **Button**, que realizamos lá nos styles do **Xamarin.Forms**. E agora? Calma, devemos fazer uma customização lá no **Xamarin.iOS**, assim teremos o resultado que desejamos. Legal, mas como faz?

No **AppDelegate.css** iremos criar um novo método para definir nossos estilos personalizados, que chamei de **BuildStyles** neste projeto de exemplo. Como já havia definido as cores padrões nos resources lá do projeto compartilhado, carreguei estes resources e as cores definidas e converti o **Color** do **Xamarin.Forms** em **UIColor** do **iOS**, então apliquei o estilo a um determinado objeto do **UIKit**.

Como o componente que queremos estilizar é o **UIAlertController**, inicialmente procurei a propriedade **Appearance** neste objeto, mas sem sucesso. Só depois descobri que o objeto **UIView** seria o responsável por fazer essa estilização, não somente no **UIAlertController**, mas também em outros elementos de UI do **iOS**. No final, chamei o método para carregar os estilos no **FinishedLaunching** após a chamada do **Xamarin.Forms**, pois o método de estilos chama os resources do **Xamarin.Forms**, fique ligado nisso.

{%- highlight cs -%}
using Foundation;
using UIKit;
using System;

public partial class AppDelegate : global::Xamarin.Forms.Platform.iOS.FormsApplicationDelegate
{
    public override bool FinishedLaunching(UIApplication app, NSDictionary options)
    {
        global::Xamarin.Forms.Forms.Init();

        LoadApplication(new App());
        BuildStyles();

        return base.FinishedLaunching(app, options);
    }

    private void BuildStyles()
    {
        var xfResources = Xamarin.Forms.Application.Current.Resources;
        if (xfResources == null)
            return;

        var mainColor = "MainColor";
        var mainBarTextColor = "MainBarTextColor";

        if (!xfResources.ContainsKey(mainColor) || !xfResources.ContainsKey(mainBarTextColor))
            return;

        var xfMainColor = (Xamarin.Forms.Color)xfResources[mainColor];
        var xfMainBarTextColor = (Xamarin.Forms.Color)xfResources[mainBarTextColor];

        var uiMainColor = UIColor.FromRGB(
            (nfloat)xfMainColor.R,
            (nfloat)xfMainColor.G,
            (nfloat)xfMainColor.B
        );

        var uiMainBarTextColor = UIColor.FromRGB(
            (nfloat)xfMainBarTextColor.R,
            (nfloat)xfMainBarTextColor.G,
            (nfloat)xfMainBarTextColor.B
        );

        UIView.Appearance.TintColor = uiMainColor;
    }
}
{%- endhighlight -%}

Agora sim a pessoa programadora vibra e diz:

<blockquote>eu te disse que tinha feito...</blockquote>

<figure>
	<img src="/assets/img/como-customizar-cor-do-uinavigationbar-e-uialertcontroller-no-xamarin-ios-exemplo-05-577x1024.png" width="300" alt="Dialog exibido com botões em cor customizada"> 
	<figcaption>Dialog exibido com botões em cor customizada</figcaption>
</figure>

Por fim, faremos mais uma implementação, que consiste em exibir uma imagem utilizando o visualizador de arquivos padrão de cada plataforma. Neste exemplo, utilizaremos o **DependencyService** para invocar o **QuickLookPreview** do **iOS** para chamar uma imagem que está na pasta **Resources** da plataforma. Vamos ver como fica:

<figure>
	<img src="/assets/img/como-customizar-cor-do-uinavigationbar-e-uialertcontroller-no-xamarin-ios-exemplo-06-577x1024.png" width="300" alt="QuickLookPreview com botões em cor customizada"> 
	<figcaption>QuickLookPreview com botões em cor customizada</figcaption>
</figure>

Ué, mas… Onde está a barra de navegação com aquela cor esperta que havíamos definido??
Sim, definimos, porém, realizamos no objeto **NavigationPage** do **Xamarin.Forms**. Como utilizamos **DependencyService** para chamar uma view direto do **iOS**, as configurações de estilo permaneceram as padrões do **iOS**, por isso essa barra branca novamente.

Pelo menos o botão **Done** e o de compartilhamento já estão verdes, mas isso é graças a definição do estilo no **UIView**, caso contrário eles estariam azuis.

E agora, como resolver? Vamos voltar no **AppDelegate.cs** no método de estilo que criamos, e vamos adicionar o estilo ao **UINavigationBar**.

{%- highlight cs -%}
private void BuildStyles()
{
    var xfResources = Xamarin.Forms.Application.Current.Resources;
    if (xfResources == null)
        return;

    var mainColor = "MainColor";
    var mainBarTextColor = "MainBarTextColor";

    if (!xfResources.ContainsKey(mainColor) || !xfResources.ContainsKey(mainBarTextColor))
        return;

    var xfMainColor = (Xamarin.Forms.Color)xfResources[mainColor];
    var xfMainBarTextColor = (Xamarin.Forms.Color)xfResources[mainBarTextColor];

    var uiMainColor = UIColor.FromRGB(
        (nfloat)xfMainColor.R,
        (nfloat)xfMainColor.G,
        (nfloat)xfMainColor.B
    );

    var uiMainBarTextColor = UIColor.FromRGB(
        (nfloat)xfMainBarTextColor.R,
        (nfloat)xfMainBarTextColor.G,
        (nfloat)xfMainBarTextColor.B
    );

    UINavigationBar.Appearance.BarTintColor = uiMainColor;
    UINavigationBar.Appearance.TintColor = uiMainBarTextColor;
    UINavigationBar.Appearance.SetTitleTextAttributes(
        new UITextAttributes() { TextColor = uiMainBarTextColor }
    );
    UIView.Appearance.TintColor = uiMainColor;
}
{%- endhighlight -%}

Primeiro, definimos a cor na barra de navegação (linha 28). Depois definimos a cor do texto dos botões presentes na navegação (linha 29). Por último, modificamos a cor do texto presente na barra de navegação (linhas 30, 31 e 32).

Olha o que temos agora...

<figure>
	<img src="/assets/img/como-customizar-cor-do-uinavigationbar-e-uialertcontroller-no-xamarin-ios-exemplo-07-577x1024.png" width="300" alt="QuickLookPreview com navigation bar em cor customizada"> 
	<figcaption>QuickLookPreview com navigation bar em cor customizada</figcaption>
</figure>

Pronto! Agora você aprendeu como realizar algumas customizações nos estilos dos elementos do **Xamarin.iOS**.

O projeto que utilizei como exemplo está no [Github, aqui][projeto].

O que achou? Deixe seu comentário com sua opinião, sugestão, crítica ou elogio.

Abraço e até a próxima!

[projeto]: https://github.com/ionixjunior/XamarinPlayground/tree/master/XFiOSCustomStyle