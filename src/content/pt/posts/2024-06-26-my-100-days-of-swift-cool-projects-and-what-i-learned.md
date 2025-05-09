+++
title = "Meus 100 Dias de Swift: Projetos Incríveis e o que Aprendi"
date = 2024-06-28
categories = ["TODO"]
tags = ["swift"]
social_image: "my-100-days-of-swift-cool-projects-and-what-i-learned.pt.webp"
+++

<p class="intro"><span class="dropcap">H</span>á algum tempo, completei o desafio 100 Days of Swift de Paul Hudson. Foi uma experiência incrível onde aprendi muito sobre Swift e desenvolvimento iOS. No post de hoje, vou compartilhar meus pensamentos sobre essa jornada e destacar as coisas mais interessantes que encontrei e desenvolvi. Vamos lá!</p>

Se você pesquisar por "100 days of Swift", encontrará vários materiais. Quando comecei minha pesquisa, escolhi o treinamento do Paul Hudson. Você pode encontrá-lo [aqui][100_days_of_swift]. Algumas pessoas me perguntaram por que comecei com UIKit em vez de SwiftUI. Bem, acredito que ambos são importantes, então decidi começar com UIKit.

Para qualquer pessoa que esteja começando sua jornada de desenvolvimento iOS, recomendo fortemente seguir um caminho estruturado como este. Você enfrentará desafios, praticará consistentemente e aprenderá algo novo a cada dia. A dinâmica é simples: aprender e praticar. Estou animado para compartilhar alguns destaques da minha experiência.

## Os Primeiros 12 Dias

Os primeiros 12 dias foram dedicados aos fundamentos do Swift, mas mesmo com conceitos aparentemente simples, aprendi algumas coisas interessantes.

### Tornando Números Grandes Legíveis

Ao trabalhar com números grandes, você pode usar sublinhados como separadores de milhares. Isso não altera o valor do número; apenas o torna mais fácil de ler.

{%- highlight swift -%}
var balance = 10_000_000
{%- endhighlight -%}

### Saindo de Múltiplos Loops

Se você tiver vários loops aninhados, pode nomear cada loop para criar uma condição `break` para sair. É uma boa alternativa ao uso de `goto` (lembra deles? 😅).

{%- highlight swift -%}
outerLoop: for i in 1...5 {
    for j in 1...5 {
        print ("\ (i) - \(j)")

        if j == 3 {
            break outerLoop
        }
    }
}        
{%- endhighlight -%}

Esses podem parecer pequenos detalhes, mas os achei bastante úteis.

## Iniciando Projetos iOS

Depois de dominar os fundamentos do Swift, comecei a trabalhar em projetos iOS, o que abriu um mundo de novas possibilidades. Vamos revisitar algumas das funcionalidades mais legais que encontrei e algumas coisas que tentei.

### Environment Overrides

O Xcode fornece uma opção chamada "Environment Overrides". Basicamente, você pode alterar configurações como aparência, texto e acessibilidade, para testar seu aplicativo em diferentes cenários. É incrivelmente fácil verificar seu aplicativo em várias características diferentes.

<video controls aria-labelledby="Environment Overrides do Xcode" aria-describedby="O vídeo mostra o Xcode e o Simulador iOS lado a lado. O aplicativo está em execução e há um botão na parte inferior da barra de ferramentas do Xcode que revela a ferramenta de Environment Overrides. Ao alterar as configurações disponíveis de aparência, texto e acessibilidade, você vê as alterações diretamente no aplicativo em execução.">
    <source src="/assets/videos/xcode_environment_overrides.mp4" type="video/mp4">
    Seu navegador não suporta reprodução de vídeo.
</video>

### Descrição de Depuração em Testes de UI

Ao executar testes de UI, você pode definir um breakpoint e digitar `po app.debugDescription` na janela de saída. Isso mostrará um "REPL" (Read-Eval-Print Loop) que o ajudará a entender os elementos da UI com os quais você pode interagir na tela. Isso é incrivelmente útil para analisar elementos da UI durante os testes.

