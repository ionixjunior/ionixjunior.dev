---
layout: post
title:  "Estratégias de Branch do Git: Um Guia Abrangente"
date:   2024-02-18
translations: ["en"]
tags: ["git"]
---

<p class="intro"><span class="dropcap">B</span>em-vindo ao nosso guia abrangente sobre estratégias de ramificação no Git! Se você já se sentiu sobrecarregado pela variedade de opções de ramificação disponíveis no Git, você não está sozinho. Com tantas estratégias para escolher, que vão desde abordagens simples de um único ramo até modelos mais complexos como o Git Flow, é essencial entender os benefícios e as compensações de cada uma. Vamos mergulhar e desvendar as complexidades da ramificação no Git juntos!</p>

Talvez você esteja se perguntando qual a relação entre estratégias de ramificação no Git e a série de domínio dos comandos do Git. Bem, acredito que este é um tópico importante, porque isso faz parte do dia a dia de um desenvolvedor de software. No [último post][last_post] eu mostrei como gerenciar ramos no Git, e agora vamos explorar mais sobre isso. Neste guia, vamos explorar várias estratégias de ramificação no Git, discutindo seus princípios, casos de uso e melhores práticas. Seja você um desenvolvedor solo trabalhando em um projeto pessoal ou parte de uma grande equipe colaborando em um aplicativo de software complexo, há uma estratégia de ramificação que é adequada para você. Ao final deste guia, você terá uma compreensão clara das diferentes abordagens de ramificação e estará equipado para escolher aquela que melhor se adapta às necessidades do seu projeto.

## O que é uma estratégia de ramificação?
Antes de mergulhar em estratégias de ramificação específicas, é essencial entender o conceito fundamental de ramificação em si. No Git, um ramo é essencialmente um ponteiro para um commit específico no histórico do seu projeto. Os ramos permitem que os desenvolvedores trabalhem em recursos separados, correções de bugs ou experimentos sem afetar a base de código principal.

No Git, os desenvolvedores geralmente nomeiam o ramo padrão como "main" ou "master" para representar a versão estável do projeto. Quando você cria um novo ramo, você está essencialmente criando uma nova linha do tempo de commits que diverge do ramo principal. Isso permite que você faça alterações independentemente da base de código principal, teste novos recursos e colabore com outros sem interromper a versão estável do projeto.

A ramificação é um recurso poderoso do Git que permite que os desenvolvedores trabalhem de forma eficiente em equipes, experimentem novas ideias e gerenciem projetos de software complexos com facilidade. Ao entender o básico da ramificação, os desenvolvedores podem aproveitar as capacidades de ramificação do Git para organizar seu fluxo de trabalho de forma eficaz e colaborar perfeitamente com os outros. Agora que você já sabe o que é uma estratégia de ramificação. Vamos aprofundar em algumas opções.

## Desenvolvimento baseado no tronco (TBD) e Estratégia de um único ramo:

Essas abordagens são semelhantes e envolvem trabalhar diretamente no ramo principal para todas as atividades de desenvolvimento, incluindo novos recursos e correções de bugs. Essa simplicidade as torna adequadas para projetos menores ou desenvolvedores solos. No entanto, com equipes maiores ou projetos complexos, gerenciar o desenvolvimento paralelo e manter a estabilidade do código pode ser desafiador.

Embora ambas as estratégias envolvam trabalhar no ramo principal, algumas implementações da estratégia de um único ramo podem envolver ramos temporários de curta duração para tarefas específicas, mas, em última análise, todas as alterações são mescladas no ramo principal.

É importante enfatizar a importância de práticas cuidadosas de desenvolvimento, como commits pequenos e frequentes, revisões de código e testes automatizados para mitigar os riscos associados ao trabalho direto no ramo principal nessas abordagens.

## Git flow
O modelo de ramificação Git Flow compreende vários ramos principais e ramos de suporte que facilitam o desenvolvimento paralelo, o gerenciamento de lançamentos e a correção de bugs.

Os ramos principais consistem no ramo principal, representando a versão estável e pronta para produção do código, e no ramo develop, servindo como o ramo de integração principal para atividades de desenvolvimento contínuas.

Os ramos de suporte incluem ramos de feature, ramos de release e ramos de hotfix. Os ramos de feature são criados a partir do ramo develop para isolar o trabalho em novos recursos ou alterações. Eles permitem que os desenvolvedores trabalhem independentemente em tarefas específicas sem afetar a base de código principal. Uma vez que um recurso estiver completo, ele é mesclado de volta para o ramo develop por meio de uma solicitação pull.

Os ramos de release são criados a partir do ramo develop quando se prepara para uma nova versão de lançamento. Eles permitem testes finais, correções de bugs e mudanças de última hora antes do deployment. Uma vez que o lançamento estiver pronto, as alterações são mescladas nos ramos principal e develop.

