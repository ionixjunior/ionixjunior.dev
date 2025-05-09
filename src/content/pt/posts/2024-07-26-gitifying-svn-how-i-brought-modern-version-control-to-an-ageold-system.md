+++
title = "Git-ificando o SVN: Como Eu Trouxe o Controle de Versão Moderno para um Sistema Antigo"
date = 2024-07-26
type = "post"
slug = "gitifying-svn-how-i-brought-modern-version-control-to-an-ageold-system"
aliases = ["/gitifying-svn-how-i-brought-modern-version-control-to-an-ageold-system"]
translationKey = "gitifying-svn-how-i-brought-modern-version-control-to-an-ageold-system"
categories = ["TODO"]
tags = ["git"]
image = "/img/cards/gitifying-svn-how-i-brought-modern-version-control-to-an-ageold-system.pt.webp"
+++

Volte no tempo dez anos. Era 2014, os smartphones ainda estavam engatinhando e eu era um desenvolvedor otimista, ansioso para conquistar o mundo, uma linha de código de cada vez. Mas um inimigo formidável estava em meu caminho – a confiança inabalável da nossa empresa no Subversion (SVN) para controle de versão. Não me leve a mal, o SVN nos serviu bem por um tempo. Mas, à medida que nossos projetos se tornaram mais complexos e nossa equipe se expandiu, suas limitações se tornaram cada vez mais aparentes. Criar e mesclar branches eram exercícios de frustração, a colaboração parecia desajeitada e nem me fale em tentar trabalhar offline! A ferramenta que deveria agilizar nosso processo de desenvolvimento estava nos atrasando. Uma solução era necessária, mas uma migração completa para um novo sistema (o Git estava acenando) parecia um sonho distante. Então, me deparei com algo que prometia o melhor dos dois mundos... uma maneira de "Git-ificar" nosso fluxo de trabalho SVN. Deixe-me contar como o `git svn` mudou tudo. 

## A Luta com o SVN

Todo desenvolvedor conhece aquela sensação terrível quando suas ferramentas se tornam obstáculos em vez de facilitadoras. Com o SVN, essa sensação estava se tornando uma companhia constante.

O processo de criação e mesclagem de branches era um pesadelo. Cada branch parecia um ecossistema delicado, e mesclá-los de volta ao trunk era uma operação arriscada, repleta de perigos de conflitos. Horas desapareciam na resolução desses conflitos, geralmente introduzindo novos no processo. Parecia que estávamos gastando mais tempo lutando contra o sistema de controle de versão do que escrevendo código de verdade. Acredito que este tenha sido o motivo pelo qual a empresa optou por trabalhar apenas no branch "trunk" - este é o nome do branch principal no SVN. 

A colaboração não era muito melhor. A natureza centralizada do SVN significava que estávamos presos a uma conexão constante com a internet. Quer fazer commit de uma pequena alteração? Certifique-se de estar online! Trabalhando remotamente? Melhor torcer para que sua VPN esteja funcionando. Essa falta de acesso offline foi um grande fator de redução de produtividade.

E não vamos esquecer que nem existir esse tal de "code review". Era realizar o commit e acabou. Eram outros tempos. Engraçado era quando você e seu colega trabalhavam no mesmo arquivo e quem fazia commit por último sem atualizar o repositório, acabava removendo a implementação do colega que fez commit primeiro. 

O impacto dessas lutas com o SVN era inegável. Como eu estava acostumado a trabalhar com boas ferramentas, foi um pouco difícil trabalhar com SVN. Algo tinha que mudar. Uma mudança completa para o Git parecia ideal, mas migrar toda a nossa base de código e fazer com que todos concordassem parecia uma tarefa impossível para a qual não estávamos preparados.

## Descobrindo o `git svn`

