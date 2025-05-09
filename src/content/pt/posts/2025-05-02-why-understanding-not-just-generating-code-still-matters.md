+++
layout: post
title = "Por que Entender, e Não Apenas Gerar Código, Ainda Importa"
date:   2025-05-02
translations: ["en"]
tags: ["carreira"]
social_image: "why-understanding-not-just-generating-code-still-matters.pt.webp"
+++

<p class="intro"><span class="dropcap">N</span>as últimas semanas, todo mundo tem falado sobre vibe coding e como é fácil desenvolver um sistema inteiro usando boas ferramentas de IA. Isso está deixando a maioria das pessoas impressionadas, e falarei sobre isso no post de hoje. Mas, antes de falar sobre vibe coding, falarei sobre "normal coding" 🤔. Vamos nessa!</p>

## Normal coding? Que p*rra é essa??
Calma, pessoal. Sou um Engenheiro de Software Sênior que desenvolve aplicações mobile, mas estou aprendendo Python e Django desde fevereiro, e estou usando a expressão "normal coding" para me referir ao processo padrão para desenvolver software: aprender, praticar, desenvolver e repetir isso várias e várias vezes.

### Aprendizagem

Fiz ótimos cursos na Pluralsight. Na verdade, completei duas trilhas da Pluralsight com muitos cursos em cada uma. A primeira foi [Python 3 Path][python_3_path], e a segunda foi [Building Web Applications with Django Path][django_path]. Ambas as trilhas são excelentes recursos para aprender e relembrar como a web funciona e como aplicar esses conceitos usando Python. Talvez você não saiba, mas eu já trabalhei com desenvolvimento web em tempo integral até 2014. Então, para mim, aprender Python e Django foi como relembrar como desenvolver para a web.

### Prática

Entre cada curso que fiz, desenvolvi algumas aplicações pequenas apenas para praticar os conceitos de cada módulo dos cursos. Foi um bom momento para entender o jeito Python de programar, as principais ferramentas e qual editor de código oferece a melhor experiência de programação.

Curiosidade: às vezes me sinto um pouco perdido ao mudar a linguagem em que estou programando. É muito comum sair do Swift e voltar para o C# e tentar criar métodos usando a palavra-chave `func`, ou apenas tentar colocar chaves no código Python para definir uma função. Isso acontece com você também?

### Desenvolvimento

Quando terminei esses cursos, comecei a pensar em um software para desenvolver, e me veio à mente uma solução de Anki. Estou estudando inglês, então gosto de usar um Anki para praticar palavras e expressões usadas comumente no dia a dia. Sei que existem muitas opções desse tipo de software. Mesmo assim, pensei em desenvolver minha própria solução de flash cards, e então comecei.

### A saga dos flash cards

Durante o desenvolvimento deste app, quebrei a cabeça para sair do mundo orientado a objetos e entender como desenvolver com Python e Django. Se você é fluente em Python, realmente acredito que sabe sobre:

- Criar um arquivo requirements para cada "configuração" (debug / release) é bom para separar dependências de desenvolvimento de dependências de produção.
- Adicionar a pasta `__pycache__` ao arquivo `.gitignore` para evitar colocar os arquivos gerados pelo Python no controle de versão.
- Usar algum linter para melhorar o estilo do código e entender como configurá-lo.
- Criar um aplicativo Django para colocar seu código, porque você não pode fazer isso no projeto principal.
- Mapear seus modelos Django para gerenciar seus dados no admin do Django.
- Usar a barra de depuração para entender a razão de alguns gargalos, principalmente ao usar o ORM mágico do Django para carregar dados em um arquivo HTML.
- A importância do arquivo `__init__.py` vazio quando criamos uma pasta e queremos torná-la um pacote separado.
- A importância de evitar usar `datetime.now()` e substituir por `timezone.now()` para evitar que seu datetime não tenha a referência incompleta do timezone.
- E muito mais!

Eu sei que você, pessoa desenvolvedora Python, já sabe todas essas coisas, mas para mim, um novato em Python e Django, tudo isso foi novo.

Passei dois dias fazendo este pequeno aplicativo, e foi realmente divertido para mim. Não usei IA para codificar, mas usei IA apenas como um consultor, onde validei meu plano sobre como desenvolver meu aplicativo de flash cards, e fiz perguntas sobre como desenvolver do jeito que um dev Python desenvolve. 

Pode parecer engraçado, mas várias vezes pensei em criar interfaces para desenvolver abstrações, até descobrir o tal duck type.

Se você estiver curioso, [aqui está o repositório][django-flash-cards] com o código fonte.

### Validação e networking

Após a versão 1.0 ser finalizada, conversei com alguns colegas para buscar feedback. Onde estou trabalhando, há muitos ótimos Engenheiros de Software que sabem muito sobre essa stack, então acredito que são as melhores pessoas para me ajudar nesta jornada de aprendizado. Recebi bons feedbacks sobre decisões que tomei, sejam elas boas ou ruins.

