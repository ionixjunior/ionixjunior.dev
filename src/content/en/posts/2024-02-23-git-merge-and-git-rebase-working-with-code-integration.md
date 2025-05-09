+++
title = "Git Merge and Git Rebase: Working with Code Integration"
date = 2024-02-23
type = "post"
slug = "git-merge-and-git-rebase-working-with-code-integration"
categories = ["TODO"]
tags = ["git"]
social_image: "git-merge-and-git-rebase-working-with-code-integration.en.webp"
+++

<p class="intro"><span class="dropcap">S</span>truggling to work with code integration in Git? You're not alone. Understanding the differences between 'git merge' and 'git rebase' is crucial for maintaining a clean commit history and streamlining your workflow. In this post, I'll explore these two essential commands, their unique approaches to code integration, and best practices for leveraging them effectively.</p>

## Git merge: Bringing branches together
To explain the examples of `git merge`, I'll use the [Book Tracking][book_tracking_repository] repository. For these examples, my target branch is the "main", and my source branch is the "library_screen". You'll see these words in the entire post. Before we start, let's see the log of Git commits for this scenario.

{%- highlight log -%}
* 214ae0f (HEAD -> library_screen) Integrate the new screen into tab view controller
* 058a356 Add screen icon
* 38867bd Create empty state
* a282019 Load data into library screen
* d076946 Add new screen
* 9060735 (origin/main, main) Replace ifs to switch case
{%- endhighlight -%}

I recently started a new task, and the source branch is updated with the target branch. I can see this because the commits of the source branch are at the top of the target branch. Let's get started to explore the command.

The `git merge` is a fundamental command for integrating changes from one branch into another. When you execute a merge, Git combines the changes from the source branch into the target branch.

To perform a merge, navigate to the target branch and use the following command:

{%- highlight bash -%}
git merge <source_branch>
{%- endhighlight -%}

This command preserves the commit history. Git merge retains the individual commits from the source branch, preserving the history of changes. Also, merge operations are simple and intuitive, making them suitable for most collaborative scenarios. If we see the log now, we can verify that the local target branch is side-by-side with the source branch. Also, the hash of the commits doesn't change.

{%- highlight log -%}
* 214ae0f (HEAD -> main, library_screen) Integrate the new screen into tab view controller
* 058a356 Add screen icon
* 38867bd Create empty state
* a282019 Load data into library screen
* d076946 Add new screen
* 9060735 (origin/main) Replace ifs to switch case
{%- endhighlight -%}

This type of merge is called fast-forward because all the commits you've applied in the source branch will go to the target branch. Now think about it: In our source branch, we're encouraged to do many commits and, create a pull request when we finish our work. But if all is integrated into the target branch without a checkpoint, how can we know when a specific pull request was merged? We can use an option to merge using a non-fast-forward approach. Let's see it.

{%- highlight bash -%}
git merge <source_branch> --no-ff
{%- endhighlight -%}

Now, Git will ask you for a commit message to make a merge commit. It will automatically suggest a message to you. Just accept it, and let's see the log.

{%- highlight log -%}
*   1d5bf70 (HEAD -> main) Merge branch 'library_screen'
|\  
| * 214ae0f (library_screen) Integrate the new screen into tab view controller
| * 058a356 Add screen icon
| * 38867bd Create empty state
| * a282019 Load data into library screen
| * d076946 Add new screen
|/  
* 9060735 (origin/main) Replace ifs to switch case
{%- endhighlight -%}

Note that the local target branch is not alongside the source branch. It is at the top! Git creates a new commit that reflects the merged state. This way, it is easier to understand when some work has been finished. This is commonly used when we merge a pull request and facilitates if we need to revert some merge commit.

## Git rebase: Rewriting history
Git rebase offers an alternative approach to integrating changes by rewriting the commit history of the source branch. Instead of creating a new merge commit, rebase reapplies the commits from the source branch onto the tip of the target branch.

This is more common when we start a task, working on it for a time, and we need to update our source branch with the new work that our teammates already merged after our task started. For this scenario, consider the following log. See the source branch began before the current state of the target branch.

{%- highlight bash -%}
*   40650e2 (origin/main, main) Merge branch 'settings_screen'
|\  
| * 4744194 Adjust dark mode
|/  
*   1dfd858 Merge branch 'profile_screen'
|\  
| * 12b4f3d Update font
| * 03dd145 Fix typo
|/  
| * 214ae0f (HEAD -> library_screen) Integrate the new screen into tab view controller
| * 058a356 Add screen icon
| * 38867bd Create empty state
| * a282019 Load data into library screen
| * d076946 Add new screen
|/  
* 9060735 Replace ifs to switch case
{%- endhighlight -%}

Note the source branch is two merge commits behind the target branch. Maybe it's not a problem to create a pull request and integrate the code this way. But if you have trouble merging it, you'll need to update your code with the newer changes before merging it. One way to do this is by using the rebase command. To rebase the source branch onto the target branch, navigate to the source branch and use the following command:

{%- highlight bash -%}
git rebase <target_branch>
{%- endhighlight -%}

Git rebase produces a linear commit history by incorporating changes from the source branch without additional merge commits. Seeing the log, the source branch will be at the top of the target branch.

{%- highlight bash -%}
* 88dda8b (HEAD -> library_screen) Integrate the new screen into tab view controller
* 6e96461 Add screen icon
* 21d55c8 Create empty state
* 4b4e82d Load data into library screen
* 0a3073f Add new screen
*   40650e2 (origin/main, main) Merge branch 'settings_screen'
{%- endhighlight -%}

