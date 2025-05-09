+++
title = "Understanding Git Commit: The Heart of Version Control"
date = 2024-02-02
type = "post"
slug = "understanding-git-commit-the-heart-of-version-control"
translationKey = "understanding-git-commit-the-heart-of-version-control"
categories = ["TODO"]
tags = ["git"]
image = "/img/cards/understanding-git-commit-the-heart-of-version-control.en.webp"
+++

In the realm of version control, the Git commit is more than a snapshot; it's the heartbeat of your project. Each commit is a deliberate note in the symphony of development, encapsulating changes, decisions, and progress. Join me as we unravel the essence of the Git commit—understanding its components, mastering the art of concise messages, and appreciating its pivotal role in shaping a coherent version of history.

The **Git commit**, a snapshot frozen in the chronicles of your project’s history, is more than meets the eye. Let’s explore its anatomy, understanding its elements of it.

### Anatomy of a Git Commit
Each commit contains four main elements: Hash, author, date and time of the commit, and the message.

The hash is a cryptographic fingerprint ensuring data integrity. This hash, often expressed as a series of characters, serves as a distinctive label for each commit, allowing Git to maintain a precise record of changes.

The authorship of a commit is a fundamental aspect, revealing who introduced specific changes. Git captures and attributes the author's identity, fostering accountability and transparency in collaborative development.

The commit timestamp, recording the date and time of the commit, contributes historical context to the project's evolution. This temporal information helps developers trace the timeline of changes, providing insights into when specific modifications were integrated into the codebase.

Finally, the commit message emerges as the narrative thread tying it all together. More than just a description, a well-crafted commit message is a concise yet comprehensive summary of the changes introduced. Effective commit messages enhance **collaboration** by clearly communicating the purpose and impact of each commit, facilitating a smooth understanding of the project's development history. If you want to learn how to write good commit messages, I suggest you read [this post][git_commit_post].

Let's see all these things in the commit below. The hash side by `commit` text, the commit's author (Paul Ricard and his email), the date of the commit, and the message at the bottom.

{%- highlight diff -%}
commit 8934fac280ff394926df4746d31da52f431d52bf
Author: Paul Ricard <paul@ricard.dev>
Date:   Sun Jan 14 18:14:34 2024 -0000

    Fix typo

{%- endhighlight -%}

### Basic usage
As long as the files have been added to the staging area, you can start to use the `git commit` command. As I wrote in the [Git basics post][git_basics_post], you can make your commit and add a message title with the following command:

{%- highlight sh -%}
git commit -m "Your commit title"
{%- endhighlight -%}

Let's explore other possibilities.

### Amend the last commit
You commit your files and then notice an error in your commit message. Maybe there are typos, or you wish to include more details. But how do you address this if the commit is already completed? No need to worry! You can effortlessly amend your last commit:

{%- highlight sh -%}
git commit --amend
{%- endhighlight -%}

This way, Git prompts you to your preferred editor, and you can fix your message commit. If you want to update the commit message and don't see the Git prompt, you can include the message with the command.

{%- highlight sh -%}
git commit --amend -m "Your new title"
{%- endhighlight -%}

Now think about the following situation: You finish the commit and forget to add some files. Do you need to do another commit? No! You can add this file to the stage using `git add` and then amend your last commit with the new files. One more thing: If you don't want to change your message, you can specify the `--no-edit` parameter, and Git won't prompt you anything.

{%- highlight sh -%}
git commit --amend --no-edit
{%- endhighlight -%}

Be careful with the `--amend` option because it changes the commit hash. If the commit exists only in your local machine, no problem. But if the commit already exists in the remote repository (like GitHub, GitLab, or BitBucket), maybe your colleagues have difficulty updating the project after you push the amended changes to the remote repository.

### Include files to the staging area and commit together
If you feel confident and plan to commit all the changed files without reviewing anything (please, don't do this), you can use the `-a` option. This parameter will stage the changes automatically before the commit.

{%- highlight sh -%}
git commit -a -m "Commit title"
{%- endhighlight -%}

If you prefer, you can join the parameters to simplify.

{%- highlight sh -%}
git commit -am "Commit title"
{%- endhighlight -%}

I already have used this a lot. Very easy, and simple, but without any control over what you are adding to the repository. Use wisely.

### Empty commits
What? This does not make sense! Yes, but sometimes this can be useful. Imagine that you are configuring your project pipeline in a CI/CD platform (like GitHub Actions, Azure DevOps, Bitrise, and so on), and you need to make some commit to test the pipeline trigger. What will you do? Do you change some files and send them to the remote repository? This will work, but you can make a commit without changing anything.

{%- highlight sh -%}
git commit --allow-empty -m "Title of your empty commit"
{%- endhighlight -%}

### That's it
This was one more Git command to learn how to use and practice. Remember, each commit you make represents one more chapter of the software history that you are telling. 

Be kind to your colleagues and try to explain the code you are developing in your message commits. They will thank you later when they try to understand something you coded.

See you in the next post. Bye!

[git_basics_post]: /{{ site.lang }}/git-basics-an-in-depth-look-at-essential-commands/#git-commit
[git_commit_post]:  https://cbea.ms/git-commit/