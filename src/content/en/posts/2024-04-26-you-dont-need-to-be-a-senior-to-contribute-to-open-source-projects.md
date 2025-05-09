+++
title = "You don't need to be a senior to contribute to open-source projects"
date:   2024-04-26
translations: ["pt"]
tags: ["git", "opensource"]
social_image: "you-dont-need-to-be-a-senior-to-contribute-to-open-source-projects.en.webp"
+++

<p class="intro"><span class="dropcap">W</span>ant to contribute to open-source projects but feel intimidated by the idea? Don't worry! Contrary to popular belief, you don't need to be a senior developer to make meaningful contributions. In fact, getting started can be easier than you think. In this post, I'll share my experience and show you how simple it can be to contribute to open-source projects, regardless of your level of experience. Let's dive in and discover how you can start making a difference today!</p>

[Some months ago][career_transition_post], I said about my career transition to focus on Swift to be an iOS Engineer, and one of my plans is starting to contribute to iOS open-source projects. But, how can I contribute if I am learning? Well, I am learning, but I have some experience and I know how to start. So, the main challenge was discovered some cool project to contribute.

## Finding a project to contribute to
When it comes to finding the right open-source project to contribute to, it's normal to feel a bit lost at first. However, with a bit of guidance, the process becomes much simpler.

There is a website called [Up For Grabs][up_for_grabs]. It contains a list of projects which have curated tasks specifically for new contributors. It can be a good way to start to looking for a project, but I didn't find any interesting project for me. So, I decided to looking for project at GitHub.

Try exploring GitHub and filtering projects based on your preferred programming language, such as Swift for iOS development. I made a search query for "iOS" and then filter by "Swift" language on GitHub interface to looking for projects that catch my interest and have a welcoming community.

Many projects label beginner-friendly issues as "Good First Issue" or something similar. These issues are perfect for newcomers because they're often well-documented and don't require deep knowledge of the codebase.

Consider contributing to a well-known project with an active community. These projects usually have comprehensive documentation and established contribution guidelines, making it easier for newcomers to get involved.

On my search query, I found the [Firefox iOS][firefox_ios] and I tried to explore it. Once you found a cool project to contribute, it's time to explore available issues.

## Exploring available issues
Once you've found a project that interests you, the next step is to explore the available issues. Issues are tasks, bugs, or feature requests that need attention from the project's contributors.

Start by navigating to the project's repository on GitHub and clicking on the "Issues" tab. There you'll find a list of all open issues, along with their labels, descriptions, and comments.

Look for issues labeled as "Good First Issue" or similar. These are specifically marked for newcomers and are usually well-documented with clear instructions on how to get started.

Read through the issue descriptions carefully and choose one that aligns with your skills, interests, and availability. Consider factors such as the complexity of the task, the technologies involved, and your level of expertise.

Don't hesitate to ask questions or seek clarification if you're unsure about something. Project maintainers and other contributors are usually happy to help newcomers get started.

What's next? Make a PR (pull request)? Be kind and request the permission to you solve the issue before to start - this should be interesting, and I'll explain why right below.

## Requesting permission
After you've found an issue you'd like to work on, the next step is to request permission to work on it. If the issue is not assigned to anyone, you can usually volunteer to take it.

To request permission, leave a comment on the issue expressing your interest in working on it. Be polite and concise. Project maintainers or other contributors will review your request and may assign the issue to you if they agree that you're a good fit for the task. Don't be discouraged if your request is not immediately accepted – sometimes it may take time for maintainers to respond.

This is not a mandatory step, but it is good to do to ensure that a specific issue is not assigned to more than one person, or you work in an issue that another person is already working on. I remembered a time that I wanted to contribute to Bitwarden project and my permissions was denied because the team had other plans for that issue. You can see it [here][bitwarden_issue]. Because of this, I believe it is good to be polite and request permission before you start to working on an issue.

