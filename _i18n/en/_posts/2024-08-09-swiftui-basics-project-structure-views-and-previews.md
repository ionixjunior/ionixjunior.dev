---
layout: post
title:  "SwiftUI Basics: Project Structure, Views, and Previews"
date:   2024-08-05
translations: ["pt"]
tags: ["100DaysOfSwiftUI"]
---

<p class="intro"><span class="dropcap">W</span>elcome back to the "100 Days of SwiftUI" series! In today's post we'll embark on a fundamental journey: understanding the core structure of a SwiftUI app.We'll demystify the Xcode project setup and explore the essential building blocks of every SwiftUI masterpiece. Let's get started!</p>

## Creating a New SwiftUI Project

To create a new SwiftUI project is very simple. Just open Xcode and click on "Create New Project" option. Another way is pressing the shortcut `CMD + SHIFT + N`.

-- IMAGE01

You'll see a screen to choose a template to you new project. Select "Multiplatform" menu, and them the "App" option on "Application" section. The multiplatform option will ensure you'll create a new SwiftUI app, compatible with other platforms. Press "Next".

-- IMAGE02

You'll see a screen to choose some options for your new project. Let's see about them:

- **Product Name**: This is the name of your project. Think about it, because it will be used on bundle identifier too.
- **Team**: This is your Apple developer account team. For a new "hello world" app, just keep it as "None".
- **Organization Identifier**: Here is the prefix of your app bundle. On my machine, the default bundle is "dev.ionixjunior", and you change it for your apps.
- **Bundle Identifier**: This is the result of your organization identifier and the product name.
- **Storage**: In this option you can select if you want to use Core Data or SwiftData. Just keep it as "None".

Also, there's another two checkboxes: "Host in CloudKit" and "Include Tests". Ensure they're unselected and click "Next". I've defined the product name of my app as "Sample App".


-- IMAGE03

Now, you want to choose the location where you want to save your new project. If you want to create a local Git repository on your machine, select the option "Create Git repository on my Mac". Press "Create".

-- IMAGE04

The Xcode project will open, and we'll talk about it now.

## Exploring the Xcode Workspace

When a SwiftUI new project open, we can split the Xcode Workspace in three different areas: Navigator Area, Editor Area, and Preview Canvas. Let's talk about each one.

### Navigator Area

Maybe this is the most important area of the project, because we can find our core files there. He's located on the left side of Xcode workspace, as you can see below.

-- IMAGE05

Note we have a lot of tabs located in this area - nine in total, but the first one is selected, and it is showing the core files of our new project. This first tab is called "Project navigator", and you can easily show the content from it hitting the shortcut `CMD + 1`. All other tabs has a shortcut too, from `CMD + 1` to `CMD + 9`, as you can see below.

-- VIDEO01

A quick overview about these tabs and shortcuts: 

-- MAYBE I SHOULD ADD IT IN A TABLE FOR BETTER READABILITY

- **Project navigator** - `CMD + 1`: is where the files of the project are located.
- **Source control navigator** - `CMD + 2`: is where you can see information about the source control.
- **Bookmark navigator** - `CMD + 3`: is where you can see your code bookmarks. You can add / remove them to easily find some code. Very useful when you're investigating something.
- **Find navigator** - `CMD + 4`: is where you can make a search query on your project files.
- **Issue navigator** - `CMD + 5`: is where you can see the project warnings.
- **Test navigator** - `CMD + 6`: is where you can see the unit and ui tests of your project.
- **Debug navigator** - `CMD + 7`: is where you can see debug information when you run your app and stop at a breakpoint.
- **Breakpoint navigator** - `CMD + 8`: is where you can see all of your project breakpoints.
- **Report navigator** - `CMD + 9`: is where you can see reports about the app compilation, like warnings, time compilation, and test coverage.

### Editor Area

The heart of your coding. Here is the location where your code is written and edited.

-- IMAGE06

To show a file here, you just go to project navigator, choose a file, and it will appear on editor area.

### Preview Canvas

Here we can show the real-time magic of SwiftUI previews. This definitely a killer feature of SwiftUI, because it helps a lot the development workflow providing real-time preview of the screen developed.

-- IMAGE07

This preview is very interesting. As you can see on the image above, it appears when you type the `#Preview` code, like this:

{%- highlight swift -%}
#Preview {
    ContentView()
}
{%- endhighlight -%}

This code won't ship when you publish your app on Apple Store, it's only works under development. A nice think that I discovered recently is it works with UIKit too. It helps a lot to prototype some screen or UI component. Try it!