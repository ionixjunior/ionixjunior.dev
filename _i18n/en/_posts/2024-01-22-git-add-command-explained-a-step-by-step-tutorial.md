---
layout: post
title:  "Git Add Command Explained: A Step-by-Step Tutorial"
date:   2024-01-22
translations: ["pt"]
tags: ["git"]
social_image: "git-add-command-explained-a-step-by-step-tutorial.en.png"
---

<p class="intro"><span class="dropcap">T</span>o add files to a Git repository, we need to add them to a specific area to commit, and Git calls it the staged area. But why this step is necessary? If I change something I want to add it to the repository, right? Yes, but I will show you some benefits of this behavior, and I will explain more details about the command. Let's go!</p>

### Understanding stage
In a Git repository, the staging area is the crucial intermediary step between modifying your files and permanently saving those changes in a commit. Staging allows you to carefully curate which modifications you want to include in your next commit, giving you granular control over the evolution of your project and helping you to articulate your thought process more effectively through commits.

When you make changes to your project files, Git recognizes these modifications, but they are not automatically included in the next commit. This is where the concept of staging comes into play. The staging area serves as a temporary storage space where you selectively choose which changes should be part of the next commit. 

By intentionally staging specific modifications, you have the flexibility to group related changes together or commit them separately. This helps maintain a clean and organized version history, making it easier to understand the progression of your project or feature over time. 

Now you know about the staging area, let's talk about how to add your files to the stage.

### Adding files to the stage
As you can see in the [last post][git_add_last_post], we can add files to the stage area using different ways. But all of these options add the entire file to the stage. Below I will explore more about it and you will become a pro at this.

For the examples, I am using [this repository][book_tracking_repo] to make some changes and show you how to use the commands.

### Partial staging
When we use the `git add` command, we can add the `-p` parameter to review all the changes that we are introducing and choose what of them we want to add to the stage. 

But, why is so important if I can just add all the changes into one simple commit? Technically, it is not a problem to add all the changes into one commit, but if you want to organize your commit history and wish to express your way of thinking, consider investing some time to organize your changes. I like so much this because when I go forward using baby steps, I can go back to reverting some specific commit and not an entire implementation. 

Suppose I need to change a font name in a specific file of my project. I do this but I am a little bit disturbed with some comments inside this file and I decided to remove them too. So, what I will write in the commit title? "Change font style and remove some unnecessary comments"? Wrong answer. Adding all the changes in the same commit can cause a little bit mess because you can lose the ability to divide the principal change of the secondary change. Let's see how we can divide this into two separate commits.

{%- highlight bash -%}
git add -p
{%- endhighlight -%}

When you do this, Git will show each change separated in hunks:

{%- highlight diff -%}
diff --git a/BookTracking/AppDelegate.swift b/BookTracking/AppDelegate.swift
index 920883f..f174577 100644
--- a/BookTracking/AppDelegate.swift
+++ b/BookTracking/AppDelegate.swift
@@ -18,7 +18,7 @@ class AppDelegate: UIResponder, UIApplicationDelegate {
     }
     
     private func configAppearance() {
-        let fontName = "Georgia-Bold"
+        let fontName = "Georgia"
         
         UILabel.appearance().font = UIFont(name: fontName, size: 12)
         
(1/2) Stage this hunk [y,n,q,a,d,j,J,g,/,e,?]? 
{%- endhighlight -%}

Git is telling us that they found two hunks and this is the first one - see this in the last line. I just changed the font name of "Geordia-Bold" to "Geordia". This is the first commit that I want to make. But can I do this? Note that in the last line exists a lot of options (y,n,q,a,d,j,J,g,/,e,?). Each of them is responsible for taking some action. I choose the last one to see the Git help about these commands. Just type `?`:

{%- highlight diff -%}
(1/2) Stage this hunk [y,n,q,a,d,j,J,g,/,e,?]? ?
y - stage this hunk
n - do not stage this hunk
q - quit; do not stage this hunk or any of the remaining ones
a - stage this hunk and all later hunks in the file
d - do not stage this hunk or any of the later hunks in the file
j - leave this hunk undecided, see next undecided hunk
J - leave this hunk undecided, see next hunk
g - select a hunk to go to
/ - search for a hunk matching the given regex
e - manually edit the current hunk
? - print help
@@ -18,7 +18,7 @@ class AppDelegate: UIResponder, UIApplicationDelegate {
     }
     
     private func configAppearance() {
-        let fontName = "Georgia-Bold"
+        let fontName = "Georgia"
         
         UILabel.appearance().font = UIFont(name: fontName, size: 12)
         
(1/2) Stage this hunk [y,n,q,a,d,j,J,g,/,e,?]?
{%- endhighlight -%}

Now we can see what does every option:
- y: Add this hunk to the stage. Similar to `git add`, but only for this piece of code;
- n: Discard this hunk to the stage. This piece of code won't be added, but you won't lose it;
- q: Exit the changes selection;
- a: Add this hunk to the stage and all of the following are located in the same file. This is a little bit dangerous if you don't know or remember what exists in the next hunks;
- d: Discard this and another later hunks in this file;
- j: Leave this hunk undecided if you have some doubt and go to the next undecided hunk;
- J: Leave this hunk undecided if you have some doubt and go to the next hunk;
- g: This is an interesting option: You can navigate between the hunks of this file. This can be good if you can check some parts of the code before adding or discarding something;
- /: Similar option of the function above, but you can specify some regex expression to find a particular hunk;
- e: This is amazing because if your hunk changes a lot of lines, you can select what lines make sense to add;
- ?: This was the option that I used to see the help.

Some many options. What do I need to do? In this case, I am focusing on the font name change. So I will accept it just by typing `y`. Now, Git show us the second hunk. This is the piece of code that I removed from the comments. I just leave this to another commit. I will discard it just by typing `n`.

{%- highlight diff -%}
(1/2) Stage this hunk [y,n,q,a,d,j,J,g,/,e,?]? y
@@ -34,15 +34,10 @@ class AppDelegate: UIResponder, UIApplicationDelegate {
     // MARK: UISceneSession Lifecycle
 
     func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
-        // Called when a new scene session is being created.
-        // Use this method to select a configuration to create the new scene with.
         return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
     }
 
     func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
-        // Called when the user discards a scene session.
-        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
-        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
     }
 
 
(2/2) Stage this hunk [y,n,q,a,d,K,g,/,s,e,?]? n
{%- endhighlight -%}

Now we are done! Let's check the repository status to see what's happening.

{%- highlight bash -%}
git status

On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   BookTracking/AppDelegate.swift

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   BookTracking/AppDelegate.swift
{%- endhighlight -%}

Note the `AppDelegate.swift` file is located in a staged area and a not staged area. This is possible because we select only one hunk of the changes and add it to the stage. So, if we do this commit, only the staged changes will be committed.

I know, I can hear you right now telling me that this is easier to make using a Git GUI tool. Ok, you are right, but this is what the Git GUI tool will do under the hood. But if you prefer or have only the command line, you will know how to do this. This was a small sample of how to use this option. There are more possibilities and I encourage you to explore them.

Let's check another way to do this using a more powerful command - but more difficult too. 

### Staging using interactive mode
The interactive mode is more powerful them the previous command because it provides us more granular control over staging. I have added a new file to the project and I will show you the `git status`.

{%- highlight bash -%}
git status

On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   BookTracking.xcodeproj/project.pbxproj
	modified:   BookTracking/AppDelegate.swift

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	BookTracking/Components/IconViewComponent.swift

no changes added to commit (use "git add" and/or "git commit -a")
{%- endhighlight -%}

Note the untracked file at the end of the Git message. If I run `git add -p`, this file will not be shown. But by using interactive mode we will have the possibility to work with it. This occurs because `git add -p` only works by listening to the changes in the repository files, not new files not added. Think with me: How can I add some piece of code to a new file if it does not exist in the repository? It does not make sense! However, using the interactive mode is not a problem because it enables us to add this file to the repository.

{%- highlight diff -%}
git add -i

           staged     unstaged path
  1:    unchanged        +4/-0 BookTracking.xcodeproj/project.pbxproj
  2:    unchanged        +1/-6 BookTracking/AppDelegate.swift

*** Commands ***
  1: status	  2: update	  3: revert	  4: add untracked
  5: patch	  6: diff	  7: quit	  8: help
What now> 

{%- endhighlight -%}

At the beginning of the message we can see the "status". Below we can see the commands that we can use. Each of them contains a number and you can use the number of the command you want to execute in the "What now" dialog in the last line. Let's talk about the options:

- 1: Show the file paths with changes;
- 2: Add the changes into to staged area;
- 3: Revert the changes to go back to the unstaged area;
- 4: Add the untracked files to the stage. Note we can't see these files on status;
- 5: Pick hunks and add them selectively. It is the same as the `git add -p`
- 6: Show the diff of the staged changes;
- 7: Exit the interactive mode;
- 8: Show the help menu.

The status (option 1) is what we are seeing now. Let's explore option 2 to add the changes to the staged area. In "What now", I typed 2.

{%- highlight diff -%}
What now> 2
           staged     unstaged path
  1:    unchanged        +4/-0 BookTracking.xcodeproj/project.pbxproj
  2:    unchanged        +1/-6 BookTracking/AppDelegate.swift
Update>> 
{%- endhighlight -%}

Now Git shows two files that I changed and asks me which of them I need to do the action. Note the files are enumerated and we need to use this to inform in the "Update" dialog. I will choose the `AppDelegate.swift` file, enumerated as the number 2.

{%- highlight diff -%}
Update>> 2   
           staged     unstaged path
  1:    unchanged        +4/-0 BookTracking.xcodeproj/project.pbxproj
* 2:    unchanged        +1/-6 BookTracking/AppDelegate.swift
Update>> 
{%- endhighlight -%}

Git shows again the same content and asks me the same question, but note the file that I have selected contains an astheristic. We can add more files, but now I will just press "enter" to finish it.

{%- highlight diff -%}
Update>> 
updated 1 path

*** Commands ***
  1: status	  2: update	  3: revert	  4: add untracked
  5: patch	  6: diff	  7: quit	  8: help
What now> 
{%- endhighlight -%}

Git told us that he updated 1 path and gave me again the commands that I can use now. If we check the status right now, we can see some changes in the table.

{%- highlight diff -%}
What now> 1
           staged     unstaged path
  1:    unchanged        +4/-0 BookTracking.xcodeproj/project.pbxproj
  2:        +1/-6      nothing BookTracking/AppDelegate.swift

*** Commands ***
  1: status	  2: update	  3: revert	  4: add untracked
  5: patch	  6: diff	  7: quit	  8: help
What now> 
{%- endhighlight -%}

Note that in the staged column, the `AppDelegate.swift` files contains the discrimination of the changes: 1 line added or changed and 6 removed. You can see what is in the stage using option 6 (diff). 

{%- highlight diff -%}
What now> 6
           staged     unstaged path
  1:        +1/-6      nothing BookTracking/AppDelegate.swift
Review diff>>
{%- endhighlight -%}

Again, Git will show us the staged files and we need to pick one of them to see the diff. Let's choose file number 1 in the "Review diff" dialog.

{%- highlight diff -%}
Review diff>> 1
diff --git a/BookTracking/AppDelegate.swift b/BookTracking/AppDelegate.swift
index 920883f..f174577 100644
--- a/BookTracking/AppDelegate.swift
+++ b/BookTracking/AppDelegate.swift
@@ -18,7 +18,7 @@ class AppDelegate: UIResponder, UIApplicationDelegate {
     }
     
     private func configAppearance() {
-        let fontName = "Georgia-Bold"
+        let fontName = "Georgia"
         
         UILabel.appearance().font = UIFont(name: fontName, size: 12)
         
@@ -34,15 +34,10 @@ class AppDelegate: UIResponder, UIApplicationDelegate {
     // MARK: UISceneSession Lifecycle
 
     func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
-        // Called when a new scene session is being created.
-        // Use this method to select a configuration to create the new scene with.
         return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
     }
 
     func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
-        // Called when the user discards a scene session.
-        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
-        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
     }
 
 

*** Commands ***
  1: status	  2: update	  3: revert	  4: add untracked
  5: patch	  6: diff	  7: quit	  8: help
What now> 
{%- endhighlight -%}

The Git shows us all the changes that are in the stage. Let's explore another option. If you want to discard this changes to the stage, you can use the revert option enumerated by 3.

{%- highlight diff -%}
What now> 3
           staged     unstaged path
  1:        +1/-6      nothing BookTracking/AppDelegate.swift
Revert>> 
{%- endhighlight -%}

Again, Git will ask us what changes we want to revert. I will select file number 1 to proceed.

{%- highlight diff -%}
Revert>> 1
           staged     unstaged path
* 1:        +1/-6      nothing BookTracking/AppDelegate.swift
Revert>> 
{%- endhighlight -%}

Check if the file you choose contains the astheristic and If there is no other file to revert, just press enter.

{%- highlight diff -%}
Revert>> 
reverted 1 path

*** Commands ***
  1: status	  2: update	  3: revert	  4: add untracked
  5: patch	  6: diff	  7: quit	  8: help
What now> 
{%- endhighlight -%}

The Git told us there is 1 path that was reverted. Let's check the status to see what is happening.

{%- highlight diff -%}
What now> 1
           staged     unstaged path
  1:    unchanged        +4/-0 BookTracking.xcodeproj/project.pbxproj
  2:    unchanged        +1/-6 BookTracking/AppDelegate.swift

*** Commands ***
  1: status	  2: update	  3: revert	  4: add untracked
  5: patch	  6: diff	  7: quit	  8: help
What now> 
{%- endhighlight -%}

Now everything goes back to the beginning!

I told you about untracked files, right? Let's explore option 4 to see it in action.

{%- highlight diff -%}
What now> 4
           staged     unstaged path
  1: BookTracking/Components/IconViewComponent.swift
Add untracked>> 
{%- endhighlight -%}

The interactive mode shows us the untracked files. Here I have only one file, but there may be multiple files in your project. Choose what files you need to add to the stage. In my case, file 1.

{%- highlight diff -%}
Add untracked>> 1   
           staged     unstaged path
* 1: BookTracking/Components/IconViewComponent.swift
Add untracked>> 
{%- endhighlight -%}

Check if your files were selected correctly and press "enter".

{%- highlight diff -%}
Add untracked>> 
added 1 path

*** Commands ***
  1: status	  2: update	  3: revert	  4: add untracked
  5: patch	  6: diff	  7: quit	  8: help
What now> 
{%- endhighlight -%}

The Git told us that 1 path was added. Let's check the status to see what is happening.

{%- highlight diff -%}
What now> 1
           staged     unstaged path
  1:    unchanged        +4/-0 BookTracking.xcodeproj/project.pbxproj
  2:    unchanged        +1/-6 BookTracking/AppDelegate.swift
  3:       +12/-0      nothing BookTracking/Components/IconViewComponent.swift

*** Commands ***
  1: status	  2: update	  3: revert	  4: add untracked
  5: patch	  6: diff	  7: quit	  8: help
What now> 
{%- endhighlight -%}

Now we have the new file in the staged area. It works! 

Now let's explore more one option: The patch. This is option 5 and is the same as `git add -p`. Let's see:

{%- highlight diff -%}
What now> 5
           staged     unstaged path
  1:    unchanged        +4/-0 BookTracking.xcodeproj/project.pbxproj
  2:    unchanged        +1/-6 BookTracking/AppDelegate.swift
Patch update>> 
{%- endhighlight -%}

First, select your files to patch. I will choose file 2.

{%- highlight diff -%}
Patch update>> 2
           staged     unstaged path
  1:    unchanged        +4/-0 BookTracking.xcodeproj/project.pbxproj
* 2:    unchanged        +1/-6 BookTracking/AppDelegate.swift
Patch update>> 
{%- endhighlight -%}

Check if the file was selected and press "enter" to confirm.

{%- highlight diff -%}
Patch update>>     
diff --git a/BookTracking/AppDelegate.swift b/BookTracking/AppDelegate.swift
index 920883f..f174577 100644
--- a/BookTracking/AppDelegate.swift
+++ b/BookTracking/AppDelegate.swift
@@ -18,7 +18,7 @@ class AppDelegate: UIResponder, UIApplicationDelegate {
     }
     
     private func configAppearance() {
-        let fontName = "Georgia-Bold"
+        let fontName = "Georgia"
         
         UILabel.appearance().font = UIFont(name: fontName, size: 12)
         
(1/2) Stage this hunk [y,n,q,a,d,j,J,g,/,e,?]? 
{%- endhighlight -%}

Now we can see the same thing in the previous section of this post. Nothing is different here. Accept or deny the hunks that you want and at the end, you will be redirected to the interactive mode commands.

In these commands, the option 7 you can exit the interactive mode, and with option 8 you can see some basic instructions for each command. We are done right now. If you testing these options with me, just press 7 to exit the interactive mode. After this, you can commit your changes and be happy.

Using the interactive mode we can revert some files of the stage. But we can do this without using it. Let's learn.

### Unstaging changes
Just as I can add files to the stage, I can also remove them. If you type `git status` you can see the Git tip telling how to do this. Let's check.

{%- highlight diff -%}
git status      

On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   BookTracking/AppDelegate.swift
	new file:   BookTracking/Components/IconViewComponent.swift

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   BookTracking.xcodeproj/project.pbxproj
	modified:   BookTracking/AppDelegate.swift
{%- endhighlight -%}

See the Git tips above the file names. Let's unstage the changes at the `AppDelegate.swift` file.

{%- highlight diff -%}
git restore --staged BookTracking/AppDelegate.swift
{%- endhighlight -%}

The Git doesn't show anything to us. Let's check the status to see what is happening.

{%- highlight diff -%}
git status                                         
On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	new file:   BookTracking/Components/IconViewComponent.swift

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   BookTracking.xcodeproj/project.pbxproj
	modified:   BookTracking/AppDelegate.swift
{%- endhighlight -%}

Now we can see the `AppDelegate.swift` file was going back to the unstaged files. Great! But what's happening if we use the same command without the `--staged` parameter? Let's see.

{%- highlight diff -%}
git restore BookTracking/AppDelegate.swift
{%- endhighlight -%}

And then the status:

{%- highlight diff -%}
git status                                
On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	new file:   BookTracking/Components/IconViewComponent.swift

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   BookTracking.xcodeproj/project.pbxproj
{%- endhighlight -%}

Oh no! I lost my changes! Be careful with these commands may you can lose your hard work.

### Staging files day-to-day
When diving into the world of Git, it's commonplace to add every change to the staging area as a beginner. However, as your experience with version control grows, especially within the context of the platform you're using and the features you're developing, the significance of the staging step becomes increasingly apparent.

Strategic use of the `git add` command allows you to transition from the initial habit of staging everything to a more nuanced approach. Carefully curating what goes into each commit leads to a version history that tells a clear and logical story of your project's evolution. Small, focused commits become not just a practice but a strategy for maintaining an organized and comprehensible history.

Consider the collaborative nature of many development projects. By staging changes thoughtfully, you contribute to a more collaborative and streamlined development process. Each commit becomes a meaningful contribution, making it easier for team members to comprehend, review, and integrate changes seamlessly.

Breaking down your changes into smaller, well-defined commits facilitates more efficient debugging. If an issue arises, you can pinpoint the exact commit responsible, making it simpler to identify and rectify problems without sifting through a monolithic commit that encompasses multiple changes.

Striking the right balance between cohesive commits and granular changes is an art that evolves with experience. Each commit should encapsulate a logical unit of work, providing a snapshot of progress without overwhelming the commit history.

I've come to appreciate the beauty of making numerous small commits, each encapsulating a specific change. This practice not only aligns with best version control practices but also enhances the overall agility of your development process.

As you embark on your Git journey, let the staging area be your ally in crafting a version history that is not just a record of changes but a narrative of your project's growth and refinement. Embrace the power of thoughtful staging, and watch as it transforms your version control workflow into a seamless and efficient collaboration.

That's it! Do you use this command? Did you already know these possibilities or understand how this command can help you? Share your thoughts on this post in the comments. 

See you soon!

[git_add_last_post]: /{{ site.lang }}/git-basics-an-in-depth-look-at-essential-commands/#git-add
[book_tracking_repo]: https://github.com/ionixjunior/BookTracking