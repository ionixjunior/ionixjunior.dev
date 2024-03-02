---
layout: post
title:  "Estratégias de Branch do Git: Um Guia Abrangente"
date:   2024-03-08
translations: ["en"]
tags: ["git"]
---

<p class="intro"><span class="dropcap">B</span>em-vindo ao nosso guia abrangente sobre estratégias de branch do Git! Se você já se sentiu sobrecarregado pela variedade de estratégias de branch disponíveis no Git, você não está sozinho. Com tantas estratégias para escolher, que vão desde abordagens simples de um único branch até modelos mais complexos como o Git Flow, é essencial entender os benefícios e as compensações de cada uma. Vamos mergulhar e desvendar as complexidades das estratégias de branch do Git juntos!</p>

Talvez você esteja se perguntando qual a relação entre estratégias de branch do Git e a série de domínio dos comandos do Git. Bem, acredito que este é um tópico importante, porque isso faz parte do dia a dia de uma pessoa desenvolvedora. No [último post][last_post] eu mostrei como gerenciar branches no Git, e agora vamos explorar mais sobre isso. Neste guia, vamos explorar várias estratégias de branch do Git, discutindo seus princípios, casos de uso e melhores práticas. Seja você uma pessoa desenvolvedora solo trabalhando em um projeto pessoal ou parte de uma grande equipe colaborando em um software complexo, há uma estratégia de branch que é adequada para você. Ao final deste guia, você terá uma compreensão clara das diferentes abordagens de branch e estará equipado(a) para escolher aquela que melhor se adapta às necessidades do seu projeto.

## O que é uma estratégia de branch?
Antes de mergulhar em estratégias de branch específicas, é essencial entender o conceito fundamental da branch em si. No Git, uma branch é essencialmente um ponteiro para um commit específico no histórico do seu projeto. As branches permitem que os desenvolvedores trabalhem em recursos separados, correções de bugs ou experimentos sem afetar a base de código principal.

No Git, geralmente nomeamos a branch padrão como "main" ou "master" para representar a versão estável do projeto. Quando você cria uma nova branch, você está essencialmente criando uma nova linha do tempo de commits que diverge do branch principal. Isso permite que você faça alterações independentemente da base de código principal, teste novos recursos e colabore com outros sem interromper a versão estável do projeto.

A branch é um recurso poderoso do Git que nos permite trabalhar de forma eficiente em equipes, experimentar novas ideias e gerenciar projetos de software complexos com facilidade. Ao entender o básico das branches, podemos aproveitar as capacidades de branch do Git para organizar nosso fluxo de trabalho de forma eficaz e colaborar perfeitamente com os colegas. Agora que você já sabe o que é uma estratégia de branch, vamos nos aprofundar.

## Trunk-based development (TBD) and Single branch strategy

Essas abordagens são semelhantes e envolvem trabalhar diretamente na branch principal para todas as atividades de desenvolvimento, incluindo novos recursos e correções de bugs. Essa simplicidade as torna adequadas para projetos menores ou desenvolvedores solos. No entanto, com equipes maiores ou projetos complexos, gerenciar o desenvolvimento paralelo e manter a estabilidade do código pode ser desafiador.

Embora ambas as estratégias envolvam trabalhar na branch principal, algumas implementações da estratégia de um branch único podem envolver branches temporários de curta duração para tarefas específicas, mas, no final, todas as alterações são mescladas na branch principal.

É importante enfatizar a importância de práticas cuidadosas de desenvolvimento, como commits pequenos e frequentes, revisões de código e testes automatizados para mitigar os riscos associados ao trabalho direto no branch principal nessas abordagens.

## Git flow
O estratégia do Git flow compreende várias branches principais e branches de suporte que facilitam o desenvolvimento paralelo, o gerenciamento de lançamentos e a correção de bugs.

As branches principais consistem na branch "main", representando a versão estável e pronta para produção do código, e na branch "develop", servindo como a branch de integração principal para atividades de desenvolvimento contínuas.

