+++
title = "Git Stash: Gerenciando Mudanças em um Armazenamento Temporário"
date:   2024-04-19
translations: ["en"]
tags: ["git"]
social_image: "git-stash-managing-changes-in-a-temporary-storage.pt.webp"
+++

<p class="intro"><span class="dropcap">O</span> Git oferece um recurso poderoso chamado "stash" que permite as pessoas desenvolvedoras armazenar temporariamente as alterações sem comitá-las no repositório. Essa ferramenta é útil quando você precisa trocar de branch, mas não está pronto para fazer commit das suas alterações ou quando deseja armazenar um trabalho inacabado para retornar mais tarde. Neste guia, vamos mergulhar no conceito de Git stash, sua importância no gerenciamento eficaz de mudanças e como ele simplifica seu fluxo de trabalho de desenvolvimento. Vamos explorar a arte de gerenciar mudanças em um armazenamento temporário com Git stash!</p>

## Compreendendo o Git stash
O Git stash é um recurso que permite armazenar temporariamente alterações modificadas, mas ainda não comitadas, em um "stash" ou área de armazenamento temporário. Isso permite que as pessoas desenvolvedoras troquem de branches ou realizem outras operações sem comitar o trabalho incompleto no repositório. O stash efetivamente salva o estado atual do diretório de trabalho e do índice, permitindo que consigamos retornar a ele posteriormente. As entradas de stash são armazenadas em uma pilha, possibilitando a criação e o gerenciamento de vários stashes simultaneamente. Essa funcionalidade oferece flexibilidade e conveniência no gerenciamento de mudanças durante o processo de desenvolvimento. Vamos ver como funciona.

## Armazenando mudanças
Para armazenar alterações no Git, podemos usar o comando `git stash`. Este comando tira uma foto do estado atual do diretório de trabalho e do índice e a salva na pilha de stash.

{%- highlight sh -%}
git stash
{%- endhighlight -%}

Este comando cria uma nova entrada de stash com um nome e descrição padrão, indicando as alterações que foram armazenadas. Uma vez armazenado, o diretório de trabalho e o índice são revertidos para o estado do último commit, permitindo trocar de branch ou realizar outras operações sem as alterações que foram armazenadas.

Também é possível especificar um nome para o seu stash para identificá-lo facilmente na pilha usando `git stash save <nome_do_seu_stash>`.

Um leitor me disse que o comando acima está depreciado, e ele está correto! Então, ao invés de usar `git stash save`, use `git stash push` seguido do parâmetro da mensagem. Muito obrigado pelo feedback, [Christophe Colombier][christophe_colombier_profile]! Eu curti muito isso!

{%- highlight sh -%}
git stash push -m "Sua mensagem"
{%- endhighlight -%}

## Listando e aplicando stashes
Para listar todos os stashes armazenados atualmente, podemos usar o comando `git stash list`. Este comando exibe uma lista de todas as alterações armazenadas junto com seus respectivos IDs de stash e descrições. Veja como listar os stashes:

{%- highlight sh -%}
git stash list
{%- endhighlight -%}

Uma vez identificado o stash que queremos aplicar, podemos usar o comando `git stash apply` seguido do ID do stash. Alternativamente, se desejarem aplicar o stash mais recente, podem usar `git stash apply` sem especificar um ID de stash. Aqui estão os comandos para aplicar os stashes:

{%- highlight sh -%}
git stash apply <id_do_stash>
{%- endhighlight -%}

Ou, aplicar o stash mais recente:

{%- highlight sh -%}
git stash apply
{%- endhighlight -%}

Aplicar um stash reaplica as alterações armazenadas no stash para o diretório de trabalho e índice atual, permitindo continuarmos trabalhando nas alterações que foram armazenadas.

Também existe um parâmetro chamado `pop` e você pode usá-lo para aplicar o stash mais recente e removê-lo da pilha.

{%- highlight sh -%}
git stash pop
{%- endhighlight -%}

## Visualizando e gerenciando as mudanças armazenadas
É possível visualizar as alterações armazenadas em um stash sem aplicá-las usando o comando `git stash show`. Este comando exibe um resumo das alterações no stash mais recente. Para visualizar as alterações em um stash específico, podemos fornecer o ID do stash como argumento. Veja como visualizar as alterações armazenadas:

{%- highlight sh -%}
git stash show
{%- endhighlight -%}

Ou, visualizar as alterações em um stash específico:

{%- highlight sh -%}
git stash show <id_do_stash>
{%- endhighlight -%}

Além disso, podemos excluir stashes da lista de stash usando o comando `git stash drop` seguido do ID do stash. Se nenhum ID de stash for fornecido, o stash mais recente será excluído.

{%- highlight sh -%}
git stash drop
{%- endhighlight -%}

Ou, excluir um stash específico:

{%- highlight sh -%}
git stash drop <id_do_stash>
{%- endhighlight -%}

Excluir um stash remove-o da lista de stash, liberando espaço e garantindo que ele não afete mais o estado do repositório. Alternativamente, podemos limpar todas as alterações armazenadas da lista de stash usando o comando `git stash clear`. Este comando remove todos os stashes, resetando a lista de stash para um estado vazio.

{%- highlight sh -%}
git stash clear
{%- endhighlight -%}

## Quando usar o comando Git stash
O comando Git stash é incrivelmente versátil e pode ser útil em vários cenários ao longo do seu processo de desenvolvimento. Use-o quando precisar temporariamente deixar de lado alterações para se concentrar em uma tarefa diferente ou resolver um problema urgente. Por exemplo, imagine que você está trabalhando em um novo branch de recurso, mas de repente precisa corrigir um bug crítico no branch principal. Em vez de realizar commit das suas alterações incompletas ou criar um branch separado, você pode armazená-las temporariamente, alternar para o branch principal, fazer as correções necessárias e depois retornar ao branch de recurso, onde pode aplicar as alterações armazenadas e continuar de onde parou. Da mesma forma, se estiver no meio da implementação de um recurso complexo e precisar alternar rapidamente para uma tarefa diferente, armazenar suas alterações permite salvar seu progresso sem poluir seu histórico de commits. 

É importante observar que o comando Git stash não salva arquivos não rastreados, portanto, certifique-se de adicioná-los à sua área de staging antes de armazená-los se desejar incluí-los no stash.

## Gerenciando stashes localmente: considerações importantes
Os stashes do Git são locais e não podem ser enviados diretamente para repositórios remotos. Se precisar compartilhar as alterações armazenadas, você terá que aplicá-las localmente e depois comitá-las e enviá-las para o repositório remoto separadamente. Portanto, se você excluir seu repositório local, todos os seus stashes serão perdidos.

## Conclusão
O `git stash` é recurso poderoso que nos permite armazenar temporariamente modificações e alternar de contexto sem fazer commit do trabalho inacabado. Ao entender como criar, listar, aplicar e gerenciar stashes, podemos manter um diretório de trabalho limpo e simplificar seu fluxo de trabalho de desenvolvimento. Seja trabalhando em várias tarefas simultaneamente ou precisando alternar o foco rapidamente, o Git stash oferece uma solução conveniente para gerenciar mudanças de forma eficaz. Lembre-se de usá-lo com sabedoria e aproveitar suas capacidades para melhorar sua produtividade e organização.

Até o próximo post!

[christophe_colombier_profile]: https://dev.to/ccoveille