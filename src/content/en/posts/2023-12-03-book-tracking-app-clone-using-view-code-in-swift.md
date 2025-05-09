+++
title = "Book Tracking app clone using View Code in Swift"
date = 2023-12-03
type = "post"
slug = "book-tracking-app-clone-using-view-code-in-swift"
translationKey = "book-tracking-app-clone-using-view-code-in-swift"
categories = ["TODO"]
tags = ["swift", "view-code"]
image = "/img/cards/book-tracking-app-clone-using-view-code-in-swift.en.webp"
+++

A few days ago, I published a post about my journey as a mobile developer and why I am changing to native iOS development. Today, I will share my first impressions of using View Code in iOS development. To practice, I chose a design for a mobile app that I found at Dribbble and started to make an app clone. So, let's jump in and see the results!

I started to study iOS development more deeply, and I believe it is a perfect moment to start a project and practice new things I am learning. I have no idea what to develop, so I looked for some inspiration at Dribbble, and I found a [Book Tracking App][dribbble] made by [Kyler Phillips][twitter-kyler]. Kyler's design is a work in progress, but the first three screens he shares are incredible, and I started the app clone based on his design.

### View Code? Why not SwiftUI??

I am still working as a Xamarin developer, and because of this, I can't use SwiftUI with this platform. Where I work, the entire project was built using Storyboards, and we are looking for a different way to handle this. Recently, we started a study to understand how to implement View Code in our app. So, because of this, I started this project to practice something different that will help me at work.

### Why did I choose this design?

Kyler's design is beautiful and clean and gives me some challenges to face. I have nothing against doing a Hello World project, but I feel more comfortable with some real challenges. His design is good because it has horizontal and vertical scrolling on the same screen, some components shared between pages, and different challenges in each layout.

### What was the most difficult using View Code?

For me, it was the constraints configuration. But it is not so hard. When you learn how to think about layout construction, it is not a difficult thing to do when developing a new screen or some part of a view. You need to think if the element should be at the top or bottom, leading or trailing, if it needs to have a width or height, and what element will relate. Once you understand this, making constraints programmatically will not be a tricky task.

Let's talk about some pros and cons.

#### Pros
- Allow a team to work together in the same file with minus risk of merge conflicts;
- Allow an easier understanding of how the elements of the screen are organized and related;
- Allow to make dynamic screens easier;
- Allow to make components and reuse them easily;
- Allow to centralize the entire code in code, not in unreadable XML files (Storyboard).

#### Cons
- Difficult to start and organize your code to not make a mess;
- There is no visual GUI to see the prototype of the constraint configuration or element behavior. You need to run the app and check;
- More time to build a screen.

### The app clone

I hosted the Swift project on GitHub. I am calling it [BookTracking][github]. This is a work-in-progress project, and I will continue to practice and learn about View Code. 

Check this project out and come with me to learn. Are you interested in seeing some live streaming developing it? Tell me in the comments. See you soon!

[github]:        https://github.com/ionixjunior/BookTracking/
[dribbble]:      https://dribbble.com/shots/6038744-Book-Tracking-App-WIP
[twitter-kyler]: https://twitter.com/kylerjphillips