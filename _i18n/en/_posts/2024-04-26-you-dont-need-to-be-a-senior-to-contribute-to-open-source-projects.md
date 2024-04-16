---
layout: post
title:  "You don't need to be a senior to contribute to open-source projects"
date:   2024-04-08
translations: ["pt"]
tags: ["opensource", "ios"]
---

<p class="intro"><span class="dropcap">W</span>ant to contribute to open-source projects but feel intimidated by the idea? Don't worry! Contrary to popular belief, you don't need to be a senior developer to make meaningful contributions. In fact, getting started can be easier than you think. In this post, I'll share my experience and show you how simple it can be to contribute to open-source projects, regardless of your level of experience. Let's dive in and discover how you can start making a difference today!</p>

[Some months ago][career_transition_post], I said about my transition to focus on Swift to be an iOS Engineer, and one of my plans is starting to contribute for iOS open-source projects. But, how can I contribute if I am learning? Well, I am learning, but I have some experience and I know how to start. So, the main challenge was discover some cool project to contribute.

## Finding a project to contribute to
When it comes to finding the right open-source project to contribute to, it's normal to feel a bit overwhelmed at first. However, with a bit of guidance, the process becomes much simpler.

There is a website called [Up For Grabs][up_for_grabs]. It contains a list of projects which have curated tasks specifically for new contributors. It can be a good way to start to looking for a project, but I didn't find any interesting project for me. So, I decied to looking for project at GitHub.

Start by exploring GitHub and filtering projects based on your preferred programming language, such as Swift for iOS development. Look for projects that catch your interest and have a welcoming community. I made a search query for "iOS" and then filter by "Swift" language on GitHub interface.

Many projects label beginner-friendly issues as "Good First Issue" or something similar. These issues are perfect for newcomers because they're often well-documented and don't require deep knowledge of the codebase.

Consider contributing to a well-known project with an active community. These projects usually have comprehensive documentation and established contribution guidelines, making it easier for newcomers to get involved.

On my search query, I found the [Firefox iOS][firefox_ios] and I tried to explore it. Once you found a cool project to contribute, it's time to exploring available issues.

## Exploring available issues
Once you've found a project that interests you, the next step is to explore the available issues. Issues are tasks, bugs, or feature requests that need attention from the project's contributors.

Start by navigating to the project's repository on GitHub and clicking on the "Issues" tab. Here, you'll find a list of all open issues, along with their labels, descriptions, and comments.

Look for issues labeled as "Good First Issue" or similar. These are specifically marked for newcomers and are usually well-documented with clear instructions on how to get started.

Read through the issue descriptions carefully and choose one that aligns with your skills, interests, and availability. Consider factors such as the complexity of the task, the technologies involved, and your level of expertise.

Don't be afraid to ask questions or seek clarification if you're unsure about anything. Project maintainers and other contributors are usually happy to help newcomers get started.

What's next? Make a pull request (PR)? Be kind and request the permission to you solve the issue before to start - this is going to be hilarious.

## Requesting permission
After you've found an issue you'd like to work on, the next step is to request permission to work on it. If the issue is not assigned to anyone, you can usually volunteer to take it on.

To request permission, leave a comment on the issue expressing your interest in working on it. Be polite and concise. Project maintainers or other contributors will review your request and may assign the issue to you if they agree that you're a good fit for the task. Don't be discouraged if your request is not immediately accepted – sometimes it may take time for maintainers to respond.

This is not a mandatory step, but it is good to do to ensure that a specific issue is not assigned for more than one person or you work in a issue that other person is already working on.

Once you've been assigned the issue, it's time to familiarize yourself with the project's guidelines and get started on your contribution! But let me expose to you some hilarious situation that happened with me: I ask the permission to the mantainer and a few days later I haven't received response yeat and other person creates a PR and I loose the opportunity 😂. I just start over to looking for another issue and I did the same asking the permission to contribute, but I've created a PR on the same day. I was determined to not loose other opportunity.

So, be polite, but be proactive too and send the PR when you finish the work even the maintainer don't respond to you fast.

## Understanding guidelines
Before you start working on your contribution, it's essential to understand the project's guidelines. Every open-source project has its own set of guidelines and best practices for contributing, so take the time to read and understand them.

Start by reviewing the project's README file, CONTRIBUTING.md file, or any other documentation provided in the repository. These documents typically contain information on how to set up your development environment, coding conventions, commit message guidelines, and the contribution process.

Pay close attention to any specific instructions or requirements related to the issue you're working on. Some projects may have additional guidelines for certain types of contributions or may require you to follow a particular workflow.

If you have any questions about the guidelines or need clarification, don't hesitate to ask. Project maintainers or other contributors are usually happy to help newcomers understand the project's expectations.

By understanding and following the project's guidelines, you can ensure that your contribution aligns with the project's goals and standards, making it easier for maintainers to review and merge your changes.

## Setting up the development environment
Once you've been assigned an issue and familiarized yourself with the project's guidelines, the next step is to set up your development environment. Having a properly configured environment will ensure that you can build, test, and debug your code effectively. 

