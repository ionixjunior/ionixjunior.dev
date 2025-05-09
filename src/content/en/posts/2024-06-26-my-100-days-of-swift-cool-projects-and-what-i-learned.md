+++
title = "My 100 Days of Swift: Cool Projects & What I Learned"
date = 2024-06-28
type = "post"
slug = "my-100-days-of-swift-cool-projects-and-what-i-learned"
translationKey = "my-100-days-of-swift-cool-projects-and-what-i-learned"
categories = ["TODO"]
tags = ["swift"]
image = "/img/cards/my-100-days-of-swift-cool-projects-and-what-i-learned.en.webp"
+++

A while ago I completed the 100 Days of Swift challenge by Paul Hudson. It was an amazing experience where I learned a lot about Swift and iOS development. In today's post, I'll share my thoughts about this journey and highlight some of the most interesting things I encountered. Let's dive in!

If you search online for "100 days of Swift," you'll find various resources. When I began my search, I chose Paul Hudson's program. You can find it [here][100_days_of_swift]. Some people asked me why I started with UIKit instead of SwiftUI. Well, I believe both are important, so I decided to begin with UIKit.

For anyone starting their iOS development journey, I highly recommend following a structured path like this. You'll face challenges, practice consistently, and learn something new every day. The dynamic is simple: learn and practice. I'm excited to share some highlights from my experience.

## The First 12 Days

The first 12 days were dedicated to Swift basics, but even with seemingly simple concepts, I learned valuable things.

### Making Large Numbers Legible

When working with large numbers, you can use underscores as thousands separators. This doesn't change the number's value; it just makes it easier to read.

{%- highlight swift -%}
var balance = 10_000_000
{%- endhighlight -%}

### Exiting Multiple Loops

If you have multiple nested loops, you can name each loop to create a `break` condition for exiting. It's a good alternative to using `goto` (remember those? 😅).

{%- highlight swift -%}
outerLoop: for i in 1...5 {
    for j in 1...5 {
        print ("\ (i) - \(j)")

        if j == 3 {
            break outerLoop
        }
    }
}        
{%- endhighlight -%}

These might seem like small details, but I found them quite useful.

## Starting iOS Projects

After mastering Swift basics, I began working on iOS projects, which opened a world of new possibilities. Let's revisit some of the coolest features I encountered and some things I've tried.

### Environment Overrides

Xcode provides an option called "environment overrides." Basically, you can change settings like appearance, text, and accessibility to test your app in different scenarios. It's incredibly easy to check your app in various environments.

<video controls aria-labelledby="Xcode Environment Overrides" aria-describedby="The video shows Xcode and iOS Simulator side by side. The app is running, and there is a button at the bottom of Xcode's toolbar that reveals the environment overrides tool. When you change the configuration, you see the changes directly in the running app.">
    <source src="/videos/xcode_environment_overrides.mp4" type="video/mp4">
    Your browser does not support video playback.
</video>

### Debug Description in UI Tests

When running UI tests, you can set a breakpoint and type `po app.debugDescription` in the output window. This will show a "REPL" (Read-Eval-Print Loop) that helps you understand the UI elements you can interact with on the screen. This is incredibly useful for analyzing UI elements during testing.

<figure>
	<img src="/img/xcode_uitests_debug.webp" alt="Xcode showing the UI elements on the screen in the output window."> 
	<figcaption>Xcode showing the UI elements on the screen in the output window.</figcaption>
</figure>

### Unresponsiveness UI Warnings

This is a very helpful feature. Xcode alerted me when I performed expensive operations on the UI thread, such as loading a URL from the internet. These types of issues are easy to fix, and I appreciated Xcode's warnings that helped me improve my implementation.

<figure>
	<img src="/img/xcode_unresponsiveness_ui_warning.webp" alt="Xcode showing an unresponsiveness UI warning in a content loaded from a URL."> 
	<figcaption>Xcode showing an unresponsiveness UI warning in a content loaded from a URL.</figcaption>
</figure>

### River Raid - A Tiny Version

In addition to UIKit, I also explored a bit of SpriteKit. This was not a challenge from Paul Hudson training, but some lessons that I've developed helped me to built it. I've made just for fun. I had an Atari, so I've played River Raid a lot!

<video controls aria-labelledby="River Raid Little made with SpriteKit" aria-describedby="The video shows Xcode and iOS Simulator side by side. The app was made using SpriteKit and is a small version of the River Raid game.">
    <source src="/videos/river_raid_little_made_by_spritekit.mp4" type="video/mp4">
    Your browser does not support video playback.
</video>

### Memory Game

I also created a simple memory game. To test it, I developed UI tests to verify that all cards could be flipped and that the game could be completed successfully. It was a rewarding project.

<video controls aria-labelledby="A memory game tested with UI Tests" aria-describedby="The video shows Xcode and iPad Simulator. The app was made using UIKit and is a memory game. The UI tests open all pairs until the game is finished.">
    <source src="/videos/test_memory_game_using_uitests.mp4" type="video/mp4">
    Your browser does not support video playback.
</video>

## 100 Days of Practice == A Great Evolution

Some chapters of this training were repetitive, but they served a purpose: solidifying knowledge. Before embarking on this journey, I felt the need to continuously develop something every day, to learn and practice consistently. The 100 Days of Swift challenge provided the perfect framework for this goal and introduced me to excellent content.

If you're interested in following my entire journey, you can check out [this tweet][100_days_of_swift_journey]. Also, all projects that I developed are hosted on this [GitHub project][github_project].

I'm thinking about starting the [100 Days of SwiftUI][100_days_of_swiftui] challenge, also by Paul Hudson. What do you think? Would you like to join me on this adventure? Remember, consistency is key! Every day counts, and with dedication, you can achieve incredible things in your coding journey. So, let's keep learning and growing together!

[100_days_of_swift]:         https://www.hackingwithswift.com/100
[100_days_of_swiftui]:       https://www.hackingwithswift.com/100/swiftui
[100_days_of_swift_journey]: https://x.com/ionixjunior/status/1569005323314425859
[github_project]:            https://github.com/ionixjunior/100DaysOfSwift