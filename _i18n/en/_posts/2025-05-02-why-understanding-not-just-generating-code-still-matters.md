---
layout: post
title:  "Why Understanding, Not Just Generating Code, Still Matters"
date:   2025-05-02
translations: ["pt"]
tags: ["career"]
social_image: "why-understanding-not-just-generating-code-still-matters.en.webp"
---

<p class="intro"><span class="dropcap">I</span>n the last few weeks, everybody has been talking about vibe coding and how easily you can develop an entire system, from zero to hero. This is blowing the minds of most people, and I'll talk about it in today's post. But, before talking about vibe coding, I'll talk about "normal coding" 🤔. Let's do it!</p>

## Normal coding? WTF??
Calm down, guys. I'm a Senior Software Engineer who develops mobile applications, but I've been learning Python and Django since February, and I'm using the expression "normal coding" to refer to the default process to develop software: learn, practice, develop, and repeat it over and over again.

### Learning

I took great courses at Pluralsight. Actually, I completed two Pluralsight paths with a lot of courses in each one. The first one was [Python 3 Path][python_3_path], and the second one was [Building Web Applications with Django Path][django_path]. Both are excellent resources to learn and remember how the web works and how to apply these concepts using Python. Maybe you don't know, but I already worked with web development full time until 2014. So, for me, learning Python and Django was like remembering how to develop for the web.

### Practicing

Between each course that I took, I developed some tiny applications just for practicing the concepts of each course module. It was a good moment to understand the Python style, main tools, and which code editor provides the best coding experience.

Fun fact: sometimes I feel a little bit lost when changing the language that I'm coding in. It's very common to leave Swift and go back to C# and try to create methods using the `func` keyword, or just try to put curly braces into Python code to define a function. Does this happen with you too?

### Developing

When I finished these courses, I started to think about a software to develop, and an Anki board solution came to my mind. I'm studying English, so I like to use an Anki board to practice words and expressions commonly used day-to-day. I know there are a lot of options for this kind of software. Even so, I thought about developing my own flash cards solution, and then I started.

### The flash cards saga

During the development time, I learned a lot about the Python way to develop and how Django works. If you're fluent in Python, I truly believe you know about:

- Creating a requirements file for each flavor (debug / release) is good to split developer dependencies from production dependencies.
- Adding the folder `__pycache__` into the `.gitignore` file to avoid putting the Python generated files in version control.
- Using some linter to improve code style and understanding how to configure it.
- Creating a Django app to put your code, because you can't do this in the main project.
- Mapping your Django models to manage its data in the Django admin.
- Using the debug toolbar to understand the reason for some bottlenecks, mainly when you use the magic Django ORM to load data into an HTML file.
- The importance of the empty `__init__.py` file when we create a folder and want to make it a separated package.
- The importance of avoiding using `datetime.now()` and replacing it with `timezone.now()` to avoid naive datetime.
- And so much more!

I know you, Python developer, already know all of these things, but for me, a newbie in Python and Django, all of it was new.

I spent two days making this small app, and it was really fun for me. I didn't use AI for coding, but I used AI just as a consultant, where I validated my plan about how to develop my flash cards app, and asked questions about the Python way to develop software.

Maybe you think this funny. but during development, I through to create some "interfaces" and make an abstraction until I discover the duck type.

If you're feeling curious, [here is the repository][django-flash-cards] with the source code.

### Validation and networking

After version 1.0 was finished, I talked with some colleagues to seek feedback. Where I'm working, there are a lot of great Software Engineers who know a lot about this stack, so I believe they're the best guys to help me in this learning journey. I received some good feedback about decisions that I made well or not.

But the main insight is here: I could learn and understand a lot of concepts just by practicing, developing, and seeking feedback from other experienced engineers. Now I feel capable of continuing my project and my journey through Python.

## The vibe coding idea

After this, I made an experiment: try to reproduce the same Python app just using vibe code, and the result really surprised me.