Once you've been assigned the issue, it's time to familiarize yourself with the project's guidelines and get started on your contribution. But let me expose to you some hilarious situation that happened to me: I asked the permission to the maintainer and a few days later I haven't received response yet and other person creates a PR and I lose the opportunity 😂. I just start over to looking for another issue and I did the same asking the permission to contribute, but I've created a PR on the same day. I was determined to not lose another opportunity.

So, be polite, but be proactive too and send the PR when you finish the work, even the maintainer doesn't respond to you fast.

## Understanding guidelines
Before you start working on your contribution, it's essential to understand the project's guidelines. Every open-source project has its own set of guidelines and best practices for contributing, so take the time to read and understand them.

Start by reviewing the project's README file, CONTRIBUTING.md file, or any other documentation provided in the repository. These documents typically contain information on how to set up your development environment, coding conventions, commit message guidelines, and the contribution process.

Pay close attention to any specific instructions or requirements related to the issue you're working on. Some projects may have additional guidelines for certain types of contributions or may require you to follow a particular workflow. If you have any questions about the guidelines or need clarification, don't hesitate to ask.

By understanding and following the project's guidelines, you can ensure that your contribution aligns with the project's goals and standards, making it easier for maintainers to review and merge your changes.

## Setting up the development environment
Once you've been assigned an issue and familiarized yourself with the project's guidelines, the next step is to set up your development environment. Having a properly configured environment will ensure that you can build, test, and debug your code effectively. 

Start by creating a fork of the project. This will copy the base repository to your GitHub account, and you'll work on it. Once you fork the project, you can clone it on your machine. But remember: you need to clone the forked repository. Don't clone the base repository because you will not be allowed to make anything this way. This is a good practice in open-source contributions.

{%- highlight sh -%}
git clone <repository-url>
{%- endhighlight -%}

Start by following the instructions provided in the project's documentation or README file for setting up the development environment. This may involve installing dependencies, configuring development tools, and any of steps to guarantee that you'll configure correctly your environment.

If the project uses specific development tools or frameworks, make sure to install them according to the project's requirements. You may need to install programming languages, package managers, libraries, or other software components necessary for building and running the project.

The Firefox iOS project was very easy to configure. They provide a clear and good documentation explaining what are the commands I need to execute to prepare all the environment and how to open the Xcode project. I felt it is a well-organized project.

Once your development environment is set up, you're ready to start working on your contribution. Open your favorite code editor, create a new branch for your changes, and dive into the code. In my case, I've used the Xcode because I'm in an iOS project.

## Testing and understanding the issue
Before making any changes to the codebase, it's essential to thoroughly understand the issue you've been assigned and how it affects the project. Start by reading the issue description and any associated comments or discussions to gain insight into the problem and its context.

The issue that I worked was described very well. You can see it [here][issue]. The main difficult for me was to discover which screen on the app would be affected with the changes. I put some breakpoints on the class mentioned on the issue, and after some attempts I discovered what was the screen impacted.

By thoroughly testing and understanding the issue and what is the location you'll change, you'll be better equipped to develop an effective solution that addresses the problem and aligns with the project's goals and guidelines.

## Implementing the solution
Again, the issue was described very well, and I was not difficult to understand what I need to do. But it depends on the project and the task you'll work. Usually, issues labeled as "Good First Issue" are issues with good descriptions, and you shouldn't have any major problems dealing with them.

The issue that I worked was very easy, and the author's added a code snippet with the code that I needed to replace. They were very kindness and the issue was very easy, but it was a good start for a person looking to contribute to an iOS project.

## Testing and validation
Test and validate are crucial steps in the contribution process to ensure that your changes meet the project's requirements and standards. Sometimes you'll need to implement some unit tests to validate the new behavior. Other times you'll just need to make some manual tests. In the issue that I worked, it was necessary to put the screenshots before and after the changes on the PR, and this was enough in this case. 

