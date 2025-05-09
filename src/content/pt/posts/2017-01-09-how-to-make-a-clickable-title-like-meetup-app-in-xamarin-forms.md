+++
title = "Como fazer o título clicável similar ao app Meetup no Xamarin.Forms"
date = 2017-01-09
tags = ["xamarin", "ios"]
redirect_from:
    - /como-fazer-o-titulo-clicavel-similar-ao-app-meetup-no-xamarin-forms/
+++

<p class="intro"><span class="dropcap">C</span>onhece o app Meetup? Meetup é uma rede social que tem o objetivo de facilitar reuniões em grupo offline. E por que estou falando disso? Apenas para dar uma introdução no assunto. O que quero falar hoje é sobre como fazer o título clicável do app Meetup para iOS em um app desenvolvido com Xamarin.Forms.</p>

Uma das coisas que me chamou atenção [nesse app][meetup] é a tela inicial, onde mostra o nome da cidade que você configurou, e também uma imagem de uma seta ao lado. Na verdade, esses dois elementos são um botão, que te permite clicar e ir para uma outra tela, onde você poderá redefinir a cidade selecionada.


<figure>
    <img src="/assets/img/como-fazer-o-titulo-clicavel-similar-ao-app-meetup-no-xamarinforms-577x1024.png" width="300" alt="Página inicial do Meetup"> 
    <figcaption>Página inicial do Meetup</figcaption>
</figure>

Achei essa abordagem bem bacana e inteligente, pois no geral, não temos muito espaço na tela para encher-la de botões, nem fica muito agradável para o usuário. Então, quanto mais otimizarmos o espaço livre, melhor.

Por isso pensei, como fazer o título do app Meetup em um aplicativo utilizando Xamarin.Forms? Não foi difícil e consegui fazer a implementação dele para o iOS. Futuramente irei implementar também para Android e atualizo o post aqui pra vocês, beleza?

Então vamos prosseguir?

Para começar, criei uma **ContentPage** para a página inicial e especifiquei os dois atributos configuráveis para texto e ícone. Sem a customização do render, você não verá texto e imagem lado a lado, somente um deles aparecerá.

{%- highlight xml -%}
<?xml version="1.0" encoding="utf-8"?>
<ContentPage
    xmlns="http://xamarin.com/schemas/2014/forms"
    xmlns:x="http://schemas.microsoft.com/winfx/2009/xaml"
    x:Class="Core.Views.HomeView"
    Title="Blumenau"
    Icon="arrow_down.png"
>
    <ContentPage.Content>
        <Label
            Text="Home"
            VerticalOptions="Center"
            HorizontalOptions="Center"
        />
    </ContentPage.Content>
</ContentPage>
{%- endhighlight -%}

Agora, para iniciar as customiazações, iniciei a implementação do custom render.

Minha tentativa inicial foi criar um render para o **NavigationRenderer**, mas não obti sucesso. Depois de algumas pesquisas, achei uma implementação parecida com o que eu queria, que utilizava o **PageRenderer**.

Dessa forma, criei um custom render para o **PageRenderer**, fazendo override do método **WillMoveToParentViewController**.

{%- highlight cs -%}
using Core.iOS.Renderers;
using UIKit;
using Xamarin.Forms;
using Xamarin.Forms.Platform.iOS;

[assembly: ExportRenderer(typeof(ContentPage), typeof(CustomContentPageRenderer))]
namespace Core.iOS.Renderers
{
    public class CustomContentPageRenderer : PageRenderer
    {
        public override void WillMoveToParentViewController(UIViewController parent)
        {
            base.WillMoveToParentViewController(parent);
        }
    }
}
{%- endhighlight -%}

Com isso, já é possível começar a modificar o render da **ContentPage** do nosso app feito utilizando Xamarin.Forms. Então, vamos programar neste método...

