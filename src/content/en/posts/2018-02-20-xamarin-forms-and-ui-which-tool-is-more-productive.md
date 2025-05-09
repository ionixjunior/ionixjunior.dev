+++
title = "Xamarin.Forms and UI – Which tool is more productive?"
date = 2018-02-20
tags = ["xamarin"]
+++

<p class="intro"><span class="dropcap">W</span>hen I started working with Xamarin.Forms, building interfaces was very difficult as there were no graphical tools for it; everything was done "manually". This post compares some tools that we can use to make this work a little easier.</p>

Time went by, and things remained pretty much the same. It is still laborious to develop interfaces using only the standard tools, but I didn't pay much attention to it because I got used to working this way. Acquiring some skills also helped me a lot with this acceptance. Until one day, I discovered a new tool, and since then, I can't work without it anymore.

The initial idea of this post was to present the facilities of **LiveXAML** that won me over, but I thought it would be unfair to talk only about it and present it as a revolutionary tool. We must not forget that before it, there were other products that ventured to do what **LiveXAML** does today.

So, I made a comparison between the tools **Gorilla Player**, **XAML Previewer**, **Xamarin Live Player**, and **LiveXAML**.

Straight to the point: the best tool for working on UI development with **Xamarin.Forms** today is **LiveXAML**.

Why? Let me explain...

### LiveXAML
In September 2017, when I first heard about **LiveXAML**, I thought: _"How many steps will I need to execute to make this work?"_. When I tried it, I was surprised because it was extremely easy to get started with it. I only needed to install the extension for Visual Studio and the **LiveXAML** package in the project. After that, it was a breeze!

With this extension, you can run the project on the simulator/emulator/device and change the **XAML** during project execution, seeing the changes in real-time. This makes it much easier to make modifications to screens without needing to compile, wait for deployment, and navigate to the screen to see the result, which probably won't look as you expect the first few times you try it 🙂 Not to mention that sometimes the fast deploy gets lost, and you need to rebuild the project. But now, with **LiveXAML**, everything is instantaneous.

However, **LiveXAML** is not a pioneer in this segment; there's also **Gorilla Player** from UXDivers, **XAML Previewer**, and **Xamarin Live Player**, both from **Xamarin**.

Let's get to know them:

### Gorilla Player
When I first tried **Gorilla Player**, I didn't understand how it worked and didn't like it – of course, how can I like something I don't understand? – so I abandoned it. Only now I tried using it again and managed to, but I didn't find it very practical. Actually, I think I had a similar problem to what I faced the first time: I created a very basic screen with two labels and a field, and in one of the labels, I added a converter, and **Gorilla Player** didn't find the converter I added.
So, I retried the test by removing the converter, and then I saw the "magic" happen.

### XAML Previewer
About the **XAML Previewer**, the first few times I used it, it was still in beta, with various problems and very slow. Gradually it improved, but it still consumed the entire machine every time I used it. However, it was better than nothing, and I gained a lot of speed with it, but it was still far from becoming a definitive solution.

On the Mac, it's quite easy to use: just compile the projects and click on Preview – a button located in the upper-right corner – that appears when you open a **XAML** file. Then, you just have to wait for it to render. On Windows, the option to show the **XAML Previewer** is almost hidden within Visual Studio, but it's there.

### Xamarin Live Player
I used this one the least. It's still in beta, meaning there's a lot to improve. It looks great, but it's still not possible to use it in a production app. Just to be clear, this is my opinion. If you think differently, leave your comment here so we can discuss it!

To use it, you need to enable it in the Visual Studio preferences. Then, download the application on your device and sync it with Visual Studio. After that, you can view your screens directly on your phone.

You'll forgive me, but in the example project I created, the **Xamarin Live Player** didn't work; I could only do isolated tests. When researching the reason for the problem, I found that there are still many [limitations][limitacoes-xamarin-live-player], as you can see in the link.

### Comparison
As I mentioned at the beginning of the post, I made a comparison between the tools, where I analyzed some aspects that you can check below.

I couldn't test all the aspects of **Xamarin Live Player** due to the limitations, but I included it in the post for comparison and future updates.

Here are some evaluated aspects:

### Cost
**LiveXAML** is the only paid tool. Its permanent license costs $240, and there's also a monthly subscription option, which costs $24.

Is the license expensive? Well, for us here in Brazil, multiplying that value by ~R$3.50 is not that easy, especially for an indie developer. However, if you analyze the real benefit that this tool will give you in the development environment, this cost will certainly be negligible.

