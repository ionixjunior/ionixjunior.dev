+++
title = "SwiftUI Basics: Project Structure, Views, and Previews"
date = 2024-08-09
categories = ["TODO"]
tags = ["100DaysOfSwiftUI"]
social_image: "swiftui-basics-project-structure-views-and-previews.en.webp"
+++

<p class="intro"><span class="dropcap">T</span>his is a new post of the "100 Days of SwiftUI" series. In today's post we'll embark on a fundamental journey: understanding the core structure of a SwiftUI app. We'll demystify the Xcode project setup and explore the essential building blocks of every SwiftUI masterpiece. Let's get started!</p>

## Creating a New SwiftUI Project

To create a new SwiftUI project is very simple. Just open Xcode and click on "Create New Project" option. Another way is pressing the shortcut `CMD + SHIFT + N`.

<figure>
	<img src="/assets/img/xcode-create-new-project.webp" alt="Xcode welcome screen with “Create New Project…” highlighted."> 
	<figcaption>Launch Xcode and start a new project.</figcaption>
</figure>

You'll see a screen to choose a template to you new project. Select "Multiplatform" menu, and them the "App" option on "Application" section. The multiplatform option will ensure you'll create a new SwiftUI app, compatible with other platforms. Press "Next".

<figure>
	<img src="/assets/img/xcode-select-multiplatform-app-template.webp" alt="Xcode project template selection window with “App” template selected."> 
	<figcaption>Choose the "App" template under the multiplatform tab.</figcaption>
</figure>

You'll see a screen to choose some options for your new project. Let's see about them:

- **Product Name**: This is the name of your project. Think about it, because it will be used on bundle identifier too.
- **Team**: This is your Apple developer account team. For a new "hello world" app, just keep it as "None".
- **Organization Identifier**: Here is the prefix of your app bundle. On my machine, the default bundle is "dev.ionixjunior", and you can change it for your apps.
- **Bundle Identifier**: This is the result of your organization identifier and the product name.
- **Storage**: In this option you can select if you want to use Core Data or SwiftData. Just keep it as "None".

Also, there's another two checkboxes: "Host in CloudKit" and "Include Tests". Ensure they're unselected and click "Next". I've defined the product name of my app as "Sample App".

<figure>
	<img src="/assets/img/xcode-set-project-name-swiftui.webp" alt="Xcode project options with “Product Name” field highlighted."> 
	<figcaption>Give your project a name.</figcaption>
</figure>

Now, you need to choose the location where you want to save your new project. If you want to create a local Git repository on your machine, select the option "Create Git repository on my Mac". Press "Create".

<figure>
	<img src="/assets/img/xcode-create-git-repository.webp" alt="Xcode project creation with “Create Git repository on my Mac” option checked."> 
	<figcaption>Optionally, initialize a Git repository for version control.</figcaption>
</figure>

The Xcode project will open, and we'll talk about it now.

## Exploring the Xcode Workspace

When a SwiftUI new project open, we can split the Xcode Workspace in five different main areas: Navigator Area, Editor Area, Preview Canvas, Inspector Area, and Debug Area. Let's talk about each one.

### Navigator Area

Maybe this is the most important area of the project, because we can find our core files there. He's located on the left side of Xcode workspace, as you can see below.

<figure>
	<img src="/assets/img/xcode-navigator-area.webp" alt="Xcode workspace with Project Navigator, ContentView.swift, and the Preview Canvas visible."> 
	<figcaption>The Navigator Area (highlighted) is where you find the files of your project.</figcaption>
</figure>

Note we have a lot of tabs located in this area - nine in total, but the first one is selected, and it is showing the core files of our new project. This first tab is called "Project navigator", and you can easily show the content from it hitting the shortcut `CMD + 1`. All other tabs has a shortcut too, from `CMD + 1` to `CMD + 9`, as you can see below.