Nesse render, a lógica será: Carregar a instância da ContentPage que criamos lá com o **XAML**; Ler os seus atributos **Title** e **Icon**; Criar um novo componente visual que será um botão, contendo o título e o ícone configurados. No final, vamos atualizar o título da **NavigationPage** com o novo elemento criado. Simples assim!

Para carregar a instância da **ContentPage**, vamos utilizar o atributo **Element**, que está definido na classe **PageRenderer**. Através dele iremos conseguir acessar as propriedades **Title** e **Icon** que definimos no **XAML**.

{%- highlight cs -%}
if (Element == null)
    return;

var page = Element as ContentPage;
{%- endhighlight -%}

Agora, vamos criar um botão utilizando o **UIButton**, adicionar o título e o ícone localizado na **ContentPage**, e ainda, definir a cor do texto que irá aparecer. Vamos também adicionar esse novo objeto para ser renderizado no lugar do render padrão, utilizando a referência do **UIViewController** para acessar o **NavigationItem**.

{%- highlight cs -%}
UIButton buttonTitle = new UIButton(UIButtonType.Custom);
buttonTitle.SetTitle(page.Title, UIControlState.Normal);
buttonTitle.SetTitleColor(UIColor.Black, UIControlState.Normal);
buttonTitle.SetImage(new UIImage(page.Icon), UIControlState.Normal);

parent.NavigationItem.TitleView = buttonTitle;
{%- endhighlight -%}

Pronto, vamos ver o que dá isso:

<figure>
    <img src="/assets/img/como-fazer-o-titulo-clicavel-similar-ao-app-meetup-no-xamarinforms-imagem-01.png" width="300" alt="Navigation bar do app com botão clicável"> 
    <figcaption>Navigation bar do app com botão clicável</figcaption>
</figure>

Opa, parece que algo está errado, pois não apareceu o ícone. Mas não está errado, apenas não chamamos o método responsável por organizar o conteúdo na tela. Então, vamos chamar o **SizeToFit** no botão:

{%- highlight cs -%}
UIButton buttonTitle = new UIButton(UIButtonType.Custom);
buttonTitle.SetTitle(page.Title, UIControlState.Normal);
buttonTitle.SetTitleColor(UIColor.Black, UIControlState.Normal);
buttonTitle.SetImage(new UIImage(page.Icon), UIControlState.Normal);
buttonTitle.SizeToFit();
 
parent.NavigationItem.TitleView = buttonTitle;
{%- endhighlight -%}

Vamos conferir:

<figure>
    <img src="/assets/img/como-fazer-o-titulo-clicavel-similar-ao-app-meetup-no-xamarinforms-imagem-02.png" width="300" alt="Navigation bar do app com botão clicável e ícone aparecendo"> 
    <figcaption>Navigation bar do app com botão clicável e ícone aparecendo</figcaption>
</figure>

Melhorou! Mas a imagem está do lado esquerdo, não do lado direito. Dá pra inverter. Para isso, vamos especificar o atributo **Transform** do **UIButton**.

{%- highlight cs -%}
UIButton buttonTitle = new UIButton(UIButtonType.Custom);
buttonTitle.SetTitle(page.Title, UIControlState.Normal);
buttonTitle.SetTitleColor(UIColor.Black, UIControlState.Normal);
buttonTitle.SetImage(new UIImage(page.Icon), UIControlState.Normal);
buttonTitle.Transform = CGAffineTransform.MakeScale(-1.0f, 1.0f);
buttonTitle.SizeToFit();
 
parent.NavigationItem.TitleView = buttonTitle;
{%- endhighlight -%}

Olha só como fica:

<figure>
    <img src="/assets/img/como-fazer-o-titulo-clicavel-similar-ao-app-meetup-no-xamarinforms-imagem-03-577x1024.png" width="300" alt="Navigation bar do app com botão clicável e ícone e textos aparecendo invertidos"> 
    <figcaption>Navigation bar do app com botão clicável e ícone e textos aparecendo invertidos</figcaption>
</figure>