### Support for custom renderers
I created a very basic project just for testing. The only one that worked perfectly was **LiveXAML**. **XAML Previewer** worked only on iOS, and **Gorilla Player** required installing the Gorilla SDK.

The Gorilla SDK is a NuGet package that needs to be installed in the project. With it, you can give instructions to **Gorilla Player** so that it can render components it doesn't recognize. I didn't focus on performing this procedure as the main objective is for the tool to be simple to use.

### Support for effects
With effects, the same happened as with custom renderers, everything was the same. **LiveXAML** in the lead 🙂

### Support for third-party components
**XAML Previewer** and **LiveXAML** were okay, only **Gorilla Player** required the SDK again. The tested component was the SfSchedule from Syncfusion.

### Support for native views
I did a very simple test by including a native label for Android and iOS. **XAML Previewer** and **LiveXAML** worked just fine. **Gorilla Player** didn't even show the SDK message, I don't think it works.

### Support for ResourceDictionary
Global and specific styles declared in the pages were all okay. All tools worked well.

### Support for ContentViews
It is common to create our own controls and import them into pages for reuse. All tools worked well with ContentViews.

### Support for multiple devices simultaneously
The only ones that stand out in this aspect are **Gorilla Player** and **LiveXAML**. With them, it's very practical, you can place the devices side by side and have one eye on the **XAML** and the other on the devices, very productive.

### Support for animations
**LiveXAML** was the only one that allowed visualizing the animation in action; the others showed the animated image of the example project statically. Not that this is very useful, especially because the effect of the animation in the example was programmed in code-behind. If it were done in **XAML**, then we would benefit from changing and seeing the effects.

### Error notifications
Congratulations to all! They all have some way of telling us that something is wrong with the elements of our UI. **LiveXAML** is the simplest, but very functional.

### Design-time data
In the example project, we created a page containing a list and a view model populating that list. When I executed the tools to view it, only **XAML Previewer** and **LiveXAML** worked correctly.

**Gorilla Player** required creating a JSON file containing the data to be displayed and some minor customization in the project, and then the information appeared. I found the way it works with this feature interesting; it's practical.

We have to take into consideration that the implementation of this project is Vanilla, meaning everything is standard. But a simple change to remove "these bad standard things from Forms" might cause **XAML Previewer** not to work. Let's assume that we want to implement ViewModel To ViewModel Navigation, and we won't explicitly specify the BindingContext in the pages; they will be created automatically through a class that manages it. Now, how do we get **XAML Previewer** to work? Only hardcoding.

To wrap up, here's a table where we can compare them more easily.

| Features                                    | LiveXAML          | Gorilla Player        | XAML Previewer     | Xamarin Live Player |
| ------------------------------------------- | ----------------- | --------------------- | ------------------ | ------------------- |
| Price                                       | $240 or $24/month | Free                  | Free               | Free                |
| Support for custom renderers                | ✅                | ✅ (with Gorilla SDK) | ⚠️ (only on iOS)    | ❌                  |
| Support for effects                         | ✅                | ✅ (with Gorilla SDK) | ⚠️ (only on iOS)    | ❌                  |
| Support for third-party components          | ✅                | ✅ (with Gorilla SDK) | ✅                 | -                   |
| Support for native views                    | ✅                | ❌                    | ✅                 | -                   |
| Support for ContentViews                    | ✅                | ✅                    | ✅                 | -                   |
| Support for ResourceDictionary              | ✅                | ✅                    | ✅                 | -                   |
| Support for multiple devices simultaneously | ✅                | ✅                    | ❌                 | ❌                  |
| Error notifications                         | ✅                | ✅                    | ✅                 | ✅                  |

That's it for today, and that's my tip! I hope you enjoyed it. The example project used for testing is available on [Github][projeto].

Try [LiveXAML][livexaml], leave your comments, praises, criticisms, or suggestions. For those interested in trying out the other tools, here are the links for [Gorilla Player][gorilla-player], [XAML Previewer][xaml-previewer], and [Xamarin Live Player][xamarin-live-player].

Thanks!

[limitacoes-xamarin-live-player]: https://developer.xamarin.com/guides/cross-platform/live/limitations/
[projeto]:                        https://github.com/ionixjunior/XamarinPlayground/tree/master/XAMLTests
[livexaml]:                       http://livexaml.com/
[gorilla-player]:                 http://gorillaplayer.com/
[xaml-previewer]:                 https://developer.xamarin.com/guides/xamarin-forms/xaml/xaml-previewer/
[xamarin-live-player]:            https://www.xamarin.com/live