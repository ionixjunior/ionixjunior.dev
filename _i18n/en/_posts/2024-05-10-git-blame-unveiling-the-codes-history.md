---
layout: post
title:  "Git Blame: Unveiling the Code's History"
date:   2024-05-06
translations: ["pt"]
tags: ["git"]
---

<p class="intro"><span class="dropcap">E</span>ver stumbled upon a piece of code and wondered, "Who wrote this?" or "When was this changed?". Fear not, fellow developer, for "git blame" is here to the rescue! This powerful command acts as a detective, uncovering the history behind each line of code in your Git repository. Let's talk about it in today's post.</p>

The `git blame` is your go-to tool for understanding the evolution of your codebase. It allows you to identify the author, timestamp, and commit associated with the last modification to each line of a specific file. This information proves invaluable for various purposes, from tracking down the source of bugs to assigning responsibility and gaining insights into the development process. Let's see how it works.

## How git blame works
This command show in the command line some annotations in each line of a specific file information about the last commit that changed it. Also, it display the commit hash, author and timestamp.

## Examples of how to use git blame
The `git blame` command is very versatile. Let's see some different usages.

### Basic usage
Let's say you're working with a Swift file called `User.swift` and you want to know the history behind its lines. Open your terminal, navigate to your repository's root directory, and run the following command:

{%- highlight txt -%}
git blame User.swift
{%- endhighlight -%}

This will display an output similar to this:

{%- highlight txt -%}
96d864ac (John Doe   2023-08-15 10:30:01 -0400 1) struct User {
96d864ac (John Doe   2023-08-15 10:30:01 -0400 2)     let id: Int
96d864ac (John Doe   2023-08-15 10:30:01 -0400 3)     let name: String
2b8f7a4c (Mary Smith 2023-08-08 16:22:10 -0400 4)     let email: String?
96d864ac (John Doe   2023-08-15 10:30:01 -0400 5) }
{%- endhighlight -%}

The first column shows the abbreviated commit hash associated with the last change to each line. The second column identifies the author of the commit. Here, we see that John Doe and Mary Smith have contributed to this file. The third column shows the date and time of the commit. The final column indicates the line number in the file. Following the information above, you'll see the actual content of each line in the file.

By analyzing this output, you can trace the evolution of the User struct, see who made specific changes, and understand when those changes occurred.

This analyse the file at the current state. Let's see how can we do this in a different way.

### Analysing specific revisions
This command allows you to delve into the history of a file at a particular point in time or commit. This is helpful when you want to understand the state of the code at a specific milestone or investigate issues that arose after certain changes.

Imagine you want to see how the `User.swift` file looked in the commit with the hash `fae4321b`. You would use the following command:

{%- highlight txt -%}
git blame fae4321b User.swift 
{%- endhighlight -%}

The output will show the file's state at that specific commit, revealing who authored each line and when it was last changed before that point in the history. 

If you're not interested in older changes, you can specify a range and it can be in two ways. The first one I'll show you throught a tag. Suppose we have a tag called `v123` and we want to see the blaming after this time:


{%- highlight txt -%}
git blame v123.. User.swift 
{%- endhighlight -%}

Another option is using the parameter `--since` to achieve this:

{%- highlight txt -%}
git blame --since=2.weeks User.swift 
{%- endhighlight -%}

These options give you the flexibility to investigate the code at different points in its history, aiding in pinpointing the introduction of bugs or understanding the context of past changes.

### Ignoring whitespaces changes
Sometimes, changes in a file involve only whitespace modifications, such as indentation or line breaks. While these changes may be necessary for formatting or style consistency, they can clutter the output of `git blame` and make it harder to focus on meaningful code changes. To disregard whitespace changes when blaming a file, simply include the `-w` flag in your command. For instance:

{%- highlight txt -%}
git blame -w User.swift 
{%- endhighlight -%}

### Custom output
There are a lot of options in this command but I'll show you more two possibilities. Both is to talk about the `L` flag into the command. You can blaming a file specifying some numbers of lines:

{%- highlight txt -%}
git blame -L 10,20 User.swift 
{%- endhighlight -%}

This command will blame the lines 10 to 20. But You can do specifying a function name, passing it as a regex into the command. Suppose you want to blame a function called `func configConstraints() { ... }`, you can run the command this way:

{%- highlight txt -%}
git blame -L /func\ configConstraints/ User.swift 
{%- endhighlight -%}

It's not common and sometimes not easy to do, but it's a possibility, right?

## Conclusion
The `git blame` is an invaluable tool in any developer's arsenal. Its ability to unveil the history behind each line of code empowers us to understand how our codebase evolved, track down bugs, and appreciate the contributions of our collaborators.

However, it's crucial to use this command responsibly and avoid creating a culture of blame. Remember, every change, even those that introduced issues, served a purpose at a specific point in time. Instead of pointing fingers, use "git blame" as a tool for learning, collaboration, and improving your codebase.

By understanding the context behind each modification and fostering open communication, you can harness the power of `git blame` to create a more productive and positive development environment.

See you in the next post!