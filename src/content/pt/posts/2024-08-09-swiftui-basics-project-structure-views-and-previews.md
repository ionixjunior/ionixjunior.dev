+++
title = "Fundamentos do SwiftUI: Estrutura do Projeto, Views e Previews"
date = 2024-08-09
categories = ["TODO"]
tags = ["100DaysOfSwiftUI"]
social_image: "swiftui-basics-project-structure-views-and-previews.pt.webp"
+++

<p class="intro"><span class="dropcap">E</span>ste é mais um artigo da série "100 Dias de SwiftUI". No post de hoje, vamos embarcar em uma jornada básica, mas importante: entender a estrutura central de um aplicativo SwiftUI. Vamos desmistificar a configuração do projeto Xcode e explorar os blocos de construção essenciais de toda obra-prima SwiftUI. Vamos começar!</p>

## Criando um Novo Projeto SwiftUI

Criar um novo projeto SwiftUI é muito simples. Basta abrir o Xcode e clicar na opção "Criar Novo Projeto". Outra maneira é pressionar o atalho `CMD + SHIFT + N`.

<figure>
	<img src="/assets/img/xcode-create-new-project.webp" alt="Tela de boas-vindas do Xcode com “Criar Novo Projeto…” destacado."> 
	<figcaption>Abra o Xcode e inicie um novo projeto.</figcaption>
</figure>

Você verá uma tela para escolher um modelo para seu novo projeto. Selecione o menu "Multiplataforma" e, em seguida, a opção "App" na seção "Aplicativo". A opção multiplataforma garantirá que você crie um novo aplicativo SwiftUI compatível com outras plataformas. Pressione "Próximo".

<figure>
	<img src="/assets/img/xcode-select-multiplatform-app-template.webp" alt="Janela de seleção de modelo de projeto Xcode com o modelo “App” selecionado."> 
	<figcaption>Escolha o modelo "App" na guia multiplataforma.</figcaption>
</figure>

Você verá uma tela para escolher algumas opções para seu novo projeto. Vamos ver sobre eles:

- **Nome do Produto**: Este é o nome do seu projeto. Pense bem, pois ele também será usado no identificador do pacote.
- **Equipe**: Esta é a sua equipe de conta de desenvolvedor Apple. Para um novo aplicativo "hello world", basta mantê-lo como "Nenhum".
- **Identificador da Organização**: Aqui está o prefixo do pacote do seu aplicativo. Na minha máquina, o pacote padrão é "dev.ionixjunior" e você pode alterá-lo para seus aplicativos.
- **Identificador do Pacote**: Este é o resultado do identificador da sua organização e o nome do produto.
- **Armazenamento**: Nesta opção, você pode selecionar se deseja usar o Core Data ou o SwiftData. Basta mantê-lo como "Nenhum".

Além disso, existem mais duas caixas de seleção: "Hospedar no CloudKit" e "Incluir Testes". Certifique-se de que estejam desmarcados e clique em "Próximo". Eu defini o nome do produto do meu aplicativo como "Sample App".

<figure>
	<img src="/assets/img/xcode-set-project-name-swiftui.webp" alt="Opções do projeto Xcode com o campo “Nome do Produto” destacado."> 
	<figcaption>Dê um nome ao seu projeto.</figcaption>
</figure>

Agora, você precisa escolher o local onde salvar seu novo projeto. Se você deseja criar um repositório Git local em sua máquina, selecione a opção "Criar repositório Git no meu Mac". Pressione "Criar".

<figure>
	<img src="/assets/img/xcode-create-git-repository.webp" alt="Criação do projeto Xcode com a opção “Criar repositório Git no meu Mac” marcada."> 
	<figcaption>Opcionalmente, inicialize um repositório Git para controle de versão.</figcaption>
</figure>

O projeto Xcode será aberto e falaremos sobre ele agora.

## Explorando o Espaço de Trabalho do Xcode

Quando um novo projeto SwiftUI é aberto, podemos dividir o espaço de trabalho do Xcode em cinco áreas diferentes: Área do Navegador, Área do Editor, Tela de Pré-visualização, Área do Inspetor e Área de Depuração. Vamos falar sobre cada um.

### Área do Navegador

Talvez esta seja a área mais importante do projeto, porque podemos encontrar nossos arquivos principais lá. Ele está localizado no lado esquerdo do espaço de trabalho do Xcode, como você pode ver abaixo.

<figure>
	<img src="/assets/img/xcode-navigator-area.webp" alt="Espaço de trabalho do Xcode com o Navegador de Projetos, ContentView.swift e a Tela de Pré-visualização visíveis."> 
	<figcaption>A Área do Navegador (destacada) é onde você encontra os arquivos do seu projeto.</figcaption>
</figure>

Observe que temos muitas guias localizadas nesta área - nove no total, mas a primeira está selecionada e mostra os arquivos principais do nosso novo projeto. Esta primeira guia é chamada de "Navegador de projetos" e você pode visualizar facilmente o conteúdo dela pressionando o atalho `CMD + 1`. Todas as outras guias também têm um atalho, de `CMD + 1` a `CMD + 9`, como você pode ver abaixo.

