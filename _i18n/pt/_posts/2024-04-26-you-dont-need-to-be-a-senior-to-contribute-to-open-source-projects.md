---
layout: post
title:  "Você não precisa ser sênior para contribuir para projetos open-source"
date:   2024-04-26
translations: ["en"]
tags: ["git", "opensource"]
---

<p class="intro"><span class="dropcap">Q</span>uer contribuir para projetos open-source, mas se sente intimidado(a) pela ideia? Não se preocupe! Contrariando a crença popular, você não precisa ser uma pessoa desenvolvedora sênior para fazer contribuições significativas. Na verdade, começar pode ser mais fácil do que você pensa. Neste post, compartilharei minha experiência e mostrarei como pode ser simples contribuir para projetos open-source, independentemente do seu nível de experiência. Vamos mergulhar e descobrir como você pode começar a fazer a diferença hoje!</p>

[Alguns meses atrás][carreira_transicao_post], falei sobre minha transição de carreira para me concentrar em Swift para ser um Engenheiro iOS, e um dos meus planos é começar a contribuir para projetos iOS open-source. Mas, como posso contribuir se estou aprendendo? Bem, estou aprendendo, mas tenho alguma experiência e sei como começar. Então, o principal desafio foi descobrir alguns projetos interessantes para contribuir.

## Encontrando um projeto para contribuir
Quando se trata de encontrar o projeto open-source certo para contribuir, é normal se sentir um pouco perdido no início. No entanto, com um pouco de orientação, o processo se torna muito mais simples.

Existe um site chamado [Up For Grabs][up_for_grabs]. Ele contém uma lista de projetos que têm tarefas selecionadas especificamente para novos colaboradores. Pode ser uma boa maneira de começar a procurar por um projeto, mas não encontrei algo interessante para mim. Então, decidi procurar por projetos no GitHub.

Tente explorar o GitHub e filtrar projetos com base na sua linguagem de programação preferida, como Swift para desenvolvimento iOS. Pesquisei por "iOS" e, em seguida, filtrei por linguagem "Swift" na interface do GitHub para procurar projetos que me interessassem e tivessem uma comunidade acolhedora.

Muitos projetos marcam issues (problemas) amigáveis para iniciantes como "Good First Issue" ou algo semelhante. Essas issues são perfeitas para novatos, porque geralmente estão bem documentadas e não exigem um conhecimento profundo da base de código.

Considere contribuir para um projeto conhecido com uma comunidade ativa. Esses projetos geralmente têm documentação abrangente e diretrizes de contribuição estabelecidas, o que facilita para as pessoas novatas se envolverem.

Em minha busca, encontrei o [Firefox iOS][firefox_ios] e tentei explorá-lo. Uma vez que você encontrou um projeto legal para contribuir, é hora de explorar as issues disponíveis.

## Explorando as issues disponíveis
Depois de encontrar um projeto que lhe interesse, o próximo passo é explorar as issues disponíveis. Issues são tarefas, bugs ou solicitações de recursos que precisam de atenção dos colaboradores do projeto.

Comece navegando até o repositório do projeto no GitHub e clicando na guia "Issues". Lá você encontrará uma lista de todos as issues abertas, junto com suas labels (etiquetas), descrições e comentários.

Procure nas labels por issues marcados como "Good First Issue" ou similar. Estes são especificamente marcados para novatos e geralmente são bem documentados, com instruções claras sobre como começar.

Leia cuidadosamente as descrições dos problemas e escolha um que esteja alinhado com suas habilidades, interesses e disponibilidade. Considere fatores como a complexidade da tarefa, as tecnologias envolvidas e seu nível de experiência.

Não tenha medo de fazer perguntas ou buscar esclarecimentos se não tiver certeza de algo. Mantenedores de projetos e outros colaboradores geralmente ficam felizes em ajudar novatos a começar.