Justamente quando meu desespero de desenvolvedor estava no auge, encontrei um vislumbre de esperança enquanto vasculhava a internet em busca de soluções alternativas para o SVN (como qualquer um faria quando estivesse diante de uma montanha de conflitos de mesclagem). Eis que surge o `git svn`: um comando aparentemente mágico que prometia conectar o abismo entre minha realidade SVN e os sonhos que eu tinha com o Git.

Em essência, o `git svn` atua como um tradutor entre os dois sistemas. Ele permite que você trabalhe localmente com todo o poder e flexibilidade do Git - criando branches, mesclando, fazendo commits offline – enquanto ainda interage com um repositório SVN remoto. Esse comando era simplesmente demais!

A beleza do `git svn` estava em sua simplicidade. Eu poderia continuar usando meus comandos Git familiares (`git checkout`, `git branch`, `git merge`, nossa!) sem forçar meus colegas a abandonar o SVN. Era a operação secreta perfeita para trazer um pouco de sanidade ao controle de versão moderno para nosso fluxo de trabalho, tudo isso sem chamar a atenção para uma migração completa.

As possibilidades eram emocionantes: eu poderia finalmente criar e mesclar branches com facilidade, fazer commit de alterações offline à vontade e obter a tão necessária visibilidade do histórico do nosso projeto, tudo isso sem balançar o barco do SVN. Seria essa a resposta para nossos problemas de controle de versão? Eu estava determinado a descobrir.

## Implementando a Solução

Armado com uma nova esperança e uma dose saudável de entusiasmo de desenvolvedor, mergulhei de cabeça no mundo do `git svn`. Minha primeira tarefa? Clonar nosso repositório SVN em um repositório Git local usando o comando mágico:

{%- highlight sh -%}
git svn clone --stdlayout URL_DO_REPOSITORIO_SVN  
{%- endhighlight -%}

Parecia que estava abrindo um portal para um universo paralelo - um universo onde eu poderia criar e mesclar branches sem suar a camisa. Assim que a clonagem foi concluída, fui saudado por uma visão familiar: meu próprio repositório Git, completo com todo o histórico do projeto.

Para mostrar a vocês, estou usando um repositório SVN gratuito do [RiouxSVN][free_svn_repo], criei um projeto, fiz alguns commits e o clonei. Quando digitei o comando acima, pude ver o seguinte ao visualizar o log:

{%- highlight sh -%}
* 899c967 (origin/trunk, main) Replace age by birthDate
* c6e470f Replace name by first and last name properties
* 0645868 Add User struct
* 9d3fa32 Creating initial repository structure
{%- endhighlight -%}

Observe que o branch principal do Git está sincronizado com o branch trunk do SVN. Agora, você pode imaginar que estamos no mundo Git e podemos criar novos branches, fazer merges, atualizações e assim por diante. Criei um novo branch chamado "new_feature" e fiz uma pequena implementação. Observando o log, temos o seguinte:

{%- highlight sh -%}
* 9ec48e4 (HEAD -> new_feature) Change to a computed property
* 9a03f1b Add fullName method
* 899c967 (origin/trunk, main) Replace age by birthDate
* c6e470f Replace name by first and last name properties
* 0645868 Add User struct
* 9d3fa32 Creating initial repository structure
{%- endhighlight -%}

Agora temos o branch "new_feature" à frente do trunk. Suponha que terminamos nosso desenvolvimento e precisamos mesclar. Mas primeiro, vamos fazer outra coisa: vamos fazer outro commit no repositório SVN (simulando o trabalho de um colega de equipe) e manter nosso novo branch atualizado antes de mesclar e enviar as alterações para o SVN. Como podemos fazer isso? Bem, podemos simplesmente usar o comando `fetch` para obter as atualizações mais recentes do SVN e, em seguida, mesclá-las em nosso repositório local. Vamos ver como funciona.

{%- highlight sh -%}
git svn fetch   
 
        M       User.swift
r5 = 8bfc98b61c4e4c0eaf4062d5dacdaeb634b97cc7 (refs/remotes/origin/trunk)
{%- endhighlight -%}

Observando o log, temos o seguinte:

{%- highlight sh -%}
* 8bfc98b (origin/trunk) Add id property
| * 9ec48e4 (HEAD -> new_feature) Change to a computed property
| * 9a03f1b Add fullName method
|/  
* 899c967 (main) Replace age by birthDate
* c6e470f Replace name by first and last name properties
* 0645868 Add User struct
* 9d3fa32 Creating initial repository structure
{%- endhighlight -%}

Agora vemos que o branch trunk está um commit à frente do nosso branch principal. Vamos atualizá-lo e, em seguida, fazer um rebase do nosso branch de recurso.

{%- highlight sh -%}
git checkout main
git merge origin/trunk

Updating 899c967..8bfc98b
Fast-forward
 User.swift | 1 +
 1 file changed, 1 insertion(+)
{%- endhighlight -%}

Agora, os branches trunk e main estão sincronizados.

{%- highlight sh -%}
* 8bfc98b (HEAD -> main, origin/trunk) Add id property
| * 9ec48e4 (new_feature) Change to a computed property
| * 9a03f1b Add fullName method
|/  
* 899c967 Replace age by birthDate
* c6e470f Replace name by first and last name properties
* 0645868 Add User struct
* 9d3fa32 Creating initial repository structure
{%- endhighlight -%}

Vamos voltar ao nosso branch de recurso, fazer um rebase e nos preparar para fazer o commit no SVN.

Fazer checkout para o branch "new_feature".

{%- highlight sh -%}
git checkout new_feature
{%- endhighlight -%}

Fazer o rebase.

{%- highlight sh -%}
git rebase main
{%- endhighlight -%}

Depois disso, tudo estará ok novamente e sincronizado. 

{%- highlight sh -%}
* 6e1f665 (HEAD -> new_feature) Change to a computed property
* e171831 Add fullName method
* 8bfc98b (origin/trunk, main) Add id property
* 899c967 Replace age by birthDate
* c6e470f Replace name by first and last name properties
* 0645868 Add User struct
* 9d3fa32 Creating initial repository structure
{%- endhighlight -%}

Estamos prontos para fazer nosso commit no SVN. Primeiro, vamos fazer o checkout para o branch principal.

{%- highlight sh -%}
git checkout main
{%- endhighlight -%}

Mesclar o branch de recurso usando a opção `--no-ff` (sem fast-forward). Isso criará um commit de mesclagem no branch principal, e isso será bom para o SVN porque não bagunçará com muitos commits.

{%- highlight sh -%}
git merge --no-ff new_feature
{%- endhighlight -%}

O Git solicitará uma mensagem de commit. Digite a mensagem e conclua a mesclagem. Observando o log, tudo estará ok.

{%- highlight sh -%}
*   3c13eb4 (HEAD -> main) Implement the fullName computed property
|\  
| * 6e1f665 (new_feature) Change to a computed property
| * e171831 Add fullName method
|/  
* 8bfc98b (origin/trunk) Add id property
* 899c967 Replace age by birthDate
* c6e470f Replace name by first and last name properties
* 0645868 Add User struct
* 9d3fa32 Creating initial repository structure
{%- endhighlight -%}

Agora vem a melhor parte: enviar as alterações para o SVN. Para fazer isso, basta digitar o comando `git svn dcommit` para enviar nossas alterações locais no branch principal para o branch trunk no servidor SVN.

{%- highlight sh -%}
git svn dcommit
Committing to https://svn.riouxsvn.com/ionixjunior-prj/trunk ...
        M       User.swift
Committed r6
        M       User.swift
r6 = 42e0f095ec453b6416f954958479f39842028f58 (refs/remotes/origin/trunk)
No changes between 3c13eb4501d858e7b7c225fa687b08667d97bcb4 and refs/remotes/origin/trunk
Resetting to the latest refs/remotes/origin/trunk
{%- endhighlight -%}

Observando o log, veremos os branches sincronizados.

