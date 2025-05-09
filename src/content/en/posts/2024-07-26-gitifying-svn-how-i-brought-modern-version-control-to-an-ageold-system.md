---
layout: post
title:  "Git-ifying SVN: How I Brought Modern Version Control to an Age-Old System"
date:   2024-07-26
translations: ["pt"]
tags: ["git"]
social_image: "gitifying-svn-how-i-brought-modern-version-control-to-an-ageold-system.en.webp"
---

<p class="intro"><span class="dropcap">R</span>ewind the clock ten years. The year was 2014, smartphones were still finding their feet, and I was a bright-eyed developer, eager to conquer the world, one line of code at a time. But a formidable foe stood in my path – our company’s steadfast reliance on Subversion (SVN) for version control. Don't get me wrong, SVN had served us well for a time. But as our projects grew in complexity and our team expanded, its limitations became increasingly apparent. Branching and merging were exercises in frustration, collaboration felt clunky, and don't even get me started on trying to work offline! The very tool that was meant to streamline our development process was slowing us down. A solution was needed, but a full-blown migration to a new system (Git was beckoning) felt like a distant dream. Then, I stumbled upon something that promised the best of both worlds... a way to "Git-ify" our SVN workflow. Let me tell you how git svn changed everything.</p>

## The SVN Struggle

Every developer knows that sinking feeling when their tools become roadblocks instead of enablers. With SVN, that feeling was becoming a constant companion.

The branching and merging process was the stuff of nightmares. Each branch felt like a delicate ecosystem, and merging them back into the trunk was a high-stakes operation fraught with the peril of conflicts. Hours would disappear into resolving these conflicts, often introducing new ones in the process. It felt like we were spending more time battling the version control system than writing actual code. I believe this was why the company choose to work only on the "trunk" branch - this is the name of the main branch on SVN.

Collaboration wasn't much better. SVN’s centralized nature meant we were tethered to a constant internet connection. Want to commit a small change? Make sure you’re online! Working remotely? Better hope your VPN is cooperating. This lack of offline access was a major productivity killer.

And let's not forget that code review didn't exist. You just made a commit and done. We lived this way. It was funny when you and your colleague were working on the same file and whoever commit last without updating the repository ended up removing the implementation of the colleague who commit first.

The impact of these SVN struggles was undeniable. As I was used to working with good tools, it was a bit difficult to work with SVN. Something had to give. A full switch to Git seemed ideal, but migrating our entire codebase and getting everyone on board felt like a Herculean task we weren't prepared for.

## Discovering git svn

Just when my developer despair was at its peak, I stumbled across a glimmer of hope while scouring the internet for SVN workarounds (as one does when facing a mountain of merge conflicts). Enter `git svn`: a seemingly magical command that promised to bridge the chasm between my SVN reality and the Git-powered dreams I held dear.

In essence, `git svn` acts as a translator between the two systems. It allows you to work locally with all the power and flexibility of Git - branching, merging, offline commits – while still interacting with a remote SVN repository. Imagine having your cake and eating it too, but for version control!

The beauty of `git svn` lay in its simplicity. I could keep using my familiar Git commands (`git checkout`, `git branch`, `git merge`, oh my!) without forcing my colleagues to abandon SVN. It was the perfect stealth operation to bring some modern version control sanity into our workflow, all while flying under the radar of a full-blown migration.

The possibilities were exhilarating: I could finally branch and merge with ease, commit changes offline to my heart’s content, and gain much-needed visibility into our project's history, all without rocking the SVN boat. Could this be the answer to our version control woes? I was determined to find out.

## Implementing the Solution

Armed with newfound hope and a healthy dose of developer enthusiasm, I dove headfirst into the world of `git svn`. My first order of business? Cloning our SVN repository into a local Git repository using the magic command:

{%- highlight sh -%}
git svn clone --stdlayout SVN_REPOSITORY_URL  
{%- endhighlight -%}

It felt like opening a portal to a parallel universe – a universe where I could branch and merge without breaking a sweat. Once the clone was complete, I was greeted by a familiar sight: my very own Git repository, complete with the entire project history.

