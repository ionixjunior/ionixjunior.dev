+++
title = "Xamarin.Forms e UI – Qual ferramenta é mais produtiva?"
date:   2018-02-20
translations: ["en"]
tags: ["xamarin"]
redirect_from:
    - /xamarin-forms-e-ui-qual-ferramenta-e-mais-produtiva/
+++

<p class="intro"><span class="dropcap">Q</span>uando comecei a trabalhar com Xamarin.Forms era muito difícil construir interfaces, pois não haviam ferramentas gráficas para tal, era tudo "na mão". Este post compara algumas ferramentas que podemos utilizar para tornar esse trabalho um pouco mais fácil.</p>

Passou um tempo e... Tudo continua praticamente a mesma coisa. Ainda é trabalhoso desenvolver interfaces apenas utilizando as ferramentas padrões, mas não dei muita importância a isso, pois me acostumei a trabalhar desta forma. Adquirir algumas habilidades também me ajudou bastante neste conformismo. Até que um dia descobri uma nova ferramenta e, desde então, não consigo mais trabalhar sem ela.

A ideia inicial deste post era apresentar as facilidades do **LiveXAML** que acabaram me conquistando, mas achei injusto falar apenas dele e apresentando-o como uma ferramenta revolucionária. Não podemos esquecer que antes dele já havia outros produtos que se aventuraram em tentar fazer o que o **LiveXAML** faz hoje.

Então, fiz um comparativo entre as ferramentas **Gorilla Player**, **XAML Previewer**, **Xamarin Live Player** e o **LiveXAML**.

Indo direto ao ponto: a melhor ferramenta para se trabalhar hoje no desenvolvimento de UI com **Xamarin.Forms** é **LiveXAML**.

Por que? Senta aí que lá vem história...

### LiveXAML
Em setembro de 2017, quando ouvi falar pela primeira vez sobre o **LiveXAML** logo pensei: _"Quantos passos vou precisar executar para fazer isso funcionar?"_. Quando testei, tive uma surpresa, pois foi extremamente fácil para começar a utilizá-lo. Apenas precisei instalar a extensão para o Visual Studio e o pacote **LiveXAML** no projeto. Depois disso, foi só correr pro abraço!

Com essa extensão é possível executar o projeto no simulador/emulador/dispositivo e alterar o **XAML** em tempo de execução do projeto, sendo possível visualizar em tempo real as modificações realizadas. Assim, fica muito mais fácil realizar alterações nas telas sem precisar compilar, esperar pelo deploy e navegar até a tela para ver o resultado, que provavelmente não vai ficar como você espera nas primeiras vezes que tentar 🙂 Sem contar que, às vezes, o fast deploy se perde e você precisava dar o rebuild do projeto. No entanto, agora com o **LiveXAML** tudo é instantâneo.

Mas o **LiveXAML** não é pioneiro no segmento, existe também o **Gorilla Player** da UXDivers, o **XAML Previewer** e o **Xamarin Live Player**, ambos do **Xamarin**.

Vamos conhecê-los:

### Gorilla Player
Quando tentei utilizar o **Gorilla Player** pela primeira vez, não entendi a maneira como ele trabalhava e não gostei – lógico, como vou gostar de algo que não entendo? – então o abandonei. Só agora experimentei utilizá-lo novamente e consegui, mas não achei nada prático. Na verdade, acho que tive um problema similar ao que enfrentei da primeira vez: criei uma tela muito básica, com duas labels e um campo, sendo que, em um dos labels adicionei um converter e o **Gorilla Player** não encontrou o converter que adicionei.
Então, refiz o teste removendo o converter e aí eu vi a “mágica” acontecer.

### XAML Previewer
Já sobre o **XAML Previewer**, as primeiras vezes que utilizei ainda estava em fase beta, com diversos problemas e muito lento. Aos poucos melhorou, mas continuava devastando a máquina toda vez que eu o utilizava. Entretanto, era melhor que nada e consegui muita agilidade com ele, mas ainda assim estava longe de se tornar uma solução definitiva.