<video controls aria-labelledby="Xcode Navigator Area Shortcuts Demo" aria-describedby="This video demonstrates keyboard shortcuts to quickly switch between tabs in the Xcode Navigator Area, improving your development workflow.">
    <source src="/assets/videos/xcode-navigator-area-shortcuts.mp4" type="video/mp4">
    Your browser does not support video playback.
</video>

A quick overview about these tabs and shortcuts: 

| Tab | Shortcut | Functionality |
|---|---|---|
| Project navigator  | `CMD + 1` | Is where the files of the project are located  |
| Source control navigator  | `CMD + 2`  | Is where you can see information about the source control changes |
| Bookmark navigator  | `CMD + 3`  | Is where you can see your code bookmarks<br> You can add / remove them to easily find some code  |
| Find navigator  | `CMD + 4`  | Is where you can make a search query on your project files  |
| Issue navigator  | `CMD + 5`  | Is where you can see the project warnings  |
| Test navigator  | `CMD + 6`  | Is where you can see the unit and UI tests of your project  |
| Debug navigator  | `CMD + 7`  | Is where you can see debug information when you run your app and stop at a breakpoint  |
| Breakpoint navigator  | `CMD + 8`  | Is where you can see all of your project breakpoints  |
| Report navigator  | `CMD + 9`  | Is where you can see reports about the app compilation, like warnings, time compilation, and test coverage |

### Editor Area

The heart of your coding. Here is the location where your code is written and edited.

<figure>
	<img src="/assets/img/xcode-editor-area-swiftui-code.webp" alt="Xcode Editor Area highlighted, showing ContentView.swift code."> 
	<figcaption>The Editor Area (highlighted) is where you write and edit your SwiftUI code.</figcaption>
</figure>

To show a file here, you just go to project navigator, choose a file, and it will appear on editor area.

### Preview Canvas

Here we can show the real-time magic of SwiftUI previews. This definitely a killer feature of SwiftUI, because it helps a lot the development workflow providing real-time preview of the screen developed.

<figure>
	<img src="/assets/img/xcode-preview-canvas-swiftui.webp" alt="Xcode Preview Canvas highlighted, displaying a preview of the ContentView."> 
	<figcaption>The Preview Canvas (highlighted) gives you an instant view of your UI.</figcaption>
</figure>

This preview is very interesting. As you can see on the image above, it appears when you type the `#Preview` code, like this:

{%- highlight swift -%}
#Preview {
    ContentView()
}
{%- endhighlight -%}

This code won't ship when you publish your app on Apple Store, it's only works under development. A nice think that I discovered recently is it works with UIKit too. It helps a lot to prototype some screen or UI component. Try it!

### Inspector Area

This is a hidden area when you create a new project, but you can show it hitting a top right button from Xcode toolbar. When you open it, you'll see a contextualized area based on selected view elements.

<figure>
	<img src="/assets/img/xcode-inspector-area.webp" alt="Xcode Inspector Area with ContentView settings displayed."> 
	<figcaption>Use the Inspector to adjust view properties and settings without coding.</figcaption>
</figure>

This area contains 5 tabs

