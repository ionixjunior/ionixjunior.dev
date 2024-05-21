---
layout: post
title:  "Git Clean: The Command You Didn't Know You Needed"
date:   2024-05-20
translations: ["pt"]
tags: ["git"]
---

<p class="intro"><span class="dropcap">I</span>magine a messy Git repository, full of untracked files, build artifacts, and temporary files. What's the best way to remove all these unwanted content and keep the repository clean? Git offers a command called git clean and we'll learn about it in this post. Let's see how it works!</p>

## What's git clean?

In simple terms, this command removes untracked files from your working directory. This is useful to reduces clutter, streamlines development, avoids conflicts, and enhances the overall Git experience. Also, some solutions generate some cache or binary files, and usually they can take up a lot of space. This command help with this, cleaning the entire repository. Don't be afraid, because the `git clean` command doesn't touch tracked files.

## How to use

This command is very simple to use. Just type `git clean` on the command line followed by some parameters. The main parameters are:
- d: configure the command to remove untracked directories using recursive way;
- i: use the interactive mode to make a clean. With this option, Git will show you all files or directories to clean and you'll make a choice;
- f: force the `git clean` to clean the repository. By default, Git won't do anything unless you specify this parameter, or use the interactive mode. You can change this behavior make a Git configuration `clean.requireForce` equals to `false`;
- X: remove only files ignored by Git using the `.gitignore` file.

A nice thing is you can combine these commands and execute all once. After you execute, you'll see all deleted files.

{%- highlight txt -%}
git clean -dfX

Removing .DS_Store
Removing BookTracking.xcodeproj/xcuserdata/ionixjunior.xcuserdatad/xcschemes/
Removing BookTracking.xcworkspace/xcshareddata/
Removing BookTracking.xcworkspace/xcuserdata/ionixjunior.xcuserdatad/UserInterfaceState.xcuserstate
Removing Pods/
{%- endhighlight -%}

This command is very simple to use, and very usefull to empty some space.

## Conclusion

