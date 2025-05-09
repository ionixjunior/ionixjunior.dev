+++
title = "Aumente Sua Produtividade Com Git Alias: Comece a Economizar Tempo Hoje!"
date = 2024-06-14
tags = ["git"]
social_image: "boost-your-git-productivity-with-aliases-start-saving-time-today.pt.webp"
+++

<p class="intro"><span class="dropcap">C</span>ansado de gastar tempo precioso digitando aqueles comandos longos e repetitivos do Git? Você não está sozinho. Os atalhos (alias) do Git oferecem uma solução poderosa para otimizar seu fluxo de trabalho e aumentar sua produtividade. Imagine navegar facilmente em seu repositório Git com atalhos para comandos comuns, economizando tempo e reduzindo o risco de erros. Este artigo irá apresentá-lo ao mundo dos atalhos do Git, desmistificando sua funcionalidade e demonstrando seu imenso poder. Vou lhe ajudar na criação de seus próprios atalhos personalizados, mostrando exemplos práticos para tarefas comuns do Git, como log, fetch, commit e muito mais. Ao final, você estará pronto para abraçar a eficiência e velocidade que os atalhos do Git trazem para seu processo de desenvolvimento. Prepare-se para dominar o Git e liberar o ninja do código que existe em você!</p>

## O que são os atalhos do Git?

Basicamente, são atalhos para comandos Git. Eles permitem que você defina nomes personalizados para comandos usados ​​com frequência, tornando seu fluxo de trabalho mais rápido e eficiente. Imagine que você usa com frequência o comando `git status` para verificar o estado do seu repositório. Com um atalho, você pode definir `git st` para representar `git status`, economizando teclas a cada vez que precisar verificar o status do seu repositório.

Pense nestes atalhos como macros personalizadas para usar o Git. Você as cria para mapear um nome personalizado (seu atalho) para um comando Git específico ou uma combinação de comandos. Isso significa que você pode essencialmente criar comandos personalizados adaptados aos seus fluxos de trabalho e necessidades específicas.

Isso é bom, não é? Vamos ver na prática como criar estes atalhos.

## Como criar os atalhos

Criar atalhos é muito simples. Você pode configurá-los globalmente, tornando-os disponíveis em todos os seus projetos Git, ou localmente para um repositório específico. Aqui está um guia passo a passo para começar.

O comando principal para criar atalhos é:

{%- highlight sh -%}
git config --global alias.ATALHO COMANDO
{%- endhighlight -%}

Substitua `ATALHO` pelo atalho que você deseja e `COMANDO` pelo comando Git que você irá utilizar. Vamos criar um atalho chamado "st" que representará `git status`:

{%- highlight sh -%}
git config --global alias.st status
{%- endhighlight -%}

Agora, sempre que você digitar `git st` no seu terminal, o Git executará `git status` por debaixo dos panos.

Isso foi muito simples, mas você pode criar comandos mais complexos, com muitos parâmetros. Deixe-me mostrar um exemplo sobre o comando "log". Gosto muito de ver o log no gráfico e em apenas uma linha, então criei um atalho para isso:

{%- highlight sh -%}
git config --global alias.lg "log --oneline --graph"
{%- endhighlight -%}

Este atalho definitivamente economiza bastante tempo! Se você preferir, pode alterar seu atalho manualmente editando o arquivo `~/.gitconfig`. Além disso, você pode digitar `git config --list | grep alias` para ver todos os atalhos que você já configurou em sua máquina.

## Atalhos que uso

Aqui estão meus atalhos favoritos que ajudam a otimizar meu fluxo de trabalho. Eu os organizei por funcionalidade para facilitar a visualização de como eles podem ser aplicados:

### Status e Navegação Básica

- `alias.st=status`: Este é um clássico, economizando você de digitar `git status` sempre que quiser verificar o estado atual do seu repositório.
- `alias.br=branch`: Uma maneira rápida de listar seus branches atuais ou criar novos, substituindo `git branch`.
- `alias.co=checkout`: Uma maneira simples de mudar para outro branch, substituindo `git checkout`.
- `alias.sw=switch`: Outro atalho para "checkout", fornecendo uma alternativa mais concisa.

### Committing e Amend

- `alias.ci=commit`: Abreviação de "commit", este atalho simplifica o processo de criação de um novo commit.
- `alias.cia=commit --amend`: Use isso para corrigir o último commit, adicionando alterações ou modificando a mensagem do commit.
- `alias.cian=commit --amend --no-edit`: Semelhante ao atalho "cia", mas ele descarta o editor de mensagens de commit, permitindo que você corrija rapidamente o commit sem altera na mensagem.

