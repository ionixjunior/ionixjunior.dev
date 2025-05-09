+++
title = "Swift Essentials: Protocolos, Extensões e Opcionais (Parte 4)"
date = 2024-08-02
type = "post"
slug = "swift-essentials-protocols-extensions-and-optionals-part-4"
translationKey = "swift-essentials-protocols-extensions-and-optionals-part-4"
categories = ["TODO"]
tags = ["100DaysOfSwiftUI"]
social_image: "swift-essentials-protocols-extensions-and-optionals-part-4.pt.webp"
+++

<p class="intro"><span class="dropcap">V</span>oltamos com os posts da série "100 Dias De SwiftUI"! No post de hoje, continuaremos a saga dos Fundamentos do Swift, explorando protocolos, extensões e opcionais. Esta será a parte final sobre os Fundamentos do Swift. Vamos começar.</p>

## O que é um Protocolo?

Para simplificar: protocolos são como interfaces. Não tenho certeza porque a Apple mudou a terminologia, mas é isso. No mundo Apple, você verá isso com frequência, já que grande parte do desenvolvimento iOS é baseado em programação orientada a protocolos (POP).

### Como Criar um Protocolo

Criar um protocolo é muito simples. Basta usar a palavra-chave `protocol` e escolher um nome. Por convenção, escolhi adicionar o sufixo `Protocol`. Pensando agora, é meio redundante. Acho que ainda estou um pouco contagiado com as convenções do DotNet. Enfim, vamos ver:

{%- highlight swift -%}
protocol SearchProtocol {
    func search(text: String)
}
{%- endhighlight -%}

Este código define um protocolo chamado `SearchProtocol`. Este protocolo exige que quem o implementar, implemente uma função `search(text:)`, que presumivelmente executaria algum tipo de operação de pesquisa usando o texto fornecido como entrada. Então, como o usamos?

### Como Usar um Protocolo

Aqui está como você pode usar este protocolo:

{%- highlight swift -%}
struct YourStruct: SearchProtocol {
    func search(text: String) {
        print("Pesquisando por: \(text)")
    }
}
{%- endhighlight -%}

`YourStruct` está em conformidade com `SearchProtocol` e fornece sua própria implementação para a função `search(text:)`. Como mencionado anteriormente, é o mesmo conceito de interfaces. 

Isso é muito importante no iOS, então vamos explorar um exemplo um pouco diferente. Suponha que precisemos criar um pequeno componente para representar algum tipo de elemento de interface de usuário de pesquisa, como este:

{%- highlight swift -%}
import SwiftUI

struct SearchComponent: View {
    @State private var text: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("O que você está procurando?")

            TextField("Digite aqui", text: $text)
                .onChange(of: text) { oldValue, newValue in
                    print(newValue)
                }
        }
    }
}
{%- endhighlight -%}

Aqui temos uma visualização com um `TextField` e estamos monitorando as alterações usando o evento `onChange` e capturando o texto digitado dentro dele usando a função `print`. Funciona. Agora podemos usá-lo em uma tela, assim:

{%- highlight swift -%}
import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack {
            SearchComponent()
            Spacer()
        }
    }
}
{%- endhighlight -%}

O componente é exibido corretamente, mas como podemos obter o valor digitado dentro do `TextField`? Podemos usar protocolos e delegates. É muito comum no iOS usarmos essa abordagem para obter uma implementação desacoplada. Em vez da visualização conhecer todos os detalhes sobre o componente, nós apenas o tornamos compatível com o protocolo `SearchComponent` e o usamos. Vamos ver como.

Coloquei o protocolo próximo ao componente, criei uma propriedade opcional no componente e substituí a chamada da função `print` pela chamada da função de protocolo por meio do delegate.

{%- highlight swift -%}
import SwiftUI

protocol SearchProtocol {
    func search(text: String)
}

struct SearchComponent: View {
    // restante do código

    var delegate: SearchProtocol?

    var body: some View {
        // restante do código

        TextField("Digite aqui", text: $text)
            .onChange(of: text) { oldValue, newValue in
                delegate?.search(text: newValue)
            }

        // restante do código
    }
}
{%- endhighlight -%}

Agora posso voltar para a visualização, torná-la compatível com o protocolo e passar o parâmetro delegate ao criar a instância do componente.

{%- highlight swift -%}
import SwiftUI

struct SearchView: View, SearchProtocol {
    var body: some View {
        // restante do código

        SearchComponent(delegate: self)

        // restante do código
    }

    func search(text: String) {
        print(text)
    }
}
{%- endhighlight -%}

Agora podemos obter os valores digitados no componente aqui na tela, mantendo baixo acoplamento entre eles.

Este padrão é muito comum ao trabalhar com `UITableView` no iOS. Ele usa protocolos para manter o componente fácil de usar e reutilizável.

Vamos continuar falando sobre extensões.

## O que é uma Extensão?

Extensões são uma maneira fácil de adicionar mais funcionalidades ao seu código. As extensões em Swift são muito poderosas porque você pode criá-las até mesmo para tipos primitivos. Vamos explorar isso.

### Como Criar uma Extensão

Em Swift, é muito simples criar uma. Você usa a palavra-chave `extension` seguida pelo nome do tipo que você deseja estender. O tipo `String` possui uma propriedade chamada `isEmpty` e, às vezes, queremos criar uma expressão para validar se uma string não está vazia. Podemos fazer isso de três maneiras:

1. Usar `suaVariavelString.isEmpty == false`.
2. Usar `!suaVariavelString.isEmpty`.
3. Criar uma extensão, escolhendo uma das opções acima.