Os ramos de hotfix são ramos de emergência criados a partir do ramo principal para resolver problemas críticos ou bugs encontrados no ambiente de produção. Eles facilitam correções rápidas sem interromper o desenvolvimento em andamento. Uma vez que as correções são verificadas, elas são mescladas nos ramos principal e develop.

O modelo Git Flow fornece uma abordagem estruturada para ramificação e gerenciamento de lançamentos, garantindo estabilidade, confiabilidade e organização ao longo do ciclo de vida de desenvolvimento. No entanto, pode ser complexo e pesado para equipes menores ou projetos com fluxos de trabalho mais simples. Além disso, a adesão estrita ao modelo pode levar a ciclos de lançamento mais longos e possíveis conflitos ou problemas de mesclagem, especialmente em equipes maiores com esforços de desenvolvimento paralelo frequentes.

<figure>
	<img src="/assets/img/git-flow.png" alt="O Git flow"> 
	<figcaption>O Git flow</figcaption>
</figure>

Esta é uma imagem conhecida originalmente publicada por [Vincent Driessen][vincent_driessen_twitter] em seu post no blog em 2010. Ele criou o conceito de Git flow e seus pensamentos podem ser vistos [aqui][git_flow_post]. Uma coisa interessante é que Vincent criou um comando de linha de comando para facilitar o uso do Git flow. Eu o encorajo a ler sobre isso para saber mais sobre a abordagem de Vincent.

## Fluxo do GitHub
O modelo de ramificação GitHub Flow é uma abordagem simplificada para controle de versão e integração de código, enfatizando práticas de integração e implantação contínuas. No fluxo do GitHub, os desenvolvedores criam ramos de recursos a partir do ramo principal para cada novo recurso ou correção, fazem commits pequenos e atômicos em seus ramos de recursos e abrem solicitações de pull (PRs) para mesclar suas alterações de volta para o ramo principal. As alterações de código são revisadas, discutidas e aprovadas por meio do processo de solicitação de pull antes de serem mescladas no ramo principal. Uma vez mescladas, as alterações acionam testes e implantações automatizados, levando a um feedback e iteração rápidos. O GitHub flow difere do Git flow em sua simplicidade, foco na implantação contínua e flexibilidade. Embora o fluxo do GitHub não tenha um processo de lançamento formal, ele promove a integração contínua, a colaboração e a iteração rápida, tornando-o adequado para fluxos de trabalho modernos de desenvolvimento de software.

<figure>
	<img src="/assets/img/github-flow.webp" alt="O diagrama mostra o ramo principal, um novo ramo chamado feature e a jornada que o recurso faz antes de ser mesclado no principal."> 
	<figcaption>O fluxo do GitHub</figcaption>
</figure>

## Fluxo do GitLab
O GitLab flow oferece uma abordagem direta para colaboração, mesclando recursos e correções diretamente no ramo principal. Ele combina desenvolvimento orientado a recursos com rastreamento de problemas, permitindo que as equipes otimizem seu fluxo de trabalho. Com o GitLab flow, há um foco na simplicidade e eficiência, com diretrizes claras para lidar com ramos de produção e estáveis. É tudo sobre garantir um processo tranquilo para as equipes trabalharem juntas e entregarem recursos de forma eficaz.

O Git flow começa com um ramo "develop" como padrão, enquanto o GitLab flow começa com o ramo "main". O GitLab flow inclui um ramo pré-produção para correções de bugs antes de mesclar as alterações no "main" para produção. As equipes podem ter vários ramos pré-produção, como teste, aceitação e produção.

No GitLab flow, as equipes usam ramos de recursos ao lado de um ramo de produção separado. Quando o "main" está pronto, ele é mesclado no ramo de produção para lançamento. O GitLab flow geralmente envolve ramos de lançamento e equipes que precisam publicar diferentes versões do software ao mesmo tempo, permitindo manutenção e correções de bugs separadas.

Isso pode nos fornecer melhores maneiras de organizar o fluxo de trabalho de entrega. Eu o encorajo a ler a [documentação completa sobre o GitLab flow][gitlab_flow_post] e suas [melhores práticas][gitlab_flow_best_practices]. Para tentar explicar como podemos usar o GitLab flow, vou mostrar algumas imagens antigas que encontrei na internet e explicá-las. Não se preocupe com isso. As imagens são antigas, mas o significado continua relevante. Porque o GitLab flow é muito versátil, podemos adaptá-lo ao melhor uso. Vamos falar sobre diferentes formas de entregar software e explorar como podemos adaptar o GitLab flow.

### Sistema de ambiente único
Esta abordagem é adequada para projetos com um único ambiente, como aplicativos em pequena escala ou projetos pessoais. Segue uma versão simplificada do GitLab flow, onde todo o desenvolvimento, teste e implantação ocorrem dentro de um único ambiente, normalmente o ramo principal. As alterações são integradas e testadas continuamente no ramo principal, com lançamentos acionados automaticamente com base em critérios predefinidos, como testes aprovados ou aprovação manual. Todo o trabalho é integrado ao ramo principal e os membros da equipe precisam decidir quando é seguro entregar o software fazendo uma mesclagem para um ramo de produção.