No mac ele é bem fácil de usar: basta compilar os projetos e clicar em Preview – um botão localizado no canto superior direito – que aparece quando você abre um arquivo **XAML**. Aí é só esperar ele renderizar. Já no Windows, a opção para mostrar o **XAML Previewer** é praticamente escondida dentro do Visual Studio, mas está lá.

### Xamarin Live Player
Esse foi o que menos utilizei. Ainda está em fase beta, ou seja, muita coisa para melhorar. É muito bonito, mas ainda não é possível utilizar em um app em produção. Apenas deixando bem claro que essa é a minha opinião. Caso você pense diferente, deixa aí o seu comentário para a gente dialogar!

Para utilizar, você deve habilitá-lo  nas preferências do Visual Studio. Em seguida, baixar o aplicativo no dispositivo e sincronizar com o Visual Studio. Após isso você irá conseguir visualizar suas telas direto no seu celular.

Vocês vão me desculpar, mas no projeto de exemplo que montei, não funcionou o **Xamarin Live Player**, consegui apenas fazer testes isolados. Pesquisando sobre o motivo do problema, verifiquei que ainda existem muitas [limitações][limitacoes-xamarin-live-player], conforme pode ser visto no link.

### Comparativo
Conforme comentei no início do post, fiz um comparativo entre as ferramentas, onde analisei alguns quesitos que você pode conferir abaixo.

Não consegui testar todos os quesitos do **Xamarin Live Player** devido às limitações, mas deixei ele no post para comparação e atualização futura.

Abaixo alguns quesitos avaliados:

### Custo
O **LiveXAML** é a única ferramenta que é paga. Sua licença permanente custa $240 dólares. Há também uma opção para assinatura mensal, que custa $24.

A licença é cara? Olha, para nós aqui do Brasil, multiplicar esse valor por ~R$3,50 não é algo muito fácil, principalmente se for apenas para um indie developer. Entretanto, se você analisar o real benefício que esta ferramenta te dará no ambiente de desenvolvimento, com certeza esse valor será irrisório.

### Suporte a custom renders
Montei um projeto bem básico apenas para testar. O único que funcionou perfeitamente foi o **LiveXAML**. O **XAML Previewer** funcionou apenas no iOS e o **Gorilla Player** necessitou instalar o Gorilla SDK.

O Gorilla SDK é um pacote NuGet que precisa ser instalado no projeto. Com ele você consegue passar instruções ao **Gorilla Player** para ele conseguir renderizar os componentes que não conhece. Não foquei na realização deste procedimento, pois o objetivo principal é que a ferramenta seja simples de usar.

### Suporte a effects
Com effects aconteceu o mesmo caso dos custom renders, tudo igual. **LiveXAML** disparando na frente 🙂

### Suporte a componente de terceiros
**XAML Previewer** e **LiveXAML** ok, apenas o **Gorilla Player** que, novamente, precisou da SDK. O componente testado foi o SfSchedule da Syncfusion.

### Suporte a native views
Fiz um teste bem simples incluindo um label nativo para Android e iOS. No **XAML Previewer** e **LiveXAML** tudo certo. **Gorilla Player** nem deu a mensagem da SDK, acho que não funciona mesmo.

### Suporte a ResourceDictionary
Tudo certo com estilos globais e específicos declarados nas páginas. Todas as ferramentas funcionaram bem.

### Suporte a ContentViews
É comum criarmos nossos próprios controls e importá-los nas páginas para fazermos o reuso. Todas as ferramentas funcionaram bem no uso de ContentViews.

### Suporte a múltiplos dispositivos simultaneamente
Os únicos que se destacam nesse quesito são **Gorilla Player** e **LiveXAML**. Neles, isso é muito prático, dá para colocar os devices lado a lado e ficar com um olho no **XAML** e outro nos devices, muito produtivo.