<video controls aria-labelledby="Demonstração de Atalhos da Área do Navegador do Xcode" aria-describedby="Este vídeo demonstra atalhos de teclado para alternar rapidamente entre as guias na Área do Navegador do Xcode, melhorando seu fluxo de trabalho de desenvolvimento.">
    <source src="/assets/videos/xcode-navigator-area-shortcuts.mp4" type="video/mp4">
    Seu navegador não suporta a reprodução de vídeo.
</video>

Uma visão geral rápida sobre essas guias e atalhos: 

| Guia | Atalho | Funcionalidade |
|---|---|---|
| Navegador de projetos  | `CMD + 1` | É onde os arquivos do projeto estão localizados  |
| Navegador de controle de versão  | `CMD + 2`  | É onde você pode ver informações sobre as alterações do projeto no repositório |
| Navegador de favoritos  | `CMD + 3`  | É onde você pode ver seus favoritos de código<br> Você pode adicioná-los / removê-los para encontrar facilmente algum código  |
| Navegador de localização  | `CMD + 4`  | É onde você pode fazer uma consulta de pesquisa nos arquivos do projeto  |
| Navegador de problemas  | `CMD + 5`  | É onde você pode ver os warnings do projeto  |
| Navegador de teste  | `CMD + 6`  | É onde você pode ver os testes de unidade e interface do usuário do seu projeto  |
| Navegador de depuração  | `CMD + 7`  | É onde você pode ver informações de depuração quando executa seu aplicativo e para em um ponto de interrupção  |
| Navegador de ponto de interrupção  | `CMD + 8`  | É onde você pode ver todos os pontos de interrupção do projeto (breakpoint) |
| Navegador de relatório  | `CMD + 9`  | É onde você pode ver relatórios sobre a compilação do aplicativo, como warnings, tempo de compilação e cobertura de teste |

### Área do Editor

O coração da sua codificação. Aqui é o local onde seu código é escrito e editado.

<figure>
	<img src="/assets/img/xcode-editor-area-swiftui-code.webp" alt="Área do Editor do Xcode destacada, mostrando o código ContentView.swift."> 
	<figcaption>A Área do Editor (destacada) é onde você escreve e edita seu código SwiftUI.</figcaption>
</figure>

Para visualizar um arquivo aqui, basta ir ao navegador do projeto, escolher um arquivo e ele aparecerá na área do editor.

### Tela de Pré-visualização

Aqui podemos mostrar a mágica em tempo real das pré-visualizações do SwiftUI. Este é definitivamente um recurso matador do SwiftUI, porque ajuda muito o fluxo de trabalho de desenvolvimento, fornecendo uma prévia em tempo real da tela desenvolvida.

<figure>
	<img src="/assets/img/xcode-preview-canvas-swiftui.webp" alt="Tela de Pré-visualização do Xcode destacada, exibindo uma prévia do ContentView."> 
	<figcaption>A Tela de Pré-visualização (destacada) fornece uma visualização instantânea da sua interface do usuário.</figcaption>
</figure>

Esta prévia é muito interessante. Como você pode ver na imagem acima, ela aparece quando você digita o código `#Preview`, assim:

{%- highlight swift -%}
#Preview {
    ContentView()
}
{%- endhighlight -%}

Este código não será enviado quando você publicar seu aplicativo na Apple Store, ele só funciona em desenvolvimento. Uma coisa legal que descobri recentemente é que ele também funciona com UIKit. Ajuda muito a prototipar alguma tela ou componente de interface do usuário. Experimente!

### Área do Inspetor

Esta é uma área oculta quando você cria um novo projeto, mas você pode exibi-la clicando em um botão no canto superior direito da barra de ferramentas do Xcode. Ao abri-lo, você verá uma área contextualizada com base nos elementos de visualização selecionados.

<figure>
	<img src="/assets/img/xcode-inspector-area.webp" alt="Área do Inspetor do Xcode com as configurações do ContentView exibidas."> 
	<figcaption>Use o Inspetor para ajustar as propriedades e configurações da visualização sem codificação.</figcaption>
</figure>

Esta área contém 5 guias

| Guia | Atalho | Funcionalidade |
|---|---|---|
| Inspetor de arquivos          | `CMD + OPTION + 1` | Mostrar informações sobre o arquivo selecionado |
| Inspetor de histórico       | `CMD + OPTION + 2` | Mostrar informações sobre o histórico do projeto (commits do Git) |
| Inspetor de ajuda          | `CMD + OPTION + 3` | Mostrar informações técnicas sobre os elementos selecionados no arquivo |
| Inspetor de acessibilidade | `CMD + OPTION + 5` | Mostrar informações sobre a acessibilidade da tela <br> (Não vi esta guia funcionando até agora, então me avise se você souber como fazer isso) |
| Inspetor de atributos    | `CMD + OPTION + 4` | Mostrar informações sobre o elemento selecionado na tela |

