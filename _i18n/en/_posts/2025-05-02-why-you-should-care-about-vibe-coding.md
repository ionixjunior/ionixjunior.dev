---
layout: post
title:  "Why you should care about vibe coding?"
date:   2025-04-21
translations: ["en"]
tags: ["career"]
---

<p class="intro"><span class="dropcap">I</span>n the last weeks, everybody is talking about vibe coding and how easy you can develop a entire system, from zero to hero. This blowing the mind of most people and I'll talk about it in today's post. But, before to talk about vibe coding, I'll talk about "normal coding" 🤔. Let's do it!</p>

## Normal Coding? WTF??
Calm down, guys. I'm a Senior Software Engineer who develop mobile applications, but I'm learning Python and Django since february, and I using the expression "normal coding" to refear to the default proccess to learn how to develop a software: learn, practice, develop, and repeat it over and over again.

### Learning

I made great courses at Pluralsight. Actually, I made two Pluralsight paths with a lot of courses in each one. The first one was [Python 3 Path][python_3_path], and the second one was [Building Web Applications with Django Path][django_path]. Both, excelent resources to learn, and remember how web works and how to apply these concepts using Python. Maybe you don't know, but I already worked with web development full time until 2014. So, to learn Python and Django, for me, it was remember how to develop for web.

### Practicing

Between each course that I made, I make some tiny applications just for practicing the concepts of each module of the courses. It was a good moment to understand the Python style, main tools, and what's the editor code who provides the best experience coding.

Fun fact: sometimes I feel I little bit lost changing the language that I'm coding. It's very common to leave Swift and go back to C# and try to create methods using the `func` keyword, or just try put curly braces into Python code to define a function. Is it happens with you too?

### Developing

When I finished these couses, I started to think about a software to develop, and came in my mind a Anki board solution. I'm studying English, so I like to use an Anki board to practice words and expressions commonly used day-to-day. I used a system that I need to install on my machine, and I know there are a lot of similar kind of apps like this. Even so, I thought to develop my own flash cards solution, and them, I started.

### The flash cards saga

During the development time, I learned a lot of Python way to develop and how Django works. If you're fluent in Python, I really believe you know about:

- Create a requirements file for each flavor (debug / release) is good to split developer dependencies from production dependencies.
- Add the folder `__pycache__` into the `.gitignore` file to avoid put in the version control Python generated files.
- Use some linter to improve code style and understand how to configure it.
- Create a Django app to put your code, because you can't do this into the main project.
- Map your Django models to manage them data into the Django admin.
- Use the debug toolbar to understand the reason of some bottlenecks, mainly when you use the magic Django ORM to load data into a HTML file.
- The importance of the empty `__init__.py` file when we create a folder and want to make it as a separated package.
- The importance to avoid use `datetime.now()` and replace by `timestamp.now()` to avoid naive datetime.
- And so more!

I know, actually you already know all of these things, and that's okay, but for me, a newbie in Python and Django, all of it were new.

I spent two days making this small app, and it was really funny for me. I don't used AI for coding, but I used AI just as a senior consultant, where I validated my plan about how to develop my flash cards app, and asking questions about the Python way to develop software.

If you're feeling curious, [here is the repository][django-flash-cards] with the source code.

### Validation and networking

After the version 1.0 finished, I talk with some colleagues to seek feedback. Here where I'm working, there are a lot of great Software Engineers who knows a lot about Python and Django, so I believe they're the best guys to help me in this learning journey. I received some good feedbacks about things that I did well or no.

But the main insight is here: I could learn and understand a lot of concepts just practing and developing, and I'm feeling capable to continue my project.

## The vibe coding idea

After this, I made an experiment: try to reproduce the same Python app just using vibe code, and the result really surprise me.

To do this, I used [VS Code][vs-code], an extension called [Cline][cline] configured in Act mode, and Gemini 2.5 Pro Preview 03-25, which is amazing. I tried using two prompts. The first one simpler and the second one more details. Let's talk about them.

### First attempt

The idea here was to create a simple prompt who just express the main goal. My script was:

> Create a web-based app in Python and Django. This app is a Flash Cards app, where I need to show my decks and have a possibility to open it and study my cards.

After this, the Cline made the following:

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
- The start of the server.