Mas a principal sacada é aqui: eu pude aprender e entender muitos conceitos apenas praticando, desenvolvendo e buscando feedback de outros engenheiros experientes. Agora me sinto capaz de continuar meu projeto e minha jornada através do Python.

## A ideia do vibe coding

Depois disso, fiz um experimento: tentar reproduzir o mesmo aplicativo Python apenas usando vibe coding, e o resultado realmente me surpreendeu.

Para fazer isso, usei [VS Code][vs-code], uma extensão chamada [Cline][cline] configurada no modo Act, e o Gemini 2.5 Pro Preview 03-25, que é incrível. Fiz duas tentativas. A primeira usando um prompt simples e muito genérico, e a segunda usando um prompt mais detalhado. Vamos falar sobre elas.

### Primeira tentativa

A ideia aqui era criar um prompt simples que apenas expressasse o objetivo principal. Meu prompt foi:

> Create a web-based app in Python and Django. This app is a Flash Cards app, where I need to show my decks and have a possibility to open it and study my cards.

Meu prompt foi em inglês, mas também deve funcionar em português. Se testar aí, me avisa depois 😉.

Depois disso, o Cline fez o seguinte:

- Verificação da versão do Python.
- A criação de um ambiente virtual e a ativação dele.
- A criação de um projeto Django.
- A criação de um aplicativo Django.
- O registro do novo aplicativo no `settings.py`.
- A criação de modelos no `models.py`.
- A criação e execução de migrations.
- A implementação no `views.py`.
- A inserção de referências de views no `urls.py`.
- A criação do HTML.
- A configuração dos modelos no admin do Django.
- A criação do super usuário no banco de dados.
- A inicialização do servidor pela linha de comando.

Tudo isso levou apenas alguns minutos (ou segundos), e eu tive o projeto inteiro criado. Tentei abrir o navegador, mas vi um erro 404. Seguindo o vibe coding, apenas procurei ajuda usando um novo prompt:

> I can't see the first screen because I get a 404 error. Here is the message:
Page not found (404)
Request Method:	GET
Request URL:	http://127.0.0.1:8000/
Using the URLconf defined in flashcards_project.urls, Django tried these URL patterns, in this order:
admin/
cards/
The empty path didn’t match any of these.
You’re seeing this error because you have DEBUG = True in your Django settings file. Change that to False, and Django will display a standard 404 page.

Olhando a mensagem, é fácil entender, mas fiz vibe coding aqui, e deleguei essa correção para a IA.

Depois disso, o projeto funcionou bem e pude ver meu novo aplicativo de flash cards. Mas havia um problema: quando abri um deck, vi todos os meus cards, com o texto da frente e de trás aparecendo juntos. Meu aplicativo não foi finalizado corretamente, porque não forneci contexto suficiente.

Pensei em continuar conversando com o chat para melhorar este código, mas tive outra ideia: criar um prompt detalhado.

### Segunda tentativa

Para a segunda tentativa, pensei em um prompt bem detalhado. Esse foi o prompt:

> Create a web-based app in Python and Django. This app is a Flash cards app. This app only I’ll use, locally. I don’t have the necessity to publish it. So, to store data, I want to use SQLite. Python needs to be the version 3.11.4, and Django 5.2.
This project should be called as “flashcards”, and the main app should be called “core”. Create two models, one for the decks, and another one for cards. The “Deck” model should have the following properties: name (max_length=50), and last_studied (nullable and blank). The “Card” model should have the following properties: deck_id, front (max_length=100), back (max_length=100), last_review_date (nullable and blank), and next_review_date (nullable and blank).
The first screen should have my list of decks. In this screen, I want to see the name of the deck, the amount of cards on it, and the last studied date. I can click in a deck and it will open another screen to see the cards. This new screen will show only one card at a time. I want to see the front text of it, and when I click on it, I want to see the back text. Also, when I click on the card to see the back text, the feedback buttons will appear too. These buttons are “again”, “hard”, “good”, and “easy”. When I click on these buttons, I will process a post request form, update the last studied deck, and the last review date and next review date of the card.
To calculate the next review date, I want to use a simple implementation of a SRS (Spaced Repetition System). If I click in “again”, add 1 minute from now into the next review date file. If I click in “hard”, add 1 day. “Good”, 3 days. “Easy”, 7 days. Create a class called SimpleSRS to create this logic.
So, to get a card, create a CardManager class and assign it into the model. With this, implement a next_card function to filter by deck, the next_review_date greater than the current date or next_review_date is null. Order by next_review_date and get the first result.
For these two pages, create a template called base.html. For my decks page, create a file called decks.html. For flash cards, create a flash_card.html. Create a 404.html custom page to handle error requests. To register new decks and cards, use Django admin. It’s enough. Use the following dependencies for the dev environment: django-debug-toolbar, pytest, pylint, pylint-django, python-dotenv. Also, create a README file with instructions about how to use the project and how to prepare the machine to use it.

Talvez eu tenha exagerado um pouco, mas funcionou também. Não vou detalhar toda a execução agora, porque foi muito semelhante, mas este segundo prompt me forneceu um novo aplicativo totalmente personalizado com base no meu pedido.

