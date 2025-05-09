+++
title = "Desmistificando o Git Push: Enviando Seus Commits com Confiança"
date = 2024-02-09
type = "post"
categories = ["TODO"]
tags = ["git"]
social_image: "git-push-demystified-pushing-your-commits-with-confidence.pt.webp"
+++

<p class="intro"><span class="dropcap">N</span>o Git, git push é o comando que move seus commits locais para um repositório remoto. É a ação que você faz quando quer compartilhar seu trabalho com outros ou atualizar uma base de código compartilhada. Pense nisso como uma forma de publicar suas alterações locais e manter todos com o código atualizado. Em suma, git push trata de levar seu progresso local e torná-lo visível e acessível para a equipe de desenvolvimento ou colaboradores. É um comando fundamental no Git que é crucial na codificação colaborativa. Neste post, vou mostrar este comando em ação!</p>

Imagine que você está desenvolvendo uma nova funcionalidade ou corrigindo algo, e está fazendo isso em seu branch local. Agora você terminou seu trabalho e precisa enviar suas alterações para o repositório remoto para criar um pull ou merge request, se estiver usando o GitLab. Como fazer isso? Vamos ver a maneira simples de executar o comando `git push`.

## Uso básico
Para usar o comando `git push`, pense: Fazer push para onde? Para um repositório remoto, certo? Sim, mas onde e como isso é configurado? Quando você faz um clone de um repositório, isso é configurado automaticamente, e você pode ver isso com o comando `git remote` com o parâmetro `-v`:

{%- highlight sh -%}
git remote -v

origin	git@github.com:ionixjunior/BookTracking.git (fetch)
origin	git@github.com:ionixjunior/BookTracking.git (push)
{%- endhighlight -%}

Estou usando o repositório [Book Tracking][book_tracking_repository] para os exemplos. Clonei este repositório para minha máquina e comecei a trabalhar nele. No resultado da linha de comando acima, tenho um nome remoto chamado "origin", o link do repositório e a ação que posso fazer - fetch e push. Agora tenho apenas um repositório remoto, o "origin". No Git, "origin" é um nome abreviado para o repositório remoto de onde um projeto foi clonado. Você pode alterar esse nome se preferir, mas é uma convenção, e é melhor usar o nome padrão. Supondo que eu esteja trabalhando em um branch chamado "hotfix_main_screen", vamos fazer push dessa branch para o repositório remoto.

{%- highlight sh -%}
git push origin hotfix_main_screen
{%- endhighlight -%}

Com isso, enviamos nossas alterações do branch "hotfix_main_screen" para o repositório remoto chamado "origin", e agora poderemos criar um pull request ou apenas salvar nosso trabalho no repositório remoto, por exemplo.

Se você estiver trabalhando em um longo trabalho na sua branch, talvez queira facilitar. Vamos falar sobre como rastrear branches. O nome em português fica um pouco estranho, então, vou chamar pelo termo em inglês mesmo: Tracking branches.

## Tracking branches
Esta é uma maneira de simplificar este comando. Em vez de repetir o comando inteiro sempre que quiser enviar suas alterações, você pode configurar a branch usando o parâmetro `-u` ou `--set-upstream`. Isso estabelecerá um relacionamento entre o repositório remoto e a branch em que você está trabalhando.

{%- highlight sh -%}
git push -u origin hotfix_main_screen
{%- endhighlight -%}

Isso é feito somente na primeira vez que você envia um branch. Agora, você pode simplificar isso quando continnuar trabalhando em seu branch:

{%- highlight sh -%}
git push
{%- endhighlight -%}

Se você quiser usar o comando dessa forma, precisará configurar o vínculo a cada novo branch em que trabalhar. Tudo funcionou bem até agora, mas vamos falar sobre um parâmetro perigoso, mas muito útil às vezes. Vou usar novamente o termo em inglês novamente pois acredito que a tradução ficará um pouco estranha. Estou falando do "force pushing".

## Force pushing
O "force pushing" é um parâmetro que deve ser usado com parcimônia, pois sobrescreve o histórico do branch do repositório remoto com o local. Embora possa ser uma ferramenta poderosa, também vem com riscos potenciais, especialmente quando se está trabalhando em equipe.

Suponha que você tenha criado um pull request, seus colegas o revisaram, sugeriram alterações, você aplicou a maioria delas e está preparado para enviar novamente sua branch. Infelizmente, desde que você criou o pull request, a base de código mudou muito, e isso causa um conflito no merge da sua branch. Uma solução é fazer rebase do seu branch com o branch principal, resolver o conflito e ser feliz. O rebase pegará todos os seus commits e aplicará após o último commit do branch principal. O rebase ajuda a fazer um histórico limpo de alterações do Git, mas há um problema: Todos os nossos hashes de commit mudam com essa ação, e você não pode simplesmente enviar as alterações agora. Quando você tenta enviar suas alterações, pode receber uma mensagem como esta:

{%- highlight sh -%}
git push origin hotfix_main_screen

To git@github.com:ionixjunior/BookTracking.git
 ! [rejected]        hotfix_main_screen -> hotfix_main_screen (non-fast-forward)
error: failed to push some refs to 'github.com:ionixjunior/BookTracking.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
{%- endhighlight -%}

Isso acontece porque a ação do rebase altera o hash dos commits. Você reescreve o histórico do Git em seu repositório local, e quando faz a ação de push, o repositório remoto não entende por que os hashes mudaram. Para resolver isso, você pode adicionar o parâmetro `-f` ou `--force` para enviar suas alterações e permitir que o repositório remoto aceite suas alterações locais.

{%- highlight sh -%}
git push origin hotfix_main_screen -f
{%- endhighlight -%}

O rebase não será um problema se você estiver trabalhando sozinho em uma branch. Mas tenha cuidado com isso. Acredito que por causa disso, algumas pessoas preferem a estratégia do back merge.

Muito bom! Agora, vou explicar como você enviará suas alterações para um repositório diferente do "origin" e quando isso será necessário.

## Origin e upstream
Estamos falando de outra convenção do Git. Suponha que você encontre um projeto no GitHub e queira contribuir. Seguindo as boas práticas para colaborar, o que você precisa fazer? Primeiro, você precisa fazer um fork do projeto para sua conta do GitHub, clonar seu repositório para sua máquina, fazer as alterações que está propondo ou corrigindo e, em seguida, enviar as alterações para o seu repositório, o "origin". Quando você abre o seu repositório no GitHub, você vê um botão para criar um pull request para o repositório que fez o fork. Você faz isso, seu pull request é aceito (ou não) e você deseja continuar contribuindo para o mesmo projeto. Como você pode sincronizar seu repositório com o repositório que fez o fork? A resposta está nos repositórios remotos que estão conectados.

Quando você clona seu repositório para sua máquina, o Git cria um vínculo com o repositório remoto e o chama de "origin". Com isso, você pode se comunicar com seu repositório por meio de comandos de fetch e push. Mas você pode adicionar outro repositório para obter ou enviar dados. Nesse cenário, você pode vincular no seu repositório o repositório que você fez o fork. Isso é comum em fluxos de trabalho de desenvolvimento baseados em bifurcação (fork), onde os desenvolvedores contribuem com alterações de volta ao projeto original. Vamos fazer isso. Suponha que eu tenha feito um fork do projeto Book Tracking de outro repositório e vou configurar o vínculo remoto deste repositório em minha máquina. Vou chamá-lo de "upstream" porque esta é outra convenção do Git.

{%- highlight sh -%}
git remote add upstream git@github.com:laurasmithdev/BookTracking.git
{%- endhighlight -%}

Com isso, vou verificar todos os vínculos existentes em meu repositório local.

{%- highlight sh -%}
git remote -v

origin	git@github.com:ionixjunior/BookTracking.git (fetch)
origin	git@github.com:ionixjunior/BookTracking.git (push)
upstream	git@github.com:laurasmithdev/BookTracking.git (fetch)
upstream	git@github.com:laurasmithdev/BookTracking.git (push)
{%- endhighlight -%}

Agora o Git está me dizendo que também posso fazer operações de fetch e push para o repositório "upstream". Partindo do pressuposto de que posso atualizar meu repositório (o origin) com todas as novas alterações do repositório que fiz fork (o upstream), posso fazer isso no meu repositório:

{%- highlight sh -%}
git fetch upstream
{%- endhighlight -%}

Esta é uma maneira de obter as novas alterações do repositório bifurcado para o seu. Isso não irá fazer merge das alterações em seu repositório. Isso apenas busca. Hoje, temos um botão no GitHub que você pode fazer esta ação a partir da interface do usuário, mas isso é exatamente parte da ação que o botão faz. Spoiler: Vou falar sobre o comando fetch no próximo post. Por isso, não vou adicionar mais detalhes agora.

## Git push: A chave para a colaboração
Em resumo, dominar o comando `git push` nos permite compartilhar nosso trabalho com outras pessoas e contribuir para o progresso do projeto. Ao entender sua sintaxe, opções e convenções, podemos garantir uma colaboração perfeita, manter uma base de código sincronizada e impulsionar o projeto adiante. Dê uma chance à linha de comando e venha nessa comigo. Tem coisas que são bem mais simples de realizar via linha de comando e você terá pleno controle sobre o que irá fazer.

Me conte nos comentários se você já enfrentou alguns cenários que falei neste post, ou compartilhe outra dica que você acha importante.

Fique ligado nos próximos posts. Até breve!

[book_tracking_repository]: https://github.com/ionixjunior/BookTracking
