---
layout: post
title:  "Git Branching Strategies: A Comprehensive Guide"
date:   2024-02-18
translations: ["pt"]
tags: ["git"]
---

<p class="intro"><span class="dropcap">W</span>elcome to our comprehensive guide on Git branching strategies! If you've ever felt overwhelmed by the multitude of branching options available in Git, you're not alone. With so many strategies to choose from, ranging from simple single-branch approaches to more complex models like Git Flow and GitHub Flow, it's essential to understand the benefits and trade-offs of each. Let's dive in and unravel the intricacies of Git branching together!</p>

Maybe you're thinking what's the relation about Git branching strategies and the mastering Git commands series. Well, I believe this is an important topic, because this is part day-to-day as a software developer. In the [last post][last_post] I show you how to manage branches on Git, and now we'll explore more about it. In this guide, we'll explore various Git branching strategies, discussing their principles, use cases, and best practices. Whether you're a solo developer working on a personal project or part of a large team collaborating on a complex software application, there's a branching strategy that's right for you. By the end of this guide, you'll have a clear understanding of the different approaches to branching and be equipped to choose the one that best suits your project's needs.

## What's a branching strategy?
Before delving into specific branching strategies, it's essential to understand the fundamental concept of branching itself. In Git, a branch is essentially a pointer to a specific commit in your project's history. Branches allow developers to work on separate features, bug fixes, or experiments without affecting the main codebase.

In Git, developers typically name the default branch "main" or "master" to represent the stable version of the project. When you create a new branch, you're essentially creating a new timeline of commits that diverges from the main branch. This allows you to make changes independently of the main codebase, test new features, and collaborate with others without disrupting the stable version of the project.

Branching is a powerful feature of Git that enables developers to work efficiently in teams, experiment with new ideas, and manage complex software projects with ease. By understanding the basics of branching, developers can leverage Git's branching capabilities to organize their workflow effectively and collaborate seamlessly with others. Now you already know what's a branch strategy. So lets deep dive into some options.

## Trunk-based development
...

## Single branch strategy
In the single branch strategy, there's only one branch, usually named "main" or "master". All development work, including new features and bug fixes, is done directly on this branch. This approach is simple and straightforward, making it suitable for small projects or solo developers. However, it lacks the flexibility and organization needed for larger teams or complex projects where parallel development is necessary.

This isn't a common approach for Git users when work in a collaborative project. Single branch strategy reminds me SVN era, but can be use for Git developers who are programming in a project alone. Remember, each strategy isn't correct or wrong. It solves a specific problem, and you need to think about what's the best way to solve it.

## Feature branch strategy
In the feature branch strategy, developers create a new branch for each feature they're working on, implement the changes, and then merge the feature branch back into the main branch once it's complete. This approach allows for parallel development of multiple features, keeps the main branch clean and stable, and enables easier code review and collaboration. It's a widely used strategy, particularly in larger teams or projects where multiple features are developing simultaneously. 

This is the basics, but exists many ways to apply it. Let's talk about some Git workflows.

## Git flow
The Git Flow branching model comprises several main branches and supporting branches that facilitate parallel development, release management, and hotfixing.

The main branches consist of the main branch, representing the stable, production-ready version of the code, and the develop branch, serving as the main integration branch for ongoing development activities.

Supporting branches include feature branches, release branches, and hotfix branches. Feature branches are created from the develop branch to isolate work on new features or changes. They allow developers to work independently on specific tasks without affecting the main codebase. Once a feature is complete, it is merged back into the develop branch via a pull request.

Release branches are created from the develop branch when preparing for a new release version. They enable final testing, bug fixes, and last-minute changes before deployment. Once the release is ready, the changes are merged into both the main and develop branches.

Hotfix branches are emergency branches created from the main branch to address critical issues or bugs found in the production environment. They facilitate quick fixes without disrupting ongoing development. Once the fixes are verified, they are merged into both the main and develop branches.

The Git Flow model provides a structured approach to branching and release management, ensuring stability, reliability, and organization throughout the development lifecycle. However, it can be complex and cumbersome for smaller teams or projects with simpler workflows. Additionally, strict adherence to the model may lead to longer release cycles and potential conflicts or merge issues, particularly in larger teams with frequent parallel development efforts.

<figure>
	<img src="/assets/img/git-flow.png" alt="The Git flow"> 
	<figcaption>The Git flow</figcaption>
</figure>

This is a known image originally posted by [Vincent Driessen][vincent_driessen_twitter] in his blog post in 2010. He created the concept of Git flow and his thoughts can be seen [here][git_flow_post]. An interesting think is Vincent creates a command line to facilitate the Git flow usages. I encourage you to read about it to know more about the Vincent approach.