<figure>
	<img src="/assets/img/gitlab-flow-single-environment-system.png" alt=""> 
	<figcaption>O GitLab flow para um sistema de ambiente único</figcaption>
</figure>

### Sistema de ambiente múltiplo
O GitLab flow de ambiente múltiplo estende o modelo básico de fluxo do GitLab para suportar vários ambientes, como desenvolvimento, staging e produção. Isso pode ser personalizado conforme necessário. Cada ambiente corresponde a um ramo separado (por exemplo, desenvolvimento, staging, produção), com alterações fluindo por uma série de estágios de promoção antes de chegar à produção. Os desenvolvedores trabalham em ramos de recursos, que são mesclados no ramo de desenvolvimento para testes de integração. Uma vez validadas, as alterações são promovidas para o ramo de staging para testes de aceitação do usuário antes de serem finalmente implantadas no ramo de produção para lançamento.

<figure>
	<img src="/assets/img/gitlab-flow-multi-environment-system.png" alt=""> 
	<figcaption>O GitLab flow para um sistema de ambiente múltiplo</figcaption>
</figure>

### Sistema de múltiplas versões
O GitLab flow de várias versões é projetado para projetos com várias versões ou fluxos de lançamento ativos em execução simultânea. Isso permite que as equipes gerenciem o desenvolvimento de recursos, correções de bugs e lançamentos em vários ramos que representam diferentes versões do software. Os desenvolvedores trabalham em ramos de recursos direcionados para ramos de versão específicos (por exemplo, v1.x, v2.x), garantindo que as alterações sejam isoladas e aplicadas ao fluxo de lançamento apropriado. Pipelines de integração e entrega contínuas são configurados para compilar, testar e implantar cada versão independentemente, permitindo que as equipes suportem várias implantações de clientes ou variantes de produtos simultaneamente.

<figure>
	<img src="/assets/img/gitlab-flow-multi-version-system.png" alt=""> 
	<figcaption>O GitLab flow para um sistema de múltiplas versões</figcaption>
</figure>

## Qual é o melhor fluxo?
Desculpe dizer isso, mas não há bala de prata, e você precisa pensar qual é a melhor abordagem para o seu projeto, equipe ou empresa. Cada fluxo tem seus prós e contras e foi adaptado a um cenário específico. Como você pode ver na tabela abaixo, não há um único "melhor" fluxo. A escolha certa depende da escala do seu projeto, do tamanho da equipe e do ritmo desejado de lançamento. Se a simplicidade for primordial, considere o fluxo do GitHub ou o TBD. Para gerenciamento de lançamentos mais estruturado ou vários ambientes, investigue o Git flow ou o GitLab flow.

| Recurso | TBD/Estratégia de um único ramo | Git flow | Fluxo do GitHub | Fluxo do GitLab |
|---|---|---|---|---|
| **Uso do Ramo Principal** | Todo desenvolvimento, código estável | Código estável | Código estável | Código estável |
| **Outros Ramos** | Ramos de recursos de curta duração (opcional) | Desenvolvimento, Recurso, Lançamento, Hotfix | Recurso  | Recurso, Ambiente (por exemplo, staging, produção), Lançamento (opcional)  |
| **Gerenciamento de Lançamento** | Implantação contínua a partir do principal | Lançamentos formais a partir de ramos de lançamento |  Implantação contínua a partir do principal | Ramos de lançamento facilitam os lançamentos |
| **Estratégia de Mesclagem** | Mesclagens frequentes e pequenas | Mesclagens maiores e menos frequentes | Mesclagens frequentes e pequenas | Varia com base no fluxo de trabalho (pode ser frequente ou maior) |
| **Foco** | Simplicidade, desenvolvimento rápido | Gerenciamento de lançamento estruturado | Integração e implantação contínuas | Fluxos de trabalho flexíveis, gerenciamento de lançamento |
| **Complexidade** | Baixa | Alta | Moderada | Moderada a Alta |
| **Mais Adequado Para** | Projetos pequenos, desenvolvedores solos | Projetos grandes, complexos, com ciclos de lançamento estritos | Projetos que priorizam simplicidade, implantação rápida | Projetos com vários ambientes, necessidades de gerenciamento de lançamento |

E você? Quais são seus pensamentos? Quais desses fluxos você já usou? Conte-me nos comentários. Vamos conversar sobre isso. Vejo você no próximo post!

[book_tracking_repository]:   https://github.com/ionixjunior/BookTracking
[vincent_driessen_twitter]:   https://twitter.com/nvie
[git_flow_post]:              https://nvie.com/posts/a-successful-git-branching-model/
[last_post]:                  /mastering-git-branching-basics-exploring-the-git-branch-command
[gitlab_flow_post]:           https://about.gitlab.com/topics/version-control/what-is-gitlab-flow/
[gitlab_flow_best_practices]: https://about.gitlab.com/topics/version-control/what-are-gitlab-flow-best-practices/