<figure>
	<img src="/assets/img/xcode_uitests_debug.webp" alt="Xcode mostrando os elementos da UI na tela na janela de saída."> 
	<figcaption>Xcode mostrando os elementos da UI na janela de saída.</figcaption>
</figure>

### Avisos de UI Sem Resposta (tela travada)

Esta é uma funcionalidade muito útil. O Xcode me alertou quando executei operações pesadas na thread da UI, como carregar uma URL da internet. Esses tipos de problemas são fáceis de corrigir e agradeci aos avisos do Xcode que me ajudaram a melhorar minha implementação.

<figure>
	<img src="/assets/img/xcode_unresponsiveness_ui_warning.webp" alt="Xcode mostrando um aviso de UI sem resposta em um conteúdo carregado de uma URL."> 
	<figcaption>Xcode mostrando um aviso de UI sem resposta em um conteúdo carregado de uma URL.</figcaption>
</figure>

### River Raid - Uma Versão Bem Simples

Além do UIKit, também explorei um pouco do SpriteKit. Este não foi um desafio do treinamento do Paul Hudson, mas algumas lições que desenvolvi me ajudaram a construí-lo. Fiz apenas por diversão. Quando criança, eu tinha um Atari, então, joguei muito River Raid. Bateu uma saudade!

<video controls aria-labelledby="River Raid versão simples, feito com SpriteKit" aria-describedby="O vídeo mostra o Xcode e o Simulador iOS lado a lado. O aplicativo foi feito usando SpriteKit e é uma versão simples do jogo River Raid do Atari.">
    <source src="/assets/videos/river_raid_little_made_by_spritekit.mp4" type="video/mp4">
    Seu navegador não suporta reprodução de vídeo.
</video>

### Jogo da Memória

Também criei um jogo da memória simples. Para testá-lo, desenvolvi testes de UI para verificar se todas as cartas podiam ser viradas e se o jogo podia ser concluído com sucesso. Foi outro projeto legal de desenvolver, pois explorei um pouco dos testes de UI.

<video controls aria-labelledby="Um jogo da memória testado com testes de UI" aria-describedby="O vídeo mostra o Xcode e o iPad Simulator. O aplicativo foi feito usando UIKit e é um jogo da memória. Os testes de UI abrem todos os pares até que o jogo termine.">
    <source src="/assets/videos/test_memory_game_using_uitests.mp4" type="video/mp4">
    Seu navegador não suporta reprodução de vídeo.
</video>

## 100 Dias de Prática == Uma Grande Evolução

Alguns capítulos desse treinamento foram repetitivos, mas cumpriram um propósito: solidificar o conhecimento. Antes de embarcar nessa jornada, sentia a necessidade de desenvolver algo continuamente a cada dia, para aprender e praticar consistentemente. O desafio 100 Days of Swift forneceu o framework perfeito para esse objetivo e me apresentou a um conteúdo excelente.

Se você estiver interessado em acompanhar toda a minha jornada, pode conferir [esse tweet][100_days_of_swift_journey]. Além disso, todos os projetos que desenvolvi estão hospedados neste [projeto no GitHub][github_project].

Estou pensando em começar o desafio [100 Days of SwiftUI][100_days_of_swiftui], também do Paul Hudson. O que você acha? Gostaria de se juntar a mim nessa aventura? Lembre-se, a consistência é a chave! Cada dia conta e, com dedicação, você pode alcançar coisas incríveis em sua jornada. Então, vamos continuar aprendendo e crescendo juntos!

[100_days_of_swift]:         https://www.hackingwithswift.com/100
[100_days_of_swiftui]:       https://www.hackingwithswift.com/100/swiftui
[100_days_of_swift_journey]: https://x.com/ionixjunior/status/1569005323314425859
[github_project]:            https://github.com/ionixjunior/100DaysOfSwift