---
layout: post
title:  "Git Merge and Git Rebase: Navigating Code Integration"
date:   2024-02-14
translations: ["pt"]
tags: ["git"]
---

<p class="intro"><span class="dropcap">S</span>truggling to navigate code integration in Git? You're not alone. Understanding the differences between 'git merge' and 'git rebase' is crucial for maintaining a clean commit history and streamlining your workflow. In this post, we'll explore these two essential commands, their unique approaches to code integration, and best practices for leveraging them effectively.</p>

To explain the examples, I going to use the [Book Tracking][book_tracking_repository] repository. For these examples, suppose I have a branch called "library_screen". It will be my source branch and my target branch is called "main". Before we start, let's see the log of Git commits for this scenario.

{%- highlight log -%}
* 214ae0f (HEAD -> library_screen) Integrate the new screen into tab view controller
* 058a356 Add screen icon
* 38867bd Create empty state
* a282019 Load data into library screen
* d076946 Add new screen
* 9060735 (origin/main, main) Replace ifs to switch case
{%- endhighlight -%}

Note at the bottom is the target branch (the main) and at the top the source branch (the library_screen). Ok, let's get started to explore these commands!

## Git merge: Bringing branches together
Git merge is a fundamental command for integrating changes from one branch into another. When you execute a merge, Git combines the changes from the source branch into the target branch, creating a new commit that reflects the merged state.

### Basic usage
To perform a merge, navigate to the target branch and use the following command:

{%- highlight bash -%}
git merge <source_branch>
{%- endhighlight -%}

This command preserves the commit history. Git merge retains the individual commits from the source branch, preserving the history of changes. Also, merge operations are simple and intuitive, making them suitable for most collaborative scenarios. If we see the log now, we can verify that the local "main" branch is side by side with the "library_screen" branch. Also, the hash of the commits doesn't change.

{%- highlight log -%}
* 214ae0f (HEAD -> main, library_screen) Integrate the new screen into tab view controller
* 058a356 Add screen icon
* 38867bd Create empty state
* a282019 Load data into library screen
* d076946 Add new screen
* 9060735 (origin/main) Replace ifs to switch case
{%- endhighlight -%}

This merge is called fast forward because all the commits you've applied in the source branch will go to the target branch. Think about it: In our source branch, we're encouraged to apply many commits, undo things, and create a pull request when we finish our work. But if all is integrated into the target branch without a "checkpoint", how can I know a specific pull request was merged? We can use an option to merge using a non-fast-forward approach. Let's see it.

{%- highlight bash -%}
git merge <source_branch> --no-ff
{%- endhighlight -%}

Now, Git will ask you the commits message, because it will make a merge commit. They'll automatically suggest to you a merge commit. Just accept it and let's see the log right now.

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

Note that the local "main" branch is not side by side with the "library_screen" branch. It is at the top! Git creates a merge commit to add all the commits of the source branch to the target branch. This way is easier to understand when some work is started and finished.




Git merge generates a new merge commit, which can clutter the commit history with unnecessary merge messages if not managed effectively. 

## Git rebase: Rewriting history
Git rebase offers an alternative approach to integrating changes by rewriting the commit history of the target branch. Instead of creating a new merge commit, rebase reapplies the commits from the source branch onto the tip of the target branch.

### Basic usage
To rebase a branch onto another branch, navigate to the target branch and use the following command:

{%- highlight bash -%}
git rebase <base_branch>
{%- endhighlight -%}

Git rebase produces a linear commit history by incorporating changes from the source branch without additional merge commits.

<!-- Squash Commits: Rebase allows users to squash or combine multiple commits into a single commit, promoting cleaner and more concise commit messages.
Considerations: -->

Rebasing modifies the commit history of the target branch, potentially altering the chronological order of commits and causing conflicts. Also, you can make the rebase using the interactive mode. Use caution when performing interactive rebases, as they involve rewriting commit messages and may introduce unintended changes.

Nice, but when do need I to use these commands? Let's talk about some best practices.

## Best practices for code integration
Merge for Collaboration: Use git merge for collaborative development workflows where preserving the original commit history is essential.
Rebase for Clean History: Opt for git rebase to maintain a linear commit history and streamline feature branches before merging them into the mainline.

## Conclusion
Navigating code integration in Git requires a nuanced understanding of git merge and git rebase. By choosing the right approach for each scenario and adhering to best practices, developers can effectively manage code changes, foster collaboration, and maintain a clean and organized commit history. Experiment with both commands to find the workflow that best suits your project's needs and enhance your version control skills today!

Stay tuned for more insights into mastering Git and unlocking the full potential of version control. Happy coding!

[book_tracking_repository]: https://github.com/ionixjunior/BookTracking