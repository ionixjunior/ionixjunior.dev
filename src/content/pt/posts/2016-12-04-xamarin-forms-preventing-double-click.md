+++
title = "Xamarin.Forms – Prevenindo duplo clique"
date = 2016-12-04
type = "post"
slug = "xamarin-forms-preventing-double-click"
translationKey = "xamarin-forms-preventing-double-click"
categories = ["TODO"]
tags = ["xamarin"]
+++

Olá, estou de volta! Hoje vou falar sobre uma situação que enfrentei essa semana e precisei bolar uma solução. Vou falar sobre duplo clique na navegação do mobile ( se é que podemos chamar assim ).

Ao liberar um aplicativo para testes, alguns usuários disseram “olha aqui o que consegui fazer…”. Então, eu fiz aquela cara de “o que vocês fizeram dessa vez…” e fui verificar. Identifiquei que o usuário havia clicado 2x em um determinado botão, fazendo com que abrisse 2x a página solicitada. Neste caso relatado, o usuário nem teve culpa ou maldade. Sem querer ( eu prefiro acreditar nisso! ), ele clicou rapidamente mais de uma vez no botão e o problema aconteceu. Vale mencionar que o app não travou, ele apenas abriu a mesma página mais de uma vez, algo similar a isso:

<figure>
	<img src="/img/duplo-clique-app-mobile.gif" alt="Exemplo de duplo clique sendo realizado em uma tela do app."> 
	<figcaption>Exemplo de duplo clique sendo realizado em uma tela do app.</figcaption>
</figure>

Com isso, lembrei que quando comecei a trabalhar com desenvolvimento mobile, eu já havia perguntando isso para um desenvolvedor que trabalhava na Xamarin e ele respondeu o seguinte:

<blockquote>For the button issues, you may need to modify the events handling the button click event so that it disables the button after it has been clicked once. Although, in a real case your users should not be performing a "double-click" type of event.</blockquote>

E agora, o que fazer? Confiar no usuário?? Acreditar que ele não vai realmente querer te trollar e “sair fazendo” o que não deve no app???

Resolvi não confiar, então, implementei uma simples validação na navegação para resolver esse problema.

### A solução

A solução que vou citar leva em consideração que temos um sistema de navegação centralizado, então, tornou fácil a implementação dessa validação.

O cenário é o seguinte: temos 2 páginas, Page1View e Page2View. Na Page1View, temos um botão. Este botão tem um comando, que ao clicar, irá chamar a Page2View, como pode ser visto abaixo na view ( xaml e code behind ):

{%- highlight xml -%}
<?xml version="1.0" encoding="UTF-8"?>
<ContentPage 
    xmlns="http://xamarin.com/schemas/2014/forms" 
    xmlns:x="http://schemas.microsoft.com/winfx/2009/xaml" 
    x:Class="Core.Views.Page1View"
    Title="Page 1"
>
    <ContentPage.Content>
        <StackLayout>
            <Button
                Text="Goto page 2"
                Command="{Binding GotoPage2Command}"
            ></Button>
        </StackLayout>
    </ContentPage.Content>
</ContentPage>
{%- endhighlight -%}

{%- highlight cs -%}
using Core.ViewModels;
using Xamarin.Forms;

namespace Core.Views
{
    public partial class Page1View : ContentPage
    {
        public Page1View()
        {
            InitializeComponent();
            BindingContext = new Page1ViewModel();
        }
    }
}
{%- endhighlight -%}

E abaixo, a implementação do view model desta página:

{%- highlight cs -%}
using System.Threading.Tasks;
using System.Windows.Input;
using Core.Interfaces;
using Xamarin.Forms;

namespace Core.ViewModels
{
    public class Page1ViewModel : BaseViewModel
    {
        public ICommand GotoPage2Command => new Command(async () => await GotoPage2());

        private async Task GotoPage2()
        {
            await DependencyService.Get<INavigationHelper>().GotoPage2();
        }
    }
}
{%- endhighlight -%}

Vejam que na execução do comando, o algoritmo utiliza DependencyService para carregar a implementação de INavigationHelper, e assim, consumir o método GotoPage2 para navegar para próxima página. Neste interface, consta todos as navegações que o app irá ter, neste caso, temos apenas 1 página:

{%- highlight cs -%}
using System.Threading.Tasks;

namespace Core.Interfaces
{
    public interface INavigationHelper
    {
        Task GotoPage2();
    }
}
{%- endhighlight -%}

No App.xaml.cs, registrei a dependência, informando ao DependencyService que para resolver a interface INavigationHelper deve utilizar a implementação NavigationHelper.

{%- highlight cs -%}
using Core.Helpers;
using Core.Interfaces;
using Core.Views;
using Xamarin.Forms;

namespace Core
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            DependencyService.Register<INavigationHelper, NavigationHelper>();

            MainPage = new NavigationPage(new Page1View());
        }
    }
}
{%- endhighlight -%}

E aqui temos a implementação do NavigationHelper:

{%- highlight cs -%}
using System;
using System.Threading.Tasks;
using Core.Interfaces;
using Core.Views;
using Xamarin.Forms;

namespace Core.Helpers
{
    public class NavigationHelper : INavigationHelper
    {
        private bool _isNavigating = false;

        public async Task GotoPage2()
        {
            await Navigate(new Page2View());
        }

        private async Task Navigate(Page page)
        {
            if (_isNavigating)
                return;

            _isNavigating = true;
            await Application.Current.MainPage.Navigation.PushAsync(page);

            Device.StartTimer(
                TimeSpan.FromMilliseconds(500), 
                () => _isNavigating = false
            );
        }
    }
}
{%- endhighlight -%}

Na implementação do NavigationHelper, existe um método privado chamado Navigate, e o objetivo aqui é que todas as chamadas de páginas sejam executadas por este método, pois o “pulo do gato” esta na validação existente nele, onde é verificado se já está sendo navegado. Caso sim, a operação é abortada. Caso contrário, o atributo _isNavigating é alterado para true, executado a operação e após 500 milissegundos é retornado o estado original do atributo, _isNavigating = false.

Pronto, resolvido o problema. E aí, o que achou? Ah, neste caso, eu consegui apenas fazer a simulação deste problema no Android, ok? No iOS o problema não aconteceu com o componente Button utilizado no projeto.

Talvez essa solução não seja tão elegante, mas resolveu o problema e os usuários agora já não irão mais conseguir fazer isso!

Se você tem alguma idéia melhor ou conhece uma implementação mais aprimorada em relação a isso, favor deixe seu comentário.

O link do projeto de exemplo que criei encontra-se no [Github][projeto].

Abraço!

[projeto]: https://github.com/ionixjunior/XFNavigation