### Suporte a animações
**LiveXAML** foi o único que possibilitou visualizar a animação em execução, os demais mostraram a imagem animada do projeto de exemplo de forma estática. Não que isso seja muito útil, até porque, o efeito da animação do exemplo foi programado em code behind. Se fosse feito no **XAML** aí teríamos benefício de alterar e visualizar os efeitos.

### Notificações de erros
Parabéns pra todos! Todos tem alguma maneira de nos dizer que algo está errado com os elementos de nossa UI. O **LiveXAML** é o mais simples, porém muito funcional.

### Design time data
No projeto de exemplo, criamos uma página contendo uma lista e uma viewmodel preenchendo essa lista. Quando executei as ferramentas para visualizar, somente o **XAML Previewer** e o **LiveXAML** funcionaram corretamente.

O **Gorilla Player** precisou que fosse criado um arquivo JSON contendo os dados a serem exibidos e mais uma pequena customização no projeto e pronto, apareceram as informações. Achei interessante a maneira como ele trabalha com isso, é prático.

Temos que levar em consideração que a implementação deste projeto é Vanilla, ou seja, tudo padrão. Mas uma simples mudança para tirar “essas coisas ruins padrões do Forms” pode fazer com que o **XAML Previewer** não funcione. Vamos supor que iremos implementar o ViewModel To ViewModel Navigation, não iremos explicitar os BindingContext nas páginas, eles serão criados automaticamente através de uma classe que gerencie isso. E agora, como faz para o **XAML Previewer** funcionar?? Somente hardcode.

Para finalizar, segue uma tabela, onde podemos compará-los de forma mais fácil.

| Características                            | LiveXAML        | Gorilla Player       | XAML Previewer     | Xamarin Live Player |
| ------------------------------------------ | --------------- | -------------------- | ------------------ | ------------------- |
| Preço                                      | $240 ou $24/mês | Gratuito             | Gratuito           | Gratuito            |
| Suporte à custom renderers                 | ✅              | ✅ (com Gorilla SDK) | ⚠️ (somente no iOS) | ❌                  |
| Suporte à effects                          | ✅              | ✅ (com Gorilla SDK) | ⚠️ (somente no iOS) | ❌                  |
| Suporte à componentes de terceiros         | ✅              | ✅ (com Gorilla SDK) | ✅                 | -                   |
| Suporte à native views                     | ✅              | ❌                   | ✅                 | -                   |
| Suporte à ContentViews                     | ✅              | ✅                   | ✅                 | -                   |
| Suporte à ResourceDictionary               | ✅              | ✅                   | ✅                 | -                   |
| Suporte à multiplos devices ao mesmo tempo | ✅              | ✅                   | ❌                 | ❌                  |
| Notificação de erros                       | ✅              | ✅                   | ✅                 | ✅                  |

Por hoje é isso e essa é a minha dica! Espero que tenham gostado. O projeto de exemplo utilizado nos testes está no [Github][projeto].

Experimentem o [LiveXAML][livexaml], deixe seu comentário, elogios, críticas ou sugestões. Para quem tiver interesse em experimentar também as outras ferramentas, deixo aqui os links do [Gorilla Player][gorilla-player], [XAML Previewer][xaml-previewer] e [Xamarin Live Player][xamarin-live-player].

Valeu!

[limitacoes-xamarin-live-player]: https://developer.xamarin.com/guides/cross-platform/live/limitations/
[projeto]:                        https://github.com/ionixjunior/XamarinPlayground/tree/master/XAMLTests
[livexaml]:                       http://livexaml.com/
[gorilla-player]:                 http://gorillaplayer.com/
[xaml-previewer]:                 https://developer.xamarin.com/guides/xamarin-forms/xaml/xaml-previewer/
[xamarin-live-player]:            https://www.xamarin.com/live