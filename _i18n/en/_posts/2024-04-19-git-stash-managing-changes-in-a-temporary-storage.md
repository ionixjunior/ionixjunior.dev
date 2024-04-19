---
layout: post
title:  "Git Stash: Managing Changes in a Temporary Storage"
date:   2024-04-19
translations: ["pt"]
tags: ["git"]
---

<p class="intro"><span class="dropcap">G</span>it offers a powerful feature called "stash" that allows developers to temporarily store changes without committing them to the repository. This tool comes in handy when you need to switch branches, but you're not ready to commit your changes or when you want to store unfinished work to come back to later. In this guide, we'll delve into the concept of Git Stash, its significance in managing changes effectively, and how it streamlines your development workflow. Let's explore the art of managing changes in a temporary storage with Git Stash!</p>

## Understanding Git stash
Git stash is a feature that enables to temporarily store modified, but not yet committed, changes in a "stash" or temporary storage area. This allows developers to switch branches or perform other operations without committing incomplete work to the repository. Stashing effectively saves the current state of the working directory and the index, allowing developers to revert to it later. Stash entries are stored on a stack, enabling multiple stashes to be created and managed concurrently. This functionality provides flexibility and convenience in managing changes during the development process. Let's see how it works.

## Stashing changes
To stash changes in Git, we can use the `git stash` command. This command takes a snapshot of the current state of the working directory and the index and saves it on the stash stack.

{%- highlight sh -%}
git stash
{%- endhighlight -%}

This command creates a new stash entry with a default name and description, indicating the changes that were stashed. Once stashed, the working directory and the index are reverted to the state of the last commit, allowing developers to switch branches or perform other operations without the changes they stashed.

Also, you can specify a name for your stash to easily identify it on the stack. 

{%- highlight sh -%}
git stash save <name_of_your_stash>
{%- endhighlight -%}

## Listing and applying stashes
To list all stashes that are currently stored, we can use the `git stash list` command. This command displays a list of all stashed changes along with their respective stash IDs and descriptions. Here's how to list stashes:

{%- highlight sh -%}
git stash list
{%- endhighlight -%}

Once we identify the stash we want to apply, we can use the `git stash apply` command followed by the stash ID. Alternatively, if they want to apply the most recent stash, they can use `git stash apply` without specifying a stash ID. Here are the commands to apply stashes:

{%- highlight sh -%}
git stash apply <stash_id>
{%- endhighlight -%}

Or, apply the most recent stash:

{%- highlight sh -%}
git stash apply
{%- endhighlight -%}

Applying a stash reapplies the changes stored in the stash to the current working directory and index, allowing developers to continue working on the changes they stashed.

Also, there is a parameter called `pop` and you can use it to apply the most recent stash and remove it from stack.

{%- highlight sh -%}
git stash pop
{%- endhighlight -%}

## Viewing and managing stashed changes
It is possible to view the changes stored in a stash without applying them using the `git stash show` command. This command displays a summary of the changes in the most recent stash. To view the changes in a specific stash, we can provide the stash ID as an argument. Here's how to view stashed changes:

{%- highlight sh -%}
git stash show
{%- endhighlight -%}

Or, view the changes in a specific stash:

{%- highlight sh -%}
git stash show <stash_id>
{%- endhighlight -%}

Additionally, we can delete stashes from the stash list using the `git stash drop` command followed by the stash ID. If no stash ID is provided, the most recent stash is dropped.

{%- highlight sh -%}
git stash drop
{%- endhighlight -%}

Or, delete a specific stash:

{%- highlight sh -%}
git stash drop <stash_id>
{%- endhighlight -%}

Deleting a stash removes it from the stash list, freeing up space and ensuring that it no longer affects the repository's state. Alternatively, we can clear all stashed changes from the stash list using the `git stash clear` command. This command removes all stashes, resetting the stash list to an empty state.

{%- highlight sh -%}
git stash clear
{%- endhighlight -%}

## When to use the Git stash command
The Git stash command is incredibly versatile and can be useful in various scenarios throughout your development process. Use it when you need to temporarily set aside changes to focus on a different task or address an urgent issue. For instance, imagine you're working on a new feature branch, but suddenly need to fix a critical bug in the main branch. Instead of committing your incomplete changes or creating a separate branch, you can stash them away, switch to the main branch, make the necessary fixes, and then return to your feature branch, where you can apply the stashed changes and continue where you left off. Similarly, if you're in the middle of implementing a complex feature and need to quickly switch to a different task, stashing your changes allows you to save your progress without cluttering your commit history. 

It's important to note that the Git stash command does not save untracked files, so be sure to add them to your staging area before stashing if you want to include them in your stash.

## Managing stashes locally: important considerations
Git stashes are local and cannot be directly pushed to remote repositories. If you need to share stashed changes, you'll have to apply them locally and then commit and push them to the remote repository separately. So if you delete your local repository, all your stashes are gone.

Este recurso é algo temporário e de curta duração. Se você possui muitos stashes, pode ter algo errado aí.

## Conclusion
The ability to stash changes in Git is a powerful feature that allows developers to temporarily store modifications and switch contexts without committing unfinished work. By understanding how to create, list, apply, and manage stashes, developers can maintain a clean working directory and streamline their development workflow. Whether you're working on multiple tasks simultaneously or need to switch focus quickly, Git stash provides a convenient solution for managing changes effectively. Remember to use it wisely and leverage its capabilities to enhance your productivity and organization.

See you in the next post!