## Creating the pull request
After implementing and testing your solution, it's time to create a PR to submit your changes for review to integrate it into the project's codebase. Begin ensuring that the branch where you made your changes is up-to-date with the latest changes from the main branch of the base repository. Large projects usually have a lot of PRs every day, and it's common to start our solutions and new code are merged into the repository when we're working in an issue. It's a good approach to synchronize your forked repository with the base repository and make a `rebase` of your branch. Today, there is a button called "Sync fork" on GitHub. This is amazing and turn this process very simple, but if you use other system or prefer to do this using the command line, you can follow this:

First, add the upstream link of the base repository if you haven't done this yet.

{%- highlight sh -%}
git remote add upstream <base-repository-url>
{%- endhighlight -%}

Now fetch the changes. 

{%- highlight sh -%}
git fetch upstream main
{%- endhighlight -%}

After this, you need to merge the upstream changes to your repository. Change to the main branch and make the merge.

{%- highlight sh -%}
git merge origin upstream/main
{%- endhighlight -%}

Now the main branch of your repository is totally updated with the base repository. Change to the branch you are working and make a rebase with the main branch.

{%- highlight javascript -%}
git rebase main
{%- endhighlight -%}

Now you're prepared to make the PR. Usually the above steps aren't mandatory, but are good practices. If you want to understand more about the `remote upstream` and the `rebase` process, you can take a look in the [Git Push][git_push_post] and [Git Rebase][git_rebase_post] posts.

Now it's time to create the PR! To do this, start pushing the branch you're working to your remote repository.

{%- highlight sh -%}
git push origin <branch-name>
{%- endhighlight -%}

I won't describe how to create the PR to the base repository. Instead, I'll suggest to you to read the GitHub documentation explaining [how to create a PR from a fork][github_create_pr_from_fork]. It is an amazing documentation.

Provide a clear title and description for PR, summarizing the purpose of the changes and providing additional context, such as an overview of the issue or feature being addressed and the approach taken to implement the solution. If the PR addresses a specific issue, reference the issue number in the PR description to automatically link the PR to the issue. The Firefox iOS repository contains some name conventions for issue title and references inside the description, so it's important to understand the project's rules.

Review your changes one last time to ensure everything looks good and that you haven't missed anything. Double-check for any potential errors or unintended changes. Once you're satisfied with the changes and the PR description, submit the PR for review. Keep an eye on the PR for comments, feedback, or requests for changes from reviewers.

If you're curious, [here][pr] is the PR that I worked.

## Conclusion
In conclusion, contributing to open-source projects is not exclusive to senior developers. With the right mindset, willingness to learn, and attention to detail, anyone can make valuable contributions to projects they're passionate about. By following the steps outlined in this guide, you can embark on your open-source journey, gain practical experience, and make a positive impact on the development community. Remember that every contribution, no matter how small, contributes to the collective growth and improvement of open-source software. So don't hesitate to get involved, share your skills, and become part of the vibrant open-source community.

So, what are you waiting for? Don't be afraid. Let go of fear, shame, and the impostor syndrome. I hope this post inspires you, and I'd love to see in the comments which PR you contributed to.

Happy coding!

[career_transition_post]:     /{{ site.lang }}/my-journey-in-mobile-development-from-csharp-to-swift/
[firefox_ios]:                https://github.com/mozilla-mobile/firefox-ios
[issue]:                      https://github.com/mozilla-mobile/firefox-ios/issues/19645
[up_for_grabs]:               https://up-for-grabs.net/#/
[git_push_post]:              /{{ site.lang }}/git-push-demystified-pushing-your-commits-with-confidence/
[git_rebase_post]:            /{{ site.lang }}/git-merge-and-git-rebase-working-with-code-integration/
[github_create_pr_from_fork]: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork
[pr]:                         https://github.com/mozilla-mobile/firefox-ios/pull/19765
[bitwarden_issue]:            https://github.com/bitwarden/mobile/issues/1824#issuecomment-1287978943