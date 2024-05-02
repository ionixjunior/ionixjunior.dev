---
layout: post
title:  "Understanding SwiftLint: Elevating Your iOS Code Quality and Standards"
date:   2024-05-03
translations: ["pt"]
tags: ["iOS"]
---

<p class="intro"><span class="dropcap">C</span>ode linting is a crucial practice in software development, aimed at maintaining code quality by identifying errors, bugs, and stylistic inconsistencies early in the development process. In iOS development, SwiftLint stands out as a valuable tool for enforcing coding standards and ensuring consistency across projects. This post explores SwiftLint's role in elevating iOS code quality and streamlining development workflows. Let's delve into the world of code linting with SwiftLint and discover its benefits for iOS developers.</p>

## Introducing SwiftLint
SwiftLint is a powerful tool that brings code linting capabilities to iOS development, ensuring adherence to coding standards and best practices. As part of a broader family of linters available for various programming languages, SwiftLint specifically targets Swift codebases, offering a tailored set of rules and guidelines to enhance code quality and maintainability. 

SwiftLint offers a robust set of features designed to enhance code quality and maintainability in Swift projects. With its customizable rules, developers can tailor linting configurations to suit their specific project requirements, ensuring adherence to coding standards and best practices. SwiftLint integrates seamlessly with popular development environments, providing real-time feedback and suggestions to streamline the coding process. Additionally, its support for automatic fixing simplifies the task of addressing code violations, allowing developers to focus on writing clean, efficient code. Overall, SwiftLint empowers developers to write better code by identifying potential issues early in the development cycle and promoting consistency across the codebase.

## How SwiftLint works
SwiftLint works by analyzing Swift source code files and applying a set of predefined or custom rules to identify violations of coding standards and best practices. When run, SwiftLint scans the specified files or directories in a Swift project, parsing the code and checking it against the configured rules. If any violations are found, SwiftLint generates a report highlighting the offending lines of code along with a description of the rule that was violated.

## Understanding SwiftLint rules
SwiftLint rules define the criteria for code quality and style within a Swift project. These rules cover various aspects of coding standards, including formatting, naming conventions, and best practices. By adhering to these rules, developers can ensure consistency and readability throughout their codebase. SwiftLint provides a comprehensive list of predefined rules, but it also allows developers to customize and extend these rules to better fit their project's needs. 

There are a lot of rules of different kinds. Rules about style, performance, metrics are some examples. You can check the [rules directory][rules_directory] to see. If you want to implement this on your Swift project, It's a good strategy to enable one rule at a time, and run the SwiftLint to check for violations. A long time projects can be a dozen of violations, so it's important to go slowly and refactor it. If you project is newer, or have little code, you can enable all by default.

Let's see how can we install and configure it.

## Installing SwiftLint
At the [SwiftLint project][swiftlint_project] you can find instructions to install it. You can install through Swift Package Manager, Homebrew, CocoaPods, Mint or Bazel. I prefer to use Homebrew because it give me more flexibility to run the SwiftLint in any project. Of course I need to configure it first, but as I like a command line, I prefer to have the SwiftLint in my command line globally. It's a preference. Choose what you're think is the best to you.

## Running SwiftLint
To do a simple test, I've used the [Book Tracking repository][book_tracking_repository]. Some of you should remember about it because I already did some examples using this repository. I just open the terminal and type `swiftlint`, and for my surprise a lot of violations were found. I'll show you only part of the report because it have more than one thousand lines. 

{%- highlight sh -%}
swiftlint 

Linting Swift files in current working directory
Linting 'ConstraintMultiplierTarget.swift' (1/79)
Linting 'LayoutConstraintItem.swift' (2/79)
Linting 'ConstraintAttributes.swift' (4/79)
Linting 'ConstraintMakerPrioritizable.swift' (3/79)
Linting 'ConstraintViewDSL.swift' (5/79)
Linting 'ConstraintDescription.swift' (6/79)
Linting 'ConstraintPriorityTarget.swift' (7/79)
Linting 'ConstraintInsets.swift' (8/79)
/Users/ionixjunior/Projects/iOS/BookTracking/Pods/SnapKit/Sources/ConstraintInsets.swift:30:1: warning: Vertical Whitespace Violation: Limit vertical whitespace to a single empty line; currently 2 (vertical_whitespace)
/Users/ionixjunior/Projects/iOS/BookTracking/Pods/SnapKit/Sources/ConstraintPriorityTarget.swift:32:1: warning: Trailing Whitespace Violation: Lines should not have trailing whitespace (trailing_whitespace)
Linting 'ReadingViewController.swift' (46/79)
/Users/ionixjunior/Projects/iOS/BookTracking/BookTracking/ViewControllers/Reading/ReadingViewController.swift:77:1: warning: Line Length Violation: Line should be 120 characters or less; currently it has 130 characters (line_length)
/Users/ionixjunior/Projects/iOS/BookTracking/BookTracking/ViewControllers/Reading/ReadingViewController.swift:97:1: warning: Trailing Newline Violation: Files should have a single trailing newline (trailing_newline)
/Users/ionixjunior/Projects/iOS/BookTracking/BookTracking/ViewControllers/Reading/ReadingViewController.swift:14:1: warning: Trailing Whitespace Violation: Lines should not have trailing whitespace (trailing_whitespace)
Linting 'TabBarViewController.swift' (61/79)
/Users/ionixjunior/Projects/iOS/BookTracking/BookTracking/ViewControllers/TabBar/TabBarViewController.swift:58:71: warning: Colon Spacing Violation: Colons should be next to the identifier when specifying a type and next to the key in dictionary literals (colon)
/Users/ionixjunior/Projects/iOS/BookTracking/BookTracking/ViewControllers/TabBar/TabBarViewController.swift:13:9: warning: Identifier Name Violation: Variable name 'vc' should be between 3 and 40 characters long (identifier_name)
Linting 'AppDelegate.swift' (77/79)
/Users/ionixjunior/Projects/iOS/BookTracking/BookTracking/AppDelegate.swift:48:1: warning: Vertical Whitespace Violation: Limit vertical whitespace to a single empty line; currently 2 (vertical_whitespace)
Done linting! Found 929 violations, 61 serious in 79 files.
{%- endhighlight -%}