Inicialmente, o aplicativo não funcionou. Houve problemas de sintaxe em alguns arquivos, mas depois de alguns prompts evidenciando o problema, tudo ficou bem e eu tive meu novo aplicativo de flash cards funcionando como esperado. O resultado foi muito interessante aqui.

Uma coisa interessante que encontrei olhando para o Python Debug Toolbar, foi um gargalo na tela inicial. Olhando para as consultas SQL, vi duas queries sendo executadas para carregar o total de cards em um deck. Quando eu vi o código do HTML, encontrei o seguinte:

```html
{ { deck.card_count } } card{ { deck.card_count|pluralize } }
```

Você consegue ver o problema aqui? Quando usamos `card_count`, estamos fazendo uma nova consulta no banco de dados. Mas veja que existem duas referências para `card_count` nessa linha. Uma para exibir o total de cards e outra para exibir corretamente a palavra "card" usando plural ou não, dependendo do total de cards que existem. Agora, imagine isso em um sistema grande. Você está preparado para resolver todos esses problemas inesperados? Está preparado para entender de onde vêm estes gargalos?

Outro fato engraçado: eu disse no prompt para instalar a dependência pytest, então a IA deveria criar alguns testes também, certo? Infelizmente, nenhum teste foi criado. Talvez eu devesse tornar esta solicitação explícita.

## Normal coding ou apenas vibe coding?

A melhor resposta que posso dar é: depende! Se você apenas quer uma solução simples e rápida, e não se importa com os artefatos que a IA irá gerar, o vibe coding pode funcionar usando um modelo avançado e uma boa ferramenta como o Cline. Mas se você realmente quer ou precisa entender o que está acontecendo, delegar todo o desenvolvimento para uma ferramenta de IA pode ser complicado.

O ponto é, não é um problema criar uma solução rápida usando alguma ferramenta de IA, mas pense sobre: você está aprendendo algo ou está apenas vendo o código gerado e não entendendo nada? Você está aceitando todo o código gerado sem revisar e sem ajustá-lo aos padrões do seu projeto? Se você está delegando todo esse trabalho para a IA na sua empresa, talvez deva se preocupar com a solução final, porque quando você comita esses arquivos no controle de versão no projeto da sua empresa, é o seu nome que aparece lá como autor, então a responsabilidade é sua.

## Polêmica: vibe coding pode ser bom para desenvolvedores experientes e prejudicial para novatos

Este tópico pode ser polêmico, mas reflete meu ponto de vista sobre isso. Desde que comecei a trabalhar com desenvolvimento de software em 2008, os momentos em que realmente aprendi muito foram momentos em que me concentrei nos três pilares principais: aprender, praticar e desenvolver. Às vezes pegamos atalhos para evoluir mais rápido, ou apenas para terminar uma tarefa, ou um trabalho, e não há problema nisso. O problema é quando começamos a fazer as coisas sem entendê-las. Isso pode ser muito ruim, principalmente se você não tem experiência desenvolvendo.

Você acha que estou errado ou tem impressões diferentes sobre isso? Não tem problema. Este post apenas reflete meu viés. Diga-me nos comentários o que você pensa. Mas apenas para registro: existem outras pessoas com pontos de vista interessantes também:

- [AI escreve código melhor que Humanos? - de Lucas Montano][video-does-ai-write-better-code-than-humans]
- [Vibe Coding is not an excuse for low-quality work - de Addy Osmani][post-vibe-coding-is-not-an-excuse-for-low-quality-work]
- [Reflections about vibe coding - de Rod Rivera][post-reflections-about-vibe-coding]

Eu recomendo fortemente que você confira esses conteúdos, porque eles fornecem excelentes insights sobre esta reflexão.

Que fique claro: gosto de ferramentas de IA, e as estou usando muito no dia a dia. Mas também, continuo me preparando, evoluindo na minha carreira, e aprendendo a usar essas ferramentas para impulsionar meu trabalho, não substituí-lo. 

Com mais habilidade, talvez eu possa resolver, no futuro, os problemas criados hoje por ferramentas de IA, pois, com certeza, precisaremos ser melhores Engenheiros de Software para continuar na profissão.

[python_3_path]: https://app.pluralsight.com/paths/skills/python-3
[django_path]: https://app.pluralsight.com/paths/skills/building-web-applications-with-django
[django-flash-cards]: https://github.com/ionixjunior/django-flash-cards
[vs-code]: https://code.visualstudio.com
[cline]: https://cline.bot
[video-does-ai-write-better-code-than-humans]: https://www.youtube.com/watch?v=6TbuelpcfS4
[post-vibe-coding-is-not-an-excuse-for-low-quality-work]: https://addyo.substack.com/p/vibe-coding-is-not-an-excuse-for
[post-reflections-about-vibe-coding]: https://www.linkedin.com/posts/rodriveracom_the-more-i-vibe-code-the-more-i-realize-activity-7321495011328495616-WFnq
