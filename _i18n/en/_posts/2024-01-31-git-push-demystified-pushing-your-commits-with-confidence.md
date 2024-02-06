---
layout: post
title:  "Git Push Demystified: Pushing Your Commits with Confidence"
date:   2024-01-31
translations: ["pt"]
tags: ["git"]
social_image: "git-push-demystified-pushing-your-commits-with-confidence.en.png"
---

<p class="intro"><span class="dropcap">I</span>n Git, git push is the command that moves your local commits to a remote repository. It's the action you take when you want to share your work with others or update a shared codebase. Think of it as a way to publish your local changes and keep everyone on the same page. In a nutshell, git push is about taking your local progress and making it visible and accessible to the wider development team or collaborators. It's a fundamental command in Git that plays a crucial role in collaborative coding. In this post, I'll show you this command in action!</p>

Imagine you are developing a new feature or fixing something and you are doing this in your local branch. Now you have finished your work and need to send your changes to the remote repository to create a pull request or merge request if you are using GitLab. How to do this? Let's see the basic usage of the `git push` command.

## Basic usage
To use the `git push` command, we need to think: Push to where? Push to a remote repository, right? Yeah, but where and how is this configured? When you make a clone from a repository, this is automatically configured and you can see what is this configuration with the following command:

{%- highlight sh -%}
git remote -v

origin	git@github.com:ionixjunior/BookTracking.git (fetch)
origin	git@github.com:ionixjunior/BookTracking.git (push)
{%- endhighlight -%}

I'm using the repository [Book Tracking][book_tracking_repository] for the examples. I've cloned this repository to my machine and started working on it. In the result, I have a remote name called "origin", the link of the repository, and the action that you can make - fetch and push. Each line means the action that we can make in the remote repository. Now I have only one, the origin. In Git, the "origin" is a shorthand name for the remote repository that a project was originally cloned from. You can change this name if you prefer, but it's a good convention to use de default name. Suppose I'm working in a branch called "hotfix_main_screen". Let's push it to the remote repository.

{%- highlight sh -%}
git push origin hotfix_main_screen
{%- endhighlight -%}

With this, we'll be able to create a pull request, or simple save or job in the remote repository, e.g.

In a long journey in your branch, maybe you want to make something easier. Let's talk about tracking branches.

## Tracking Branches
This is a simple way to simplify this command. Instead of specifying the entire command that I showed you previously every time you want to push your changes, you can set up the tracking using the parameter `-u` or `--set-upstream`. This will establish a tracking relationship between the remote repository and the branch you are working. 

{%- highlight sh -%}
git push -u origin hotfix_main_screen
{%- endhighlight -%}

This is typically done the first time you push a branch. Now, you can simply do this:

{%- highlight sh -%}
git push
{%- endhighlight -%}

If you want to use this way, you need to set up the tracking in every new branch you'll working on. Everything has worked fine until now, but let's talk about a dangerous parameter, but very useful. 

## Force Pushing
The force pushing is a command that should be used with caution, as it overwrites the remote repository branch's history with the local one. While it can be a powerful tool, it also comes with potential risks, especially in collaborative settings. 

Suppose you create a pull request, your colleagues review it, suggest to you some changes and you're prepared to push again. But unfortunately, since you create the pull request the code base changes a lot or will cause a merge conflict on your branch. One option you have is to rebase your branch to the main branch. This will pick up all your commits after the main branch, as you can have started you change after the last commits of the main branch. This command help to make a clean Git history, but there's a problem: All our Git commit hashes will be changed and you can't simply push the changes now. To solve this, just add the parameter `-f` or `--force` to push your changes and rewrite the branch's history. 

{%- highlight javascript -%}
git push origin hotfix_main_screen -f
{%- endhighlight -%}

This is not a problem if is only you working in a specific branch, but be careful with this. I believe because of this many people prefer the back merge strategy.

[book_tracking_repository]: https://github.com/ionixjunior/BookTracking