To do this, I used [VS Code][vs-code], an extension called [Cline][cline] configured in Act mode, and Gemini 2.5 Pro Preview 03-25, which is amazing. I made two attempts. The first one using a simple and very generic prompt, and a second one using a more detailed prompt. Let's talk about them.

### First attempt

The idea here was to create a simple prompt that just expressed the main goal. My script was:

> Create a web-based app in Python and Django. This app is a Flash Cards app, where I need to show my decks and have a possibility to open it and study my cards.

After this, Cline did the following:

- Python version verification.
- The creation of a virtual environment and the activation of it.
- The creation of a Django project.
- The creation of a Django app.
- The registration of the new app into `settings.py`.
- The models creation into `models.py`.
- The creation and execution of migrations.
- The implementation into the `views.py`.
- The insertion of views references into the `urls.py`.
- The HTML creation.
- The models configuration into the Django admin.
- The super user creation into the database.
- The server initialization by command line.

All of it just took a few minutes (or seconds), and I had the entire project created. I tried to open the browser, but I saw a 404 error. Following the vibe coding, I just sought help using a new prompt:

> I can't see the first screen because I get a 404 error. Here is the message:
Page not found (404)
Request Method:	GET
Request URL:	http://127.0.0.1:8000/
Using the URLconf defined in flashcards_project.urls, Django tried these URL patterns, in this order:
admin/
cards/
The empty path didn’t match any of these.
You’re seeing this error because you have DEBUG = True in your Django settings file. Change that to False, and Django will display a standard 404 page.

Looking at the message, it's easy to understand, but I did vibe coding here, and I delegated this fix to the AI.

After this, the project worked very well and I could see my new flash cards app. But there was a problem: when I opened a deck, I saw all my cards, with the front and back text appearing together. My app wasn't finished properly, because I didn't provide enough context.

I thought about continuing talking with the chat to improve this code, but I had another idea: create a detailed prompt.

### Second attempt

For the second attempt, I thought about a well-detailed prompt. So, here it is:

> Create a web-based app in Python and Django. This app is a Flash cards app. This app only I’ll use, locally. I don’t have the necessity to publish it. So, to store data, I want to use SQLite. Python needs to be the version 3.11.4, and Django 5.2.
This project should be called as “flashcards”, and the main app should be called “core”. Create two models, one for the decks, and another one for cards. The “Deck” model should have the following properties: name (max_length=50), and last_studied (nullable and blank). The “Card” model should have the following properties: deck_id, front (max_length=100), back (max_length=100), last_review_date (nullable and blank), and next_review_date (nullable and blank).
The first screen should have my list of decks. In this screen, I want to see the name of the deck, the amount of cards on it, and the last studied date. I can click in a deck and it will open another screen to see the cards. This new screen will show only one card at a time. I want to see the front text of it, and when I click on it, I want to see the back text. Also, when I click on the card to see the back text, the feedback buttons will appear too. These buttons are “again”, “hard”, “good”, and “easy”. When I click on these buttons, I will process a post request form, update the last studied deck, and the last review date and next review date of the card.
To calculate the next review date, I want to use a simple implementation of a SRS (Spaced Repetition System). If I click in “again”, add 1 minute from now into the next review date file. If I click in “hard”, add 1 day. “Good”, 3 days. “Easy”, 7 days. Create a class called SimpleSRS to create this logic.
So, to get a card, create a CardManager class and assign it into the model. With this, implement a next_card function to filter by deck, the next_review_date greater than the current date or next_review_date is null. Order by next_review_date and get the first result.
For these two pages, create a template called base.html. For my decks page, create a file called decks.html. For flash cards, create a flash_card.html. Create a 404.html custom page to handle error requests. To register new decks and cards, use Django admin. It’s enough. Use the following dependencies for the dev environment: django-debug-toolbar, pytest, pylint, pylint-django, python-dotenv. Also, create a README file with instructions about how to use the project and how to prepare the machine to use it.