All of it just take a few seconds, and I was with the entire project created. I tried to open the browser, but I saw a 404 error. Following the vibe coding, I just seek help using a new prompt:

> I can't see the first screen because I get a 404 error. Here is the message: 
Page not found (404)
Request Method:	GET
Request URL:	http://127.0.0.1:8000/
Using the URLconf defined in flashcards_project.urls, Django tried these URL patterns, in this order:
admin/
cards/
The empty path didn’t match any of these.
You’re seeing this error because you have DEBUG = True in your Django settings file. Change that to False, and Django will display a standard 404 page.

Looking to the message, is easy to undertand, but I made vive coding here, and I delegate this fix to the AI.

After this, the project works very well and I could see my new "great" new flash cards app. But there's a problem: when I open a deck, I see all my cards, with the front and back text appearing together. My app wasn't finished propertly, because I don't provide enough context.

I think to continue talking with the chat to improve "my" code, but I had another idea: create a detail prompt, and I'll talk about it in the second attempt.

### Second attempt

For the second attempt, I thought in a well-detailed prompt. So, here it is:

> Create a web-based app in Python and Django. This app is a Flash cards, app. This app only I’ll use, locally. I don’t have the necessity to publish it. So, to store data, I want to use SQLite. Python needs to be the version 3.11.4, and Django 5.2. 
This project should be called as “flashcards”, and the main app should be called “core”. Create two models, one for the decks, and another one for cards. The “Deck” model should have the following properties: name (max_length=50), and last_studied (nullable and blank). The “Card” model should have the following one: deck_id, front (max_length=100), back (max_length=100), last_review_date (nullable and blank), and next_review_date (nullable and blank).
The first screen should have my list of decks. In this screen, I want to see the name of the deck, the about of cards on it, and the last studied date. I can click in a deck and it will open another screen to see the cards. This new screen will show only one card by time. I want to see the front text of it, and when I click on it, I want to see the back text. Also, when click on the card to see the back text, the buttons feedbacks will appear too. This buttons are “again”, “hard”, “good”, and “easy”. When I click on these buttons, I will process a post request form, update the last studied deck, and the last review date and next review date of the card. 
To calculate the next review date, I want to use a simple implementation of a SRS (Spaced Repetition System). If I click in “again”, add 1 minute from now into the next review date file. If I click in “hard”, add 1 day. “Good”, 3 days. “Easy”, 7 days. Create a class called SimpleSRS to create this logic.
So, to get a card, create a CardManager class and assign it into the model. With this, implement a next_card function to filter by deck, the next_review_date greater than the current date or next_review_date is null. Order by next_review_date and get the first result.
To this two pages, create a template called base.html. For my decks page, create a file called decks.html. For flash cards, create a flash_card.html. Create a 404.html custom page to handle error requests.
To register new decks and cards, use Django admin. It’s enough.
Use the following dependencies for dev environment:
django-debug-toolbar
pytest
pylint
pylint-django
python-dotenv
Also, create a README file with the instructions about how to use the project and how prepare the machine to use it.

Okay, maybe I exaggerated a little, but it works too. I won't detail all the execution now, because it was very similar, but this second prompt provide me a new app totally customized based on my input.

The first attempt trying to start the project doesn't work, but after some prompts everything were fine and I had my new flash cards app and working as expected. The result was very interesting here.

## Normal coding or just vibe coding?

The best answer I could provide is: it depends! If you just want a simple and fast solution, and don't care about the artifacts that AI will generate, vibe coding could work using an advanced model. But if really wants or needs to understand what is happening, delegate the entire development to an AI tool can be tricky.

The point is, it isn't a problem to create a fast solution using some AI tool, but thing about: are you learning something or you just seeing the code generated and understand nothing? If you're making your job, maybe you should care about the final solution, because when you commit these files into the version control, it's your name that appears there as an author, so the responsability it all yours.

[python_3_path]: https://app.pluralsight.com/paths/skills/python-3
[django_path]: https://app.pluralsight.com/paths/skills/building-web-applications-with-django
[django-flash-cards]: https://github.com/ionixjunior/django-flash-cards
[vs-code]: https://code.visualstudio.com
[cline]: https://cline.bot
