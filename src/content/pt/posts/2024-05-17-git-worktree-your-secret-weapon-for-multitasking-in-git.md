+++
title = "Git Worktree: Sua Arma Secreta para Multitarefa no Git"
date:   2024-05-17
translations: ["en"]
tags: ["git"]
social_image: "git-worktree-your-secret-weapon-for-multitasking-in-git.pt.webp"
+++

<p class="intro"><span class="dropcap">C</span>omo uma pessoa desenvolvedora, você está acostumado a lidar com múltiplas tarefas. Você pode estar corrigindo bugs em uma versão de produção enquanto desenvolve novos recursos para a próxima versão. Isso geralmente significa alternar entre diferentes branches do seu projeto, o que pode ser um processo desajeitado e demorado. Armazenar mudanças constantemente, alternar branches e esperar que sua IDE se atualize pode interromper significativamente seu fluxo de trabalho. E se houvesse uma maneira de trabalhar em vários branches simultaneamente, sem a constante mudança de contexto? Para isso, existe o git worktree: um comando poderoso, mas frequentemente negligenciado, que pode revolucionar a maneira como você realiza multitarefas no Git. Vamos vê-lo em ação neste post.</p>

Pense nisso como sua arma secreta para gerenciar vários estados de projeto sem a dor de cabeça de lidar com repositórios separados. Com o `git worktree`, você pode alternar facilmente entre branches, experimentar novos recursos e corrigir bugs urgentes - tudo dentro do mesmo projeto, sem grande complicação. Isso é estranho, certo? Não se preocupe! Vamos entender como este comando funciona.

## Entendendo o git worktree

Em sua essência, o `git worktree` permite criar várias árvores de trabalho a partir de um único repositório Git. Isso significa que você pode ter vários branches baixados simultaneamente, cada um em seu próprio diretório separado, mas todos conectados aos mesmos dados de repositório subjacentes 🤯.

Imagine assim: sua pasta principal do projeto se torna o diretório "pai", e cada `git worktree` que você cria é um diretório "filho", representando um branch diferente do seu projeto. A mágica é que cada diretório filho opera como um espaço de trabalho completamente independente. Você pode editar arquivos, fazer commits e até criar novos branches dentro de um worktree específico, sem afetar nenhum dos outros worktrees.

Isso permite, por exemplo, ter um worktree dedicado ao desenvolvimento de um novo recurso, outro focado em corrigir bugs no branch "main" e ainda outro para experimentar um recurso experimental arriscado - tudo dentro do mesmo projeto.

Para criar um novo worktree é simples:
{%- highlight sh -%}
git worktree add <caminho/para/novo/worktree> <nome-do-branch>
{%- endhighlight -%}

O `<caminho/para/novo/worktree>` é o diretório onde seu novo worktree será criado. Você pode nomeá-lo como fizer sentido para a tarefa em que está trabalhando. O `<nome-do-branch>` é o branch que você deseja baixar no novo worktree. Por exemplo, para criar um worktree chamado "BookTrackingLint" para desenvolver um novo recurso no branch "swiftlint", você executaria:

{%- highlight sh -%}
git worktree add ../BookTrackingLint swiftlint
{%- endhighlight -%}

Isso criará um novo diretório chamado "BookTrackingLint" no mesmo nível da pasta principal do seu projeto e baixará o branch "swiftlint" dentro dele. Agora você pode trabalhar neste branch de forma totalmente independente de seus outros worktrees.

Você pode listar todos os worktrees já criados com o seguinte comando:

{%- highlight sh -%}
git worktree list
{%- endhighlight -%}

Como resultado, você verá algo como isto:

{%- highlight sh -%}
/Users/ionixjunior/Projects/iOS/BookTracking      9060735 [main]
/Users/ionixjunior/Projects/iOS/BookTrackingLint  bf99013 [swiftlint] 
{%- endhighlight -%}

## Casos de uso e benefícios do git worktree

A beleza do `git worktree` reside em sua versatilidade. Ele pode ser aplicado a uma variedade de cenários, otimizando significativamente seu fluxo de trabalho de desenvolvimento. Aqui estão alguns casos de uso comuns e os benefícios que eles trazem:

### Seja um(a) "herói do hotfix"

Um bug crítico é descoberto em seu ambiente de produção, exigindo atenção imediata. Você precisa criar um branch de hotfix enquanto continua trabalhando em seu branch de recurso atual. Como lidar com isso? Use o `git worktree` para criar um novo worktree para o branch de hotfix. Isso permite que você resolva rapidamente o problema crítico sem interromper seu trabalho em andamento. Assim que o hotfix for concluído e mesclado, você pode simplesmente excluir o worktree dedicado.

