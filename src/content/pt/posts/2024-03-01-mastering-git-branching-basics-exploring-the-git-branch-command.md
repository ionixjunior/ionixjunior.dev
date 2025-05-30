+++
title = "Dominando os Conceitos Básicos de Branches do Git: Explorando o Comando git branch"
date = 2024-03-01
type = "post"
slug = "mastering-git-branching-basics-exploring-the-git-branch-command"
aliases = ["/mastering-git-branching-basics-exploring-the-git-branch-command"]
translationKey = "mastering-git-branching-basics-exploring-the-git-branch-command"
categories = ["tools"]
tags = ["git"]
image = "/img/cards/mastering-git-branching-basics-exploring-the-git-branch-command.pt.webp"
+++

Embarcar em sua jornada com o Git envolve dominar seus comandos fundamentais, e entre eles, o git branch se destaca como uma ferramenta fundamental para gerenciar branches. Neste guia, vamos mergulhar fundo no comando git branch, explorando suas várias funcionalidades, desde listar branches existentes até criá-los e excluí-los. Ao final, você estará apto a utilizar este comando com segurança, estabelecendo uma base sólida para o seu fluxo de trabalho com o Git.

## Listando branches
Para começar, podemos ver todos os branches que temos em nosso repositório local. Novamente, estou usando o repositório [Book Tracking][book_tracking_repository].

```bash
git branch

  improve_highlight_cell
  library_screen
* main
```

Atualmente, estou no branch principal, e podemos ver um asterisco nele. Este comando lista apenas os branches locais. Se necessário, você pode listar os branches remotos com o parâmetro `-r`.

```bash
git branch -r

  origin/main
```

Também é possível exibir todos os branches, tanto locais quanto remotos, usando o parâmetro `-a`.

```bash
git branch -a

  improve_highlight_cell
  library_screen
* main
  remotes/origin/main
```

Agora que você sabe como listar os branches, vamos criar um.

## Criando branches
Criar um branch é fácil. Para demonstrar, usarei o nome "a_new_branch" para criar um.

```bash
git branch a_new_branch
```

O Git não nos mostrará nada, mas podemos usar o `git branch` para listar os branches.

```bash
git branch

  a_new_branch
  improve_highlight_cell
  library_screen
* main
```

Ótimo! Mas este comando apenas cria um branch. Ele não altera o ponteiro do Git (checkout). Para isso, precisamos usar o `git switch` para mudar de branch.

```bash
git switch a_new_branch

Switched to branch 'a_new_branch'
```

Agora, se visualizarmos a lista de branches, o asterisco estará no branch que alternamos.

```bash
git branch

* a_new_branch
  improve_highlight_cell
  library_screen
  main
```

Suponha que você tenha criado o branch e queira mudar seu nome. Como fazer isso? Vamos ver.

## Alterando o nome do branch
Alterar o nome do branch pode ser feito com o parâmetro `-m`. Vou mudar o nome para "dark_mode_support".

```bash
git branch -m dark_mode_support
```

Se verificarmos a lista de branches agora, veremos o branch renomeado.

```bash
git branch

* dark_mode_support
  improve_highlight_cell
  library_screen
  main
```

Muito bom! Mas o que podemos fazer se criarmos um branch errado e precisarmos excluí-lo?

## Excluindo um branch
Para excluir um branch, precisamos fazer checkout para outro branch e executar o comando com o parâmetro `-D` para excluí-lo.

```bash
git branch -D dark_mode_support

Deleted branch dark_mode_support (was 40650e2).
```

## Dicas úteis
Para simplificar a criação e a mudança de branches, podemos usar o comando `git switch` com o parâmetro `-c`. Dessa forma, o Git criará o novo branch e imediatamente fará o checkout para ele.

```bash
git switch -c name_of_your_branch

Switched to a new branch 'name_of_your_branch'
```

Outra ótima dica é sobre a mudança de branches. Suponha que estejamos no branch principal e executemos o `git switch` para fazer checkout para outro branch. Agora queremos voltar ao branch principal novamente. Podemos digitar o `git switch` e especificar o nome do branch para o qual precisamos ir ou simplesmente digitar o parâmetro `-` para voltar ao branch anterior.

```bash
git switch -

Switched to branch 'main'
```

Isso é muito útil quando estamos fazendo essas trocas simples de branch.

## Ainda não acabamos!
Como você viu, dominar o comando `git branch` é um passo crucial para aproveitar todo o potencial das capacidades das branches do Git. Dotado desse conhecimento, você agora está apto a navegar entre branches com facilidade, estabelecendo a base para estratégias de branching mais avançadas. Em nosso próximo post, elevaremos ainda mais nosso entendimento enquanto exploramos estratégias de branching do Git, revelando as diversas abordagens que as equipes utilizam para gerenciar o desenvolvimento de projetos de forma eficaz. Fique ligado para mais uma exploração aprofundada sobre o Git!

[book_tracking_repository]: https://github.com/ionixjunior/BookTracking/