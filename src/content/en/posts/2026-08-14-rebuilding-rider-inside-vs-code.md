+++
title = "Rebuilding Rider Inside VS Code"
date = 2026-08-14
type = "post"
slug = "rebuilding-rider-inside-vs-code"
translationKey = "rebuilding-rider-inside-vs-code"
categories = ["tools"]
tags = ["tips"]
image = "/img/cards/rebuilding-rider-inside-vs-code.en.webp"
+++

The first week was rough. Not because anything was broken, but because every single thing I reached for by reflex simply wasn't there. Where's the solution explorer? How do I see what's inside `/data/data` on the emulator? In the [last post][previous_post] I told you I was wrong about VS Code. Today I'll show you the work it took to make it right: every extension I installed, and which Rider feature each one replaced. Let's dive in!

## What this post isn't

A setup guide. Getting the project configured, the device recognized, and the right target selected is its own piece of work, and I left it out on purpose so this could stay what it is: a list of extensions and what each one replaced.

Maybe that's the next thing I write. Tell me in the comments if you'd like to read about it.

## Start where Microsoft tells you to

Three extensions, all from Microsoft, and you need all three:

- [C#][csharp] gives you the language itself. IntelliSense, go to definition, find references, refactorings.
- [C# Dev Kit][csharp_dev_kit] adds the parts that make it feel like a project instead of a folder: a Solution Explorer and a Test Explorer.
- [.NET MAUI][dotnet_maui] adds the mobile half. F5 deploy to emulators, simulators and devices, XAML IntelliSense, and Hot Reload.

One note before we continue: the C# Dev Kit follows the Visual Studio license, so it's worth checking the terms for your situation.

### The version trap nobody warned me about

This one cost me time, so let me save you some.

The project I work on is still on .NET 9. Today, if you look at the C# Dev Kit page on the marketplace, the requirements list the .NET 10 SDK. And with the latest versions of these three extensions installed, I could not deploy the Android app to a physical device.

The fix is not elegant, but it works: **install older versions of all three extensions, and turn off automatic updates for them.** In VS Code, click the gear icon on the extension, choose "Install Another Version...", pick one from the list, then use the same gear menu to turn "Auto Update" off.

Which version should you pin to? That part isn't a guess. Each extension publishes a changelog on its marketplace page, and I read through all three until I found the releases where .NET 10 support landed. The version you want is the one just before that.

So consider this the warning I wish I'd had: if your project isn't on the newest .NET yet, go read the changelogs and pin your extensions, before you spend an afternoon wondering why your device deploy stopped working.

## Teaching VS Code my shortcuts

I could have learned the VS Code keybindings. I chose not to.

[JetBrains IDE Keymap][jetbrains_keymap] brings the JetBrains shortcuts over, and suddenly my fingers knew where they were again. To be precise, it's modeled on the JetBrains family in general, IntelliJ IDEA, WebStorm and PyCharm, not on Rider specifically, but the overlap is almost total for everything I do daily.

**This was the single biggest jump in comfort, and it took about thirty seconds to install.** Years of muscle memory is not something to throw away out of principle.

## The windows I missed

This is where most of the work happened. Not features exactly, but *places I used to look at things*.

### The solution explorer

The C# Dev Kit does give you a Solution Explorer in the Explorer tab, and it works fine. I use [DotNav][dotnav] instead.

For me it's more powerful. Beyond the solution tree, it can reveal where the file I'm currently editing sits inside the solution, and I use that constantly in a big project. That's my preference, not a knock on the official one, so try both and keep whichever works better for you.

### The database window

Rider has DataGrip built in, and I only realized how much I relied on that once it was gone.

[DBCode][dbcode] filled the hole. It handles a long list of databases, but I use it for one thing: opening a SQLite file and looking at the data without leaving the editor.

### Git, without leaving the editor

Three of them, doing three different jobs:

- [GitNav][gitnav] gives me the visual history. The commit graph, and diffing against another branch without checking it out.
- [Git Blame Annotations][git_blame] puts the blame information inline, the way JetBrains IDEs do. Who changed this line, and when.
- [LazyGit VSCode][lazygit_vscode] opens [lazygit][lazygit] inside VS Code. Note that lazygit itself has to be installed on your machine first, the extension just brings it in.

That last one is my own preference. I just like working with Git in lazygit: making commits, looking at diffs, rebasing, switching branches. It's the way my hands want to work, and being able to do it without leaving the editor window is worth an extension all by itself. I could do the same thing by opening a terminal, but the extension gives me an easy shortcut to reach lazygit.

## The Android tooling

Here's where a .NET Android developer usually gives up and opens something else. You don't have to.

### The SDK and the emulators

[AVD Manager][avd_manager] manages virtual devices *and* SDK packages: platforms, tools, license acceptance. Its marketplace page describes doing all of this "without touching Android Studio", and I want you to hold on to that phrase, because it comes back in the next post.

[Android Emulator Helper][emulator_helper] is what I use to create and delete AVDs.

[Tabbed Emulator][tabbed_emulator] runs the emulator inside a VS Code tab instead of a floating window, and it does iOS simulators too. No more hunting for a window behind the editor.

### Looking inside the device

[Android System Explorer][system_explorer] browses the device filesystem over ADB. I use it to get into `/data/data` and look at databases and app files.

This is the one that replaced a Rider feature that had been broken for months, which tells you something about how this whole story started.

### Reading the logs

[Logcat Lens][logcat_lens] streams logcat with filtering by level, tag and package. It's a simple tool that does exactly what it promises.

## A few more extensions

Here are a few more that I installed:

- [Bookmarks][bookmarks] marks a line so I can jump back to it later. I use this a lot while navigating unfamiliar code, when I know I'll want to return to a specific spot.
- [Mermaid][mermaid] renders Mermaid diagrams.
- [Markdown Preview Github Styling][markdown_preview] makes the markdown preview look the way I expect it to look.
- [Clean Bin Obj][clean_bin_obj] deletes `bin` and `obj`. It's the strangest extension on this list, and I keep it because it's useful.

And four more for Python that I installed: [Python][python_ext], [Python Debugger][python_debugger], [Pylance][pylance] and [Python Environments][python_envs]. I haven't used them enough to tell you anything interesting, but they were enough to make PyCharm unnecessary, and that's all I need from them.

## What my own list told me

Now go back and look at that list with me.

DotNav. Bookmarks. Git Blame. GitNav. Android System Explorer. Logcat Lens. DBCode. Tabbed Emulator.

Every single one of those is for **reading, navigating, or inspecting**. Not one of them helps me write a line of code.

And the things Rider is genuinely, famously excellent at? The deep refactorings, the code inspections, the completion that feels like it read your mind. They're barely represented here. I replaced almost none of that, and I didn't notice it was missing.

That bothered me for a while, and then it stopped bothering me and started explaining something instead. In the next post I'll tell you about the extension I had to write myself, and then I'll come back to this list and what I think it means.

Happy coding!

[previous_post]:      /en/i-was-wrong-about-vs-code/
[csharp]:             https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp
[csharp_dev_kit]:     https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit
[dotnet_maui]:        https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.dotnet-maui
[jetbrains_keymap]:   https://marketplace.visualstudio.com/items?itemName=isudox.vscode-jetbrains-keybindings
[dotnav]:             https://marketplace.visualstudio.com/items?itemName=tuna-ex.dotnav
[dbcode]:             https://marketplace.visualstudio.com/items?itemName=DBCode.dbcode
[gitnav]:             https://marketplace.visualstudio.com/items?itemName=tuna-ex.gitnav-workflows
[git_blame]:          https://marketplace.visualstudio.com/items?itemName=lkqm.gitblame-annotations
[lazygit_vscode]:     https://marketplace.visualstudio.com/items?itemName=TomPollak.lazygit-vscode
[lazygit]:            https://github.com/jesseduffield/lazygit
[avd_manager]:        https://marketplace.visualstudio.com/items?itemName=toroxx.vscode-avdmanager
[emulator_helper]:    https://marketplace.visualstudio.com/items?itemName=oognuyh.android-emulator-helper
[tabbed_emulator]:    https://marketplace.visualstudio.com/items?itemName=ShouryaShikhar.tabbed-emulator
[system_explorer]:    https://marketplace.visualstudio.com/items?itemName=SalemAl-Zuhairi.android-system-explorer
[logcat_lens]:        https://marketplace.visualstudio.com/items?itemName=AshishKumarD.logcat-lens
[bookmarks]:          https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks
[mermaid]:            https://marketplace.visualstudio.com/items?itemName=MermaidChart.vscode-mermaid-chart
[markdown_preview]:   https://marketplace.visualstudio.com/items?itemName=bierner.markdown-preview-github-styles
[clean_bin_obj]:      https://marketplace.visualstudio.com/items?itemName=hybr8.clean-bin-obj
[python_ext]:         https://marketplace.visualstudio.com/items?itemName=ms-python.python
[python_debugger]:    https://marketplace.visualstudio.com/items?itemName=ms-python.debugpy
[pylance]:            https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance
[python_envs]:        https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-python-envs
