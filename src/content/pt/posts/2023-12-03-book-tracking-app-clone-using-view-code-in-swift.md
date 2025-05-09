+++
title = "Book Tracking app clone usando View Code em Swift"
date = 2023-12-03
type = "post"
slug = "book-tracking-app-clone-using-view-code-in-swift"
translationKey = "book-tracking-app-clone-using-view-code-in-swift"
categories = ["TODO"]
tags = ["swift", "view-code"]
social_image: "book-tracking-app-clone-using-view-code-in-swift.pt.webp"
+++

<p class="intro"><span class="dropcap">H</span>á alguns dias, publiquei um post falando sobre minha jornada como desenvolvedor mobile e porque eu decidi focar no desenvolvimento nativo com iOS. Hoje, vou compartilhar minhas primeiras impressões usando View Code no iOS. Para praticar, escolhi um design the um aplicativo que encontrei no Dribbble e iniciei um clone do aplicativo. Então, vamos conferir o resultado!</p>

Eu iniciei a estudar iOS de forma um pouco mais focada, e acredito que esse é o momento perfeito para iniciar um projeto e praticar algumas novas coisas que estou aprendendo. Eu não tinha ideia do que desenvolver, então, procurei por algumas inspirações no Dribbble, e achei o [Book Tracking App][dribbble] feito pelo [Kyler Phillips][twitter-kyler]. O design de Kyler é um trabalho em andamento, mas as três primeiras telas que ele compartilhou são incríveis, e eu iniciei o clone do aplicativo baseado em seu design.

### View Code? Por que não SwiftUI??

Eu ainda trabalho como desenvolvedor Xamarin, e por conta disso, não consigo usar SwiftUI com essa plataforma. Onde eu trabalho, todo o projeto foi construído usando Storyboards, e nós estamos procurando uma maneira diferente de lidar com isso. Recentemente, iniciamos um estudo para entender como implementar o View Code no nosso app. Por conta disso, iniciei este projeto para praticar algo diferente que vai me ajudar no trabalho.

### Por que eu escolhi este design?

O design do Kyler é muito bonito, claro e me dá alguns desafios para enfrentar. Não tenho nada contra em fazer projetos mais simples, mas me sinto mais confortável com alguns desafios reais. O design proposto por ele é bom pois possui rolagem horizontal e vertical na mesma tela, alguns componentes são compartilhados entre as telas e possui diferentes desafios em cada layout.

### Qual foi a maior dificuldade usando View Code?

Para mim, foi a configuração das constraints. Mas não é muito difícil. Quando você aprende a pensar na construção do layout, não é algo difícil para implementar quando desenvolvemos uma nova tela ou partes dela. Você precisa pensar se o elemento deve ficar no topo ou rodapé, à esquerda ou à direita, se o elemento precisa de altura ou largura definida, e qual elemento ele deve se relacionar. Uma vez que você entende isso, configurar as constraints programaticamente não será uma tarefa difícil.

Vamos falar sobre prós e contras da abordagem.

#### Prós
- Permite que um time trabalhe junto no mesmo arquivo com menos chances de conflitos ao fazer merge;
- Permite um entendimento fácil de como os elementos da tela estão organizados e se relacionam;
- Permite criar telas dinâmicas facilmente;
- Permite criar componentes e reutilizá-los facilmente;
- Permite centralizar o código dentro do próprio código, não em arquivos XML que não impossíveis de ler (Storyboard).

#### Contras
- Difícil para iniciar e organizar o código; Isso é importante para evitar que façamos bagunça e tornar as coisas ainda mais difícieis;
- Não existe uma ferramenta visual para visualizar o layout que estamos desenvolvendo, configuração de constraints e propriedades que alteramos do elemento. Você precisa executar o projeto e ver no próprio similador o resultado;
- Mais tempo para construtir uma tela.

### O clone do aplicativo

Coloquei o projeto Swift no GitHub e estou chamando ele de [BookTracking][github]. É um trabalho que está em desenvolvimento e vou continuá-lo para praticar e aprender mais sobre View Code.

Confira o projeto e venha aprender comigo. Você tem interesse em ver eu fazendo alguma live no meu canal desenvolvendo este aplicativo? Responde aí nos comentários. Até mais!

[github]:        https://github.com/ionixjunior/BookTracking/
[dribbble]:      https://dribbble.com/shots/6038744-Book-Tracking-App-WIP
[twitter-kyler]: https://twitter.com/kylerjphillips