+++
title = "Eu estava errado sobre o VS Code"
date = 2026-08-07
type = "post"
slug = "i-was-wrong-about-vs-code"
translationKey = "i-was-wrong-about-vs-code"
categories = ["tools"]
tags = ["dicas"]
image = "/img/cards/i-was-wrong-about-vs-code.pt.webp"
+++

Durante anos eu falei a mesma coisa para todo mundo que me perguntava sobre o VS Code: ele não é uma IDE. É um editor de código, e um editor de código não é suficiente para desenvolver software de verdade. Eu estava errado. Foi preciso um deploy quebrado no Android, meses de espera e muita frustração para eu enxergar isso, e hoje o VS Code é onde eu escrevo todo o meu código. Deixa eu te contar como cheguei até aqui.

## A IDE que eu não pedi

O Visual Studio for Mac chegou em 2017, e por anos ele foi a minha IDE principal para desenvolvimento Xamarin. Se você escrevia C# no Mac naquela época, era ali que você estava, e eu era feliz ali.

Em 2019 eu entrei na empresa onde trabalho hoje, e o Rider veio junto com o trabalho. Eu resisti. Por mais ou menos um ano eu mantive as duas ferramentas instaladas e continuei voltando para o Visual Studio for Mac sempre que a coisa era séria. Se eu me lembro bem, foi só por volta de 2020 que eu parei de abrir ele de vez e o Rider finalmente virou a minha IDE principal.

Repare no padrão, porque ele se repete mais para frente neste post: alguém coloca uma boa ferramenta na minha frente, e a minha primeira reação é continuar usando a antiga.

Curiosidade: a Microsoft [encerrou o suporte do Visual Studio for Mac][vs_for_mac_retirement] em 31 de agosto de 2024, e a recomendação oficial era migrar para o Visual Studio no Windows, ou para o [VS Code][vs_code] no Mac com o C# Dev Kit. A essa altura eu já estava confortável no Rider, então li aquele anúncio e não fiz absolutamente nada a respeito. A Microsoft me apontou exatamente o setup sobre o qual estou escrevendo hoje, dois anos antes de eu chegar nele 😅.

## Quando o Rider parou de funcionar para mim

Deixa eu ser justo: o Rider é uma ótima IDE, e este post não é sobre ele ser um software ruim.

Mas se você trabalha com Xamarin ou .NET MAUI, você já sabe que não é o público principal. Esse suporte não vem de fábrica, ele chega através de plugins, e dá para sentir a diferença. O device explorer do Android ficou quebrado por meses. Depois o deploy para o emulador Android quebrou também, em versões recentes.

Essa última tem número: [RIDER-137704][rider_issue], "Unable to evaluate deployment properties when deploying/building MAUI Android". E olha como a própria JetBrains classificou a issue. O campo de prioridade do usuário diz:

> Prevents from using Rider

Ou seja: "impede o uso do Rider". Não fui eu que inventei esse drama, esse é o rótulo que está lá na issue.

Então eu e o meu time esperamos. Semanas, e depois meses.

Para ser justo, sempre existiu uma saída: fazer rollback e instalar uma versão anterior do Rider. Mas pare e pense no que isso significa na sua rotina. A sua IDE deveria ser a parte estável do seu dia, aquela em que você não precisa pensar.

A issue está marcada como corrigida agora, e eu quero ser honesto com você aqui: eu nunca validei essa correção. Eu já tinha esperado tanto que em algum momento simplesmente desisti. Mesmo corrigida, isso não muda nada para mim, porque não pretendo voltar.

**Quando a saída é instalar uma versão mais antiga da sua IDE, e a correção de verdade demora meses, a confiança vai embora muito antes do conserto chegar.**

## "Um editor de código não é suficiente para programar de verdade"

Agora a parte desconfortável, onde eu preciso citar a mim mesmo.

Eu era aquele cara que vivia implicando com o VS Code. Toda vez que alguém me mostrava o setup, eu já tinha a resposta pronta: isso é um editor de código, não é uma IDE. Cadê as ferramentas de refactoring? Cadê o solution explorer? Não dá para construir software de verdade em um editor de texto com plugins.

Eu acreditava nisso. E falei isso em voz alta, mais de uma vez, para pessoas que estavam perfeitamente felizes com o setup delas.

Você se reconhece aí? Talvez não com o VS Code, mas com alguma outra ferramenta sobre a qual você formou uma opinião anos atrás e nunca mais revisitou.

## O plot twist

Então lá estava eu: frustrado, com a IDE sem as features que eu precisava, sem previsão de correção, e com uma opinião antiga sobre o VS Code que não estava resolvendo nenhum dos meus problemas. Instalei o VS Code e as três extensões que a Microsoft recomenda para essa stack: [C#][csharp], [C# Dev Kit][csharp_dev_kit] e [.NET MAUI][dotnet_maui].

Eu adoraria te dizer que foi amor à primeira vista. Não foi. Os primeiros dias foram chatos, porque tudo que eu buscava por reflexo simplesmente não estava lá, e eu passei mais tempo caçando extensão do que escrevendo código.

Mas aí aconteceu uma coisa que eu realmente não esperava. Cada problema que eu encontrava tinha uma solução. Nem sempre perfeita, mas tinha. E depois de algumas semanas ajustando as coisas, eu tinha um setup que faz o que o Rider fazia por mim, com os atalhos que os meus dedos já conhecem.

Aí eu desinstalei o Rider. E o PyCharm foi junto. Às vezes eu também mexo com Python aqui na empresa, e o PyCharm era onde eu fazia isso. Agora isso também acontece no VS Code.

**A ferramenta que eu passei anos defendendo sumiu da minha máquina.**

Isso não quer dizer que eu não perdi nada. Sinto falta do dotTrace e do dotMemory, as ferramentas de profiling que vêm junto com o Rider. E aqui vai a parte honesta: eu ainda não fui atrás do que o VS Code consegue fazer nessa área. Simplesmente ainda não doeu o suficiente para eu ir procurar.

## Mas por que agora?

Essa é a parte sobre a qual eu ainda estou refletindo, e eu prefiro perguntar em voz alta do que fingir que já resolvi.

Eu sempre estive errado sobre o VS Code, ou as coisas evoluíram muito enquanto eu não estava olhando?

Porque tem outra coisa que mudou ao mesmo tempo. O meu ciclo de desenvolvimento hoje é conduzido principalmente por agentes de IA. Eu passo muito menos tempo do meu dia digitando código, e muito mais tempo lendo, revisando, navegando e decidindo o que vem depois. Se é assim que o meu dia realmente é hoje, quanto de uma IDE cara eu estou de fato usando?

Ainda não tenho uma resposta pronta. O que eu tenho é uma suspeita, e a evidência está bem ali, na lista de extensões que eu instalei. Vou voltar nisso no final desta série.

No próximo post eu vou te mostrar essa lista: cada extensão que eu adicionei, e qual recurso do Rider cada uma delas substituiu. Algumas me surpreenderam.

Vejo você no próximo post!

[vs_code]:                https://code.visualstudio.com
[vs_for_mac_retirement]:  https://learn.microsoft.com/pt-br/lifecycle/announcements/visual-studio-mac-end-of-servicing
[rider_issue]:            https://youtrack.jetbrains.com/issue/RIDER-137704/Unable-to-evaluate-deployment-properties-when-deploying-building-MAUI-Android
[csharp]:                 https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp
[csharp_dev_kit]:         https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit
[dotnet_maui]:            https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.dotnet-maui