O que vem a seguir? Fazer um PR (pull request)? Seja gentil e peça permissão para resolver o issue antes de começar - isso deve ser interessante e vou contar porque logo abaixo.

## Solicitando permissão
Depois de encontrar um issue que você gostaria de resolver, o próximo passo é solicitar permissão para trabalhar nele. Se o issue não estiver atribuído a ninguém, você pode voluntariar-se para resolvê-lo.

Para solicitar permissão, deixe um comentário no issue expressando seu interesse em trabalhar nele. Seja educado e conciso. Mantenedores de projetos ou outros colaboradores revisarão sua solicitação e podem atribuir o issue a você se concordarem que você é adequado para a tarefa. Não se desanime se sua solicitação não for aceita imediatamente - às vezes pode levar tempo para responderem.

Este não é um passo obrigatório, mas é bom fazer para garantir que um issue específico não seja atribuído a mais de uma pessoa, ou você trabalhe em uma tarefa que outra pessoa já está trabalhando. Lembro-me de uma vez que eu queria contribuir para o projeto Bitwarden e minha permissão foi negada porque a equipe tinha outros planos para aquele issue. Você pode ver [aqui][bitwarden_issue]. Por causa disso, acredito que é bom ser educado e solicitar permissão antes de começar a trabalhar em um issue.

Depois de atribuído o issue a você, é hora de se familiarizar com as diretrizes do projeto e começar sua contribuição. Mas deixe-me contar uma situação engraçada que aconteceu comigo: eu pedi permissão para trabalhar no issue e alguns dias depois ainda não tinha recebido resposta e outra pessoa criou um PR e eu perdi a oportunidade 😂. Comecei novamente a procurar outro issue e fiz o mesmo pedido de permissão para contribuir, mas criei um PR no mesmo dia. Eu estava determinado a não perder outra oportunidade.

Então, seja educado, mas seja proativo também e envie o PR quando terminar o trabalho, mesmo que o mantenedor do projeto não responda rápido.

## Compreendendo as diretrizes
Antes de começar a trabalhar em sua contribuição, é essencial entender as diretrizes do projeto. Todo projeto open-source tem seu próprio conjunto de diretrizes e melhores práticas para contribuir, então reserve um tempo para lê-las e entendê-las.

Comece revisando o arquivo README do projeto, o arquivo CONTRIBUTING.md ou qualquer outra documentação fornecida no repositório. Esses materiais geralmente contêm informações sobre como configurar seu ambiente de desenvolvimento, convenções de codificação, diretrizes para mensagens de commit e o processo de contribuição.

Preste atenção especial a quaisquer instruções ou requisitos específicos relacionados ao problema em que você está trabalhando. Alguns projetos podem ter diretrizes adicionais para certos tipos de contribuições ou podem exigir que você siga um fluxo de trabalho específico. Se tiver dúvidas sobre as diretrizes ou precisar de esclarecimentos, não hesite em perguntar.

Ao entender e seguir as diretrizes do projeto, você pode garantir que sua contribuição esteja alinhada com os objetivos e padrões do projeto, facilitando para os mantenedores revisarem e mesclarem suas mudanças.

## Configurando o ambiente de desenvolvimento
Depois de atribuído um issue e se familiarizar com as diretrizes do projeto, o próximo passo é configurar seu ambiente de desenvolvimento. Ter um ambiente devidamente configurado garantirá que você possa criar, testar e depurar seu código com eficácia.

Comece criando um fork do projeto. Isso copiará o repositório base para sua conta do GitHub, e você trabalhará nele. Uma vez que você cria um fork do projeto, você pode cloná-lo em sua máquina. Mas lembre-se: você precisa clonar o repositório que fez fork. Não clone o repositório base porque você não terá permissão para fazer nada dessa maneira. Isso é uma boa prática em contribuições open-source.

{%- highlight sh -%}
git clone <url-do-repositorio>
{%- endhighlight -%}

