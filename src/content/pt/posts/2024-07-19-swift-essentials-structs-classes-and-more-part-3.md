+++
title = "Swift Essentials: Structs, Classes e Mais (Parte 3)"
date = 2024-07-19
tags: ["100DaysOfSwiftUI"]
social_image: "swift-essentials-structs-classes-and-more-part-3.pt.webp"
+++

<p class="intro"><span class="dropcap">N</span>as duas primeiras partes do "100DaysOfSwiftUI", exploramos os blocos de construção fundamentais do Swift - variáveis, tipos de dados, fluxo de controle, loops, funções e closures. Agora, estamos prontos para mergulhar em um aspecto crucial da programação Swift: structs e classes. Essas ferramentas poderosas permitem que criemos estruturas de dados personalizadas que organizam e representam objetos do mundo real em nosso código. Entender structs e classes é essencial para construir aplicativos complexos e modulares em SwiftUI, e elas o capacitarão a criar aplicativos iOS mais poderosos e robustos. Vamos aprender sobre isso!</p>

## Structs: Tipos de Valor

Structs em Swift são tipos de valor que permitem que você crie estruturas de dados personalizadas. Imagine-as como blueprints para criar seus próprios contêineres de dados exclusivos, semelhante a como você projetaria um blueprint para uma casa. Blueprint para uma casa seria como uma planta baixa, onde você discrimina todas as características estruturais que ela vai ter.

Pense em structs como "caixas" que armazenam informações relacionadas. Cada caixa possui compartimentos específicos (propriedades) para armazenar diferentes tipos de dados, e você pode definir ações (métodos) que podem ser executadas nos dados dentro da caixa. Agora vamos entender como criar structs.

### Definição Básica de Struct

Para definir uma struct, usamos a palavra-chave `struct` seguida do nome da struct:

{%- highlight swift -%}
struct User {
    // Propriedades e métodos aqui
}
{%- endhighlight -%}

Vamos criar uma struct `User` para representar um perfil de usuário:

{%- highlight swift -%}
struct User {
    var firstName: String
    var lastName: String
}
{%- endhighlight -%}

Isso define uma struct `User` com duas propriedades: `firstName` e `lastName`.

### Propriedades Armazenadas

Propriedades armazenadas armazenam dados dentro de uma struct. Elas funcionam como variáveis dentro da struct. As propriedades mostradas acima são propriedades armazenadas.

{%- highlight swift -%}
let userLaura = User(firstName: "Laura", lastName: "Campbell")
{%- endhighlight -%}

### Propriedades Computadas

Propriedades computadas ou calculadas não armazenam valores diretamente. Em vez disso, elas calculam e retornam um valor com base em outras propriedades.

{%- highlight swift -%}
struct User {
    var firstName: String
    var lastName: String

    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}

let userLaura = User(firstName: "Laura", lastName: "Campbell")
print(userLaura.fullName) // Output: Laura Campbell
{%- endhighlight -%}

Esta struct `User` agora possui uma propriedade computada `fullName` que retorna a concatenação de `firstName` e `lastName`.

Propriedades computadas são muito usadas no SwiftUI, principalmente em views.

### Observadores de Propriedade (didSet, willSet)

Observadores de propriedade permitem que você execute ações sempre que o valor de uma propriedade muda. Temos dois:

- `didSet`: Este observador é chamado depois que o valor de uma propriedade muda.
- `willSet`: Este observador é chamado antes que o valor de uma propriedade mude.

{%- highlight swift -%}
struct User {
    var firstName: String
    var lastName: String {
        willSet {
            print("O novo valor é \(newValue)")
        }

        didSet {
            print("O valor antigo é \(oldValue)")
        }
    }
}

var userLaura = User(firstName: "Laura", lastName: "Campbell")
userLaura.lastName = "Johnson"

// Output:
// O novo valor é Johnson
// O valor antigo é Campbell
{%- endhighlight -%}

`newValue` e `oldValue` são fornecidos automaticamente pelo Swift ao usar esses observadores de propriedade. Você pode usar isso para desenvolver algo reativo. Mas tenha cuidado, pois seu código pode ficar lento com muitas ações em uma propriedade simples chamada várias vezes.

