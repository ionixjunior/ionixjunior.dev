+++
title = "HotReload: A free tool for XAML UI development"
date = 2019-06-03
type = "post"
slug = "hotreload-a-free-tool-for-xaml-ui-development"
translationKey = "hotreload-a-free-tool-for-xaml-ui-development"
categories = ["TODO"]
tags = ["xamarin"]
+++

<p class="intro"><span class="dropcap">S</span>ome time ago, I wrote a post called Xamarin.Forms and UI - Which tool is more productive?. In that post, I created a comparison between the main existing tools at that time to facilitate app development with Xamarin.Forms using XAML. Now, a new tool called HotReload has emerged. Let's take a look at it and compare it with the other tools, shall we?</p>

Here's the [link to the post][post-primeiro-comparativo] I mentioned above.

One of the most fantastic things about **HotReload** is that it's **open source**! Yes, you can check out the [project on GitHub][hot-reload] and maybe even contribute to it.

I won't provide a detailed introduction to **HotReload**, as [Mahmoud Ali][akamud] has already done it. [Here's the review][review-akamud] he made of the tool. So, you can check that out as well. The focus here is on the comparison with the other tools I evaluated in the previous post. Let's get started!

### Cost
This tool is free! Yes, now we have a free solution for UI development using **XAML**.

### Support for Custom Renders, Effects, Third-Party Components, Native Views, ContentViews, Animations, and Design Time Data
In all these aspects, **HotReload** worked perfectly. No significant issues were found in these tests.

### Support for ResourceDictionary
The tool supports **ResourceDictionary**, but with one caveat. If the screen we are editing has a **ResourceDictionary**, and we make changes to it, no problems occur. However, if we make changes to the global **ResourceDictionary** of the application, these changes are not immediately propagated to the screen and may even cause the app to crash. The example I tried was simple; I added a new style to the **ResourceDictionary** and tried to reference it on the page. Then the screen went blank, and nothing worked anymore. But don't worry; there's already an [issue][issue-64] opened for this, and it will be resolved soon.

EXTRA EXTRA: I inform you that the problem mentioned above has already been fixed! 🙂 At the time I was writing this article, the problem existed, but it has been recently resolved. The solution to the problem came with version 1.3.0 of the library, so make sure to update the NuGet package.

### Support for Multiple Devices Simultaneously
Yes, with **HotReload**, we also have support for previews on multiple devices simultaneously. However, some small configurations need to be made for everything to work as expected. Once again, [Mahmoud Ali][akamud] wrote a super-detailed post explaining all of this, and he even created a script to facilitate all these configurations.

**Update: 22/06/19**: A recent update of the extension has added automatic discovery of device IPs. Fantastic! This means less configuration to start our projects 😉

### Error Notifications
**HotReload** does show error notifications, but you need to have the app running on the emulator/simulator/device while making changes to the **XAML** 🙂 I didn't notice this because I was testing it without running the app on devices, so I didn't see the errors when they occurred.

### Interesting Facts
During the tests, I made changes to a page, and everything happened as expected. I changed the background color of a screen, and the color changed. However, when I removed the color, it didn't revert to the default. A bit strange, but not a serious issue. It's something that can be worked around and might be related to the problem mentioned in the issue I referenced. Soon, this should be overcome, and we can have an even better tool.

### Considerations and Comparative Table
Finally, the community can rely on a good and free solution. Personally, I still like **LiveXAML** a lot because it's more practical (no need for workarounds), but I'm testing **HotReload**, and I confess I'm very impressed with everything and very motivated because it's an **open-source** project, which means this tool is likely to evolve rapidly.

Below is the comparative table of UI tools (now including **HotReload**):

| Features                                    | HotReload       | LiveXAML          | Gorilla Player       | XAML Previewer     | Xamarin Live Player |
| ------------------------------------------- | --------------- | ----------------- | -------------------- | ------------------ | ------------------- |
| Price                                       | Free            | $240 or $24/month | Free                 | Free               | Free                |
| Support for custom renderers                | ✅              | ✅                | ✅ (with Gorilla SDK) | ⚠️ (only on iOS)    | ❌                  |
| Support for effects                         | ✅              | ✅                | ✅ (with Gorilla SDK) | ⚠️ (only on iOS)    | ❌                  |
| Support for third-party components          | ✅              | ✅                | ✅ (with Gorilla SDK) | ✅                 | -                   |
| Support for native views                    | ✅              | ✅                | ❌                    | ✅                 | -                   |
| Support for ContentViews                    | ✅              | ✅                | ✅                    | ✅                 | -                   |
| Support for ResourceDictionary              | ✅              | ✅                | ✅                    | ✅                 | -                   |
| Support for multiple devices simultaneously | ✅              | ✅                | ✅                    | ❌                 | ❌                  |
| Error notifications                         | ✅              | ✅                | ✅                    | ✅                 | ✅                  |

That's all for today, folks. Thanks, and have a great day!

[post-primeiro-comparativo]: /{{ site.lang }}/xamarin-forms-and-ui-which-tool-is-more-productive
[hot-reload]:                https://github.com/AndreiMisiukevich/HotReload
[akamud]:                    https://github.com/akamud
[review-akamud]:             http://high5devs.com/2019/04/hotreload-desenvolvendo-telas-mais-rapido-para-xamarin-forms-de-maneira-gratuita/
[issue-64]:                  https://github.com/AndreiMisiukevich/HotReload/issues/64
