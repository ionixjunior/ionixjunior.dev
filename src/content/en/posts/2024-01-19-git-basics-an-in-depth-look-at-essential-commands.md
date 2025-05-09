+++
title = "Git Basics: An In-Depth Look at Essential Commands"
date = 2024-01-19
categories = ["TODO"]
tags = ["git"]
social_image: "git-basics-an-in-depth-look-at-essential-commands.en.webp"
+++

<p class="intro"><span class="dropcap">W</span>hen I started using Git, no GUI tool existed to manage a repository. Everything had to be done via the command line. After a few years, some good tools were introduced, and turns more productive the developer lifecycle with some Git GUIs and Git tools integrated into IDEs. In this series of posts, I won't talk about Git GUIs. I will talk about Git in the command line, and we will start right now.</p>

### git config
The first thing we need to do before using Git is configure our identity. Our identity contains our name and email. This is important to define the authorship of the commit. To do this globally to your machine, type the following:

{%- highlight sh -%}
git config --global user.name "Your Name" 
{%- endhighlight -%}

{%- highlight sh -%}
git config --global user.email "your@email.com"
{%- endhighlight -%}

You can check what value is set up by removing the last parameter.

{%- highlight bash -%}
git config --global user.name
Your Name
{%- endhighlight -%}

{%- highlight bash -%}
git config --global user.email
your@email.com
{%- endhighlight -%}

This global configuration is stored in the `.gitconfig` file in the home directory. You can check all the Git configurations this way:

{%- highlight bash -%}
cat ~/.gitconfig
{%- endhighlight -%}

Also, if you need to specify a different identity to a specific repository in your machine, remove the `--global` parameter and execute the command inside your repository. 

{%- highlight bash -%}
git config user.email "another@email.com"
{%- endhighlight -%}

When you do this, this configuration is stored in the config file inside the `.git` directory of the project, and you can see what exists inside it.

{%- highlight bash -%}
cat DIRECTORY_OF_YOUR_PROJECT/.git/config
{%- endhighlight -%}

With this, we are ready to continue to use Git. But I will show you another configuration. You can choose the editor that you will use when Git asks you for a message commit or do another thing that can't be done alone by it. You can choose the preferred editor to interact with when Git asks something to you. The `vim` editor will be chosen by default on Unix machines if nothing is configured, but you can choose the `nano` if you prefer it.

{%- highlight bash -%}
git config --global core.editor "nano"
{%- endhighlight -%}

I am used to `vim`. I don't like `nano`. But for the first-timers using the command line, it might be better to use some code editor to do this, like VS Code. 

{%- highlight bash -%}
git config --global core.editor "code --wait"
{%- endhighlight -%}

You can check how to configure other editors, like Sublime and TextMate, by reading [this documentation][core_editor_docs].

After this, you are prepared to create your first repository.

### git init
When we create a new project using an IDE, usually, the Git repository is created automatically. But, if we are not using some robust code editor or simply creating a new project from scratch, we can type the following to create a new folder and a repository inside it:

{%- highlight bash -%}
git init NAME_OF_YOUR_PROJECT
{%- endhighlight -%}

With this simple command, a folder with the name of your project will be created where you are in the command line, and the repository will be started. You will see a hidden folder called `.git` inside your project. On macOS, you can hit the `CMD + SHIFT + .` shortcut to see it because it is a hidden folder. But listen: Do not touch this folder, as you may damage your repository.

If you already have a folder or an entire project in a specific directory and want to create a repository, proceed by omitting the project name.

{%- highlight bash -%}
git init
{%- endhighlight -%}

Now we are ready for the next step: Add some files to the repository.

### git add
When updating a project and needing to version it, we must add these changes to the repository. The first step is to include the modified files using the following command:

{%- highlight bash -%}
git add .
{%- endhighlight -%}

This command will add your entire changes. If you prefer, you can specify the name of a specific file or directory to add. This is useful when you want to split your commits.

{%- highlight bash -%}
git add NAME_OF_YOUR_FILE.txt
{%- endhighlight -%}

