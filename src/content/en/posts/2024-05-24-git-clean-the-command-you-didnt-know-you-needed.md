+++
title = "Git Clean: The Command You Didn't Know You Needed"
date:   2024-05-24
translations: ["pt"]
tags: ["git"]
social_image: "git-clean-the-command-you-didnt-know-you-needed.en.webp"
+++

<p class="intro"><span class="dropcap">I</span>magine a messy Git repository, full of untracked files, build artifacts, and temporary files. What's the best way to remove all this unwanted content and keep the repository clean, freeing up space from your computer? Git offers a command called git clean and we'll learn about it in this post. Let's discover the command you didn't know you needed!</p>

## What is Git Clean?

In simple terms, `git clean` removes untracked files from your working directory. This is useful for reducing clutter, streamlining development, avoiding conflicts, and enhancing the overall Git experience.  Many projects generate caches, binaries, or download external libraries which can take up significant space. This command helps clean the entire repository. 

Don't worry, `git clean` doesn't touch tracked files (files already staged or committed). 

## How to Use Git Clean

The command is very simple to use. Just type `git clean` on the command line followed by some parameters. Here are the main parameters:

- **-d**: Removes untracked directories recursively.
- **-i**: Uses interactive mode. Git will show you all files or directories to be cleaned, and you'll need to choose which ones to remove.
- **-f**: Forces `git clean` to clean the repository. By default, Git won't clean anything unless you specify this parameter or use interactive mode. You can change this behavior by setting the Git configuration `clean.requireForce` to `false`. For more information on Git configuration, refer to the [Git Basics post][git_basics_post].
- **-X**: Removes only files ignored by Git using the `.gitignore` file.

You can combine these parameters to perform different clean operations. After execution, you'll see a list of deleted files.

{%- highlight txt -%}
git clean -dfX

Removing .DS_Store
Removing BookTracking.xcodeproj/xcuserdata/ionixjunior.xcuserdatad/xcschemes/
Removing BookTracking.xcworkspace/xcshareddata/
Removing BookTracking.xcworkspace/xcuserdata/ionixjunior.xcuserdatad/UserInterfaceState.xcuserstate
Removing Pods/
{%- endhighlight -%}

The `git clean` is very simple to use and extremely useful for freeing up space, especially in older projects that you aren't actively working on.

## Conclusion

While simple, `git clean` is incredibly useful.  Many times, we manually delete files, but this command comes to the rescue. If you want to free up space or have a clean working directory to rebuild your project without worrying about cached files, `git clean` is your solution. Stop doing things manually and use the power of Git to help you every day.

See you in the next post!

[git_basics_post]: /{{ site.lang }}/git-basics-an-in-depth-look-at-essential-commands/