To show you, I'm using a free SVN repo from [RiouxSVN][free_svn_repo], create a project, make some commits and clone it. When I typed the command above, I can see the following where I typed `git log`:

{%- highlight sh -%}
* 899c967 (origin/trunk, main) Replace age by birthDate
* c6e470f Replace name by first and last name properties
* 0645868 Add User struct
* 9d3fa32 Creating initial repository structure
{%- endhighlight -%}

Note that the main branch of Git is synched with the trunk branch of SVN. Now, you can imagine that we're in the Git world and can create new branches, make merges, updates, and so on. I've created a new branch called "new_feature", and make a small implementation. Seeing the log, we have the following:

{%- highlight sh -%}
* 9ec48e4 (HEAD -> new_feature) Change to a computed property
* 9a03f1b Add fullName method
* 899c967 (origin/trunk, main) Replace age by birthDate
* c6e470f Replace name by first and last name properties
* 0645868 Add User struct
* 9d3fa32 Creating initial repository structure
{%- endhighlight -%}

Now we have the "new_feature" branch ahead of the trunk. Suppose we finish our development and needs merge. But first, let's do another think: let's make another commit into SVN repo (simulation a teammate work), and keep our new branch updated before merge and send changed to SVN. How can we do this? Well, we can simple use the `fetch` command to get the newest updates from SVN, and them merge it if our local repository. Let's see it.

{%- highlight sh -%}
git svn fetch   
 
        M       User.swift
r5 = 8bfc98b61c4e4c0eaf4062d5dacdaeb634b97cc7 (refs/remotes/origin/trunk)
{%- endhighlight -%}

Seeing the log, we get the following:

{%- highlight sh -%}
* 8bfc98b (origin/trunk) Add id property
| * 9ec48e4 (HEAD -> new_feature) Change to a computed property
| * 9a03f1b Add fullName method
|/  
* 899c967 (main) Replace age by birthDate
* c6e470f Replace name by first and last name properties
* 0645868 Add User struct
* 9d3fa32 Creating initial repository structure
{%- endhighlight -%}

Now we see the trunk branch is one commit ahead of our main branch. Let's update it and them make a rebase of our feature branch.

{%- highlight sh -%}
git checkout main
git merge origin/trunk

Updating 899c967..8bfc98b
Fast-forward
 User.swift | 1 +
 1 file changed, 1 insertion(+)
{%- endhighlight -%}

Now the trunk and main branches are synched.

{%- highlight sh -%}
* 8bfc98b (HEAD -> main, origin/trunk) Add id property
| * 9ec48e4 (new_feature) Change to a computed property
| * 9a03f1b Add fullName method
|/  
* 899c967 Replace age by birthDate
* c6e470f Replace name by first and last name properties
* 0645868 Add User struct
* 9d3fa32 Creating initial repository structure
{%- endhighlight -%}

Let's go back to our feature branch, make a rebase and prepare to commit into SVN.

Checkout to the "new_feature" branch.

{%- highlight sh -%}
git checkout new_feature
{%- endhighlight -%}

Make the rebase.

{%- highlight sh -%}
git rebase main
{%- endhighlight -%}

After it, everything is okay again and all synched. 

{%- highlight sh -%}
* 6e1f665 (HEAD -> new_feature) Change to a computed property
* e171831 Add fullName method
* 8bfc98b (origin/trunk, main) Add id property
* 899c967 Replace age by birthDate
* c6e470f Replace name by first and last name properties
* 0645868 Add User struct
* 9d3fa32 Creating initial repository structure
{%- endhighlight -%}

We're prepared to make our commit to SVN. First, let's checkout to the main branch.

{%- highlight sh -%}
git checkout main
{%- endhighlight -%}

Merge the feature branch using the `--no-ff` (no-fast-forward) option. This will create a merge commit into main branch, and this will be good to the SVN because won't mess with a lot of commits.

{%- highlight sh -%}
git merge --no-ff new_feature
{%- endhighlight -%}

Git will ask you a commit message. Type the message and finish the merge. Seeing the log, everything is okay.