Ué, estou lendo árabe?? Não, é que invertemos a posição do botão. É como inverter horizontalmente em 180 graus. E agora, como resolver? Podemos aplicar também a propriedade **Transform** no título e no ícone, e aí vai dar o resultado que esperamos. Note que neste ícone, nem precisa aplicar a propriedade, mas se você tiver uma imagem que não possui os lados iguais, neste caso, vai precisar aplicar.

{%- highlight cs -%}
UIButton buttonTitle = new UIButton(UIButtonType.Custom);
buttonTitle.SetTitle(page.Title, UIControlState.Normal);
buttonTitle.SetTitleColor(UIColor.Black, UIControlState.Normal);
buttonTitle.SetImage(new UIImage(page.Icon), UIControlState.Normal);
buttonTitle.Transform = CGAffineTransform.MakeScale(-1.0f, 1.0f);
buttonTitle.TitleLabel.Transform = CGAffineTransform.MakeScale(-1.0f, 1.0f);
buttonTitle.ImageView.Transform = CGAffineTransform.MakeScale(-1.0f, 1.0f);
buttonTitle.SizeToFit();
 
parent.NavigationItem.TitleView = buttonTitle;
{%- endhighlight -%}

Olha como ficou:

<figure>
    <img src="/assets/img/como-fazer-o-titulo-clicavel-similar-ao-app-meetup-no-xamarinforms-imagem-04-577x1024.png" width="300" alt="Navigation bar do app com botão clicável e ícone e textos corrigidos"> 
    <figcaption>Navigation bar do app com botão clicável e ícone e textos corrigidos</figcaption>
</figure>

Bem melhor! Ficou mais parecido, mas ainda faltam algumas coisas. Note que o título e o ícone estão muito próximos. Podemos fazer uma "gambiarrazinha", apenas colocando alguns espaços no fim do título, ou então, utilizar a propriedade **ImageEdgeInsets** para configurar o espaçamento, o que é o mais indicado:

{%- highlight cs -%}
UIButton buttonTitle = new UIButton(UIButtonType.Custom);
buttonTitle.SetTitle(page.Title, UIControlState.Normal);
buttonTitle.SetTitleColor(UIColor.Black, UIControlState.Normal);
buttonTitle.SetImage(new UIImage(page.Icon), UIControlState.Normal);
buttonTitle.Transform = CGAffineTransform.MakeScale(-1.0f, 1.0f);
buttonTitle.TitleLabel.Transform = CGAffineTransform.MakeScale(-1.0f, 1.0f);
buttonTitle.ImageView.Transform = CGAffineTransform.MakeScale(-1.0f, 1.0f);
buttonTitle.ImageEdgeInsets = new UIEdgeInsets(0, -20, 0, 0);
buttonTitle.SizeToFit();
 
parent.NavigationItem.TitleView = buttonTitle;
{%- endhighlight -%}

Conferindo:

<figure>
    <img src="/assets/img/como-fazer-o-titulo-clicavel-similar-ao-app-meetup-no-xamarinforms-imagem-05-577x1024.png" width="300" alt="Navigation bar do app com botão clicável e espaçamento entre texto e ícone"> 
    <figcaption>Navigation bar do app com botão clicável e espaçamento entre texto e ícone</figcaption>
</figure>

Estamos quase lá! O que falta? Algumas perfumarias… Se você conferir no app do Meetup, tem mais duas características naquele título. Uma é o título em negrito e a outra é quando, ao clicarmos nele o mesmo fica em tom de cinza. Podemos fazer isso facilmente ajustando a fonte e definindo a cor cinza quando o estado do botão estiver clicado.