### Inicializadores Membro a Membro (Construtor Padrão)

Structs recebem automaticamente um inicializador membro a membro. Em português esse nome é meio estranho, mas em inglês é chamado de "memberwise initializer". Isso é um inicializador padrão que permite que você crie instâncias fornecendo valores para todas as propriedades. Como mostrado anteriormente, não criamos nenhum construtor para a struct, mas fomos capazes de inicializar o objeto e colocar valores dentro.

### Inicializadores Personalizados

Podemos criar nossos próprios inicializadores personalizados para structs para controlar a criação de instâncias com base em parâmetros específicos.

{%- highlight swift -%}
struct User {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName.uppercased()
        self.lastName = lastName.uppercased()
    }
}
{%- endhighlight -%}

Aqui, criamos um inicializador personalizado que recebe os mesmos parâmetros do inicializador membro a membro. No entanto, podemos adicionar lógica ou validação adicionais dentro do inicializador antes de atribuir valores às propriedades. Se você criar um inicializador personalizado, precisa garantir que todas as propriedades sejam inicializadas com um valor.

### Métodos Mutantes

Métodos que modificam as propriedades de uma struct precisam da palavra-chave `mutating`.

{%- highlight swift -%}
struct User {
    var firstName: String
    var lastName: String

    mutating func changeLastName(to newLastName: String) {
        lastName = newLastName
    }
}

var userLaura = User(firstName: "Laura", lastName: "Campbell")
userLaura.changeLastName(to: "Johnson")
print(userLaura.lastName) // Output: Johnson
{%- endhighlight -%}

Aqui, `changeLastName` modifica a propriedade `lastName`, por isso precisa ser marcado como `mutating`.

Structs são incrivelmente úteis para criar tipos de dados personalizados, e entender seus recursos é crucial para construir código bem organizado e eficiente em Swift. Na próxima seção, mergulharemos em classes, outra ferramenta poderosa para representar dados e comportamento em Swift.

## Classes: Tipos de Referência

Classes em Swift são como blueprints para criar objetos que representam entidades do mundo real. Elas são semelhantes a structs no sentido de que podem conter propriedades e métodos, mas possuem algumas diferenças cruciais. Classes são **tipos de referência**, o que significa que são passadas como referências (ponteiros) em vez de cópias. Isso tem implicações significativas para como elas se comportam.

Vamos explorar classes em mais detalhes para entender algumas diferenças.

### Definição Básica de Classe

Para definir uma classe, usamos a palavra-chave `class` seguida do nome da classe. Vou usar o mesmo exemplo de struct `User` que mostrei anteriormente.

{%- highlight swift -%}
class User {

}
{%- endhighlight -%}

Vamos adicionar algumas propriedades.

{%- highlight swift -%}
class User {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName.uppercased()
        self.lastName = lastName.uppercased()
    }
}
{%- endhighlight -%}

Observe que agora precisamos especificar o método inicializador. Diferentemente de structs, o Swift não cria inicializadores membro a membro para classes.

### Herança

A herança permite que criemos subclasses que herdam propriedades e métodos de superclasses. Isso promove a reutilização de código e reduz a redundância.

{%- highlight swift -%}
class AdminUser: User {
    var canDeleteAccount: Bool

    init(firstName: String, lastName: String, canDeleteAccount: Bool) {
        self.canDeleteAccount = canDeleteAccount
        super.init(firstName: firstName, lastName: lastName)
    }
}
{%- endhighlight -%}

Neste exemplo, `AdminUser` herda de `User`. Ele possui sua própria propriedade (canDeleteAccount) e sobrescreve o inicializador para receber um parâmetro `canDeleteAccount` adicional.

Observe que estamos usando um inicializador para classe de herança com `super.init`.

### Métodos

Diferentemente de structs, as classes não precisam ser marcadas com a palavra-chave `mutating` para modificar alguma propriedade.

{%- highlight swift -%}
class User {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func changeLastName(to newLastName: String) {
        lastName = newLastName
    }
}

var userLaura = User(firstName: "Laura", lastName: "Campbell")
userLaura.changeLastName(to: "Johnson")
print(userLaura.lastName) // Output: Johnson
{%- endhighlight -%}

