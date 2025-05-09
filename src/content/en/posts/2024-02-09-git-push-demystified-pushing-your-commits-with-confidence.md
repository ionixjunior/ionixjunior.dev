+++
layout: post
title = "Git Push Demystified: Pushing Your Commits with Confidence"
date:   2024-02-09
translations: ["pt"]
tags: ["git"]
social_image: "git-push-demystified-pushing-your-commits-with-confidence.en.webp"
+++

<p class="intro"><span class="dropcap">I</span>n Git, git push is the command that moves your local commits to a remote repository. It's the action you do when you want to share your work with others or update a shared codebase. Think of it as a way to publish your local changes and keep everyone on the same page. In a nutshell, git push is about taking your local progress and making it visible and accessible to the development team or collaborators. It's a fundamental command in Git that is crucial in collaborative coding. In this post, I'll show you this command in action!</p>

Imagine you are developing a new feature or fixing something, and you are doing this in your local branch. Now you have finished your work and need to send your changes to the remote repository to create a pull or merge request if you use GitLab. How to do this? Let's see the simple way to run the `git push` command.

## Basic usage
To use the `git push` command, think: Push to where? Push to a remote repository, right? Yeah, but where and how is this configured? When you make a clone from a repository, this is automatically configured, and you can see this with the `git remote` command with the `-v` parameter:

{%- highlight sh -%}
git remote -v

origin	git@github.com:ionixjunior/BookTracking.git (fetch)
origin	git@github.com:ionixjunior/BookTracking.git (push)
{%- endhighlight -%}

I'm using the repository [Book Tracking][book_tracking_repository] for the examples. I've cloned this repository to my machine and started working on it. In the result, I have a remote name called "origin", the link of the repository, and the action that I can make - fetch and push. Now I've only one remote repository, the origin. In Git, the "origin" is a shorthand name for the remote repository that a project was cloned from. You can change this name if you prefer, but it's a convention, and it is better to use the default name. Supposing I'm working in a branch called "hotfix_main_screen", let's push it to the remote repository.

{%- highlight sh -%}
git push origin hotfix_main_screen
{%- endhighlight -%}

With this, we sent our changes of the "hotfix_main_screen" branch to the remote repository called "origin", and now we'll be able to create a pull request or save our job in the remote repository, e.g.

If you're on a long work with your branch, maybe you want to make it easier. Let's talk about tracking branches.

## Tracking branches
This is a simple way to simplify this command. Instead of repeating the entire command when you want to push your changes, you can set up the tracking using the parameter `-u` or `--set-upstream`. This will establish a tracking relationship between the remote repository and the branch you're working on.

{%- highlight sh -%}
git push -u origin hotfix_main_screen
{%- endhighlight -%}

This is typically done the first time you push a branch. Now, you can simplify this when you're working on your branch:

{%- highlight sh -%}
git push
{%- endhighlight -%}

If you want to use this way, you'll need to set up the tracking in every new branch you'll work. Everything has worked fine until now, but let's talk about a dangerous parameter, but very useful sometimes.

## Force pushing
The force pushing is a parameter that should be used with parsimony, as it overwrites the remote repository branch's history with the local one. While it can be a powerful tool, it also comes with potential risks, especially in collaborative settings.

Suppose you've created a pull request, your colleagues review it, suggest changes, you apply most of them, and you're prepared to push again. Unfortunately, since you created the pull request, the code base has changed a lot, and this causes a merge conflict with your branch. One solution is to rebase your branch with the main branch, solve the conflict, and be happy. The rebase will pick up all your commits and apply after the last commit of the main branch. The rebase helps to make a clean Git history, but there's a problem: All our Git commit hashes changes with this action, and you can't simply push the changes now. When you try to send your changes, you can get a message like this:

{%- highlight sh -%}
git push origin hotfix_main_screen

To git@github.com:ionixjunior/BookTracking.git
 ! [rejected]        hotfix_main_screen -> hotfix_main_screen (non-fast-forward)
error: failed to push some refs to 'github.com:ionixjunior/BookTracking.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
{%- endhighlight -%}

This happens because the rebase action changes the hash commits. You rewrite the Git history in your local repository, and when you do the push action, the remote repository does not understand why the hashes changed. To solve this, you can add the parameter `-f` or `--force` to push your changes and allow the remote repository to accept your local changes.

{%- highlight sh -%}
git push origin hotfix_main_screen -f
{%- endhighlight -%}

The rebase won't be a problem if you're working alone on a branch. But be careful with this. I believe because of this, some people prefer the back merge strategy.

Very nice! Now, I'll explain how you'll push your changes to a different repository than the origin and when this will be necessary.

## Origin and upstream
We're talking about another Git convention. Suppose you find a project on GitHub and want to contribute. Following the best practices to collaborate, what do you need to do? First, you need to fork the project to your GitHub account, clone your repository to your machine, make the changes you're proposing or fixing, and then push the changes to your repository, the origin. When you open GitHub, you'll see a button to create a pull request to the forked repository. You do this, your pull request is accepted (or not), and you want to continue contributing. How can you make your repository synced with the forked repository? The response is on the remote repositories connected. 

When you clone your repository to your machine, Git creates a bond with the remote repository and calls it the "origin". With this, you can communicate with your repository through fetch and push commands. But you can add another repository to get or send data. In this scenario, you can add another remote repository to track changes in the forked project. This is common in fork-based development workflows where developers contribute changes back to the original project. Let's do it. Suppose I've forked the Book Tracking project from another repository, and I'll configure the remote bond in my machine. I'll call it the "upstream" because this is another Git convention.

{%- highlight sh -%}
git remote add upstream git@github.com:laurasmithdev/BookTracking.git
{%- endhighlight -%}

Now, I can check all the remotes in my local repository.

{%- highlight sh -%}
git remote -v

origin	git@github.com:ionixjunior/BookTracking.git (fetch)
origin	git@github.com:ionixjunior/BookTracking.git (push)
upstream	git@github.com:laurasmithdev/BookTracking.git (fetch)
upstream	git@github.com:laurasmithdev/BookTracking.git (push)
{%- endhighlight -%}

Now Git is telling me that I can make fetch and push operations to the upstream repository. Starting from the assumption that I can update my repository (the origin) with all new changes of the forked repository (the upstream), I can do this in my repository:

{%- highlight sh -%}
git fetch upstream
{%- endhighlight -%}

This is a way to get the new changes from the forked repository to yours. This won't merge the changes to your repository. This only fetches. Today, we have a button on GitHub that you can make this action from UI, but this is exactly some part of the action that the button does. Spoiler alert: I'll tell you about the fetch command in the next post. Because of this, I won't add more details right now.

## Git push: The key to collaboration
In summary, mastering the `git push` command empowers developers to confidently share their work with collaborators and contribute to the project's progress. By understanding its syntax, options, and conventions, developers can ensure seamless collaboration, maintain a synchronized codebase, and drive the project forward. Embrace the power of `git push` to propel your development journey with efficiency and effectiveness.

Tell me in the comments if you already faced some scenarios that I talked about in this post, or share another tip that you believe is important. 

Stay tuned for the next posts. See you soon!

[book_tracking_repository]: https://github.com/ionixjunior/BookTracking