| Tab | Shortcut | Functionality |
|---|---|---|
| File inspector          | `CMD + OPTION + 1` | Show information about the selected file |
| History inspector       | `CMD + OPTION + 2` | Show information about project history (Git commits) |
| Help inspector          | `CMD + OPTION + 3` | Show technical information about selected elements in the file |
| Accessibility inspector | `CMD + OPTION + 5` | Show information about screen accessibility <br> (I didn't see this tab working until now, so please let me know if you know how to do it) |
| Attributes inspector    | `CMD + OPTION + 4` | Show information about the selected element on screen |

<video controls aria-labelledby="Xcode Inspector Area Shortcuts Demo" aria-describedby="This video demonstrates keyboard shortcuts to quickly switch between tabs in the Xcode Inspector Area, improving your development workflow.">
    <source src="/assets/videos/xcode-inspector-area-shortcuts.mp4" type="video/mp4">
    Your browser does not support video playback.
</video>

### Debug Area

This is a dedicated area to use when you're running your app. In this area you can interact when you create a breakpoint on your app and need to see values on variables or objects. To see it, click on the button located at bottom right side, and you'll see a spliced area that will can contain values when you're running your app.

<figure>
	<img src="/assets/img/xcode-debug-area.webp" alt="Xcode Debug Area that shows app information when it's running."> 
	<figcaption>Use the Debug Area to see information when your app is running.</figcaption>
</figure>

Now you know about the Xcode workspace, let's explore about the SwiftUI code.

## Exploring the SwiftUI Code

Now that you've set up your SwiftUI project and understand the basics of Xcode, let's explore the core code that brings your app to life. Let's see the main file.

### "YourAppName.swift" file

Now I'm seeing that "Sample App" isn't a good name for the app, because SwiftUI create a file called "your app name" + "App". So, my file is called `Sample_AppApp.swift` 😂. But that's okay, no problem.

{%- highlight swift -%}
import SwiftUI

@main
struct Sample_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
{%- endhighlight -%}

The `@main` attribute above the struct declaration might seem subtle, but it's crucial. It signals to Xcode that this structure, `Sample_AppApp`, serves as the entry point of your application. Think of it as the "front door" where execution begins.

The struct `Sample_AppApp: App` line defines your app's overall structure and behavior. This means `Sample_AppApp` conforms to the `App` protocol. By conforming to `App`, you're telling SwiftUI that this structure knows how to assemble and manage the different parts of your application.

Inside the body property of your app structure, you'll find the `WindowGroup`. This powerful element determines what users see on their screens. 

Within the `WindowGroup`, you'll usually see `ContentView()`, witch creates an instance of another SwiftUI view called `ContentView`. Your `ContentView.swift` file (created automatically by Xcode) is where you'll start building the actual user interface of your app.

In essence, the code in the `Sample_AppApp.swift` sets the stage by defining the entry point, app structure, and the initial view (`ContentView`) that users will see when they launch your app.

In the next section, we'll dive into `ContentView.swift` and start crafting the visual elements of your SwiftUI masterpiece!

### ContentView.swift file

Let's dive into `ContentView.swift`, the heart of your SwiftUI app. Open it up, and you'll see a structure similar to this:

{%- highlight swift -%}
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .accessibilityLabel("hello")
                .accessibilityAction {
                    print("teste")
                }
                .accessibilityHint("Hellou")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
{%- endhighlight -%}

The line `struct ContentView: View` declares a structure named `ContentView` that conforms to the `View` protocol. This is how you create all visual elements in SwiftUI.

The `body` is where the magic happens. This computed property is responsible for defining the appearance and layout of your view.

Inside the `body`, you'll find SwiftUI views that make up your UI. The default code includes a simple `Image` and `Text` views.

Below `ContentView`, you'll notice `#Preview` block. This enables SwiftUI's incredible live previews using the Preview Canvas.

With this foundation, you're well on your way to crafting beautiful and interactive user interfaces in SwiftUI. The possibilities are limitless, and we explore some of them in the next blog posts.

## Wrap up

You've taken your first steps into the world of SwiftUI, and you've already got a good grasp of the basics. You know how to set up a new Xcode project, know about the Xcode workspace, and understand the roles of key elements like `@main`, `App`, `WindowGroup`, and `ContentView`. Plus, you've experienced the magic of SwiftUI Previews, which give you instant feedback as you code.

But this is just the beginning! There's so much more to learn and explore in SwiftUI. Get ready to master layout techniques, create dynamic user interfaces with data, and build smooth navigation between different parts of your app.

Keep experimenting, have fun, and never stop learning. The possibilities with SwiftUI are limitless, and you're well on your way to creating incredible apps.

See you in the next post!