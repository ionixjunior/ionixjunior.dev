+++
title = "Git Merge e Git Rebase: Trabalhando com Integração de Código"
date = 2024-02-23
type = "post"
slug = "git-merge-and-git-rebase-working-with-code-integration"
categories = ["TODO"]
tags = ["git"]
social_image: "git-merge-and-git-rebase-working-with-code-integration.pt.webp"
+++

<p class="intro"><span class="dropcap">E</span>stá com dificuldades para trabalhar com a integração de código no Git? Você não está sozinho. Compreender as diferenças entre 'git merge' e 'git rebase' é crucial para manter um histórico de commits limpo e otimizar seu fluxo de trabalho. Neste post, explorarei esses dois comandos essenciais, suas abordagens únicas para a integração de código e as melhores práticas para utilizá-los de forma eficaz.</p>

## Git merge: Unindo branches
Para explicar os exemplos do `git merge`, usarei o repositório [Book Tracking][book_tracking_repository]. Para esses exemplos, meu branch de destino é o "main", e meu branch de origem é o "library_screen". Você verá essas palavras em todo o post. Antes de começarmos, vamos ver o log de commits do Git para esse cenário.

{%- highlight log -%}
* 214ae0f (HEAD -> library_screen) Integrate the new screen into tab view controller
* 058a356 Add screen icon
* 38867bd Create empty state
* a282019 Load data into library screen
* d076946 Add new screen
* 9060735 (origin/main, main) Replace ifs to switch case
{%- endhighlight -%}

Recentemente, iniciei uma nova tarefa, e o branch de origem está atualizado com o branch de destino. Posso ver isso porque os commits do branch de origem estão no topo do branch de destino. Vamos começar a explorar o comando.

O `git merge` é um comando fundamental para integrar alterações de um branch em outro. Quando você executa um merge, o Git combina as alterações do branch de origem no branch de destino.

Para realizar um merge, navegue até o branch de destino e use o seguinte comando:

{%- highlight bash -%}
git merge <branch_de_origem>
{%- endhighlight -%}

Este comando preserva o histórico de commits. O `git merge` mantém os commits individuais do branch de origem, preservando o histórico de alterações. Além disso, as operações de merge são simples e intuitivas, tornando-as adequadas para a maioria dos cenários de colaboração. Se verificarmos o log agora, podemos ver que o branch de destino local está lado a lado com o branch de origem. Além disso, o hash dos commits não mudaram.

{%- highlight log -%}
* 214ae0f (HEAD -> main, library_screen) Integrate the new screen into tab view controller
* 058a356 Add screen icon
* 38867bd Create empty state
* a282019 Load data into library screen
* d076946 Add new screen
* 9060735 (origin/main) Replace ifs to switch case
{%- endhighlight -%}

Esse tipo de merge é chamado de fast-forward porque todos os commits aplicados no branch de origem irão para o branch de destino. Agora pense sobre isso: em nosso branch de origem, somos encorajados a fazer muitos commits e criar um pull request quando terminarmos nosso trabalho. Mas se tudo for integrado no branch de destino sem um checkpoint, como saber quando um pull request específico foi integrado no branch de destino? Podemos usar uma opção para mesclar os branches usando uma abordagem non-fast-forward. Vamos ver.

{%- highlight bash -%}
git merge <branch_de_origem> --no-ff
{%- endhighlight -%}

Agora, o Git solicitará uma mensagem de commit para fazer um commit de merge. Ele sugerirá automaticamente uma mensagem para você. Apenas aceite-a e vejamos o log.

{%- highlight log -%}
*   1d5bf70 (HEAD -> main) Merge branch 'library_screen'
|\  
| * 214ae0f (library_screen) Integrate the new screen into tab view controller
| * 058a356 Add screen icon
| * 38867bd Create empty state
| * a282019 Load data into library screen
| * d076946 Add new screen
|/  
* 9060735 (origin/main) Replace ifs to switch case
{%- endhighlight -%}

Note que o branch de destino local não está ao lado do branch de origem. Está no topo! O Git cria um novo commit que reflete o estado após o merge. Desta forma, é mais fácil entender quando algum trabalho foi concluído. Isso é comumente usado quando mesclamos um pull request e facilita se precisarmos revertê-lo.

