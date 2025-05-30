+++
title = "Git Worktree: Your Secret Weapon for Multitasking in Git"
date = 2024-05-17
type = "post"
slug = "git-worktree-your-secret-weapon-for-multitasking-in-git"
translationKey = "git-worktree-your-secret-weapon-for-multitasking-in-git"
categories = ["tools"]
tags = ["git"]
image = "/img/cards/git-worktree-your-secret-weapon-for-multitasking-in-git.en.webp"
+++

As a developer, you're no stranger to juggling multiple tasks. You might be fixing bugs in a production release, while simultaneously developing new features for the next version. This often means switching between different branches of your project, which can be a clunky and time-consuming process. Constantly stashing changes, checking out branches, and waiting for your IDE to catch up can significantly disrupt your workflow. But what if there was a way to work on multiple branches simultaneously, without the constant context switching? Enter git worktree: a powerful yet often overlooked command that can revolutionize the way you multitask in Git. Let's see it in action in this post.

Think of it as your secret weapon for managing multiple project states without the headache of juggling separate repositories. With `git worktree`, you can effortlessly switch between branches, experiment with new features, and fix urgent bugs — all within the same project, without losing your place. This is strange, right? Don't worry about it! Let's understand how this command works.

## Understanding git worktree

At its core, `git worktree` allows you to create multiple working trees from a single Git repository. This means you can have several branches checked out simultaneously, each in its own separate directory, but all connected to the same underlying repository data 🤯.

Imagine it like this: your main project folder becomes the "parent" directory, and each `git worktree` you create is a "child" directory, representing a different branch of your project. The magic is that each child directory operates as a completely independent workspace. You can edit files, commit changes, and even create new branches within a specific worktree, without affecting any of the other worktrees.

This allows you to, for example, have one worktree dedicated to developing a new feature, another focused on fixing bugs on the "main" branch, and yet another for experimenting with a risky experimental feature—all within the same project.

To create a new worktree is simple:
```sh
git worktree add <path/to/new/worktree> <branch-name>
```

The `<path/to/new/worktree>` is the directory where your new worktree will be created. You can name this whatever makes sense for the task you're working on. The `<branch-name>` is the branch that you want to check out into the new worktree. For example, to create a worktree named "BookTrackingLint" for developing a new feature on the "swiftlint" branch, you'd run:
```sh
git worktree add ../BookTrackingLint swiftlint
```

This will create a new directory named "BookTrackingLint" at the same level as your main project folder, and check out the "swiftlint" branch within it. Now you can work on this branch completely independently from your other worktrees.

You can list all worktrees already created with the following command:
```sh
git worktree list
```

As a result, you'll see something like this:
```sh
/Users/ionixjunior/Projects/iOS/BookTracking      9060735 [main]
/Users/ionixjunior/Projects/iOS/BookTrackingLint  bf99013 [swiftlint] 
```

## Use cases and benefits of git worktree

The beauty of `git worktree` lies in its versatility. It can be applied to a variety of scenarios, significantly streamlining your development workflow. Here are a few common use cases and the benefits they bring:

### Hotfix hero

A critical bug is discovered in your production environment, requiring immediate attention. You need to create a hotfix branch while simultaneously continuing work on your current feature branch. How to deal with this? Use `git worktree` to create a new worktree for the hotfix branch. This allows you to quickly address the critical issue without disrupting your ongoing work. Once the hotfix is complete and merged, you can simply delete the dedicated worktree.

### Feature branch bliss

You're working on multiple features in parallel, each requiring its own isolated environment. Constantly switching branches and stashing changes is becoming a nightmare. How to deal with this? Create a separate worktree for each feature branch. This allows you to seamlessly switch between features, work on them independently, and easily track their progress without interrupting other branches.

### Testing made easy

You need to test a specific feature branch in a dedicated environment without affecting your main development workspace. What to do? Use `git worktree` to create a dedicated worktree for testing purposes. You can then configure this environment specifically for testing and easily discard it once testing is complete. 

### Benefits of using git worktree

With this command, you can reduce context switching. No more constantly stashing changes and checking out different branches, saving you time and mental energy. Also, you can enhance organization by keeping your project organized by separating different development tasks into dedicated worktrees. Another good thing is it can improve focus because if you work on specific features or bugs in isolation, it can minimize distractions and improve concentration. Furthermore, the command can provide faster testing and experimentation as you can easily create dedicated worktrees for testing new features or experimenting with different approaches.

To IDEs that have support for multi window, you can use this resource to open an instance of the IDE using a specific worktree and use another instance to open another worktree. This can be useful in some scenarios.

Other interesting thing there are projects where the setup it takes times. The compilation time is big, the files' analysis is slow, and all this needs to be performed when we change the branch. This can impact in loss performance in our job, and the `git worktree` can help us with this.

## Managing your worktree

You created some worktrees, right? But how can we delete them? Maybe just delete the new folder? Yes, you can do this, but you'll leave some traces in your repository. To correctly remove a worktree, you use the `remove` option followed by the worktree directory. I'll use the same example of the Book Tracking repository that I created previously. 
```sh
git worktree remove ../BookTrackingLint
```

Now, if we run the list command, the worktree isn't there anymore.
```sh
git worktree list
/Users/ionixjunior/Projects/iOS/BookTracking  9060735 [main]
```

But as I said to you, you can delete the folder, but let's see what happens. I created the same worktree again, deleted the worktree folder, and ran the list command:
```sh
git worktree list
/Users/ionixjunior/Projects/iOS/BookTracking      9060735 [main]
/Users/ionixjunior/Projects/iOS/BookTrackingLint  bf99013 [swiftlint] prunable
```

Now you can see the word "prunable" in the folder that I deleted manually. This means that Git doesn't find this worktree, but the relationship still exists in the repository. We can clean this up using the "prune" command:
```sh
git worktree prune
```

Now when we run the list command, everything is okay.
```sh
git worktree list
/Users/ionixjunior/Projects/iOS/BookTracking  9060735 [main]
```

## Conclusion

The `git worktree` command is a game-changer for any developer looking to boost their productivity and streamline their workflow. It liberates you from the limitations of constantly switching branches and juggling separate repositories, allowing you to effortlessly multitask within your Git projects. Whether you're tackling urgent hotfixes, developing multiple features in parallel, or setting up dedicated testing environments, `git worktree` provides a powerful and flexible solution. 

Take the time to explore the command, experiment with its features, and discover how it can revolutionize your approach to multitasking in Git. Your future, more efficient self will thank you for it.

See you in the next post!