### Diferenciando e Comparando

- `alias.df=diff -w`: Este atalho cria um diff ignorando espaços em branco, simplificando a comparação de alterações de código.
- `alias.dfword=diff -w --word-diff`: Este atalho mostra as diferenças, palavra por palavra no diff, facilitando a identificação de alterações específicas.
- `alias.dft=!f() { GIT_EXTERNAL_DIFF=difft git diff -w --ext-diff $@; }; f`: Este atalho usa o programa "difft" (um programa instalado separadamente) para gerar o diff, tornando a saída mais concisa e informativa.
- `alias.sh=!f() { GIT_EXTERNAL_DIFF=difft git show -p --ext-diff $@; }; f`: Este atalho também usa o "difft" para gerar a saída de diff, mas usa o comando `git show`.

### Limpando o Espaço de Trabalho

- `alias.cl=clean -dfX`: Este atalho remove arquivos não rastreados e arquivos ignorados do seu espaço de trabalho, mantendo tudo organizado.

### Visualização Aprimorada do Log

- `alias.lg=log --oneline --graph`: Este atalho exibe um log conciso em forma de gráfico, facilitando a visualização do histórico de commits.
- `alias.lga=log --oneline --graph --all`: Semelhante a "lg", mas mostra todos os branches no log, fornecendo uma visão mais completa.
- `alias.lgd=log --pretty=format:'%h %ad | %s%d [%an]' --date=short`: Este atalho fornece um log de commit detalhado, incluindo o hash do commit, data, assunto e autor.

### Cherry-Picking e Fetching

- `alias.cp=cherry-pick`: Um atalho para fazer cherry-picking de commits específicos de outros branches.
- `alias.ft=fetch origin -p`: Isso busca alterações do repositório nomeado como "origin".

### Encontrando o Branch Pai

- `alias.parent=!git show-branch | grep '*' | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed 's/.*\[\(.*\)\].*/\1/' | sed 's/[\^~].*//' #`: Este atalho complexo encontra o branch pai do branch atual, o que pode ser útil ao trabalhar com branches de recursos (feature branches).

Acredite em mim: estes simples atalhos me ajudam muito diariamente a trabalhar com o Git. Deixo aqui o conteúdo do meu arquivo `~/.gitconfig` referente a configuração dos atalhos:

{%- highlight gitconfig -%}

[alias]
	st = status
	ci = commit
	br = branch
	cia = commit --amend
	cian = commit --amend --no-edit
	df = diff -w
	dfword = diff -w --word-diff
	dft = "!f() { GIT_EXTERNAL_DIFF=difft git diff -w --ext-diff $@; }; f"
	co = checkout
	sw = switch
	cl = clean -dfX
	lg = log --oneline --graph
	lga = log --oneline --graph --all
	cp = cherry-pick
	ft = fetch origin -p
	parent = "!git show-branch | grep '*' | grep -v \"$(git rev-parse --abbrev-ref HEAD)\" | head -n1 | sed 's/.*\\[\\(.*\\)\\].*/\\1/' | sed 's/[\\^~].*//' #"
	lgd = log --pretty=format:'%h %ad | %s%d [%an]' --date=short
	sh = "!f() { GIT_EXTERNAL_DIFF=difft git show -p --ext-diff $@; }; f"

{%- endhighlight -%}

## Conclusão

Dominar o Git é essencial para qualquer pessoa desenvolvedora, e os atalhos são sua arma secreta para desbloquear um fluxo de trabalho mais eficiente e agradável. Ao substituir comandos longos por atalhos simples e personalizados, você pode economizar inúmeras horas, reduzir erros e obter uma compreensão mais profunda do histórico do seu repositório.

Exploramos os conceitos básicos dos atalhos do Git e demonstramos exemplos práticos. Agora, é hora de colocar seu novo conhecimento em prática. Comece criando alguns atalhos para seus comandos mais usados ​​e experimente combinações mais complexas à medida que se sentir mais confortável.

Lembre-se, o poder dos atalhos do Git reside em sua capacidade de se adaptar às suas necessidades específicas. Abrace a flexibilidade, experimente diferentes abordagens e personalize sua experiência Git para maximizar sua produtividade.

Então, não perca mais tempo com comandos tediosos! Comece a usar os atalhos do Git hoje e experimente a praticidade de um fluxo de trabalho otimizado e eficiente que o capacita a alcançar mais. 

Aposto que depois dessa você vai querer começar a usar a linha de comando (ou não).