## Git rebase: Reescrevendo o histórico
O `git rebase` oferece uma abordagem alternativa para integrar alterações, reescrevendo o histórico de commits do branch de origem. Em vez de criar um novo commit de merge, o rebase reaplica os commits do branch de origem na ponta do branch de destino.

Isso é mais comum quando iniciamos uma tarefa, trabalhamos nela por um tempo e precisamos atualizar nosso branch de origem com o novo trabalho que nossos colegas já mesclaram depois que nossa tarefa começou. Para esse cenário, considere o seguinte log. Veja que o branch de origem começou antes do estado atual do branch de destino.

{%- highlight bash -%}
*   40650e2 (origin/main, main) Merge branch 'settings_screen'
|\  
| * 4744194 Adjust dark mode
|/  
*   1dfd858 Merge branch 'profile_screen'
|\  
| * 12b4f3d Update font
| * 03dd145 Fix typo
|/  
| * 214ae0f (HEAD -> library_screen) Integrate the new screen into tab view controller
| * 058a356 Add screen icon
| * 38867bd Create empty state
| * a282019 Load data into library screen
| * d076946 Add new screen
|/  
* 9060735 Replace ifs to switch case
{%- endhighlight -%}

Observe que o branch de origem está dois commits de merge atrás do branch de destino. Talvez não seja um problema criar um pull request e integrar o código dessa forma. Mas se você tiver problemas para mesclá-lo, precisará atualizar seu código com as alterações mais recentes antes de fazer o merge. Uma maneira de fazer isso é usando o comando rebase. Para fazer o rebase do branch de origem no branch de destino, navegue até o branch de origem e use o seguinte comando:

{%- highlight bash -%}
git rebase <branch_de_destino>
{%- endhighlight -%}

O `git rebase` produz um histórico de commits linear incorporando alterações do branch de origem sem commits de merge adicionais. Vendo o log, o branch de origem estará no topo do branch de destino.

{%- highlight bash -%}
* 88dda8b (HEAD -> library_screen) Integrate the new screen into tab view controller
* 6e96461 Add screen icon
* 21d55c8 Create empty state
* 4b4e82d Load data into library screen
* 0a3073f Add new screen
*   40650e2 (origin/main, main) Merge branch 'settings_screen'
{%- endhighlight -%}

O rebase modifica o histórico de commits do branch de origem, potencialmente alterando a ordem cronológica dos commits e causando problemas, principalmente se o branch de origem já estiver no repositório remoto. Após o rebase, as alterações no branch de origem parecem começar após a última alteração do branch de destino. 

Esse é o rebase simples, mas você pode fazê-lo usando o modo interativo. Tenha cuidado ao realizar rebases interativos, pois eles envolvem a reescrita de mensagens de commit e podem introduzir alterações não intencionais. Vamos explorar um pouco sobre o rebase interativo para entender como o rebase funciona. Para isso, use o parâmetro `-i`.

{%- highlight bash -%}
git rebase -i <branch_de_destino>
{%- endhighlight -%}

Agora, o Git mostrará um prompt e perguntará o que fazer. Vamos verificar para entender.

{%- highlight bash -%}
pick d076946 Add new screen
pick a282019 Load data into library screen
pick 38867bd Create empty state
pick 058a356 Add screen icon
pick 214ae0f Integrate the new screen into tab view controller

# Rebase 40650e2..214ae0f onto 40650e2 (5 commands)
#
# Commands:
# p, pick <commit> = use commit
# r, reword <commit> = use commit, but edit the commit message
# e, edit <commit> = use commit, but stop for amending
# s, squash <commit> = use commit, but meld into previous commit
# f, fixup [-C | -c] <commit> = like "squash" but keep only the previous
#                    commit's log message, unless -C is used, in which case
#                    keep only this commit's message; -c is same as -C but
#                    opens the editor
# x, exec <command> = run command (the rest of the line) using shell
# b, break = stop here (continue rebase later with 'git rebase --continue')
# d, drop <commit> = remove commit
# l, label <label> = label current HEAD with a name
# t, reset <label> = reset HEAD to a label
# m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
#         create a merge commit using the original merge commit's
#         message (or the oneline, if no original merge commit was
#         specified); use -c <commit> to reword the commit message
# u, update-ref <ref> = track a placeholder for the <ref> to be updated
#                       to this position in the new commits. The <ref> is
#                       updated at the end of the rebase
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
#
# However, if you remove everything, the rebase will be aborted.
#
{%- endhighlight -%}