{%- highlight swift -%}
extension String {
    var isNotEmpty: Bool {
        return self.isEmpty == false
    }
}
{%- endhighlight -%}

Agora você pode usar `suaVariavelString.isNotEmpty`. Esta é uma propriedade de extensão, mas você também pode criar funções de extensão. Funciona da mesma forma, mesmo para tipos primitivos, como você pode ver acima.

## O que é um Opcional?

Em Swift, os opcionais são uma proteção poderosa contra um problema notório de codificação: o temido erro "unexpectedly found nil", ou algo do tipo. Mas o que são opcionais e por que são tão importantes?

Imagine uma variável como um contêiner. Uma variável regular deve sempre conter um valor do tipo declarado. Um opcional, no entanto, introduz a possibilidade de vazio. É como um contêiner que pode conter um valor ou ser explicitamente marcado como vazio, um estado representado pela palavra-chave `nil`.

Essa "nulabilidade" é incrivelmente valiosa. Por exemplo, ao buscar dados de um servidor ou do dispositivo de um usuário, não há garantia de que a operação sempre será bem-sucedida. Os opcionais lidam com esses cenários com elegância.

Considere uma função que tenta converter uma string em um inteiro:

{%- highlight swift -%}
func convertToInt(from text: String) -> Int? {
    return Int(text)
}
{%- endhighlight -%}

O tipo de retorno `Int?` significa que esta função pode retornar um inteiro ou pode retornar `nil` se a conversão falhar (por exemplo, ao tentar converter "hello" em um inteiro). Vamos explorar como acessar com segurança um valor opcional.

### if let

Para acessar com segurança o valor potencial dentro de um opcional, você usa mecanismos de "desempacotamento". Uma maneira comum é usar `if let`:

{%- highlight swift -%}
let userInput = "123"
if let number = convertToInt(from: userInput) {
    print("O número é \(number)")
} else {
    print("Entrada inválida")
}
{%- endhighlight -%}

Aqui, `number` só recebe um valor se `convertToInt` for bem-sucedido. Caso contrário, o bloco `else` é executado, evitando falhas ao tentar usar um valor inexistente.

### guard let

Você pode verificar a "nulabilidade" de diferentes maneiras. Por exemplo, você pode usar `guard let`. Essa abordagem é melhor de usar quando você precisa criar uma instrução de retorno antecipado.

{%- highlight swift -%}
let userInput = "123"

func yourFunction() {
    guard let number = convertToInt(from: userInput) else {
        print("Entrada inválida")
        return
    }

    print("O número é \(number)")
}

yourFunction()
{%- endhighlight -%}

### Nil Coalescing

Nil Coalescing fornece uma maneira concisa e elegante de lidar com valores opcionais, fornecendo um valor padrão quando um opcional é `nil`.

Aqui está um exemplo simples:

{%- highlight swift -%}
let userInput = "hello"
let convertedValue = convertToInt(from: userInput)
print(convertedValue ?? "valor vazio")
{%- endhighlight -%}

Como resultado, a função `print` exibirá "valor vazio" porque `convertedValue` é um opcional sem valor.

### Encadeamento Opcional

O encadeamento opcional, ou "optional chaining", atua como uma proteção cuidadosa quando você está acessando dados que podem estar ausentes no seu código Swift. Imagine que você está seguindo um mapa do tesouro com instruções como "Vá até o carvalho velho, verifique embaixo da pedra solta e você encontrará o prêmio!" Mas e se a árvore não estiver lá, a pedra estiver faltando ou o prêmio já tiver sido levado? No código, quando tentamos acessar algo que não existe, recebemos um erro fatal, mas usar o encadeamento opcional impede que isso aconteça. Vejamos o exemplo anterior, onde mostrei os protocolos:

{%- highlight swift -%}
import SwiftUI

protocol SearchProtocol {
    func search(text: String)
}

struct SearchComponent: View {
    // restante do código

    var delegate: SearchProtocol?

    var body: some View {
        // restante do código

        TextField("Digite aqui", text: $text)
            .onChange(of: text) { oldValue, newValue in
                delegate?.search(text: newValue)
            }

        // restante do código
    }
}
{%- endhighlight -%}

Na linha `delegate?.search(text: newValue)`, estamos acessando o método `search` da propriedade `delegate`, mas ele só será chamado se a propriedade realmente contiver um valor.

Os opcionais, embora inicialmente pareçam uma camada extra de complexidade, são bem importantes no Swift. Eles incentivam você a pensar e lidar com situações em que os dados podem estar ausentes, levando a aplicativos mais robustos e resistentes a falhas.

## Conclusão

Ao chegarmos ao final de nossa exploração, fica claro que protocolos, extensões e opcionais formam um trio poderoso no mundo da programação Swift.

**Protocolos**, com sua natureza de modelo, permitem definir um comportamento consistente em diferentes tipos, promovendo a capacidade de reutilização e manutenção do código. Eles trazem ordem ao caos, garantindo que seu código siga um padrão comum.

**Extensões**, como artesãos qualificados, adicionam funcionalidade e elegância a tipos existentes sem exigir acesso a seus modelos originais. Eles aprimoram e estendem, tornando seu código mais expressivo e adaptável.

**Opcionais**, os guardiões sempre vigilantes, equipam você para lidar com a incerteza de dados ausentes. Eles guiam seu código com elegância por armadilhas potenciais, evitando falhas e promovendo a resiliência diante do desconhecido.

Juntos, este trio dinâmico permite que você escreva código Swift mais seguro, limpo e flexível. Abrace seus pontos fortes, experimente suas possibilidades e veja como seu código se transforma em uma obra-prima de clareza e robustez.

Até o próximo post!