Comece seguindo as instruções fornecidas na documentação do projeto ou arquivo README para configurar o ambiente de desenvolvimento. Isso pode envolver instalar dependências, configurar ferramentas de desenvolvimento e qualquer um dos passos para garantir que você configure corretamente seu ambiente.

Se o projeto usar ferramentas ou estruturas de desenvolvimento específicas, certifique-se de instalá-las de acordo com os requisitos do projeto. Você pode precisar instalar linguagens de programação, gerenciadores de pacotes, bibliotecas ou outros componentes de software necessários para compilar e executar o projeto.

O projeto Firefox iOS foi muito fácil de configurar. Eles fornecem uma documentação clara e boa explicando quais são os comandos que preciso executar para preparar todo o ambiente e como abrir o projeto no Xcode. Senti que é um projeto bem organizado.

Depois que seu ambiente de desenvolvimento estiver configurado, você estará pronto para começar a trabalhar em sua contribuição. Abra seu editor de código favorito, crie um novo branch para suas alterações e mergulhe no código. No meu caso, usei o Xcode porque estou em um projeto iOS.

## Testando e compreendendo o problema
Antes de fazer qualquer alteração na base de código, é essencial entender completamente o problema que lhe foi atribuído e como ele afeta o projeto. Comece lendo a descrição do problema e quaisquer comentários ou discussões associados para obter insights sobre o problema e seu contexto.

O problema com o qual trabalhei estava muito bem descrito. Você pode vê-lo [aqui][problema]. A principal dificuldade para mim foi descobrir qual tela do aplicativo seria afetada com as mudanças. Coloquei alguns breakpoints na classe mencionada no issue e, após algumas tentativas, descobri qual era a tela impactada.

Ao testar e entender completamente o problema e qual é o local que você mudará, você estará melhor preparado para desenvolver uma solução eficaz que aborde o problema e esteja alinhada com os objetivos e diretrizes do projeto.

## Implementando a solução
Novamente, o problema estava muito bem descrito, e não foi difícil entender o que eu precisava fazer. Mas isso depende do projeto e da tarefa em que você trabalhará. Normalmente, problemas rotulados como "Good First Issue" são tarefas com boas descrições, e você não deve ter grandes problemas para lidar com elas.

O problema com o qual trabalhei foi muito fácil, e o autor da issue adicionou um trecho com o código que eu precisava substituir. Eles foram muito gentis e o problema foi muito fácil, mas foi um bom começo para uma pessoa que deseja contribuir para um projeto iOS.

## Testando e validando
Testar e validar são etapas cruciais no processo de contribuição para garantir que suas alterações atendam aos requisitos e padrões do projeto. Às vezes, você precisará implementar alguns testes de unidade para validar o novo comportamento. Outras vezes, você apenas precisará fazer alguns testes manuais. No problema com o qual trabalhei, foi necessário colocar as capturas de tela antes e depois das alterações no PR, e isso foi suficiente neste caso.

## Criando o pull request
Depois de implementar e testar sua solução, é hora de criar um PR para enviar suas alterações para revisão e integrá-las ao código do projeto. Comece garantindo que o branch onde você fez suas alterações esteja atualizado com as últimas alterações do branch principal do repositório base. Projetos grandes geralmente têm muitos PRs todos os dias, e é comum começar nossas soluções e novos códigos são mesclados no repositório quando estamos trabalhando em um problema. É uma boa abordagem sincronizar seu repositório com o repositório base e fazer um `rebase` de seu branch. Hoje em dia, há um botão chamado "Sync fork" no GitHub. Isso é incrível e torna esse processo muito simples, mas se você usar outro sistema ou preferir fazer isso usando a linha de comando, pode seguir este procedimento:

Primeiro, adicione o link de upstream do repositório base se ainda não o fez.

{%- highlight sh -%}
git remote add upstream <url-do-repositorio-base>
{%- endhighlight -%}

