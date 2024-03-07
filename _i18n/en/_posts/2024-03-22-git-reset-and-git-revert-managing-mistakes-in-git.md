---
layout: post
title:  "Git Reset and Git Revert: Managing Mistakes in Git"
date:   2024-03-07
translations: ["pt"]
tags: ["git"]
---

<p class="intro"><span class="dropcap">I</span>n the software development process, mistakes are inevitable. Whether it's a misplaced line of code or a misguided commit, every developer has encountered the sinking feeling that accompanies an error in their work. Yet, in the realm of version control systems, such as Git, these missteps need not spell disaster. Git reset and Git revert serve as beacons of hope amidst the tumultuous sea of code changes, offering developers the means to rectify errors, backtrack on misguided decisions, and steer their projects back on course. In this post, we'll embark on a journey into the heart of Git, exploring the nuances of Git reset and Git revert, uncovering their capabilities, and arming ourselves with the knowledge needed to navigate the choppy waters of version control with confidence. So, let's dive in and discover how Git reset and Git revert can be our steadfast companions in the pursuit of flawless code and seamless collaboration.</p>

## Understanding git reset
Git reset is a versatile command that allows developers to manipulate the state of their repository's staging area and working directory. At its core, Git reset serves as a tool for undoing changes and resetting the current HEAD to a specified state. However, its functionality extends far beyond mere undoing, offering developers a range of options for navigating their project's history and managing the progression of commits.

One of the primary functions of Git reset is to move the HEAD pointer to a different commit, effectively resetting the state of the repository to that particular snapshot in time. This action can be performed with varying degrees of granularity, allowing developers to reset the HEAD to a specific commit, branch, or even a previous state of the working directory. Let's see the command and all these variations.

### Moving HEAD to a specific commit
Git reset moves the HEAD pointer to the specified commit, resetting the staging area and working directory to match the state of that commit. Changes made after this commit will be unstaged. All the files that you have changed between the pointer you move and the pointer you were before will be unstaged.

{%- highlight bash -%}
git reset <commit-hash>
{%- endhighlight -%}

### Soft reset
Soft reset moves the HEAD pointer to the specified commit while preserving changes in the staging area. This allows you to recommit the changes or make further modifications before committing.

{%- highlight bash -%}
git reset --soft <commit-hash>
{%- endhighlight -%}

### Hard reset
A hard reset moves the HEAD pointer to a specified commit and resets both the staging area and working directory to match. Any changes made after this commit will be permanently discarded.

{%- highlight bash -%}
git reset --hard <commit-hash>
{%- endhighlight -%}
