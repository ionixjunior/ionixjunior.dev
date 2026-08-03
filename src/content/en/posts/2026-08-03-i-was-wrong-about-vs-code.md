+++
title = "I Was Wrong About VS Code"
date = 2026-08-03
type = "post"
slug = "i-was-wrong-about-vs-code"
translationKey = "i-was-wrong-about-vs-code"
categories = ["tools"]
tags = ["tips"]
image = "/img/cards/i-was-wrong-about-vs-code.en.webp"
+++

For years I said the same thing to anyone who asked me about VS Code: it isn't an IDE. It's a code editor, and a code editor isn't enough to write software seriously. I was wrong. It took a broken Android deploy, months of waiting, and a lot of frustration to show me, and today VS Code is where I write all my code. Let me tell you how I got here.

## The IDE I didn't ask for

Visual Studio for Mac arrived in 2017, and for years it was my primary IDE for Xamarin development. If you wrote C# on a Mac back then, that's where you were, and I was happy there.

In 2019 I joined the company where I work today, and Rider came with the job. I resisted it. For about a year I kept both tools installed and kept going back to Visual Studio for Mac whenever something mattered. If I remember well, it was only around 2020 that I stopped opening it at all and Rider finally became my primary IDE.

Notice the pattern, because it repeats later in this post: someone puts a good tool in front of me, and my first reaction is to keep using the old one.

Fun fact: Microsoft [retired Visual Studio for Mac][vs_for_mac_retirement] on August 31, 2024, and the official recommendation was to move to Visual Studio on Windows, or to [VS Code][vs_code] on the Mac with the C# Dev Kit. By then I was comfortable in Rider, so I read that announcement and did absolutely nothing about it. Microsoft pointed me at the exact setup I'm writing about today, two years before I got there 😅.

## When Rider stopped working for me

Let me be fair: Rider is a great IDE, and this post isn't about it being bad software.

But if you work with Xamarin or .NET MAUI, you already know that you're not the main audience. That support doesn't come in the box, it arrives through plugins, and you feel the difference. The Android device explorer was broken for months. Then deploying to an Android emulator broke too, in recent versions.

That last one has a number: [RIDER-137704][rider_issue], "Unable to evaluate deployment properties when deploying/building MAUI Android". And look at how JetBrains classified it themselves. The user priority on that issue reads:

> Prevents from using Rider

That's not my dramatic phrasing. That's the label on the ticket.

So my team and I waited. Weeks, and then months.

To be fair, there was always a way out: roll back and install a previous version of Rider. But stop and think about what that means for your daily routine. Your IDE is supposed to be the stable thing in your day, the part you don't have to think about.

The issue is marked as fixed now, and I want to be honest with you here: I never validated that fix. I had been waiting so long that at some point I just gave up. Even fixed, it doesn't change anything for me, because I'm not planning to go back.

**When the workaround is to install an older version of your IDE, and the real fix takes months, the trust is gone long before the repair arrives.**

## "A code editor isn't enough to code seriously"

Now the uncomfortable part, where I have to quote myself.

I was the guy who gave VS Code a hard time. Every time someone showed me their setup, I had the same answer ready: that's a code editor, not an IDE. Where's the refactoring tools? Where's the solution explorer? You can't seriously build software in a text editor with plugins.

I believed it. I said it out loud, more than once, to people who were perfectly happy with their setup.

Do you recognize yourself here? Maybe not with VS Code, but with some other tool you made up your mind about years ago and never revisited since.

## The plot twist

So there I was: frustrated, with an IDE missing the features I needed, no ETA for a fix, and an old opinion about VS Code that wasn't solving a single one of my problems. I installed VS Code and the three extensions Microsoft recommends for this stack: [C#][csharp], [C# Dev Kit][csharp_dev_kit], and [.NET MAUI][dotnet_maui].

I wish I could tell you it was love at first sight. It wasn't. The first days were annoying, because everything I reached for by reflex simply wasn't there, and I spent more time hunting for extensions than writing code.

But then something happened that I really did not expect. Every problem I found had a solution. Not always a perfect one, but a solution. And after a few weeks of tuning, I had a setup that does what Rider did for me, with the shortcuts I already know in my fingers.

Then I uninstalled Rider. And PyCharm went with it. Sometimes I also work with Python at the company, and PyCharm was where I did that. Now it happens in VS Code too.

**The tool I spent years defending is gone from my machine.**

That doesn't mean I lost nothing. I miss dotTrace and dotMemory, the profiling tools that come bundled with Rider. And here's the honest part: I haven't gone looking for what VS Code can do there yet. It just hasn't hurt enough to make me look.

## So why now?

Here's the part I'm still reflecting on, and I'd rather ask it out loud than pretend I have it solved.

Was I always wrong about VS Code, or did the ground move under me while I wasn't looking?

Because something else changed at the same time. My development cycle today is driven mostly by AI agents. I spend much less of my day typing code, and much more of it reading, reviewing, navigating, and deciding what happens next. If that's what my day actually looks like now, how much of an expensive IDE am I really using?

I don't have a clean answer yet. What I have is a suspicion, and the evidence is sitting right there in the list of extensions I installed. I'll come back to it at the end of this series.

In the next post I'll show you that list: every extension I added, and which Rider feature each one replaced. A few of them surprised me.

See you in the next post!

[vs_code]:                https://code.visualstudio.com
[vs_for_mac_retirement]:  https://learn.microsoft.com/en-us/lifecycle/announcements/visual-studio-mac-end-of-servicing
[rider_issue]:            https://youtrack.jetbrains.com/issue/RIDER-137704/Unable-to-evaluate-deployment-properties-when-deploying-building-MAUI-Android
[csharp]:                 https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp
[csharp_dev_kit]:         https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit
[dotnet_maui]:            https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.dotnet-maui