Start doing this creating a fork of the project. This will copy the original repository to your account and you'll work on it. Once you fork the project, you can clone it on your machine. But remember: you need to clone the forked repository, in your account. Don't clone the original repository because you will not be allowed to make anything this way. This is a good practice in open-source contributions.

{%- highlight sh -%}
git clone <repository-url>
{%- endhighlight -%}

Start by following the instructions provided in the project's documentation or README file for setting up the development environment. This may involve installing dependencies, configuring development tools, and any of steps to garantee that you'll configure correctily your environment.

If the project uses specific development tools or frameworks, make sure to install them according to the project's requirements. You may need to install programming languages, package managers, libraries, or other software components necessary for building and running the project.

The Firefox iOS project was very easy to configure. They provide a clear and good documentation explanning what is the commands I need to execute to prepare all the environment and how to open the Xcode project. I felt it is a well-organized project.

Once your development environment is set up and configured, you're ready to start working on your contribution. Open your favorite code editor, create a new branch for your changes, and dive into the code. In my case, I've used the Xcode because I'm in an iOS project.

## Testing and understanding the issue
Before making any changes to the codebase, it's essential to thoroughly understand the issue you've been assigned and how it affects the project. Start by reading the issue description and any associated comments or discussions to gain insight into the problem and its context.

The issue that I worked was described very well. You can see it [here][issue]. The main difficult was to understand what was the path I need to follow on the app to understand if my changes will be work. I put some breakpoints on the class mentioned on the issue, and after some attempts I discovered what was the screen affected.

By thoroughly testing and understanding the issue and what is the location you'll change, you'll be better equipped to develop an effective solution that addresses the problem and aligns with the project's goals and guidelines.

## Implementing the solution
Again, the issue was described very well and I was not difficult to understand what I need to do. But it depends of the project and the task you'll work. Usually, issues labeled as "Good First Issue" are issues with good descriptions, and you shouldn't have any major problemas dealing with them.

The issue that I work was very easy and the author's added a code snippet with the code that I need to replace. They was very kindness and the issue was very easy, but it was a good start for a person looking for contribute in an iOS project.

## Testing and verification
Testing and verification are crucial steps in the contribution process to ensure that your changes meet the project's requirements and standards. Sometimes you'll need to implement some unit tests to validate the new behavior. Other times you'll just need to make some manual tests. In the issue that I worked, was necessary to put the screenshots before and after the changes on the PR, and this was enough in this case. 

## Creating the pull request
After implementing and testing your solution, it's time to create a PR to submit your changes for review to integrate it into the project's codebase. Begin by switching to the branch where you made your changes and ensuring it's up to date with the latest changes from the main branch. Large projects usually have a lot of PRs every day and it's common to start our solutions and new code are merged into the repository when we working on. It's a good approach to synchronize your forked repository with the original repository and make a rebase of your branch. Today there is a button called "Sync fork" on GitHub. This is amazing and turn this process very simple, but if you use other system or prefer to do this using the command line, you can follow this:

First, add the upstream link of the original repository if you haven't do this yet.

{%- highlight sh -%}
git remote add upstream <original-repository-url>
{%- endhighlight -%}

Now fetch the changes. 

{%- highlight sh -%}
git fetch upstream main
{%- endhighlight -%}

After this, you need to merge the upstream changes to your repository. Change to the main branch and make the merge.

{%- highlight sh -%}
git merge origin upstream/main
{%- endhighlight -%}

Now the main branch of your repository is totally updated with the original repository. Change to the branch you are working and make a rebase with the main branch.

{%- highlight javascript -%}
git rebase main
{%- endhighlight -%}

Now you're prepared to make the PR. Usually the above steps aren't mandatory, but are good practices. If you want to understand more about the remote upstream and the rebase process, you can take a look in the [Git Push post][git_push_post] and [Git Rebase post][git_rebase_post].

CREATE THE PULL REQUEST...

Provide a clear title and description for your pull request, summarizing the purpose of the changes and providing additional context, such as an overview of the issue or feature being addressed and the approach taken to implement the solution.

If your pull request addresses a specific issue or feature request, reference the relevant issue number in the pull request description to automatically link the pull request to the issue.

Review the diff of your changes one last time to ensure everything looks good and that you haven't missed anything. Double-check for any potential errors or unintended changes.

Once you're satisfied with the changes and the pull request description, submit your pull request for review. Keep an eye on the pull request for comments, feedback, or requests for changes from reviewers.

[career_transition_post]: /{{ site.lang }}/my-journey-in-mobile-development-from-csharp-to-swift/
[firefox_ios]:            https://github.com/mozilla-mobile/firefox-ios
[issue]:                  https://github.com/mozilla-mobile/firefox-ios/issues/19645
[up_for_grabs]:           https://up-for-grabs.net/#/
[git_push_post]:          /{{ site.lang }}/git-push-demystified-pushing-your-commits-with-confidence/
[git_rebase_post]:        /{{ site.lang }}/git-merge-and-git-rebase-working-with-code-integration/