Que mensagem grande, né? Não se preocupe com isso. Primeiro, vamos focar no topo. O Git mostra uma lista com um comando chamado "pick", o hash do commit e a mensagem do commit. Isso significa que ele tentará executar o comando "pick" para cada commit listado nessa ordem. O comando "pick" significa "cherry-pick", e não vimos sobre ele até agora. O `git cherry-pick` aplicará o commit no branch de destino. O comando aplica um commit específico em outro branch, alterando o hash do commit, mas mantendo o autor, a mensagem e o horário.

Na parte inferior, temos uma grande mensagem comentada. Esta mensagem contém dicas para outros comandos que podemos usar como reword, edit, squash e outras opções. Esses outros comandos não são muito usados, mas sinta-se à vontade para ler as instruções do Git e experimentá-los.

Legal, mas quando usar esses comandos? Vamos falar sobre isso.

## Quando usar esses comandos
Normalmente, o `git merge` é usado para fluxos de trabalho de desenvolvimento colaborativo onde preservar o histórico de commits original é essencial. Podemos fazer isso quando criamos um pull request ou dividimos nosso trabalho em partes diferentes em nossa máquina e precisamos mesclá-lo.

O `git rebase` é usado para obter um histórico limpo. Opte por este comando para manter um histórico de commits linear e otimizar o branch que está trabalhando antes de mesclá-los na branch principal. Normalmente, é usado antes de criar um pull request para garantir que nosso trabalho esteja atualizado com o branch de destino.

No [último artigo][last_post] quando falei sobre force pushing, comentei que o rebase pode trazer problemas se você não estiver trabalhando sozinho em um branch. Por causa disso, acredito que algumas pessoas preferem a estratégia de back merge em vez do rebase. Vamos tentar a estratégia de back merge e ver os resultados. O objetivo é atualizar nosso branch de origem com alterações mais recentes para o branch de destino. Supondo que o repositório esteja completamente atualizado, vamos permanecer em nosso branch de origem e executar o back merge.

{%- highlight bash -%}
git merge <branch_de_destino>
{%- endhighlight -%}

O Git solicitará uma mensagem de commit de merge. Ele irá sugerir uma mensagem, e você pode aceitá-la. Este será um commit de merge. Vendo o log, podemos ver o seguinte resultado:

{%- highlight bash -%}
*   190f6b6 (HEAD -> library_screen) Merge branch 'main' into library_screen
|\  
| *   40650e2 (origin/main, main) Merge branch 'settings_screen'
| |\  
| | * 4744194 Adjust dark mode
| |/  
| *   1dfd858 Merge branch 'profile_screen'
| |\  
| | * 12b4f3d Update font
| | * 03dd145 Fix typo
| |/  
* | 214ae0f Integrate the new screen into tab view controller
* | 058a356 Add screen icon
* | 38867bd Create empty state
* | a282019 Load data into library screen
* | d076946 Add new screen
|/  
* 9060735 Replace ifs to switch case
{%- endhighlight -%}

O resultado é semelhante ao comando rebase, mas sem reescrever o histórico de commits. No gráfico dos commits, podemos ver todas as alterações do branch de destino sendo mescladas no branch de origem. Na minha opinião, isso causa um pouco de confusão ao analisar o histórico de commits. Fico um pouco desconfortável vendo isso, e por isso prefiro usar o rebase nesse caso.

Muitos procuram regras para seguir, mas este é um caso em que você precisa pensar na melhor ferramenta para resolver seu problema ou qual abordagem sua equipe ou você prefere. Eu prefiro o rebase para manter um histórico linear de commits, e você?

## Conclusão
Trabalhar com integração de código no Git requer uma compreensão sutil dos comandos `git merge` e `git rebase`. Escolhendo a abordagem certa para cada cenário e aderindo às melhores práticas, conseguimos gerenciar efetivamente as mudanças de código, promover a colaboração e manter um histórico de commits limpo e organizado. Experimente ambos os comandos para encontrar o fluxo de trabalho que melhor atenda às necessidades do seu projeto e aprimore suas habilidades de controle de versão hoje!

Fique atento para mais insights sobre dominar o Git e desbloquear todo o potencial do controle de versão. Até mais!

[book_tracking_repository]: https://github.com/ionixjunior/BookTracking
[last_post]:                /git-push-demystified-pushing-your-commits-with-confidence/#force-pushing