Rebasing modifies the commit history of the source branch, potentially altering the chronological order of commits and causing problems, mainly if the source branch is already on the remote repository. After the rebase, the changes in the source branch appear to start after the last change of the target branch. 

This is a simple rebase, but you can do it using the interactive mode. Use caution when performing interactive rebases, as they involve rewriting commit messages and may introduce unintended changes. Let's explore a little bit about the interactive rebase to understand how the rebase works. For this, use the `-i` parameter.

{%- highlight bash -%}
git rebase -i <target_branch>
{%- endhighlight -%}

Now, Git will show you a prompt and ask you what to do. Let's check to understand.

{%- highlight bash -%}
pick d076946 Add new screen
pick a282019 Load data into library screen
pick 38867bd Create empty state
pick 058a356 Add screen icon
pick 214ae0f Integrate the new screen into tab view controller

# Rebase 40650e2..214ae0f onto 40650e2 (5 commands)
#
# Commands:
# p, pick <commit> = use commit
# r, reword <commit> = use commit, but edit the commit message
# e, edit <commit> = use commit, but stop for amending
# s, squash <commit> = use commit, but meld into previous commit
# f, fixup [-C | -c] <commit> = like "squash" but keep only the previous
#                    commit's log message, unless -C is used, in which case
#                    keep only this commit's message; -c is same as -C but
#                    opens the editor
# x, exec <command> = run command (the rest of the line) using shell
# b, break = stop here (continue rebase later with 'git rebase --continue')
# d, drop <commit> = remove commit
# l, label <label> = label current HEAD with a name
# t, reset <label> = reset HEAD to a label
# m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
#         create a merge commit using the original merge commit's
#         message (or the oneline, if no original merge commit was
#         specified); use -c <commit> to reword the commit message
# u, update-ref <ref> = track a placeholder for the <ref> to be updated
#                       to this position in the new commits. The <ref> is
#                       updated at the end of the rebase
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
#
# However, if you remove everything, the rebase will be aborted.
#
{%- endhighlight -%}

A big message, right? Don't worry about it. First, let's focus at the top. Git shows a list with a command called "pick", the commit hash, and the commit message. This means it will try to execute the "pick" command for each listed commit in this order. The "pick" command means "cherry-pick", and we haven't seen about it until now. The `git cherry-pick` will apply the commit in the target branch. The command applies a specific commit into another branch, changing the commit hash but keeping the author, the message, and the timestamp.

At the bottom, we have a big commented message. This message contains tips for other commands that we can use like reword, edit, squash, and other options. These other commands aren't used much but feel free to read the Git instructions and try them.

Nice, but when to use these commands? Let's talk about it.

## When to use these commands
Usually, the `git merge` is used for collaborative development workflows where preserving the original commit history is essential. We can do this when we create a pull request or divide our work into different parts in our machine and need to merge.

The `git rebase` is used for clean history. Opt for this command to maintain a linear commit history and streamline feature branches before merging them into the mainline. Usually, it is used before creating a pull request to guarantee our work is updated with the target branch.

As I posted about force pushing in the [last article][last_post], the rebase can bring problems if you aren't working alone in a branch. Because of this, I believe some people prefer the back merge strategy instead of the rebase. Let's try the back merge strategy and see the results. The objective is to update our source branch with newer changes to the target branch. Assuming the repository is completely updated, let's stay in our source branch and execute the back merge.

{%- highlight bash -%}
git merge <target_branch>
{%- endhighlight -%}

Git will prompt you with a merge commit message. It will suggest a message, and you can accept it. This will be a merge commit. Seeing the log, we can get the following result:

{%- highlight bash -%}
*   190f6b6 (HEAD -> library_screen) Merge branch 'main' into library_screen
|\  
| *   40650e2 (origin/main, main) Merge branch 'settings_screen'
| |\  
| | * 4744194 Adjust dark mode
| |/  
| *   1dfd858 Merge branch 'profile_screen'
| |\  
| | * 12b4f3d Update font
| | * 03dd145 Fix typo
| |/  
* | 214ae0f Integrate the new screen into tab view controller
* | 058a356 Add screen icon
* | 38867bd Create empty state
* | a282019 Load data into library screen
* | d076946 Add new screen
|/  
* 9060735 Replace ifs to switch case
{%- endhighlight -%}

The result is similar to the rebase command but without rewriting the commit history. In the graph, we can see all the target branch changes merging into the source branch. In my opinion, it causes a little mess if you analyze the commit history. I feel a little confused seeing this, and because of this, I prefer to use rebase in this case.

Many look for rules to follow, but this is a case where you need to think about the best tool to solve your problem or which approach your team or you prefer. I prefer rebase to maintain a linear commit history. What about you?

## Conclusion
Working with code integration in Git requires a nuanced understanding of the `git merge` and the `git rebase` commands. By choosing the right approach for each scenario and adhering to best practices, developers can effectively manage code changes, foster collaboration, and maintain a clean and organized commit history. Experiment with both commands to find the workflow that best suits your project's needs and enhance your version control skills today!

Stay tuned for more insights into mastering Git and unlocking the full potential of version control. Happy coding!

[book_tracking_repository]: https://github.com/ionixjunior/BookTracking
[last_post]:                /{{ site.lang }}/git-push-demystified-pushing-your-commits-with-confidence/#force-pushing