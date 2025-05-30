+++
title = "Git Basics: An In-Depth Look at Essential Commands"
date = 2024-01-19
type = "post"
slug = "git-basics-an-in-depth-look-at-essential-commands"
translationKey = "git-basics-an-in-depth-look-at-essential-commands"
categories = ["tools"]
tags = ["git"]
image = "/img/cards/git-basics-an-in-depth-look-at-essential-commands.en.webp"
+++

When I started using Git, no GUI tool existed to manage a repository. Everything had to be done via the command line. After a few years, some good tools were introduced, and turns more productive the developer lifecycle with some Git GUIs and Git tools integrated into IDEs. In this series of posts, I won't talk about Git GUIs. I will talk about Git in the command line, and we will start right now.

### git config
The first thing we need to do before using Git is configure our identity. Our identity contains our name and email. This is important to define the authorship of the commit. To do this globally to your machine, type the following:

```sh
git config --global user.name "Your Name" 
```

```sh
git config --global user.email "your@email.com"
```

You can check what value is set up by removing the last parameter.

```bash
git config --global user.name
Your Name
```

```bash
git config --global user.email
your@email.com
```

This global configuration is stored in the `.gitconfig` file in the home directory. You can check all the Git configurations this way:

```bash
cat ~/.gitconfig
```

Also, if you need to specify a different identity to a specific repository in your machine, remove the `--global` parameter and execute the command inside your repository. 

```bash
git config user.email "another@email.com"
```

When you do this, this configuration is stored in the config file inside the `.git` directory of the project, and you can see what exists inside it.

```bash
cat DIRECTORY_OF_YOUR_PROJECT/.git/config
```

With this, we are ready to continue to use Git. But I will show you another configuration. You can choose the editor that you will use when Git asks you for a message commit or do another thing that can't be done alone by it. You can choose the preferred editor to interact with when Git asks something to you. The `vim` editor will be chosen by default on Unix machines if nothing is configured, but you can choose the `nano` if you prefer it.

```bash
git config --global core.editor "nano"
```

I am used to `vim`. I don't like `nano`. But for the first-timers using the command line, it might be better to use some code editor to do this, like VS Code. 

```bash
git config --global core.editor "code --wait"
```

You can check how to configure other editors, like Sublime and TextMate, by reading [this documentation][core_editor_docs].

After this, you are prepared to create your first repository.

### git init
When we create a new project using an IDE, usually, the Git repository is created automatically. But, if we are not using some robust code editor or simply creating a new project from scratch, we can type the following to create a new folder and a repository inside it:

```bash
git init NAME_OF_YOUR_PROJECT
```

With this simple command, a folder with the name of your project will be created where you are in the command line, and the repository will be started. You will see a hidden folder called `.git` inside your project. On macOS, you can hit the `CMD + SHIFT + .` shortcut to see it because it is a hidden folder. But listen: Do not touch this folder, as you may damage your repository.

If you already have a folder or an entire project in a specific directory and want to create a repository, proceed by omitting the project name.

```bash
git init
```

Now we are ready for the next step: Add some files to the repository.

### git add
When updating a project and needing to version it, we must add these changes to the repository. The first step is to include the modified files using the following command:

```bash
git add .
```

This command will add your entire changes. If you prefer, you can specify the name of a specific file or directory to add. This is useful when you want to split your commits.

```bash
git add NAME_OF_YOUR_FILE.txt
```

```bash
git add NAME_OF_YOUR_DIRECTORY
```

You can specify more than one file or directory at a time. Just add a space and the name that you want.

```bash
git add FIRST_FILE.txt SECOND_FILE.txt
```

Also, you can add files using Fileglobs to match your files by extension, for example. Suppose you change Swift files and text files and want to add only Swift files in the commit:

```bash
git add *.swift
```

I will share more tips on this command, but not now. This command adds the files to the stage but we haven't committed them yet. Let's learn this now.

### git commit
Now is the time to incorporate our changes into the repository's history.

```bash
git commit
```

If you follow this approach, Git will ask for the commit message. I recommend incorporating the commit message through a parameter to avoid any prompts from Git.

```bash
git commit -m "Your commit title"
```

The message commit can be divided into two parts: title and description. In the example above, we specify only the message title. Following good practices, we need to be very concise in the title. If we need to add an explanation, we can break the line twice and write a long description with details. Note the quotation mark is not at the end of the title. It is located at the end of the description.

```bash
git commit -m "Your commit title

This is the commit description. 
A place where you can explain some aspects of the change in detail."
```

For commit messages best practices, I suggest you read [this post][git_commit_post]. It was written in 2014 but is still very relevant.

### git status
Type the status command to see what is happening in your working directory.

```bash
git status

On branch main
nothing to commit, working tree clean
```

Below the command, Git tells me I am on a branch named main, and there is nothing to commit. If I change some file that already exists in the repository, the result is the following:

```bash
git status

On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   file.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

We can't see here, but Git shows us in red the unstaged files. If we add the file to the stage using `git add` and run again `git status`, the file will appear in green color.

If we add some new file to the repository, Git will tell us the file is untracked, and you can track it using `git add`.

```bash
git status

On branch main
Untracked files:
  (use "git add <file>..." to include in what will be committed)
	new_file.txt

nothing added to commit but untracked files present (use "git add" to track)
```

And now, what is next? Let's see the log of the commits.

### git log
Every commit into the repository can be visualized using the log command. You can check who made it, when, and what it does based on the commit message. Also, you can use the commit hash to see the entire change, but we won't see this in this basic post.

```bash
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
```

If your repository has a lot of commits, they will be paged based on the height of your terminal. To navigate and see more commits, just press space.

### The journey continues
I believe these are the first commands you will need when using Git for the first time, and you will use them frequently. But this is not the end! Stay tuned because I will soon publish more posts about Git, covering additional commands. 

Share your thoughts on this post in the comments. Is there another essential Git command you believe should be included?

See you soon!

[core_editor_docs]: https://docs.github.com/en/get-started/getting-started-with-git/associating-text-editors-with-git?platform=mac
[git_commit_post]:  https://cbea.ms/git-commit/