{%- highlight sh -%}
*   3c13eb4 (HEAD -> main) Implement the fullName computed property
|\  
| * 6e1f665 (new_feature) Change to a computed property
| * e171831 Add fullName method
|/  
* 8bfc98b (origin/trunk) Add id property
* 899c967 Replace age by birthDate
* c6e470f Replace name by first and last name properties
* 0645868 Add User struct
* 9d3fa32 Creating initial repository structure
{%- endhighlight -%}

Now comes the best part: push changes to SVN. To do it, we just type the `git svn dcommit` command to push our local changes on main branch to the trunk branch on SVN server.

{%- highlight sh -%}
git svn dcommit
Committing to https://svn.riouxsvn.com/ionixjunior-prj/trunk ...
        M       User.swift
Committed r6
        M       User.swift
r6 = 42e0f095ec453b6416f954958479f39842028f58 (refs/remotes/origin/trunk)
No changes between 3c13eb4501d858e7b7c225fa687b08667d97bcb4 and refs/remotes/origin/trunk
Resetting to the latest refs/remotes/origin/trunk
{%- endhighlight -%}

Seeing the log, we will see the branches synched.

{%- highlight sh -%}
*   42e0f09 (HEAD -> main, origin/trunk) Implement the fullName computed property
|\  
| * 6e1f665 (new_feature) Change to a computed property
| * e171831 Add fullName method
|/  
* 8bfc98b Add id property
* 899c967 Replace age by birthDate
* c6e470f Replace name by first and last name properties
* 0645868 Add User struct
* 9d3fa32 Creating initial repository structure
{%- endhighlight -%}

Works like a charm 😎.

## The Impact

The introduction of `git svn` wasn’t just a technological shift; it was a breath of fresh air for me. I went from battling our version control system to embracing it as a valuable ally in our quest to build great software. Unfortunately, I've tried to evangelize my teammates to work this way, but I felt from them some fear and disturb. Even though it was cool, it was something very "new", and we know that changes take time to be introduced.

The most noticeable change was the boost in productivity. Branching and merging, once dreaded tasks, became routine operations. The fear of merge conflicts subsided, replaced by the confidence that Git’s powerful algorithms had our back. I was finally free to experiment, iterate, and collaborate with ease, and the way that I love: commit a lot, every piece of code, and I finally can use Git as a strategic tool in development, not just for versioning code.

`git svn` was the silent hero, bridging the gap between two worlds and empowering us to become better, happier, and more productive developer.

## Using git svn today

In 2014 I just typed `git svn`, and everything works. But today, maybe you need to install the `git-svn` using Homebrew. Just type `brew install git-svn`, and you'll get the `git svn` command on your command line. But this is an official command, as you can see [here][git_svn].

## Lessons Learned and Conclusion

Looking back, my journey with `git svn` was an eye-opener. It taught me that you don’t always need a radical overhaul to make a significant impact. Sometimes, the most effective solutions are the ones that bridge the gaps between existing systems and individual preferences.

While my teammates were content with the familiar flow of SVN, I was eager to tap into the power and flexibility of Git. `git svn` became my secret weapon, allowing me to work more efficiently and with far less friction, all while remaining a contributing member of our SVN-centric team.

What did I learn?

- The right tool can make all the difference. Don’t be afraid to explore solutions that cater to your specific workflow and preferences, even within constraints.
- Sometimes, a gradual approach is key. `git svn` provided a perfect steppingstone, allowing me to reap the benefits of Git without disrupting the team’s established workflow.
- Embrace flexibility. Development is a diverse field, and what works for one person might not work for another. Respecting different tools and approaches is crucial for team harmony.

While our team eventually moved on to embrace Git fully (hey, progress waits for no one!), my time with `git svn` taught me valuable lessons about adaptability, the importance of choosing the right tools for the job, and finding ways to thrive, even within the constraints of legacy systems. And sometimes, a little bit of silent revolution is all it takes to make a world of difference in your own coding journey.

Happy coding and choose the best tools for work!

[free_svn_repo]: https://riouxsvn.com
[git_svn]:       https://git-scm.com/docs/git-svn