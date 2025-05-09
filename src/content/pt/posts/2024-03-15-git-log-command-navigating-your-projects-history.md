+++
title = "Comando Git Log: Navegando pela História do Seu Projeto"
date:   2024-03-15
translations: ["en"]
tags: ["git"]
social_image: "git-log-command-navigating-your-projects-history.pt.webp"
+++

<p class="intro"><span class="dropcap">B</span>em-vindo ao mundo do controle de versão, onde cada commit conta uma história sobre a jornada do seu projeto. Compreender essa narrativa é fundamental para colaboração eficaz, rastreamento de bugs e gerenciamento de projetos. É aí que entra o comando Git log. Neste post, embarcaremos em uma jornada pela história do seu projeto, usando o comando Git log como nosso guia confiável. Aprenderemos a navegar pelos commits, explorar alterações e descobrir insights que o ajudarão a se tornar um mestre na história do seu projeto. Portanto, prepare-se enquanto mergulhamos no comando Git log e desbloqueamos os segredos escondidos na história do seu projeto!</p>

## Compreendendo o git log
O comando `git log` fornece uma visão abrangente da história do seu projeto, permitindo que você mergulhe nos detalhes de cada commit. Ele permite rastrear quem fez alterações, quando essas alterações ocorreram e as motivações por trás delas.

Para visualizar o histórico de commits do seu projeto, basta digitar `git log` no seu terminal. Isso exibirá uma lista cronológica de commits, começando pelo mais recente.

{%- highlight bash -%}
git log

commit e6b3812b55d039f525f7d2fc07ae22f3c0260c7e (HEAD -> main, origin/main)
Author: John Doe <john@example.com>
Date:   Tue Feb 15 10:21:37 2024 -0500

    Merge pull request #123 from user/feature-branch

commit 87fc9d3e493e5f342e1a8d1a3b0ec110d57e0512
Author: Jane Smith <jane@example.com>
Date:   Mon Feb 14 16:42:19 2024 -0500

    Add new feature

commit 9a4d8fbf9c0e190e7f142bc9c48a6b91575ab228
Author: John Doe <john@example.com>
Date:   Mon Feb 14 12:09:48 2024 -0500

    Fix bug in authentication

commit a3c8f1d27c41b1d0107e163132f7eaf4eb9f3f2f
Author: John Doe <john@example.com>
Date:   Sun Feb 13 18:15:02 2024 -0500

    Update documentation

commit 7b7ae9f1f9c2e588bc1c1d101d6c1df68c2e7dd0
Author: Jane Smith <jane@example.com>
Date:   Sat Feb 12 09:30:51 2024 -0500

    Initial commit

{%- endhighlight -%}

O log apresenta cada commit com informações detalhadas, incluindo o hash do commit, autor, data e mensagem do commit. Você pode percorrer o log usando seu editor de texto preferido ou pressionando a barra de espaço para avançar e a tecla "q" para sair.

## Filtrando o log
O Git log oferece várias opções para personalizar a saída de acordo com suas necessidades. Por exemplo, você pode filtrar por autor, procurar por alterações específicas ou formatar a saída para incluir apenas detalhes essenciais.

Filtrando apenas commits de "Jane Smith":
{%- highlight bash -%}
git log --author="Jane Smith"

commit 87fc9d3e493e5f342e1a8d1a3b0ec110d57e0512
Author: Jane Smith <jane@example.com>
Date:   Mon Feb 14 16:42:19 2024 -0500

    Add new feature

commit 7b7ae9f1f9c2e588bc1c1d101d6c1df68c2e7dd0
Author: Jane Smith <jane@example.com>
Date:   Sat Feb 12 09:30:51 2024 -0500

    Initial commit

{%- endhighlight -%}

Filtrando apenas commits desde 14 de fevereiro de 2024:
{%- highlight bash -%}
git log --since="2024-02-14"

commit e6b3812b55d039f525f7d2fc07ae22f3c0260c7e (HEAD -> main, origin/main)
Author: John Doe <john@example.com>
Date:   Tue Feb 15 10:21:37 2024 -0500

    Merge pull request #123 from user/feature-branch

commit 87fc9d3e493e5f342e1a8d1a3b0ec110d57e0512
Author: Jane Smith <jane@example.com>
Date:   Mon Feb 14 16:42:19 2024 -0500

    Add new feature

commit 9a4d8fbf9c0e190e7f142bc9c48a6b91575ab228
Author: John Doe <john@example.com>
Date:   Mon Feb 14 12:09:48 2024 -0500

    Fix bug in authentication
{%- endhighlight -%}

Filtrando apenas commits até 14 de fevereiro de 2024:
{%- highlight bash -%}
git log --until="2024-02-14"

commit 87fc9d3e493e5f342e1a8d1a3b0ec110d57e0512
Author: Jane Smith <jane@example.com>
Date:   Mon Feb 14 16:42:19 2024 -0500

    Add new feature

