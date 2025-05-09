+++
title = "Git Log Command: Navigating Your Project's History"
date:   2024-03-15
translations: ["pt"]
tags: ["git"]
social_image: "git-log-command-navigating-your-projects-history.en.webp"
+++

<p class="intro"><span class="dropcap">W</span>elcome to the world of version control, where every commit tells a story about your project's journey. Understanding this narrative is key to effective collaboration, bug tracking, and project management. That's where the Git log command comes in. In this post, we'll embark on a journey through your project's history, using the Git log command as our trusty guide. We'll learn how to navigate through commits, explore changes, and uncover insights that will help you become a master of your project's story. So, buckle up as we dive into the Git log command and unlock the secrets hidden within your project's history!</p>

## Understanding git log
The `git log` command provides a comprehensive view of your project's history, allowing you to delve into each commit's details. It enables you to track down who made changes, when those changes occurred, and the motivations behind them.

To view the commit history of your project, simply enter `git log` in your terminal. This will display a chronological list of commits, starting with the most recent.

{%- highlight bash -%}
git log

commit e6b3812b55d039f525f7d2fc07ae22f3c0260c7e (HEAD -> main, origin/main)
Author: John Doe <john@example.com>
Date:   Tue Feb 15 10:21:37 2024 -0500

    Merge pull request #123 from user/feature-branch

commit 87fc9d3e493e5f342e1a8d1a3b0ec110d57e0512
Author: Jane Smith <jane@example.com>
Date:   Mon Feb 14 16:42:19 2024 -0500

    Add new feature

commit 9a4d8fbf9c0e190e7f142bc9c48a6b91575ab228
Author: John Doe <john@example.com>
Date:   Mon Feb 14 12:09:48 2024 -0500

    Fix bug in authentication

commit a3c8f1d27c41b1d0107e163132f7eaf4eb9f3f2f
Author: John Doe <john@example.com>
Date:   Sun Feb 13 18:15:02 2024 -0500

    Update documentation

commit 7b7ae9f1f9c2e588bc1c1d101d6c1df68c2e7dd0
Author: Jane Smith <jane@example.com>
Date:   Sat Feb 12 09:30:51 2024 -0500

    Initial commit

{%- endhighlight -%}

The log presents each commit with detailed information, including the commit hash, author, date, and commit message. You can scroll through the log using your preferred text editor, or by pressing the spacebar to move forward and the "q" key to exit.

## Filtering log
Git log offers various options to tailor the output to your needs. For instance, you can filter by author, search for specific changes, or format the output to include only essential details.

Filtering only commits by "Jane Smith":
{%- highlight bash -%}
git log --author="Jane Smith"

commit 87fc9d3e493e5f342e1a8d1a3b0ec110d57e0512
Author: Jane Smith <jane@example.com>
Date:   Mon Feb 14 16:42:19 2024 -0500

    Add new feature

commit 7b7ae9f1f9c2e588bc1c1d101d6c1df68c2e7dd0
Author: Jane Smith <jane@example.com>
Date:   Sat Feb 12 09:30:51 2024 -0500

    Initial commit

{%- endhighlight -%}

Filtering only commits since February, 14 2024:
{%- highlight bash -%}
git log --since="2024-02-14"

commit e6b3812b55d039f525f7d2fc07ae22f3c0260c7e (HEAD -> main, origin/main)
Author: John Doe <john@example.com>
Date:   Tue Feb 15 10:21:37 2024 -0500

    Merge pull request #123 from user/feature-branch

commit 87fc9d3e493e5f342e1a8d1a3b0ec110d57e0512
Author: Jane Smith <jane@example.com>
Date:   Mon Feb 14 16:42:19 2024 -0500

    Add new feature

commit 9a4d8fbf9c0e190e7f142bc9c48a6b91575ab228
Author: John Doe <john@example.com>
Date:   Mon Feb 14 12:09:48 2024 -0500

    Fix bug in authentication
{%- endhighlight -%}

Filtering only commits until February, 14 2024:
{%- highlight bash -%}
git log --until="2024-02-14"

commit 87fc9d3e493e5f342e1a8d1a3b0ec110d57e0512
Author: Jane Smith <jane@example.com>
Date:   Mon Feb 14 16:42:19 2024 -0500

    Add new feature

commit 9a4d8fbf9c0e190e7f142bc9c48a6b91575ab228
Author: John Doe <john@example.com>
Date:   Mon Feb 14 12:09:48 2024 -0500

    Fix bug in authentication