### Desenvolvendo novas features sem preocupação

Você está trabalhando em vários recursos em paralelo, cada um exigindo seu próprio ambiente isolado. Mudar constantemente de branch e armazenar alterações está se tornando um pesadelo. Como lidar com isso? Crie um worktree separado para cada branch de recurso. Isso permite que você alterne facilmente entre os recursos, trabalhe neles de forma independente e acompanhe facilmente seu progresso sem interromper outros branches.

### Testes facilitados

Você precisa testar um branch de recurso específico em um ambiente dedicado sem afetar seu espaço de trabalho de desenvolvimento principal. O que fazer? Use o `git worktree` para criar um worktree dedicado para fins de teste. Você pode então configurar este ambiente especificamente para teste e descartá-lo facilmente após a conclusão do teste. 

### Benefícios de usar o git worktree

Com este comando, você pode reduzir a mudança de contexto. Chega de realizar diversos stashes e alternar entre diferentes branches, economizando tempo e energia mental. Além disso, você pode aprimorar a organização, mantendo seu projeto organizado separando diferentes tarefas de desenvolvimento em worktrees dedicados. Outra coisa boa é que ele pode melhorar o foco, pois se você trabalhar em recursos específicos ou bugs isoladamente, pode minimizar as distrações e melhorar a concentração. Além disso, o comando pode fornecer testes e experimentação mais rápidos, pois você pode criar facilmente worktrees dedicados para testar novos recursos ou experimentar diferentes abordagens.

Para IDEs que possuem suporte a multiplas janelas, você pode utilizar uma instância para abrir um worktree e outra instância para abrir outro. Isso pode ser útil em alguns cenários.

Outro ponto que vale ressaltar é que existem projetos onde o setup é um pouco demorado. O tempo de compilação é grande, a análise dos arquivos é lenta e isso tudo precisa ser realizado quando alteramos o branch. Isso pode impactar em perda de desempenho em nosso trabalho, e o `git worktree` pode ajudar com isso.

## Gerenciando seu worktree

Você criou alguns worktrees, certo? Mas como podemos excluí-los? Talvez apenas excluindo a nova pasta? Sim, você pode fazer isso, mas deixará alguns rastros em seu repositório. Para remover corretamente um worktree, você usa a opção `remove` seguida pelo diretório do worktree. Usarei o mesmo exemplo do repositório BookTracking que criei anteriormente. 

{%- highlight sh -%}
git worktree remove ../BookTrackingLint
{%- endhighlight -%}

Agora, se executarmos o comando list, o worktree não estará mais lá.

{%- highlight sh -%}
git worktree list
/Users/ionixjunior/Projects/iOS/BookTracking  9060735 [main]
{%- endhighlight -%}

Mas, como eu disse, você pode excluir a pasta, mas vamos ver o que acontece. Criei o mesmo worktree novamente, excluí a pasta do worktree e executei o comando list:

{%- highlight sh -%}
git worktree list
/Users/ionixjunior/Projects/iOS/BookTracking      9060735 [main]
/Users/ionixjunior/Projects/iOS/BookTrackingLint  bf99013 [swiftlint] prunable
{%- endhighlight -%}

Agora você pode ver a palavra "prunable" na pasta que excluí manualmente. Isso significa que o Git não encontra esse worktree, mas o relacionamento ainda existe no repositório. Podemos limpar isso usando o comando "prune":

{%- highlight sh -%}
git worktree prune
{%- endhighlight -%}

Agora, quando executarmos o comando list, tudo estará ok.

{%- highlight sh -%}
git worktree list
/Users/ionixjunior/Projects/iOS/BookTracking  9060735 [main]
{%- endhighlight -%}

## Conclusão

O comando `git worktree` é um divisor de águas para qualquer pessoa desenvolvedora que busca aumentar sua produtividade e otimizar seu fluxo de trabalho. Ele o libera das limitações de mudar constantemente de branch e lidar com repositórios separados, permitindo que você realize multitarefas sem esforço em seus projetos Git. Esteja você lidando com hotfixes urgentes, desenvolvendo vários recursos em paralelo ou configurando ambientes de teste dedicados, o `git worktree` fornece uma solução poderosa e flexível. 

Reserve um tempo para explorar o comando, experimentar seus recursos e descobrir como ele pode revolucionar sua abordagem de multitarefas no Git. A sua versão do futuro, que será mais eficiente, agradecerá por isso.

Até o próximo post!