{%- highlight bash -%}
git add NAME_OF_YOUR_DIRECTORY
{%- endhighlight -%}

You can specify more than one file or directory at a time. Just add a space and the name that you want.

{%- highlight bash -%}
git add FIRST_FILE.txt SECOND_FILE.txt
{%- endhighlight -%}

Also, you can add files using Fileglobs to match your files by extension, for example. Suppose you change Swift files and text files and want to add only Swift files in the commit:

{%- highlight bash -%}
git add *.swift
{%- endhighlight -%}

I will share more tips on this command, but not now. This command adds the files to the stage but we haven't committed them yet. Let's learn this now.

### git commit
Now is the time to incorporate our changes into the repository's history.

{%- highlight bash -%}
git commit
{%- endhighlight -%}

If you follow this approach, Git will ask for the commit message. I recommend incorporating the commit message through a parameter to avoid any prompts from Git.

{%- highlight bash -%}
git commit -m "Your commit title"
{%- endhighlight -%}

The message commit can be divided into two parts: title and description. In the example above, we specify only the message title. Following good practices, we need to be very concise in the title. If we need to add an explanation, we can break the line twice and write a long description with details. Note the quotation mark is not at the end of the title. It is located at the end of the description.

{%- highlight bash -%}
git commit -m "Your commit title

This is the commit description. 
A place where you can explain some aspects of the change in detail."
{%- endhighlight -%}

For commit messages best practices, I suggest you read [this post][git_commit_post]. It was written in 2014 but is still very relevant.

### git status
Type the status command to see what is happening in your working directory.

{%- highlight bash -%}
git status

On branch main
nothing to commit, working tree clean
{%- endhighlight -%}

Below the command, Git tells me I am on a branch named main, and there is nothing to commit. If I change some file that already exists in the repository, the result is the following:

{%- highlight bash -%}
git status

On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   file.txt

no changes added to commit (use "git add" and/or "git commit -a")
{%- endhighlight -%}

We can't see here, but Git shows us in red the unstaged files. If we add the file to the stage using `git add` and run again `git status`, the file will appear in green color.

If we add some new file to the repository, Git will tell us the file is untracked, and you can track it using `git add`.

{%- highlight bash -%}
git status

On branch main
Untracked files:
  (use "git add <file>..." to include in what will be committed)
	new_file.txt

nothing added to commit but untracked files present (use "git add" to track)
{%- endhighlight -%}

And now, what is next? Let's see the log of the commits.

### git log
Every commit into the repository can be visualized using the log command. You can check who made it, when, and what it does based on the commit message. Also, you can use the commit hash to see the entire change, but we won't see this in this basic post.

{%- highlight bash -%}
git log

commit 10d777cb334d99171e0c958925cb0caa615734ac (HEAD -> main, origin/main)
Author: Paul Ricard <paul@ricard.dev>
Date:   Sun Jan 14 18:17:22 2024 -0000

    Change the page title

commit 8934fac280ff394926df4746d31da52f431d52bf
Author: Paul Ricard <paul@ricard.dev>
Date:   Sun Jan 14 18:14:34 2024 -0000

    Fix typo

commit e9bfd726289f8a23049655cbee49315c36669706
Author: Laura Smith <laura@smith.dev>
Date:   Sun Jan 14 17:16:03 2024 -0000

    Revert "Add company logo"
    
    This reverts commit 85b52630af1655282b85dc7f56d9962503eb70ad.
{%- endhighlight -%}

If your repository has a lot of commits, they will be paged based on the height of your terminal. To navigate and see more commits, just press space.

### The journey continues
I believe these are the first commands you will need when using Git for the first time, and you will use them frequently. But this is not the end! Stay tuned because I will soon publish more posts about Git, covering additional commands. 

Share your thoughts on this post in the comments. Is there another essential Git command you believe should be included?

See you soon!

[core_editor_docs]: https://docs.github.com/en/get-started/getting-started-with-git/associating-text-editors-with-git?platform=mac
[git_commit_post]:  https://cbea.ms/git-commit/