<video controls aria-labelledby="Demonstração de Atalhos da Área do Inspetor do Xcode" aria-describedby="Este vídeo demonstra atalhos de teclado para alternar rapidamente entre as guias na Área do Inspetor do Xcode, melhorando seu fluxo de trabalho de desenvolvimento.">
    <source src="/assets/videos/xcode-inspector-area-shortcuts.mp4" type="video/mp4">
    Seu navegador não suporta a reprodução de vídeo.
</video>

### Área de Depuração

Esta é uma área dedicada para usar quando você está executando seu aplicativo. Nesta área, você pode interagir quando cria um ponto de interrupção em seu aplicativo e precisa ver valores em variáveis ou objetos. Para vê-la, clique no botão localizado no canto inferior direito e você irá visualizar uma área dividida que pode conter valores de objetos e variáveis quando você estiver executando seu aplicativo.

<figure>
	<img src="/assets/img/xcode-debug-area.webp" alt="Área de Depuração do Xcode que mostra informações do aplicativo quando ele está em execução."> 
	<figcaption>Use a Área de Depuração para ver informações quando seu aplicativo está em execução.</figcaption>
</figure>

Agora que você conhece o espaço de trabalho do Xcode, vamos explorar o código SwiftUI.

## Explorando o Código SwiftUI

Agora que você configurou seu projeto SwiftUI e entende o básico do Xcode, vamos explorar o código principal que dá vida ao seu aplicativo. Vamos ver o arquivo principal.

### Arquivo "NomeDoSeuAplicativo.swift"

Agora estou vendo que "Sample App" não foi um bom nome para o aplicativo, porque o SwiftUI cria um arquivo chamado "nome do seu aplicativo" + "App". Então, meu arquivo ficou `Sample_AppApp.swift` 😂. Mas tudo bem, sem problemas.

{%- highlight swift -%}
import SwiftUI

@main
struct Sample_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
{%- endhighlight -%}

O atributo `@main` acima da declaração da estrutura pode parecer sutil, mas é crucial. Ele sinaliza ao Xcode que essa estrutura, `Sample_AppApp`, serve como o ponto de entrada do seu aplicativo. Pense nisso como a "porta da frente" onde a execução começa.

A linha `struct Sample_AppApp: App` define o struct e o comportamento geral do seu aplicativo. Isso significa que `Sample_AppApp` está em conformidade com o protocolo `App`. Ao estar em conformidade com o `App`, você está dizendo ao SwiftUI que essa estrutura sabe como montar e gerenciar as diferentes partes do seu aplicativo.

Dentro da propriedade body da estrutura do aplicativo, você encontrará o `WindowGroup`. Este elemento poderoso determina o que os usuários veem em suas telas. 

Dentro do `WindowGroup`, você geralmente verá `ContentView()`, que cria uma instância de outra visualização SwiftUI chamada `ContentView`. Seu arquivo `ContentView.swift` (criado automaticamente pelo Xcode) é onde você começará a construir a interface do usuário real do seu aplicativo.

Em essência, o código no `Sample_AppApp.swift` prepara o terreno definindo o ponto de entrada e a visualização inicial (`ContentView`) que os usuários verão ao iniciar seu aplicativo.

Na próxima seção, vamos nos aprofundar no `ContentView.swift` e entender como que a tela é composta!

### Arquivo ContentView.swift

Vamos nos aprofundar no `ContentView.swift`. Abra-o e você verá uma estrutura semelhante a esta:

{%- highlight swift -%}
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .accessibilityLabel("hello")
                .accessibilityAction {
                    print("teste")
                }
                .accessibilityHint("Hellou")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
{%- endhighlight -%}

A linha `struct ContentView: View` declara um struct chamado `ContentView` que está em conformidade com o protocolo `View`. É assim que você cria todos os elementos visuais no SwiftUI.

O `body` é onde a mágica acontece. Esta propriedade computada é responsável por definir a aparência e o layout da sua visualização.

Dentro do `body`, você encontrará visualizações SwiftUI que compõem sua interface do usuário. O código padrão inclui visualizações simples de `Image` e `Text`.

Abaixo de `ContentView`, você notará o bloco `#Preview`. Isso habilita as incríveis visualizações ao vivo do SwiftUI usando a Tela de Pré-visualização.

Com essa base, você está no caminho certo para criar interfaces de usuário bonitas e interativas no SwiftUI. As possibilidades são ilimitadas e exploraremos algumas delas nas próximas postagens do blog.

## Conclusão

Você deu seus primeiros passos no mundo do SwiftUI e já tem um bom domínio do básico. Você sabe como configurar um novo projeto Xcode, conhece o espaço de trabalho do Xcode e entende as funções de elementos-chave como `@main`, `App`, `WindowGroup` e `ContentView`. Além disso, você experimentou a mágica das Pré-visualizações do SwiftUI, que fornecem feedback instantâneo enquanto você codifica.

Mas este é apenas o começo! Há muito mais para aprender e explorar no SwiftUI. Prepare-se para dominar as técnicas de layout, criar interfaces de usuário dinâmicas com dados e construir uma navegação suave entre diferentes partes do seu aplicativo.

Continue experimentando, divirta-se e nunca pare de aprender. As possibilidades com o SwiftUI são ilimitadas e você está no caminho certo para criar aplicativos incríveis.

Até o próximo post!