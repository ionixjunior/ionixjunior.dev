---
layout: post
title:  "Mastering Git Branching Basics: Exploring the git branch Command"
date:   2024-02-19
translations: ["pt"]
tags: ["git"]
---

<p class="intro"><span class="dropcap">E</span>mbarking on your journey with Git involves mastering its fundamental commands, and among them, git branch stands out as a pivotal tool for managing branches. In this guide, we'll delve deep into the git branch command, exploring its various functionalities, from listing existing branches to creating and deleting them. By the end, you'll wield the power of branching with confidence, laying a solid foundation for your Git workflow.</p>

## Listing branches
To start, we can see all the branches we have on our local repository. Again, I'm using the [Book Tracking][book_tracking_repository] repository.

{%- highlight bash -%}
git branch

  improve_highlight_cell
  library_screen
* main
{%- endhighlight -%}

Currently, I'm in the main branch, and we can see an asterisk on it. This command list only the local branches. If you need, you can list the remote branches with `-r` parameter.

{%- highlight bash -%}
git branch -r

  origin/main
{%- endhighlight -%}

You can also display all the branches, both local and remote, by using the `-a` parameter.

{%- highlight bash -%}
git branch -a

  improve_highlight_cell
  library_screen
* main
  remotes/origin/main
{%- endhighlight -%}

Now you know how to list the branches, let's create one.

## Creating branches
Create a branch is easy. To show you, I'll use the name "a_new_branch" to create a new one.

{%- highlight bash -%}
git branch a_new_branch
{%- endhighlight -%}

Git won't show us anything, but we can use the `git branch` to list the branches.

{%- highlight bash -%}
git branch

  a_new_branch
  improve_highlight_cell
  library_screen
* main
{%- endhighlight -%}

Great! But this command only creates a branch but don't change the Git pointer (checkout). To this, we need to use the `git switch` to change between branches.

{%- highlight jabashvascript -%}
git switch a_new_branch

Switched to branch 'a_new_branch'
{%- endhighlight -%}

Now, if we visualize the branch list, the asterisk is on the branch we switch.

{%- highlight bash -%}
git branch

* a_new_branch
  improve_highlight_cell
  library_screen
  main
{%- endhighlight -%}

Suppose you created the branch and want to change its name. How to do this? Let's see.

## Changing the branch name
Changing the branch name can be made with the `-m` parameter. I'm going to change the branch name to "dark_mode_support".

{%- highlight bash -%}
git branch -m dark_mode_support
{%- endhighlight -%}

If we check the branch list now, we can see the branch renamed.

{%- highlight bash -%}
git branch

* dark_mode_support
  improve_highlight_cell
  library_screen
  main
{%- endhighlight -%}

Very nice! But what can we do if we create a wrong branch and need to delete it? 

## Deleting a branch
To delete a branch, we need to checkout to another branch and execute the command with `-D` parameter to delete it. 

{%- highlight bash -%}
git branch -D dark_mode_support

Deleted branch dark_mode_support (was 40650e2).
{%- endhighlight -%}

## Pro-tips
To simplify the branch creation and change, we can use the `git switch` command with the `-c` parameter. This way the Git will create the new branch and immediately will make the checkout to it.

{%- highlight bash -%}
git switch -c name_of_your_branch

Switched to a new branch 'name_of_your_branch'
{%- endhighlight -%}

Another great tip is about changing branches. Suppose we are on the main branch and execute the `git switch` to checkout to another branch. Now we want to go back to the main branch again. We can type the `git switch` and specify the name of branch we need to go or simple type the `-` parameter to go to the previous branch.

{%- highlight bash -%}
git switch -

Switched to branch 'main'
{%- endhighlight -%}

This is very useful when we're doing this simple branch swaps.

## We aren't done!
As you've seen, mastering the `git branch` command is a crucial step towards harnessing the full potential of Git's branching capabilities. Armed with this knowledge, you're now equipped to navigate branches with ease, laying the groundwork for more advanced branching strategies. In our next post, we'll elevate our understanding further as we explore comprehensive Git branching strategies, unveiling the diverse approaches teams use to manage project development effectively. Stay tuned for an in-depth exploration of Git's branching landscape!

[book_tracking_repository]: https://github.com/ionixjunior/BookTracking/