{%- highlight cs -%}
UIButton buttonTitle = new UIButton(UIButtonType.Custom);
buttonTitle.SetTitle(page.Title, UIControlState.Normal);
buttonTitle.SetTitleColor(UIColor.Black, UIControlState.Normal);
buttonTitle.SetImage(new UIImage(page.Icon), UIControlState.Normal);
buttonTitle.Transform = CGAffineTransform.MakeScale(-1.0f, 1.0f);
buttonTitle.TitleLabel.Transform = CGAffineTransform.MakeScale(-1.0f, 1.0f);
buttonTitle.ImageView.Transform = CGAffineTransform.MakeScale(-1.0f, 1.0f);
buttonTitle.ImageEdgeInsets = new UIEdgeInsets(0, -20, 0, 0);
buttonTitle.SetTitleColor(UIColor.Gray, UIControlState.Highlighted);
buttonTitle.TitleLabel.Font = UIFont.BoldSystemFontOfSize(14);
buttonTitle.SizeToFit();
 
parent.NavigationItem.TitleView = buttonTitle;
{%- endhighlight -%}

Vamos conferir:

<figure>
    <img src="/assets/img/como-fazer-o-titulo-clicavel-similar-ao-app-meetup-no-xamarinforms-imagem-06-577x1024.png" width="300" alt="Navigation bar do app com botão clicável e fonte customizada"> 
    <figcaption>Navigation bar do app com botão clicável e fonte customizada</figcaption>
</figure>

Olha aí, não é que deu certo!

E agora, o que falta? Falta uma característica, a principal, na minha opinião: esse botão precisa ser clicável para podermos direcionar o app para outra página. Para isso, podemos implementar o evento **TouchUpInside** do **UIButton**.

Mas agora as coisas começam a ficar um pouco mais complicadas. Pense comigo: até o momento, utilizamos o título e o ícone, atributos esses que já existem na **ContentPage**. Mas nela não existe nenhum atributo onde possamos vincular uma ação ou evento para poder realizar uma operação.

Acredito que o ideal seria estendermos a **ContentPage** e implementarmos um comando para que possamos efetuar a operação no custom render. Aí, quando clicarmos no botão, vamos capturar o evento no **TouchUpInside** e iremos chamar o comando, que estará setado na nossa **ContentPage**. Vamos tentar?

Primeiro, vamos estender a **ContentPage**, criei uma classe chamada **CustomContentPage**. Nela, implementei uma bindable property chamada **Command**.

{%- highlight cs -%}
using System.Windows.Input;
using Xamarin.Forms;

namespace Core.Controls
{
    public class CustomContentPage : ContentPage
    {
        public static readonly BindableProperty CommandProperty =
            BindableProperty.Create(
            nameof(Command),
            typeof(ICommand),
            typeof(CustomContentPage),
            null
        );

        public ICommand Command
        {
            get { return (ICommand)GetValue(CommandProperty); }
            set { SetValue(CommandProperty, value); }
        }
    }
}
{%- endhighlight -%}

No code behind da página, precisei alterar a herança da **ContentPage** para a nova página criada. Você também terá que fazer isso.

{%- highlight cs -%}
using Core.Controls;
using Core.ViewModels;

namespace Core.Views
{
    public partial class HomeView : CustomContentPage
    {
        public HomeView()
        {
            InitializeComponent();
            BindingContext = new HomeViewModel();
        }
    }
}
{%- endhighlight -%}

O **XAML** também precisou sofrer alterações, pois agora a página herda de **CustomContentPage**, portanto, precisamos alterar essa referência lá também. Notem que também foi preciso declarar o namespace onde a página que criei está localizada.

{%- highlight xml -%}
<?xml version="1.0" encoding="utf-8"?>
<controls:CustomContentPage 
    xmlns="http://xamarin.com/schemas/2014/forms"
    xmlns:x="http://schemas.microsoft.com/winfx/2009/xaml"
    xmlns:controls="clr-namespace:Core.Controls"
    x:Class="Core.Views.HomeView"
    Title="Blumenau"
    Icon="arrow_down.png"
>
    <ContentPage.Content>
        <Label
            Text="Home"
            VerticalOptions="Center"
            HorizontalOptions="Center"
        />
    </ContentPage.Content>
</controls:CustomContentPage>
{%- endhighlight -%}

Agora, podemos adicionar um comando na propriedade **Command** que tem a **CustomContentPage**.

