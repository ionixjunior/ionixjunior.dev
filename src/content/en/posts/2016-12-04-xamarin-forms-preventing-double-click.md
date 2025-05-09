+++
layout: post
title = "Xamarin.Forms - Preventing double click"
date:   2016-12-04
translations: ["pt"]
tags: ["xamarin"]
+++

<p class="intro"><span class="dropcap">H</span>i, I'm back! Today I'm going to talk about a situation I faced this week and had to come up with a solution. I'm going to talk about double clicking on mobile navigation (if we can call it that).</p>

When releasing an app for testing, some users said "look what I managed to do...". So, I made that face of "what did you guys do this time..." and went to check. I identified that the user had clicked 2x on a certain button, causing the requested page to open 2x. In this reported case, the user was not even at fault or malicious. Unintentionally (I prefer to believe that!), he clicked quickly more than once on the button and the problem happened. It is worth mentioning that the app did not crash, it just opened the same page more than once, something similar to this:

<figure>
	<img src="/assets/img/duplo-clique-app-mobile.gif" alt="Example of double click being performed on an app screen."> 
	<figcaption>Example of double click being performed on an app screen.</figcaption>
</figure>

With that, I remembered that when I started working with mobile development, I had already asked this to a developer who worked at Xamarin and he replied the following:

<blockquote>For the button issues, you may need to modify the events handling the button click event so that it disables the button after it has been clicked once. Although, in a real case your users should not be performing a "double-click" type of event.</blockquote>

And now, what to do? Trust the user?? Believe that he really won't want to troll you and "go doing" what he shouldn't in the app???

I decided not to trust, so I implemented a simple validation in navigation to solve this problem.

### The solution

The solution I will mention takes into account that we have a centralized navigation system, so it was easy to implement this validation.

The scenario is as follows: we have 2 pages, Page1View and Page2View. On Page1View, we have a button. This button has a command, which when clicked, will call Page2View, as can be seen below in the view (xaml and code behind):

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

And below is the implementation of this page's view model:

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

Notice that in the execution of the command, the algorithm uses DependencyService to load the implementation of INavigationHelper, and thus consume the GotoPage2 method to navigate to the next page. In this interface are all navigations that the app will have, in this case we have only 1 page:

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

In App.xaml.cs, I registered the dependency, informing DependencyService that to resolve INavigationHelper interface it should use NavigationHelper implementation.

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

And here is the implementation of NavigationHelper:

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

In the implementation of NavigationHelper, there is a private method called Navigate, and the goal here is that all page calls are executed by this method, because the "trick" is in the validation that exists in it, where it is checked if it is already being navigated. If so, the operation is aborted. Otherwise, the _isNavigating attribute is changed to true, the operation is executed and after 500 milliseconds the original state of the attribute is returned, _isNavigating = false.

Ready, problem solved. And then, what did you think? Ah, in this case, I was only able to simulate this problem on Android, ok? On iOS the problem did not happen with the Button component used in the project.

Maybe this solution is not so elegant, but it solved the problem and users will no longer be able to do that!

If you have a better idea or know a more refined implementation regarding this, please leave your comment.

The link to the example project I created can be found on [Github][project].

Hug!

[project]: https://github.com/ionixjunior/XFNavigation