{%- highlight sh -%}
*   42e0f09 (HEAD -> main, origin/trunk) Implement the fullName computed property
|\  
| * 6e1f665 (new_feature) Change to a computed property
| * e171831 Add fullName method
|/  
* 8bfc98b Add id property
* 899c967 Replace age by birthDate
* c6e470f Replace name by first and last name properties
* 0645868 Add User struct
* 9d3fa32 Creating initial repository structure
{%- endhighlight -%}

Funciona que é uma beleza 😎!

## O Impacto

A introdução do `git svn` não foi apenas uma mudança tecnológica; foi um sopro de ar fresco para mim. Eu passei de lutar contra nosso sistema de controle de versão para abraçá-lo como um aliado valioso em nossa busca por construir um ótimo software. Infelizmente, tentei evangelizar meus colegas de equipe para trabalhar dessa maneira, mas senti deles algum medo e perturbação. Mesmo sendo legal, era algo muito "novo", e sabemos que mudanças demoram a ser introduzidas.

A mudança mais notável foi o aumento da produtividade. Criar e mesclar branches, tarefas antes temidas, se tornaram operações rotineiras. O medo de conflitos de mesclagem diminuiu, substituído pela confiança de que os poderosos algoritmos do Git estavam me apoiando. Finalmente, eu estava livre para experimentar, iterar e colaborar com facilidade, e da maneira que eu amo: fazer commit com frequência, de cada pedaço de código, e finalmente pude usar o Git como uma ferramenta estratégica no desenvolvimento, e não apenas para versionar código.

O `git svn` foi o herói silencioso, conectando dois mundos e me capacitando a me tornar um desenvolvedor melhor, mais feliz e mais produtivo.

## Usando o `git svn` hoje

Em 2014 eu simplesmente digitava `git svn` e tudo funcionava. Mas hoje, talvez você precise instalar o `git-svn` usando o Homebrew. Basta digitar `brew install git-svn` e você terá o comando `git svn` na sua linha de comando. Mas este é um comando oficial, como você pode ver [aqui][git_svn].

## Lições Aprendidas e Conclusão

Olhando para trás, minha jornada com o `git svn` foi uma revelação. Aprendi que nem sempre precisamos de uma mudança radical para causar um impacto significativo. Às vezes, as soluções mais eficazes são aquelas que conectam os sistemas existentes às preferências individuais.

Enquanto meus colegas de equipe estavam contentes com o fluxo familiar do SVN, eu estava ansioso para explorar o poder e a flexibilidade do Git. O `git svn` se tornou minha arma secreta, permitindo que eu trabalhasse com mais eficiência e muito menos atrito, sem deixar de ser um membro colaborativo da nossa equipe centrada no SVN.

O que eu aprendi?

- A ferramenta certa pode fazer toda a diferença. Não tenha medo de explorar soluções que atendam ao seu fluxo de trabalho e preferências específicas, mesmo dentro de restrições.
- Às vezes, uma abordagem gradual é fundamental. O `git svn` forneceu um trampolim perfeito, permitindo que eu colhesse os benefícios do Git sem interromper o fluxo de trabalho estabelecido da equipe.
- Abrace a flexibilidade. O desenvolvimento é uma área diversa e o que funciona para uma pessoa pode não funcionar para outra. Respeitar diferentes ferramentas e abordagens é crucial para a harmonia da equipe.

Embora nossa equipe eventualmente tenha migrado para o Git completamente (ei, o progresso não espera por ninguém!), meu tempo com o `git svn` me ensinou lições valiosas sobre adaptabilidade, a importância de escolher as ferramentas certas para o trabalho e encontrar maneiras de prosperar, mesmo dentro das restrições de sistemas legados. E às vezes, um pouco de revolução silenciosa é tudo o que precisamos para fazer uma grande diferença em nossa própria jornada de codificação.

Seja feliz e escolha boas ferramentas para trabalhar!

[free_svn_repo]: https://riouxsvn.com
[git_svn]:       https://git-scm.com/docs/git-svn/pt_BR