### Desinicializadores

Desinicializadores (`deinit`) são chamados quando uma instância de uma classe está prestes a ser desalocada da memória. Algumas linguagens chamam isso de destrutores.

{%- highlight swift -%}
class User {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    deinit {
        print("\(firstName) está sendo desalocado.")
    }
}
{%- endhighlight -%}

Para ver isso em ação, tente usar o playground e criar este objeto em um loop. Você verá que, quando o contexto da classe termina, o `deinit` será chamado.

{%- highlight swift -%}
for index in 1...3 {
    var userLaura = User(firstName: "Laura \(index)", lastName: "Campbell")
    print(userLaura.lastName)
}

// Output:
// Campbell
// Laura 1 está sendo desalocado.
// Campbell
// Laura 2 está sendo desalocado.
// Campbell
// Laura 3 está sendo desalocado.
{%- endhighlight -%}

Classes são ferramentas poderosas para construir aplicativos complexos e orientados a objetos em Swift. Elas permitem que você modele entidades do mundo real, promova a reutilização de código por meio da herança e gerencie o ciclo de vida do objeto. Mas acredito que você está pensando agora: quando devo usar uma struct ou uma classe?

## Struct ou Classe?

Vou tentar simplificar: use uma struct quando quiser criar contêineres de dados simples que sejam copiados e permaneçam imutáveis. Use uma classe quando quiser criar objetos complexos que são referenciados e modificados, e quando a herança for necessária.

| Feature | Struct (Tipo de Valor) | Classe (Tipo de Referência) |
|---|---|---|
| **Copiar** | Cópias são feitas quando passadas como argumentos ou atribuídas a novas variáveis | As referências são passadas, então as alterações afetam o objeto original |
| **Mutabilidade** | As propriedades são imutáveis por padrão. A palavra-chave `mutating` é necessária para modificar propriedades dentro de métodos | As propriedades são mutáveis por padrão. Não há necessidade de `mutating` |
| **Herança** | Structs não podem herdar de outras structs ou classes | Classes podem herdar de outras classes (herança única) |
| **Contagem de Referência** | Sem contagem de referência | A contagem de referência é usada para rastrear instâncias de objeto |
| **Desinicializadores** | Structs não possuem desinicializadores | Classes podem ter desinicializadores (`deinit`) |
| **Casos de Uso Típicos** | Representando estruturas de dados simples, tipos de valor, onde a imutabilidade é preferida, estruturas de dados passadas por valor | Representando objetos complexos, tipos de referência, onde a herança ou mutabilidade é necessária, estruturas de dados passadas por referência |

Na tabela acima, mostro as principais diferenças entre cada um. Uma coisa que não mostrei ainda é sobre "copiar". Vamos ver.

No código a seguir, criei um `user1` e o copiei para um `user2`. Alterei a propriedade `user1` e imprimi ambos. Observe que os nomes são diferentes para cada um porque estamos usando uma `struct`.

{%- highlight swift -%}
struct User {
    var firstName: String

    init(firstName: String) {
        self.firstName = firstName
    }
}

var user1 = User(firstName: "Laura")
var user2 = user1
user1.firstName = "Samantha"

print(user1.firstName) // Output: Samantha
print(user2.firstName) // Output: Laura
{%- endhighlight -%}

Agora, apenas alterei uma palavra-chave: substituí `struct` por uma `class` e o resultado é diferente agora.

{%- highlight swift -%}
class User {
    var firstName: String

    init(firstName: String) {
        self.firstName = firstName
    }
}

var user1 = User(firstName: "Laura")
var user2 = user1
user1.firstName = "Samantha"

print(user1.firstName) // Output: Samantha
print(user2.firstName) // Output: Samantha
{%- endhighlight -%}

Isso ocorre devido às diferenças entre esses dois tipos. Quando você usa uma classe e passa uma referência dela, qualquer alteração afeta o objeto original, mas isso não é o mesmo para structs.

Já vimos bastante sobre structs e classes, certo? Vamos ver a próxima seção para entender sobre o controle de acesso, que ajuda a proteger seu código e garantir a integridade dos dados.

## Controle de Acesso: Protegendo Seu Código