As branches de suporte incluem branches de feature, branches de release e branches de hotfix. As branches de feature são criados a partir da branch develop para isolar o trabalho em novos recursos ou alterações. Eles permitem que as pessoas desenvolvedoras trabalhem independentemente em tarefas específicas sem afetar a base de código principal. Uma vez que um recurso estiver completo, ele é mesclado de volta para a branch develop por meio de um pull request.

As branches de release são criadas a partir da branch develop quando nos preparamos para um novo lançamento de versão. Eles permitem testes finais, correções de bugs e mudanças de última hora antes do deployment. Uma vez que o lançamento estiver pronto, as alterações são mescladas nas branches main e develop.

As branches de hotfix são branches de emergência criadas a partir da branch main para resolver problemas críticos ou bugs encontrados no ambiente de produção. Elas facilitam correções rápidas sem interromper o desenvolvimento em andamento. Uma vez que as correções são verificadas, elas são mescladas nas branches main e develop.

A estratégia do Git flow fornece uma abordagem estruturada para branch e gerenciamento de lançamentos, garantindo estabilidade, confiabilidade e organização ao longo do ciclo de vida de desenvolvimento. No entanto, pode ser complexo e pesado para equipes menores ou projetos com fluxos de trabalho mais simples. Além disso, a adesão estrita ao modelo pode levar a ciclos de lançamento mais longos e possíveis conflitos ou problemas de mesclagem, especialmente em equipes maiores com esforços de desenvolvimento paralelo frequentes.

<figure>
	<img src="/assets/img/git-flow.png" alt="A imagem mostra o diagrama do Git flow. Ele ilustra como diferentes tipos de branches, como feature, hotfix e release, são criadas e mescladas para desenvolver, testar e lançar software de forma eficiente. As setas no diagrama indicam o fluxo do código entre as diferentes branches."> 
	<figcaption>Git flow</figcaption>
</figure>

Esta é uma imagem conhecida originalmente publicada por [Vincent Driessen][vincent_driessen_twitter] em seu post no blog em 2010. Ele criou o conceito de Git flow e seu post pode ser visto [aqui][git_flow_post]. Uma coisa interessante é que Vincent criou um utilitário via linha de comando para facilitar o uso do Git flow. Sugiro você ler sobre isso para saber mais sobre a abordagem de Vincent.

## GitHub flow
A estratégia do GitHub flow é uma abordagem simplificada para controle de versão e integração de código, enfatizando práticas de integração e implantação contínuas. No GitHub flow, os desenvolvedores criam branches de recursos a partir da branch principal para cada novo recurso ou correção, fazem commits pequenos e atômicos em seus branches de recursos e abrem pull requests (PR) para mesclar suas alterações de volta para a branch principal. As alterações de código são revisadas, discutidas e aprovadas por meio do processo de PR antes de serem mescladas na branch principal. Uma vez mescladas, as alterações acionam testes e implantações automatizados, levando a um feedback e iteração rápidos. O GitHub flow difere do Git flow em sua simplicidade, foco na implantação contínua e flexibilidade. Embora o GitHub flow não tenha um processo de lançamento formal, ele promove a integração contínua, a colaboração e a iteração rápida, tornando-o adequado para fluxos de trabalho modernos de desenvolvimento de software.

<figure>
	<img src="/assets/img/github-flow.webp" alt="A imagem mostra o diagrama do GitHub flow. Ele usa apenas duas branches: main e feature. As features possuem o desenvolvimento de novas funcionalidades. Com elas criamos o pull request, é realizado discussão e sugestões de melhoria com o time e, por fim, a branch é mesclada de volta para a main."> 
	<figcaption>GitHub flow</figcaption>
</figure>