commit 9a4d8fbf9c0e190e7f142bc9c48a6b91575ab228
Author: John Doe <john@example.com>
Date:   Mon Feb 14 12:09:48 2024 -0500

    Fix bug in authentication

commit a3c8f1d27c41b1d0107e163132f7eaf4eb9f3f2f
Author: John Doe <john@example.com>
Date:   Sun Feb 13 18:15:02 2024 -0500

    Update documentation

commit 7b7ae9f1f9c2e588bc1c1d101d6c1df68c2e7dd0
Author: Jane Smith <jane@example.com>
Date:   Sat Feb 12 09:30:51 2024 -0500

    Initial commit

{%- endhighlight -%}

Filtrando apenas commits que mencionam "authentication" na mensagem do commit:
{%- highlight bash -%}
git log --grep="authentication"

commit 9a4d8fbf9c0e190e7f142bc9c48a6b91575ab228
Author: John Doe <john@example.com>
Date:   Mon Feb 14 12:09:48 2024 -0500

    Fix bug in authentication
{%- endhighlight -%}

## Visualizando a história
Para uma representação mais visual da história do seu projeto, você pode usar ferramentas como `git log --graph`, que exibe commits como um gráfico, mostrando branches e merges.

{%- highlight bash -%}
git log --graph

*   commit e6b3812b55d039f525f7d2fc07ae22f3c0260c7e (HEAD -> main, origin/main)
|\  Author: John Doe <john@example.com>
| | Date:   Tue Feb 15 10:21:37 2024 -0500
| |
| |     Merge pull request #123 from user/feature-branch
| |
| * commit 87fc9d3e493e5f342e1a8d1a3b0ec110d57e0512
| | Author: Jane Smith <jane@example.com>
| | Date:   Mon Feb 14 16:42:19 2024 -0500
| |
| |     Add new feature
| |
| * commit 9a4d8fbf9c0e190e7f142bc9c48a6b91575ab228
|/  Author: John Doe <john@example.com>
|   Date:   Mon Feb 14 12:09:48 2024 -0500
|
|       Fix bug in authentication
|
* commit a3c8f1d27c41b1d0107e163132f7eaf4eb9f3f2f
| Author: John Doe <john@example.com>
| Date:   Sun Feb 13 18:15:02 2024 -0500
|
|     Update documentation
|
* commit 7b7ae9f1f9c2e588bc1c1d101d6c1df68c2e7dd0
  Author: Jane Smith <jane@example.com>
  Date:   Sat Feb 12 09:30:51 2024 -0500
  
      Initial commit

{%- endhighlight -%}


Se você quiser ver uma forma mais simples, com apenas uma linha por commit, pode especificar o parâmetro `--oneline`:

{%- highlight bash -%}
git log --graph --oneline

* e6b3812 Merge pull request #123 from user/feature-branch
|\
| * 87fc9d3 Add new feature
| * 9a4d8fb Fix bug in authentication
|/
* a3c8f1d Update documentation
* 7b7ae9f Initial commit
{%- endhighlight -%}

Esta abordagem é comumente usada em IDEs para mostrar o log do repositório. Além disso, você pode especificar que tipo de informação deseja ver no log. Use o parâmetro `--format` para especificar os dados que você deseja. Para fazer isso, você usará algumas combinações de caracteres para selecionar quais informações mostrar. Os mais comuns são o hash de commit abreviado (%h), o nome do autor (%an), a data (%aD) e o título do commit (%s).

{%- highlight bash -%}
git log --graph --format='%h - %an - %aD - %s'

* e6b3812 - John Doe - Tue, 15 Feb 2024 10:21:37 -0500 - Merge pull request #123 from user/feature-branch
|\
| * 87fc9d3 - Jane Smith - Mon, 14 Feb 2024 16:42:19 -0500 - Add new feature
| * 9a4d8fb - John Doe - Mon, 14 Feb 2024 12:09:48 -0500 - Fix bug in authentication
|/  
* a3c8f1d - John Doe - Sun, 13 Feb 2024 18:15:02 -0500 - Update documentation
* 7b7ae9f - Jane Smith - Sat, 12 Feb 2024 09:30:51 -0500 - Initial commit

{%- endhighlight -%}

Você pode ver todas as opções na [documentação de formatos do Git][git_pretty_format_doc].

## Conclusão
O comando Git log é uma ferramenta poderosa para navegar e entender o histórico de commits do seu projeto. Dominando suas várias opções e técnicas, você pode obter insights valiosos sobre como sua base de código evoluiu ao longo do tempo, rastrear alterações específicas e colaborar de forma mais eficaz com sua equipe. Seja filtrando commits por autor ou data, pesquisando mensagens de commit por palavras-chave ou visualizando o histórico de commit como um gráfico, o Git log oferece a flexibilidade e o controle de que você precisa para explorar a história do seu projeto com confiança. Portanto, experimente diferentes opções e desbloqueie todo o potencial do Git log no seu fluxo de trabalho de desenvolvimento. Desejo "bons logs" a vocês!

[git_pretty_format_doc]: https://git-scm.com/docs/pretty-formats