Agora, obtenha as alterações.

{%- highlight sh -%}
git fetch upstream main
{%- endhighlight -%}

Depois disso, você precisa mesclar as alterações de upstream para o seu repositório. Mude para o branch principal e faça a mesclagem.

{%- highlight sh -%}
git merge origin upstream/main
{%- endhighlight -%}

Agora, o branch principal do seu repositório está totalmente atualizado com o repositório base. Mude para o branch em que está trabalhando e faça um rebase com o branch principal.

{%- highlight javascript -%}
git rebase main
{%- endhighlight -%}

Agora você está preparado para fazer o PR. Normalmente, as etapas acima não são obrigatórias, mas são boas práticas. Se quiser entender mais sobre o `remote upstream` e o processo de `rebase`, pode dar uma olhada nos posts [Git Push][git_push_post] e [Git Rebase][git_rebase_post].

Agora é hora de criar o PR! Para fazer isso, comece enviando o branch em que está trabalhando para seu repositório remoto.

{%- highlight sh -%}
git push origin <nome-do-branch>
{%- endhighlight -%}

Não vou descrever como criar o PR para o repositório base. Em vez disso, sugiro que você leia a documentação do GitHub explicando [como criar um PR de um fork][github_create_pr_from_fork]. É uma documentação incrível.

Forneça um título e descrição claros para o PR, resumindo o propósito das alterações e fornecendo contexto adicional, como uma visão geral do problema ou recurso abordado e a abordagem adotada para implementar a solução. Se o PR abordar um issue específico, faça referência ao número do issue na descrição do PR para vincular automaticamente o PR ao issue. O repositório Firefox iOS contém algumas convenções de nomenclatura para o título de issue e referências dentro da descrição, então é importante entender as regras do projeto.

Revise suas alterações mais uma vez para garantir que tudo pareça bom e que você não tenha perdido nada. Verifique novamente se há erros potenciais ou alterações não intencionais. Quando estiver satisfeito com as alterações e a descrição do PR, envie o PR para revisão. Fique de olho no PR para comentários, feedback ou solicitações de alterações dos revisores.

Se você estiver curioso, [aqui][pr] está o PR que trabalhei.

## Conclusão
Em conclusão, contribuir para projetos open-source não é exclusivo para pessoas desenvolvedoras sênior. Com a mentalidade certa, disposição para aprender e atenção aos detalhes, qualquer pessoa pode fazer contribuições valiosas para projetos dos quais se interessam. Seguindo os passos descritos neste guia, você pode embarcar em sua jornada open-source, adquirir experiência prática e fazer um impacto positivo na comunidade de desenvolvimento. Lembre-se de que toda contribuição, por menor que seja, contribui para o crescimento e a melhoria coletiva do software open-source. Portanto, não hesite em se envolver, compartilhar suas habilidades e fazer parte da vibrante comunidade open-source.

Então, o que você está esperando? Não tenha medo. Deixe de lado os receios, a vergonha e a síndrome do impostor. Espero que este post inspire você, e adoraria ver nos comentários em qual PR você contribuiu.

Até o próximo post!

[carreira_transicao_post]:    /my-journey-in-mobile-development-from-csharp-to-swift/
[firefox_ios]:                https://github.com/mozilla-mobile/firefox-ios
[problema]:                   https://github.com/mozilla-mobile/firefox-ios/issues/19645
[up_for_grabs]:               https://up-for-grabs.net/#/
[git_push_post]:              /git-push-demystified-pushing-your-commits-with-confidence/
[git_rebase_post]:            /git-merge-and-git-rebase-working-with-code-integration/
[github_create_pr_from_fork]: https://docs.github.com/pt/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork
[pr]:                         https://github.com/mozilla-mobile/firefox-ios/pull/19765
[bitwarden_issue]:            https://github.com/bitwarden/mobile/issues/1824#issuecomment-1287978943