commit a3c8f1d27c41b1d0107e163132f7eaf4eb9f3f2f
Author: John Doe <john@example.com>
Date:   Sun Feb 13 18:15:02 2024 -0500

    Update documentation

commit 7b7ae9f1f9c2e588bc1c1d101d6c1df68c2e7dd0
Author: Jane Smith <jane@example.com>
Date:   Sat Feb 12 09:30:51 2024 -0500

    Initial commit

{%- endhighlight -%}

Filtering only commits that mention "authentication" on commit message:
{%- highlight bash -%}
git log --grep="authentication"

commit 9a4d8fbf9c0e190e7f142bc9c48a6b91575ab228
Author: John Doe <john@example.com>
Date:   Mon Feb 14 12:09:48 2024 -0500

    Fix bug in authentication
{%- endhighlight -%}

## Visualizing history
For a more visual representation of your project's history, you can use tools like `git log --graph`, which displays commits as a graph, showing branching and merging.

{%- highlight bash -%}
git log --graph

*   commit e6b3812b55d039f525f7d2fc07ae22f3c0260c7e (HEAD -> main, origin/main)
|\  Author: John Doe <john@example.com>
| | Date:   Tue Feb 15 10:21:37 2024 -0500
| |
| |     Merge pull request #123 from user/feature-branch
| |
| * commit 87fc9d3e493e5f342e1a8d1a3b0ec110d57e0512
| | Author: Jane Smith <jane@example.com>
| | Date:   Mon Feb 14 16:42:19 2024 -0500
| |
| |     Add new feature
| |
| * commit 9a4d8fbf9c0e190e7f142bc9c48a6b91575ab228
|/  Author: John Doe <john@example.com>
|   Date:   Mon Feb 14 12:09:48 2024 -0500
|
|       Fix bug in authentication
|
* commit a3c8f1d27c41b1d0107e163132f7eaf4eb9f3f2f
| Author: John Doe <john@example.com>
| Date:   Sun Feb 13 18:15:02 2024 -0500
|
|     Update documentation
|
* commit 7b7ae9f1f9c2e588bc1c1d101d6c1df68c2e7dd0
  Author: Jane Smith <jane@example.com>
  Date:   Sat Feb 12 09:30:51 2024 -0500
  
      Initial commit

{%- endhighlight -%}

If you want to see a simpler way, with only one line per commit, you can specify the `--oneline` parameter:

{%- highlight bash -%}
git log --graph --oneline

* e6b3812 Merge pull request #123 from user/feature-branch
|\
| * 87fc9d3 Add new feature
| * 9a4d8fb Fix bug in authentication
|/
* a3c8f1d Update documentation
* 7b7ae9f Initial commit
{%- endhighlight -%}

This approach is commonly used on IDEs to show the log of the repository. Also, you can specify what type of information you want to see in the log. Use the `--format` parameter to specify the data that you want. To do this, you'll use some placeholders to select what information to show. The more common are the abbreviated commit hash (%h), the author name (%an), the author date (%aD), and the commit title (%s).

{%- highlight bash -%}
git log --graph --format='%h - %an - %aD - %s'

* e6b3812 - John Doe - Tue, 15 Feb 2024 10:21:37 -0500 - Merge pull request #123 from user/feature-branch
|\
| * 87fc9d3 - Jane Smith - Mon, 14 Feb 2024 16:42:19 -0500 - Add new feature
| * 9a4d8fb - John Doe - Mon, 14 Feb 2024 12:09:48 -0500 - Fix bug in authentication
|/  
* a3c8f1d - John Doe - Sun, 13 Feb 2024 18:15:02 -0500 - Update documentation
* 7b7ae9f - Jane Smith - Sat, 12 Feb 2024 09:30:51 -0500 - Initial commit

{%- endhighlight -%}

You can see all the options on [Git pretty formats documentation][git_pretty_format_doc].

## Wrap-Up
The Git log command is a powerful tool for navigating and understanding your project's commit history. By mastering its various options and techniques, you can gain valuable insights into how your codebase has evolved over time, track down specific changes, and collaborate more effectively with your team. Whether you're filtering commits by author or date, searching commit messages for keywords, or visualizing commit history as a graph, Git log provides the flexibility and control you need to explore your project's history with confidence. So dive in, experiment with different options, and unlock the full potential of Git log in your development workflow. Happy coding!

[git_pretty_format_doc]: https://git-scm.com/docs/pretty-formats