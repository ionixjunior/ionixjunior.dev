+++
title = "A extensão que eu criei, e a IDE que deixei de precisar"
date = 2026-08-21
type = "post"
slug = "the-extension-i-built-and-the-ide-i-stopped-needing"
translationKey = "the-extension-i-built-and-the-ide-i-stopped-needing"
categories = ["mobile"]
tags = ["android", "open-source", "IA"]
image = "/img/cards/the-extension-i-built-and-the-ide-i-stopped-needing.pt.webp"
+++

A essa altura o Rider já tinha ido embora e o PyCharm também. Um aplicativo continuava instalado na minha máquina, e eu abria ele para exatamente uma coisa: olhar um arquivo XML. Esse aplicativo era o Android Studio, e este post é sobre como eu me livrei dele também. No [post anterior][previous_post] eu te mostrei as extensões que substituíram o Rider. Este aqui é sobre a extensão que não existia, então eu precisei escrever. Vamos nessa!

## O último motivo para eu manter o Android Studio

O projeto em que eu trabalho é .NET Android, e ele tem muito XML: layouts, drawables, vetores. Eu preciso visualizar o layout deles. Não o tempo todo, mas com frequência suficiente para que "é só compilar e rodar o app para ver" seja uma resposta terrível.

Os previews eram instáveis no Rider, então o Android Studio ficou instalado exatamente para isso. Abrir o arquivo, olhar a imagem, fechar de novo. Gigabytes de IDE para uma olhada rápida, editando pouca coisa, na maioria das vezes.

Você já manteve uma ferramenta inteira instalada por causa de um único recurso? É uma coisa estranha de perceber, e depois que você percebe, fica difícil parar de reparar nisso.

## Por que as extensões existentes não resolveram

Existem várias extensões de preview de XML para o VS Code, e eu testei elas.

As que eu encontrei esperam um projeto Gradle. Elas vão procurar em `res/layout/`, que é onde um projeto Android nativo guarda os recursos. Um projeto .NET Android guarda em `Resources/`, então as extensões procuram, não acham nada, e acabou a conversa.

Isso não é uma crítica. Elas foram escritas para o ecossistema em que as pessoas que as criaram trabalham, o que é exatamente o certo a se fazer. Só significava que, para .NET Android, a resposta era "instale o Android Studio", e eu já tinha decidido que não queria mais essa resposta.

## Então eu criei o Inflate

O [Inflate][inflate_marketplace] renderiza previews de XML do Android dentro do VS Code, e funciona nos **dois** ecossistemas.

A parte importante é como ele desenha. Ele não aproxima o layout com HTML nem com um renderizador próprio. Ele roda o `layoutlib`, o mesmo engine de renderização que o próprio Android Studio usa, então o que você vê passou por inflate, measure e draw de verdade. Se renderizar diferente do Android Studio, isso é um bug, não uma limitação.

E ele não se importa com o seu build system. Ele trabalha em cima do XML e das convenções de árvore de recursos que o Gradle e o .NET Android compartilham, em vez de acionar um build. Então `res/layout/` e `Resources/layout/` são igualmente suportados, e nada invoca Gradle ou MSBuild, nunca.

Algumas coisas práticas que vale saber:

- Você precisa de um **JDK entre 17 e 24** na sua máquina. O Inflate encontra ele sozinho e nunca baixa nem embute uma JVM. Fique de olho na versão máxima: um colega meu estava no Java 25 e não rodou, e isso é limitação da engine de renderização.
- O primeiro preview dispara um **download único da engine de renderização**, cerca de 170 MB, do repositório Maven do Google. Depois disso funciona offline.
- Dá para alternar entre claro e escuro, mudar dispositivo, densidade e orientação por uma toolbar, sem editar o manifest.
- Existe um comando `Inflate: Doctor` que mostra o que foi detectado e o que a última renderização fez. É o primeiro lugar para olhar quando algo parecer errado.

Ele é gratuito e open source sob a licença Apache-2.0. O código está [no GitHub][inflate_github], e além da [VS Code Marketplace][inflate_marketplace] ele também está publicado na [Open VSX][inflate_openvsx], então funciona em editores que não podem usar o marketplace da Microsoft.

<figure>
	<img src="/img/inflate-preview.webp" alt="Um layout XML de um projeto .NET Android aberto no VS Code, com o painel do Inflate renderizando o layout ao lado do código.">
	<figcaption>Um layout em Resources/layout, renderizado ao lado do código pelo mesmo engine que o Android Studio usa.</figcaption>
</figure>

Aí eu desinstalei o Android Studio.

## O Android SDK instalado na mão

Tirar o Android Studio levanta uma pergunta óbvia: de onde vem o Android SDK agora?

Você configura na mão, e é menos doloroso do que parece. Foi isso que eu fiz no macOS:

```sh
brew install --cask android-commandlinetools

mkdir -p "$HOME/Library/Android/sdk"

yes | sdkmanager --sdk_root="$HOME/Library/Android/sdk" \
  "cmdline-tools;latest" "platform-tools" "emulator" \
  "platforms;android-35" "build-tools;37.0.0"

yes | sdkmanager --sdk_root="$HOME/Library/Android/sdk" --licenses

brew uninstall android-commandlinetools
```

Olhe para a primeira e a última linha, porque essa parte não é enfeite. Na primeira vez que eu tentei, instalei as command line tools pelo Homebrew e depois instalei os pacotes do Android por cima, e acabei com uma instalação dividida: as ferramentas em um lugar, os pacotes em outro. Um Android SDK espalhado por dois diretórios, e nenhum caminho único para o `ANDROID_HOME` apontar.

Então eu refiz tudo de propósito. O Homebrew está ali só para dar o pontapé inicial. Eu uso o `sdkmanager` dele uma vez, com o `--sdk_root` apontando para o diretório que eu realmente quero, para instalar o `cmdline-tools;latest` e todo o resto naquele único lugar. Depois removo a cópia do Homebrew. O que sobra é um SDK autossuficiente, que se gerencia sozinho dali em diante, e um diretório só para o `ANDROID_HOME`.

A minha máquina está mais limpa do que esteve em anos. Rider, PyCharm e Android Studio, todos fora.

O Xcode continua ali, claro. A Apple não me dá escolha nessa, e não vou fingir o contrário. Embora eu vá admitir que já comecei a me perguntar se não daria para fazer as minhas contribuições no [Firefox iOS][firefox_ios] pelo VS Code também. Se você quiser saber como eu entrei nesse projeto, [escrevi sobre isso aqui][open_source_post].

## Agora, a pergunta que eu prometi

Dois posts atrás eu disse que voltaria nisso, então aqui está.

**O Inflate foi construído inteiramente com agentes de IA.** Eu usei o [Claude Code][claude_code] com a skill [TLC Spec-Driven][tlc_spec_driven], que conduz o trabalho por fases: escrever a spec, desenhar a solução, quebrar em tarefas e então implementar.

Quero ser preciso sobre o que isso significa, porque "construído com IA" carrega muita coisa nessa frase. O meu trabalho foi manter o foco no que eu realmente precisava e revisar as specs até ter certeza de que elas me levariam até lá. Todas as decisões foram minhas. O agente escreveu o código; eu decidi qual código deveria existir. Se você tiver curiosidade de ver como isso funciona na prática, os registros de decisão estão no repositório.

Então: um renderizador em cima do `layoutlib`, rodando em outro processo, para dois ecossistemas de build, com configuração de dispositivo e densidade e um comando de diagnóstico. Isso não é um script de fim de semana. E existe porque eu descrevi com cuidado e revisei com cuidado, não porque eu digitei.

Agora coloque isso ao lado da lista do post anterior.

Quase todas as extensões que eu instalei são para ler, navegar e inspecionar. Quase nenhuma delas me ajuda a escrever código. E a ferramenta que eu construí para escapar de uma IDE pesada foi ela mesma construída por um agente.

**Se a escrita está cada vez mais sendo feita por um agente, e o meu dia é principalmente ler, revisar e decidir, por que exatamente eu estava pagando por uma IDE pesada?**

Essa é a minha resposta, e eu vou definir os limites dela também. É uma pessoa, uma stack, um projeto. Eu ainda sinto falta do dotTrace e do dotMemory, e não fui atrás de substitutos. Não estou dizendo para você desinstalar nada. Muita gente tira proveito do Rider todos os dias, e essas pessoas não estão erradas.

Mas eu passei anos dizendo que um editor de código não era suficiente para desenvolver software de verdade, e eu estava errado. Talvez eu estivesse errado esse tempo todo. Talvez o trabalho tenha mudado debaixo do meu nariz e eu só tenha percebido quando um deploy quebrado me obrigou a procurar alternativas. Sinceramente não sei qual das duas, e acho isso mais interessante do que ter a resposta.

Você vê isso diferente? Me conta nos comentários. E se você trabalha com .NET Android, instala o Inflate e me conta se algo quebrou. Sério, eu quero saber 🙂.

Até o próximo post, e escolha sempre as melhores ferramentas para o seu trabalho!

[previous_post]:      /pt/rebuilding-rider-inside-vs-code/
[inflate_marketplace]: https://marketplace.visualstudio.com/items?itemName=ionixjunior.inflate
[inflate_openvsx]:    https://open-vsx.org/extension/ionixjunior/inflate
[inflate_github]:     https://github.com/ionixjunior/inflate
[claude_code]:        https://claude.com/product/claude-code
[tlc_spec_driven]:    https://agent-skills.techleads.club/skills/tlc-spec-driven/
[firefox_ios]:        https://github.com/mozilla-mobile/firefox-ios
[open_source_post]:   /pt/you-dont-need-to-be-a-senior-to-contribute-to-open-source-projects/