{%- highlight xml -%}
<?xml version="1.0" encoding="utf-8"?>
<controls:CustomContentPage 
    xmlns="http://xamarin.com/schemas/2014/forms"
    xmlns:x="http://schemas.microsoft.com/winfx/2009/xaml"
    xmlns:controls="clr-namespace:Core.Controls"
    x:Class="Core.Views.HomeView"
    Title="Blumenau"
    Icon="arrow_down.png"
    Command="{Binding OpenOptionCommand}"
>
    <ContentPage.Content>
        <Label
            Text="Home"
            VerticalOptions="Center"
            HorizontalOptions="Center"
        />
    </ContentPage.Content>
</controls:CustomContentPage>
{%- endhighlight -%}

OMG! Mas que loucura! Calma que ainda piora. Agora vamos voltar lá para nosso custom render e fazer algumas customizações.

Primeiro, iremos alterar a declaração do **ExportRenderer** para realizarmos o vínculo com a **CustomContentPage**, não mais com a **ContentPage**.

{%- highlight cs -%}
[assembly: ExportRenderer(typeof(CustomContentPage), typeof(CustomContentPageRenderer))]
namespace Core.iOS.Renderers
{
    public class CustomContentPageRenderer : PageRenderer
    {
        ...
    }
}
{%- endhighlight -%}

Depois vamos customizar a implementação do **WillMoveToParentViewController**, fazendo o cast do **Element** para a classe **CustomContentPage** e implementando o evento **TouchUpInside**.

{%- highlight cs -%}
public override void WillMoveToParentViewController(UIViewController parent)
{
    base.WillMoveToParentViewController(parent);

    if (Element == null)
        return;

    var page = Element as CustomContentPage;

    UIButton buttonTitle = new UIButton(UIButtonType.Custom);
    buttonTitle.SetTitle(page.Title, UIControlState.Normal);
    buttonTitle.SetImage(new UIImage(page.Icon), UIControlState.Normal);
    buttonTitle.SetTitleColor(UIColor.Black, UIControlState.Normal);
    buttonTitle.Transform = CGAffineTransform.MakeScale(-1.0f, 1.0f);
    buttonTitle.TitleLabel.Transform = CGAffineTransform.MakeScale(-1.0f, 1.0f);
    buttonTitle.ImageView.Transform = CGAffineTransform.MakeScale(-1.0f, 1.0f);
    buttonTitle.ImageEdgeInsets = new UIEdgeInsets(0, -20, 0, 0);
    buttonTitle.SetTitleColor(UIColor.Gray, UIControlState.Highlighted);
    buttonTitle.TitleLabel.Font = UIFont.BoldSystemFontOfSize(14);
    buttonTitle.SizeToFit();
    buttonTitle.TouchUpInside += (sender, e) =>
    {
        if (page.Command == null)
            return;

        if (page.Command.CanExecute(null))
            page.Command.Execute(null);
    };

    parent.NavigationItem.TitleView = buttonTitle;
}
{%- endhighlight -%}

Pronto! E qual é o resultado disso?

<figure>
    <img src="/assets/img/como-fazer-o-titulo-clicavel-similar-ao-app-meetup-no-xamarinforms-gif-exemplo.gif" width="300" alt="Exemplo da tela implementada"> 
    <figcaption>Exemplo da tela implementada</figcaption>
</figure>

Olha aí.. Não é que deu certo mesmo!!

Esse post ficou muito grande, talvez seja melhor eu publicar as customizações do Android em um novo post. Ainda não fiz a implementação, talvez demore um pouco. Assim que tiver novidades comunico a vocês.

O código de exemplo utilizado no post está no [GitHub][projeto].

Abraço, aguardo feedback. Críticas e sugestões são sempre bem vindas ( e dinheiro na minha conta também, brincadeirinha rsrs ).

[projeto]: https://github.com/ionixjunior/XamarinPlayground/tree/master/CustomTitle
[meetup]:  https://www.meetup.com