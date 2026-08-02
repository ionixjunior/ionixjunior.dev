+++
title = "Reconstruindo o Rider dentro do VS Code"
date = 2026-08-14
type = "post"
slug = "rebuilding-rider-inside-vs-code"
translationKey = "rebuilding-rider-inside-vs-code"
categories = ["tools"]
tags = ["dicas"]
image = "/img/cards/rebuilding-rider-inside-vs-code.pt.webp"
+++

A primeira semana foi dura. Não porque alguma coisa estivesse quebrada, mas porque tudo que eu buscava por reflexo simplesmente não estava lá. Cadê o solution explorer? Como eu vejo o que tem dentro do `/data/data` no emulador? No [post anterior][previous_post] eu te contei que estava errado sobre o VS Code. Hoje eu vou te mostrar o trabalho que deu para acertar: cada extensão que eu instalei, e qual recurso do Rider cada uma delas substituiu. Vamos nessa!

## O que este post não é

Um guia de configuração. Deixar o projeto configurado, o dispositivo reconhecido e o target certo selecionado é um trabalho à parte, e eu deixei isso de fora de propósito para que este post continuasse sendo o que ele é: uma lista de extensões e o que cada uma substituiu.

Talvez seja a próxima coisa que eu escreva. Me diz nos comentários se você gostaria de ler sobre isso.

## Comece por onde a Microsoft manda

Três extensões, todas da Microsoft, e você precisa das três:

- [C#][csharp] te dá a linguagem em si. IntelliSense, go to definition, find references, refactorings.
- [C# Dev Kit][csharp_dev_kit] adiciona as partes que fazem aquilo parecer um projeto em vez de uma pasta: um Solution Explorer e um Test Explorer.
- [.NET MAUI][dotnet_maui] adiciona a metade mobile. Deploy com F5 para emuladores, simuladores e dispositivos, IntelliSense de XAML e Hot Reload.

Uma observação antes de seguir: o C# Dev Kit segue a licença do Visual Studio, então vale conferir os termos para a sua situação.

### A armadilha de versão que ninguém me avisou

Essa aqui me custou tempo, então deixa eu te economizar um pouco.

O projeto em que eu trabalho ainda está no .NET 9. Hoje, se você olhar a página do C# Dev Kit na marketplace, os requisitos listam o SDK do .NET 10. E com as versões mais recentes dessas três extensões instaladas, eu não conseguia fazer deploy do app Android em um dispositivo físico.

A solução não é elegante, mas funciona: **instale versões mais antigas das três extensões e desligue a atualização automática delas.** No VS Code, clique no ícone de engrenagem da extensão, escolha "Install Another Version...", selecione uma da lista, e depois use o mesmo menu para desligar o "Auto Update".

E qual versão escolher? Essa parte não é chute. Cada extensão publica um changelog na sua página da marketplace, e eu li os três até achar as releases em que o suporte ao .NET 10 entrou. A versão que você quer é a imediatamente anterior a essa.

Então considere isso o aviso que eu gostaria de ter recebido: se o seu projeto ainda não está no .NET mais novo, vá ler os changelogs e fixe as versões das suas extensões, antes de passar uma tarde inteira se perguntando por que o deploy no dispositivo parou de funcionar. Se você chegou aqui por uma busca no Google depois de perder essa tarde, oi, eu sei bem como você está se sentindo 😅.

## Ensinando os meus atalhos para o VS Code

Eu poderia ter aprendido os atalhos do VS Code. Escolhi não aprender.

O [JetBrains IDE Keymap][jetbrains_keymap] traz os atalhos da JetBrains, e de repente os meus dedos souberam de novo onde estavam. Para ser preciso, ele é baseado na família JetBrains em geral, IntelliJ IDEA, WebStorm e PyCharm, e não no Rider especificamente, mas a sobreposição é quase total para tudo que eu faço no dia a dia.

**Esse foi o maior salto de conforto de todos, e levou uns trinta segundos para instalar.** Anos de memória muscular não é algo para se jogar fora por princípio.

## As janelas que eu sentia falta

É aqui que estava a maior parte do trabalho. Não exatamente recursos, mas *lugares onde eu costumava olhar as coisas*.

### O solution explorer

O C# Dev Kit até te dá um Solution Explorer dentro da aba Explorer, e ele funciona bem. Mas eu uso o [DotNav][dotnav] no lugar.

Para mim ele é mais poderoso. Além da árvore da solution, ele consegue mostrar onde o arquivo que eu estou editando fica dentro dela, e eu uso isso o tempo todo em um projeto grande. Essa é a minha preferência, não uma crítica ao oficial, então experimente os dois e fique com o que funcionar melhor para você.

### A janela de banco de dados

O Rider tem o DataGrip embutido, e eu só percebi o quanto dependia disso quando não tinha mais.

O [DBCode][dbcode] resolveu. Ele suporta uma lista enorme de bancos, mas eu uso para uma coisa só: abrir um arquivo SQLite e olhar os dados sem sair do editor.

### Git, sem sair do editor

Três extensões, fazendo três trabalhos diferentes:

- O [GitNav][gitnav] me dá o histórico visual. O grafo de commits, e o diff contra outra branch sem precisar fazer checkout.
- O [Git Blame Annotations][git_blame] coloca o blame inline, do jeito que as IDEs da JetBrains fazem. Quem mudou esta linha, e quando.
- O [LazyGit VSCode][lazygit_vscode] abre o [lazygit][lazygit] dentro do VS Code. Vale saber que o lazygit precisa estar instalado na sua máquina antes, a extensão só traz ele para dentro.

Esse último é preferência minha. Eu simplesmente gosto de trabalhar com Git no lazygit: criar commits, olhar diffs, fazer rebase, trocar de branch. É do jeito que as minhas mãos querem trabalhar, e poder fazer isso sem sair da janela do editor já vale uma extensão sozinho. Eu posso fazer a mesma coisa abrindo o terminal, mas a extensão me dá um atalho fácil para chegar no lazygit.

## A parte do Android

É aqui que a pessoa que desenvolve .NET Android normalmente desiste e parte para outra. Você não precisa.

### O SDK e os emuladores

O [AVD Manager][avd_manager] gerencia dispositivos virtuais *e* pacotes do SDK: platforms, tools, aceite de licenças. A página dele na marketplace descreve fazer tudo isso "without touching Android Studio", ou seja, sem encostar no Android Studio. Guarde essa frase, porque ela volta no próximo post.

O [Android Emulator Helper][emulator_helper] é o que eu uso para criar e apagar AVDs.

O [Tabbed Emulator][tabbed_emulator] roda o emulador dentro de uma aba do VS Code em vez de uma janela flutuante, e funciona com simuladores iOS também. Chega de procurar uma janela perdida atrás do editor.

### Olhando dentro do dispositivo

O [Android System Explorer][system_explorer] navega pelo sistema de arquivos do dispositivo via ADB. Eu uso para entrar no `/data/data` e olhar bancos de dados e arquivos do app.

Essa é a extensão que substituiu um recurso do Rider que ficou quebrado por meses, o que já diz alguma coisa sobre como essa história toda começou.

### Lendo os logs

O [Logcat Lens][logcat_lens] exibe o logcat com filtro por nível, tag e pacote. É uma ferramenta simples, que faz exatamente o que promete.

## Outras extensões

Deixo aqui mais algumas extensões que instalei:

- O [Bookmarks][bookmarks] marca uma linha para eu voltar nela depois. Uso bastante quando estou navegando em um código que não conheço e sei que vou querer voltar em um ponto específico.
- O [Mermaid][mermaid] renderiza diagramas Mermaid.
- O [Markdown Preview Github Styling][markdown_preview] deixa o preview de markdown com a cara que eu espero que ele tenha.
- O [Clean Bin Obj][clean_bin_obj] apaga `bin` e `obj`. É a extensão mais estranha desta lista, e eu mantenho porque é útil.

E mais quatro de Python que instalei: [Python][python_ext], [Python Debugger][python_debugger], [Pylance][pylance] e [Python Environments][python_envs]. Não usei elas o suficiente para te contar algo interessante, mas foram suficientes para tornar o PyCharm desnecessário, e é tudo que eu preciso delas.

## O que a minha própria lista me disse

Agora volte e olhe essa lista comigo.

DotNav. Bookmarks. Git Blame. GitNav. Android System Explorer. Logcat Lens. DBCode. Tabbed Emulator.

Todas elas, sem exceção, são para **ler, navegar ou inspecionar**. Nenhuma delas me ajuda a escrever uma linha de código.

E as coisas em que o Rider é genuinamente, reconhecidamente excelente? Os refactorings profundos, as inspeções de código, o autocomplete que parece ler a sua mente. Elas quase não aparecem aqui. Eu praticamente não substituí nada disso, e não senti falta.

Isso me incomodou por um tempo, e depois parou de me incomodar e começou a explicar alguma coisa. No próximo post eu vou te contar sobre a extensão que eu precisei escrever, e depois eu volto nessa lista e no que eu acho que ela significa.

Até o próximo post!

[previous_post]:      /pt/i-was-wrong-about-vs-code/
[csharp]:             https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp
[csharp_dev_kit]:     https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit
[dotnet_maui]:        https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.dotnet-maui
[jetbrains_keymap]:   https://marketplace.visualstudio.com/items?itemName=isudox.vscode-jetbrains-keybindings
[dotnav]:             https://marketplace.visualstudio.com/items?itemName=tuna-ex.dotnav
[dbcode]:             https://marketplace.visualstudio.com/items?itemName=DBCode.dbcode
[gitnav]:             https://marketplace.visualstudio.com/items?itemName=tuna-ex.gitnav-workflows
[git_blame]:          https://marketplace.visualstudio.com/items?itemName=lkqm.gitblame-annotations
[lazygit_vscode]:     https://marketplace.visualstudio.com/items?itemName=TomPollak.lazygit-vscode
[lazygit]:            https://github.com/jesseduffield/lazygit
[avd_manager]:        https://marketplace.visualstudio.com/items?itemName=toroxx.vscode-avdmanager
[emulator_helper]:    https://marketplace.visualstudio.com/items?itemName=oognuyh.android-emulator-helper
[tabbed_emulator]:    https://marketplace.visualstudio.com/items?itemName=ShouryaShikhar.tabbed-emulator
[system_explorer]:    https://marketplace.visualstudio.com/items?itemName=SalemAl-Zuhairi.android-system-explorer
[logcat_lens]:        https://marketplace.visualstudio.com/items?itemName=AshishKumarD.logcat-lens
[bookmarks]:          https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks
[mermaid]:            https://marketplace.visualstudio.com/items?itemName=MermaidChart.vscode-mermaid-chart
[markdown_preview]:   https://marketplace.visualstudio.com/items?itemName=bierner.markdown-preview-github-styles
[clean_bin_obj]:      https://marketplace.visualstudio.com/items?itemName=hybr8.clean-bin-obj
[python_ext]:         https://marketplace.visualstudio.com/items?itemName=ms-python.python
[python_debugger]:    https://marketplace.visualstudio.com/items?itemName=ms-python.debugpy
[pylance]:            https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance
[python_envs]:        https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-python-envs