Okay, maybe I exaggerated a little, but it worked too. I won't detail all the execution now, because it was very similar, but this second prompt provided me with a new app totally customized based on my input.

Initially, the app didn't work. There were problems of syntax in some files, but after some prompts, everything was fine and I had my new flash cards app working as expected. The result was very interesting here.

An interesting think that I found looking at the Python Debug Toolbar, was a bottleneck on the main screen. Looking at the SQL queries, I saw two queries executing a count to get the total of cards in a deck. When I saw the source code into the HTML file, I found the following code:

```html
{ { deck.card_count } } card{ { deck.card_count|pluralize } }
```

Do you see the problem here? When we use the `card_count` we're making a new SQL query on the database. But wait, there are two `card_count` references in this line. One for print the result, and another to properly print the "card" word using plural or no, depending of the total of cards. Now, imagine this in a big system. Are prepared to solve all this unwanted issues? Are you prepared to solve all these bottlenecks?

Another fun fact: I told the prompt to install the pytest dependency, so the AI should create some tests too, right? Unfortunately, no tests were created. Maybe I should make this request explicit.

## Normal coding or just vibe coding?

The best answer I could provide is: it depends! If you just want a simple and fast solution, and don't care about the artifacts that AI will generate, vibe coding could work using an advanced model and a good tool like Cline. But if you really want or need to understand what is happening, delegating the entire development to an AI tool can be tricky.

The point is, it isn't a problem to create a fast solution using some AI tool, but think about: are you learning something or are you just seeing the code generated and understanding nothing? Are you accepting all generated code without review it and adjusting it to your project standards? If you're delegating all this work to the AI in your company, maybe you should care about the final solution, because when you commit these files into the version control in the project of your company, it's your name that appears there as an author, so the responsibility is yours.

## Polemic: vibe coding can be good for experienced developers and harmful for newbies

This topic can be polemic, but it reflects my point of view about it. Since I started working with software development in 2008, the moments that I really learned a lot were moments that I focused on the three main pillars: learning, practicing, and developing. Sometimes we take shortcuts to evolve faster, or just to finish a task or a job, and there's no problem. The problem is when we start to do things without understanding them. This can be very bad, mainly if you don't have experience developing.

Do you think I'm wrong or have bad feelings about it? It's not a problem. This post just reflects my bias. Tell me in the comments your thoughts about this post. But just for the record: there are other guys with interesting points of view too:

- [Does AI write better code than Humans? - from Lucas Montano][video-does-ai-write-better-code-than-humans]
- [Vibe Coding is not an excuse for low-quality work - from Addy Osmani][post-vibe-coding-is-not-an-excuse-for-low-quality-work]
- [Reflections about vibe coding - from Rod Rivera][post-reflections-about-vibe-coding]

I highly recommend you check these contents out, because they provide excellent insights about this reflection.

To be clear: I like AI tools, and I'm using them a lot day-to-day. But also, I'm continuing to prepare myself, evolving in my career, and learning how to use these tools to boost my work, not replace my job. 

With more ability, maybe I could solve, in the future, issues created today by AI tools, because all of us well need to be better Software Engineers to keep in our jobs.

[python_3_path]: https://app.pluralsight.com/paths/skills/python-3
[django_path]: https://app.pluralsight.com/paths/skills/building-web-applications-with-django
[django-flash-cards]: https://github.com/ionixjunior/django-flash-cards
[vs-code]: https://code.visualstudio.com
[cline]: https://cline.bot
[video-does-ai-write-better-code-than-humans]: https://www.youtube.com/watch?v=6TbuelpcfS4
[post-vibe-coding-is-not-an-excuse-for-low-quality-work]: https://addyo.substack.com/p/vibe-coding-is-not-an-excuse-for
[post-reflections-about-vibe-coding]: https://www.linkedin.com/posts/rodriveracom_the-more-i-vibe-code-the-more-i-realize-activity-7321495011328495616-WFnq