Oh god. A lot of violations! But I don't configure anything. How SwiftLint discover all of it? SwiftLint just use all the default rules it have. Another interesting thing is it lint a pod called SnapKit. This is not interesting to us. We don't need to linting the dependencies. We need to define and organize how to deal with this. Because of this is important to configure our lint file. Let's do it!

## Configuring SwiftLint
First, let's create the `.swiftlint.yml` file. It needs to start with "dot" because it's a hidden file. After this, let's configure our excluded folders and files. In my project I configured the `Pods` folder to SwiftLint don't parse my external libs, because I'm using CocoaPods dependencies.

{%- highlight yml -%}
excluded:
  - Pods/
{%- endhighlight -%}

Running the `swiftlint` command now the result is much better, because the `Pods` directory is not reported anymore. Now I have "only" 364 violations in my project.

You have to choose a strategy to deal with this. You can keep the swiftlint file this way and solve all the violations that it founded, or you can learn about all rules and choose what is interesting to you or to your project. I'll keep all the rules activated at this moment, and I'll try to solve the violations of my project. But I'll show you how to do some configurations. Suppose you choose to specify only some specific rules, you need to use the `only_rules` property and specify the rules:

{%- highlight yml -%}
only_rules:
  - multiline_arguments
  - overridden_super_call

excluded:
  - Pods/
{%- endhighlight -%}

Also, you can configure some disabled rules to avoid SwiftLint parse them. 

{%- highlight yml -%}
disabled_rules:
  - trailing_whitespace

excluded:
  - Pods/
{%- endhighlight -%}

These are just examples. I suggest you to run `swiflint rules` command to see all rules available. In the table that will appear on the command line, you can see if the rule can be automatically corrected (is, it is possible), the kind of the rule (lint, idiomatic, style, metrics or performance), the default configuration and some other informations.

We're running the SwiftLint from command line, but exists a way to integrate it into Xcode and see warnings or erros in every build. Let's learn about it!

## Integrating SwiftLint into Xcode
To do this is very simple. You need to add a "Run Script Phase" on the Xcode project. Open Xcode and follow these steps:
1. Select your project in the Project Navigator to open the project editor;
2. Select the target you want to add SwiftLint integration to;
3. Go to the "Build Phases" tab;
4. Click the "+" button and select "New Run Script Phase";
5. In the script text field, enter the command to run SwiftLint. In my case, I added the swiftlint path from Homebrew: `/opt/homebrew/bin/swiftlint`.

<figure>
	<img src="/assets/img/steps_how_to_configure_swiftlint_into_xcode_part_I.png" alt="Steps how to configure SwiftLint into Xcode."> 
	<figcaption>Steps how to configure SwiftLint into Xcode.</figcaption>
</figure>

After this, move the "Run Script" phase before the "Compile Sources" phase. You just need to drag and drop on the Xcode interface.

<figure>
	<img src="/assets/img/steps_how_to_configure_swiftlint_into_xcode_part_II.gif" alt="Moving the Run Script phase before the Compile Sources phase."> 
	<figcaption>Moving the Run Script phase before the Compile Sources phase.</figcaption>
</figure>

Then, you'll can build your project and be happy using SwiftLint directly into Xcode. In my case the project don't compile because a violation called `line_length`. Unfortunatelly, I made some bad decisions when prototype data directly into a class and it easily violete this rule. For compile my app again, I just removed this rule and focus on other problems at this moment.

## Fixing the violations
In my project I found 364 violations. I just start fixing using the easy way: using the autocorrect. SwiftLint provide a way to autocorrect some rules. To do this, run the following commnad:

{%- highlight sh -%}
swiftlint --autocorrect
{%- endhighlight -%}

In my project, the tool automatically correct simple rules, like `trailing_whitespace`, `trailing_newline`, `trailing_comma`, `unneeded_override`, `colon`, `comma`, and `opening_brace`. Again, they are very simple rules, but can keep your project standardized. Some sules like `identifier_name` and `function_body_length` I needed to fix myself.

## Conclusion
Integrating SwiftLint into your iOS development workflow can significantly improve your code quality by enforcing consistent coding standards and identifying potential issues early in the development process. By leveraging SwiftLint's extensive set of customizable rules and seamless integration with popular development environments like Xcode, you can ensure that your codebase remains clean, maintainable, and free of common pitfalls.

Whether you're a seasoned iOS developer or just starting out, understand SwiftLint and adopting a proactive approach to code linting will elevate the quality of your iOS projects and contribute to a more efficient and collaborative development experience. So, don't hesitate to incorporate SwiftLint into your toolkit and take your iOS development practices to the next level, even you project is new. It will help you to ensure your project has good standards.

See you in the next post!

[rules_directory]:          https://realm.github.io/SwiftLint/rule-directory.html
[swiftlint_project]:        https://github.com/realm/SwiftLint
[book_tracking_repository]: https://github.com/ionixjunior/BookTracking