O controle de acesso em Swift é um mecanismo que permite que você restrinja o acesso a entidades dentro do seu código, como propriedades, métodos e até mesmo tipos inteiros. Isso ajuda a garantir a integridade dos dados, evitar modificações acidentais e melhorar a organização do código.

Swift fornece alguns modificadores de acesso para controlar a visibilidade e acessibilidade de entidades:

- `public`: Acessível de qualquer lugar, incluindo outros módulos ou frameworks.
- `private`: Acessível apenas dentro do mesmo escopo onde a entidade é definida (como uma classe ou uma extensão).
- `fileprivate`: Acessível apenas dentro do mesmo arquivo-fonte onde a entidade é definida.

Além disso, para propriedades, podemos usar o modificador `private (set)` para criar propriedades apenas para leitura pública com um setter privado.

{%- highlight swift -%}
class User {
    private (set) var firstName: String

    init(firstName: String) {
        self.firstName = firstName
    }

    func deleteAccount() {
        deleteFiles()
        deleteData()
    }

    private func deleteFiles() {

    }

    fileprivate func deleteData() {

    }
}
{%- endhighlight -%}

O controle de acesso é particularmente importante no SwiftUI porque ajuda a controlar os dados e o comportamento de suas views. Ao usar modificadores de acesso com cuidado, você pode criar componentes de UI mais robustos e bem estruturados.

Este exemplo é muito simples, apenas para você entender o que é possível. Experimente criar um novo projeto de playground e explore essas possibilidades.

## Propriedades e Métodos Estáticos

Propriedades e métodos estáticos estão associados à própria struct ou classe, em vez de instâncias individuais da struct ou classe. Isso significa que eles podem ser acessados diretamente no tipo sem a necessidade de criar uma instância.

{%- highlight swift -%}
struct User {
    static var totalOfUsers = 0

    var firstName: String

    init(firstName: String) {
        self.firstName = firstName
        User.totalOfUsers += 1
    }
}

print(User.totalOfUsers) // Output: 0
var user1 = User(firstName: "Laura")
print(User.totalOfUsers) // Output: 1
var user2 = User(firstName: "Samantha")
print(User.totalOfUsers) // Output: 2
{%- endhighlight -%}

Propriedades estáticas armazenam dados que são compartilhados entre todas as instâncias de uma classe ou struct. Portanto, tenha cuidado. Além disso, os métodos também podem ser estáticos.

{%- highlight swift -%}
struct User {
    static var totalOfUsers = 0

    var firstName: String

    init(firstName: String) {
        self.firstName = firstName
        User.totalOfUsers += 1
    }

    static func describeTotalOfUsers() {
        print("Existem \(totalOfUsers) usuários criados.")
    }
}

User.describeTotalOfUsers() // Output: Existem 0 usuários criados.
var user1 = User(firstName: "Laura")
User.describeTotalOfUsers() // Output: Existem 1 usuários criados.
{%- endhighlight -%}

## Conclusão

Nesta terceira parte do "100DaysOfSwiftUI", mergulhamos no mundo de structs e classes, os blocos de construção para organizar e representar dados em Swift. Exploramos suas diferenças, aprendemos como definir propriedades, métodos e inicializadores, e descobrimos sobre o controle de acesso.

Ao dominar structs e classes, desbloqueamos novos níveis de poder e flexibilidade na programação Swift. Agora podemos modelar objetos complexos, criar código reutilizável por meio da herança e controlar o acesso a dados para melhor organização e segurança do código.

À medida que você continua sua jornada SwiftUI, lembre-se de que structs e classes são ferramentas essenciais para construir aplicativos poderosos e fáceis de manter. Elas fornecem uma abordagem estruturada para organizar seu código, tornando mais fácil gerenciar, estender e modificar seus projetos. Structs são muito importantes para SwiftUI, pois são usadas maciçamente para criar views.

Agora é sua vez. Reserve um tempo para praticar e explorar tudo o que foi descrito aqui usando o playground e pratique em seus próprios projetos. Quanto mais você praticar, mais confiante você se tornará.

Fique ligado para a próxima parte da série "100DaysOfSwiftUI". Até a próxima!