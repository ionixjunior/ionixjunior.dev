+++
title = "Git Diff Explained: Understanding Code Differences with Ease"
date = 2024-05-31
type = "post"
categories = ["TODO"]
tags = ["git"]
social_image: "git-diff-explained-understanding-code-differences-with-ease.en.webp"
+++

<p class="intro"><span class="dropcap">E</span>ver struggled to remember what changes you made in your code? Or maybe you've accidentally deleted a vital line and spent hours trying to figure out how to recover it? Or just you make some changes and want to review it before to commit? We've all been there. But fear not, dear coder! There's a powerful tool in Git's arsenal that can make your life significantly easier: Git Diff. In this post we'll learn about it.</p>

## Understanding Git Diff's Basics

**Git Diff** is like having a magnifying glass for your code changes. It lets you compare two versions of your code and see exactly what has been added, removed, or modified.

Imagine you're working on a document with "track changes" enabled. **Git Diff** works similarly, but for your code. It highlights the differences between two versions of a file, making it easy to understand what's changed and how.

### How to Use It:

The basic **Git Diff** command is: `git diff`. This command will compare the current state of your working directory to the last commit you made. Here's a simple example using a file called `Foo.swift`:

{%- highlight swift -%}
class Foo {
    func bar() {
        print("Hello, world!")
    }
}
{%- endhighlight -%}

Let's say you make a change to `Foo.swift`:

{%- highlight swift -%}
class Foo {
    func bar() {
        print("Hello, world! I've been updated.")
    }
}
{%- endhighlight -%}

Now, if you run `git diff` in your terminal, you'll see the following output:

{%- highlight diff -%}
git diff

diff --git a/Foo.swift b/Foo.swift
index 495198a..6543e6d 100644
--- a/Foo.swift
+++ b/Foo.swift
@@ -3,4 +3,4 @@
 class Foo {
     func bar() {
-        print("Hello, world!")
+        print("Hello, world! I've been updated.")
     }
 }
{%- endhighlight -%}

This output shows:

- **- - - a/Foo.swift**: This line represents the original version of the file.
- **+++ b/Foo.swift**: This line represents the modified version of the file.
- **@@ -3,4 +3,4 @@**: This line indicates the line numbers where the changes occurred.
- **- print("Hello, world!")**: This line shows the original code that was deleted.
- **+ print("Hello, world! I've been updated.")**: This line shows the new code that was added.

By visualizing the changes, **Git Diff** helps you grasp the impact of your code modifications and track the evolution of your project.

In the next section, we'll delve into some handy **Git Diff** arguments that can take your code comparison skills to the next level!

## Essential Git Diff Arguments (Tips and Tricks)

**Git Diff** offers a variety of arguments that can fine-tune its output and make your code comparison experience even more insightful. Here are some essential arguments to boost your **Git Diff** skills:

### "staged" or "cached" argument

`git diff --staged`

`git diff --cached`

These commands compare the changes you've staged for your next commit (using git add) to the current state of your working directory. It's incredibly useful for reviewing your staged changes before committing, ensuring you're only committing the intended modifications.

### "w" argument

`git diff -w`

Only shows changes to the actual content, ignoring whitespace changes. This is useful when you're focused on the logic of the code and don't care about formatting.

### "word-diff" argument

`git diff --word-diff`

This is an amazing option to see text differences. This argument displays word-level diffs, highlighting the specific words that have been changed within a line. This makes it easier to identify subtle changes and understand the context of the modifications.

Consider the last change in `Foo.swift`. If we use the `git diff --word-diff`, we'll see the following result:

{%- highlight diff -%}
git diff --word-diff

diff --git a/Foo.swift b/Foo.swift
index 495198a..6543e6d 100644
--- a/Foo.swift
+++ b/Foo.swift
@@ -3,4 +3,4 @@
 class Foo {
     func bar() {
         print("Hello, [-world!")-]{+world! I've been updated.")+}
     }
 }
{%- endhighlight -%}

Using this argument would clearly show you that phrase "I've been updated." has been added, while the rest of the line remains unchanged. Maybe this was not so clearly here on the blog post, but if you're using **Git** on the command line, probably you'll see a colored **Git Diff** result and it turns easier to understand changes.

### "color-words" argument

`git diff --color-words`

This argument highlights changed words with different colors, making it easier to visually distinguish the modified parts of the code. Is very similar than "word-diff", but can be easier to understand.

### "HEAD" argument

`git diff HEAD`

This command shows the differences between your current working directory and the last commit (HEAD). It's useful for reviewing your unstaged changes before committing or checking what changes you've made since the last commit. This is the default option when you don't specify anything after the `diff`.

### branch argument

`git diff branch_name`

This argument compares your current branch with another branch, like "feature-branch." This is invaluable for understanding the differences between branches, especially before merging or when trying to identify conflicts.

### Using an external diff tool

Sometimes, the default **Git diff** output might not be visually appealing or provide enough context. In these cases, you can use external **diff tools** to enhance your code comparison experience.

One popular external **diff tool** is [**Difftastic**][difft], a structural **diff tool** that compares files based on their syntax.

To use **Difftastic**, you need to install it. You can check out instructions in the link above. After install it, you can configure **Git** to use it as the default external **diff tool**:

{%- highlight sh -%}
git config --global diff.external difft
{%- endhighlight -%}

After setting up **difft**, simply run **git diff** as usual. **Git** will automatically use **difft** to display the differences, providing a more visually appealing and informative output. The same diff of `Foo.swift` will appears this way:

{%- highlight diff -%}
Foo.swift --- Swift
File permissions changed from 100600 to 100644.
1 class Foo {                         1 class Foo {
2     func bar() {                    2     func bar() {
3         print("Hello, world!")      3         print("Hello, world! I've been updated.")
4     }                               4     }
5 }                                   5 }
{%- endhighlight -%}

This is similar a side-by-side option that we can see on GitHub or GitLab. I like so much this tool.

These are just a few of the many helpful arguments offered by **Git Diff**. Exploring the **Git** documentation will reveal even more advanced options for fine-tuning your code comparison experience.

By mastering these arguments and exploring external **diff tools**, you'll be equipped to efficiently understand and manage code changes, leading to cleaner code, better debugging, and smoother collaboration.

## Conclusion: The Power of Git Diff

In this post, we've explored its basic functionality, and learned essential arguments to enhance its capabilities. From tracking code changes to pinpointing bugs and streamlining code reviews, **Git Diff** proves to be an indispensable tool in any developer's arsenal.

Now that you've gained a better understanding of **Git Diff**, it's time to put your knowledge into practice. Experiment with different arguments, explore advanced options, and discover how **Git Diff** can transform your development workflow.

Don't let code changes be a mystery! Embrace the power of **Git Diff** and unlock a new level of efficiency and understanding in your development journey.

Happy coding!

[difft]: https://github.com/Wilfred/difftastic