## GitLab flow
O GitLab flow oferece uma abordagem direta para colaboração, mesclando recursos e correções diretamente na branch principal. Ele combina desenvolvimento orientado a recursos com rastreamento de problemas, permitindo que as equipes otimizem seu fluxo de trabalho. Com o GitLab flow, há um foco na simplicidade e eficiência, com diretrizes claras para lidar com branches de produção e estáveis. É tudo sobre garantir um processo tranquilo para as equipes trabalharem juntas e entregarem recursos de forma eficaz.

O Git flow começa com uma branch "develop" como padrão, enquanto o GitLab flow começa com a branch "main". O GitLab flow inclui uma branch pré-produção para correções de bugs antes de mesclar as alterações na "main" para produção. As equipes podem ter várias branches pré-produção, como teste, aceitação e produção.

No GitLab flow, as equipes usam branches de recursos ao lado de uma branch de produção separada. Quando a "main" está pronta, ela é mesclada na branch de produção para lançamento. O GitLab flow geralmente envolve branches de lançamento e equipes que precisam publicar diferentes versões do software ao mesmo tempo, permitindo manutenção e correções de bugs separadas.

Isso pode nos fornecer melhores maneiras de organizar o fluxo de trabalho de entrega. Eu o encorajo a ler a [documentação completa sobre o GitLab flow][gitlab_flow_post] e suas [melhores práticas][gitlab_flow_best_practices]. Para tentar explicar como podemos usar o GitLab flow, vou mostrar algumas imagens antigas que encontrei na internet e explicá-las. Não se preocupe com isso. As imagens são antigas, mas o significado continua relevante. Como o GitLab flow é muito versátil, podemos adaptá-lo ao melhor uso. Vamos falar sobre diferentes formas de entregar software e explorar como podemos adaptar o GitLab flow.

### Sistema de ambiente único
Esta abordagem é adequada para projetos com um único ambiente, como aplicativos em pequena escala ou projetos pessoais. Segue uma versão simplificada do GitLab flow, onde todo o desenvolvimento, teste e implantação ocorrem dentro de um único ambiente, normalmente a branch principal. As alterações são integradas e testadas continuamente na branch principal, com lançamentos acionados automaticamente com base em critérios predefinidos, como testes aprovados ou aprovação manual. Todo o trabalho é integrado na branch principal e os membros da equipe precisam decidir quando é seguro entregar o software fazendo uma mesclagem para uma branch de produção.

<figure>
	<img src="/assets/img/gitlab-flow-single-environment-system.png" alt="A imagem mostra o diagrama do GitLab flow para sistema de ambiente único. Ele usa apenas duas branches: main e production. Todo o desenvolvimento é realizado na main e a pessoa desenvolvedora escolhe quando mesclar as alterações para a branch de produção."> 
	<figcaption>GitLab flow para um sistema de ambiente único</figcaption>
</figure>

### Sistema de ambiente múltiplo
O GitLab flow de ambiente múltiplo estende o modelo básico de fluxo do GitLab para suportar vários ambientes, como desenvolvimento, staging e produção. Isso pode ser personalizado conforme necessário. Cada ambiente corresponde a uma branch separada (por exemplo, desenvolvimento, staging, produção), com alterações fluindo por uma série de estágios de promoção antes de chegar à produção. Os desenvolvedores trabalham em branches de recursos, que são mescladas na branch de desenvolvimento para testes de integração. Uma vez validadas, as alterações são promovidas para a branch de staging para testes de aceitação do usuário antes de serem finalmente implantadas na branch de produção para lançamento.

<figure>
	<img src="/assets/img/gitlab-flow-multi-environment-system.png" alt="A imagem mostra o diagrama do GitLab flow para sistema de ambiente múltiplo. Ele usa três branches: main, pré-production e production, mas poderia usar outras branches, caso necessário. Todo o desenvolvimento é realizado na main e a pessoa desenvolvedora escolhe quando mesclar as alterações para os demais ambientes de staing e produção."> 
	<figcaption>GitLab flow para um sistema de ambiente múltiplo</figcaption>
</figure>