## GitHub flow
The GitHub Flow branching model is a simplified approach to version control and code integration, emphasizing continuous integration and deployment practices. In GitHub Flow, developers create feature branches off the main branch for each new feature or fix, make small, atomic commits to their feature branches, and open pull requests (PRs) to merge their changes back into the main branch. Code changes are reviewed, discussed, and approved through the pull request process before being merged into the main branch. Once merged, changes trigger automated tests and deployments, leading to rapid feedback and iteration. GitHub Flow differs from Git Flow in its simplicity, continuous deployment focus, and flexibility. While GitHub Flow lacks a formal release process, it promotes continuous integration, collaboration, and rapid iteration, making it well-suited for modern software development workflows.

<figure>
	<img src="/assets/img/github-flow.webp" alt="The diagram shows the main branch, a new branch called feature and the journey that feature takes before it's merged into main."> 
	<figcaption>The GitHub flow</figcaption>
</figure>

## GitLab flow
The GitLab Flow offers a straightforward approach to collaboration, merging features and fixes directly into the main branch. It blends feature-driven development with issue tracking, allowing teams to streamline their workflow. With GitLab Flow, there's a focus on simplicity and efficiency, with clear guidelines for handling production and stable branches. It's all about ensuring a smooth process for teams to work together and deliver features effectively.

Git Flow starts with a 'develop' branch as the default, while GitLab Flow begins with the 'main' branch. GitLab Flow includes a pre-production branch for bug fixes before merging changes to 'main' for production. Teams can have multiple pre-production branches, such as test, acceptance, and production.

In GitLab Flow, teams use feature branches alongside a separate production branch. When 'main' is ready, it's merged into the production branch for release. GitLab Flow often involves release branches, and teams needing to publish different versions of the software at the same time, allowing for separte maintenance and bug fixes.

This can provide us better ways to organize the delivery workflow. I encorage you to read the [full documentation about GitLab Flow][gitlab_flow_post] and its [best practices][gitlab_flow_best_practices]. To try to explain how can we use the GitLab Flow, I'll show you some old images that I found o internet and explain them. Don't worry about it. The images are old, but the meaning continues relevant. Because the GitLab Flow is very versatible, we can adapt it to the best use. Let's talk about some different ways to deliver software and explore how can we adapt the GitLab Flow.

### Single environment system
This approach is suitable for projects with a single environment, such as small-scale applications or personal projects. It follows a simplified version of the GitLab Flow, where all development, testing, and deployment occur within a single environment, typically the main branch. Changes are continuously integrated and tested in the main branch, with releases triggered automatically based on predefined criteria like passing tests or manual approval. All work is integrated to the main branch and the team members need to decide when is safe to deliver the software making a merge to a production branch.

<figure>
	<img src="/assets/img/gitlab-flow-single-environment-system.png" alt=""> 
	<figcaption>The GitLab flow for a single environment system</figcaption>
</figure>

### Multi environment system
The multi environment GitLab Flow extends the basic GitLab Flow model to support multiple environments, such as development, staging, and production. This can be customized as we need. Each environment corresponds to a separate branch (e.g., development, staging, production), with changes flowing through a series of promotion stages before reaching production. Developers work on feature branches, which are merged into the development branch for integration testing. Once validated, changes are promoted to the staging branch for user acceptance testing before finally being deployed to the production branch for release.

<figure>
	<img src="/assets/img/gitlab-flow-multi-environment-system.png" alt=""> 
	<figcaption>The GitLab flow for a multi environment system</figcaption>
</figure>

### Multi version system
The multi version GitLab Flow is designed for projects with multiple active versions or release streams running concurrently. It allows teams to manage feature development, bug fixes, and releases across multiple branches representing different versions of the software. Developers work on feature branches targeting specific version branches (e.g., v1.x, v2.x), ensuring that changes are isolated and applied to the appropriate release stream. Continuous integration and delivery pipelines are configured to build, test, and deploy each version independently, enabling teams to support multiple customer deployments or product variants simultaneously.

<figure>
	<img src="/assets/img/gitlab-flow-multi-version-system.png" alt=""> 
	<figcaption>The GitLab flow for a multi version system</figcaption>
</figure>

## What's the best flow?
Sorry to say this, but there's no silver bullet, and you need to think what's the best approach for your project, team or company. Each flow has its pros and cons and have been adapted to a specific scenario. Personally, I prefer the GitHub Flow because it is very easy to use, it provides speed to the developent and delivery process, and avoid a lot of possibles merge conflicts. Of couse, you need to pay attention to not merge on the main branch a broken software, because you'll deliver it all the time. 

And you? What's your throughts? What do you think is the best approach and why? Which of these flows have you used? Tell me in the comments. Let's talk about it. See you in the next post!

[book_tracking_repository]:   https://github.com/ionixjunior/BookTracking
[vincent_driessen_twitter]:   https://twitter.com/nvie
[git_flow_post]:              https://nvie.com/posts/a-successful-git-branching-model/
[last_post]:                  /{{ site.lang }}/mastering-git-branching-basics-exploring-the-git-branch-command
[gitlab_flow_post]:           https://about.gitlab.com/topics/version-control/what-is-gitlab-flow/
[gitlab_flow_best_practices]: https://about.gitlab.com/topics/version-control/what-are-gitlab-flow-best-practices/