### Sistema de múltiplas versões
O GitLab flow de sistema de múltiplas versões foi projetado para projetos com várias versões ou fluxos de lançamento ativos em execução simultânea. Isso permite que as equipes gerenciem o desenvolvimento de recursos, correções de bugs e lançamentos em várias branches que representam diferentes versões do software. Os desenvolvedores trabalham em branches de recursos direcionados para branches de versão específicos (por exemplo, v1.x, v2.x), garantindo que as alterações sejam isoladas e aplicadas ao fluxo de lançamento apropriado. Pipelines de integração e entrega contínuas são configurados para compilar, testar e implantar cada versão independentemente, permitindo que as equipes suportem várias implantações de clientes ou variantes de produtos simultaneamente.

<figure>
	<img src="/assets/img/gitlab-flow-multi-version-system.png" alt="A imagem mostra o diagrama do GitLab flow para sistema de múltiplas versões. Ele possui a branch main e pode possuir diversas branches, uma para cada versão."> 
	<figcaption>GitLab flow para um sistema de múltiplas versões</figcaption>
</figure>

## Qual é o melhor fluxo?
Desculpe dizer isso, mas não há bala de prata, e você precisa pensar qual é a melhor abordagem para o seu projeto, equipe ou empresa. Cada fluxo tem seus prós e contras e foi adaptado a um cenário específico. Como você pode ver na tabela abaixo, não há o melhor fluxo. A escolha certa depende da escala do seu projeto, do tamanho da equipe e do ritmo desejado de lançamento de versões. Se a simplicidade for primordial, considere o GitHub flow ou o TBD. Para gerenciamento de lançamentos mais estruturados ou vários ambientes, invista no Git flow ou o GitLab flow.

| Característica | TBD/Single branch strategy | Git flow | GitHub flow | GitLab flow |
|---|---|---|---|---|
| **Uso da branch principal** | Todo desenvolvimento, código estável | Código estável | Código estável | Código estável |
| **Outras branchs** | Branches de recursos de curta duração (opcional) | Desenvolvimento, Recurso, Lançamento, Hotfix | Recurso  | Recurso, Ambiente (por exemplo, staging, produção), Lançamento (opcional)  |
| **Gerenciamento de lançamento** | Implantação contínua a partir da branch principal | Lançamentos formais a partir da branch de lançamento |  Implantação contínua a partir da branch principal | Branches de lançamento facilitam os lançamentos |
| **Estratégia de mesclagem** | Mesclagens frequentes e pequenas | Mesclagens maiores e menos frequentes | Mesclagens frequentes e pequenas | Varia com base no fluxo de trabalho (pode ser frequente ou maior) |
| **Foco** | Simplicidade, desenvolvimento rápido | Gerenciamento de lançamento estruturado | Integração e implantação contínuas | Fluxos de trabalho flexíveis, gerenciamento de lançamento |
| **Complexidade** | Baixa | Alta | Moderada | Moderada a Alta |
| **Mais adequado para** | Projetos pequenos, desenvolvedores solos | Projetos grandes, complexos, com ciclos de lançamento estritos | Projetos que priorizam simplicidade, implantação rápida | Projetos com vários ambientes, necessidades de gerenciamento de lançamento |

E você? O que você pensa sobre isso? Quais desses fluxos você já usou? Conte-me nos comentários. Vamos conversar sobre isso. Até o próximo post!

[book_tracking_repository]:   https://github.com/ionixjunior/BookTracking
[vincent_driessen_twitter]:   https://twitter.com/nvie
[git_flow_post]:              https://nvie.com/posts/a-successful-git-branching-model/
[last_post]:                  /mastering-git-branching-basics-exploring-the-git-branch-command
[gitlab_flow_post]:           https://about.gitlab.com/topics/version-control/what-is-gitlab-flow/
[gitlab_flow_best_practices]: https://about.gitlab.com/topics/version-control/what-are-gitlab-flow-best-practices/