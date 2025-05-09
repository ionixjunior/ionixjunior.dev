+++
title = "Swift Essentials: Variáveis, Tipos de Dados e Mais (Parte 1)"
date = 2024-07-05
type = "post"
slug = "swift-essentials-variables-data-types-and-more-part-1"
translationKey = "swift-essentials-variables-data-types-and-more-part-1"
categories = ["TODO"]
tags = ["100DaysOfSwiftUI"]
social_image: "swift-essentials-variables-data-types-and-more-part-1.pt.webp"
+++

<p class="intro"><span class="dropcap">E</span>stou focando no desafio "100 Days of SwiftUI" do Paul Hudson, e estou animado por estar nessa jornada. Mas antes de poder criar aplicativos iOS incríveis, sei que construir uma base sólida em Swift é crucial. Esta série de posts, que estou chamando de "100DaysOfSwiftUI" (criativo, não? rsrs), é a minha maneira de compartilhar minha jornada de aprendizado com vocês, especialmente aqueles que estão começando com Swift. Exploraremos juntos o que é fundamental entender dessa linguagem poderosa. Nesta primeira parte, abordaremos os conceitos básicos de variáveis, tipos de dados, interpolação de strings e enums. Esses elementos aparentemente simples são os pilares sobre os quais construiremos aplicativos mais complexos e poderosos em SwiftUI. Então, prepare-se, pegue seu café (ou sua bebida preferida!) e embarquemos juntos nessa jornada! Abordaremos os fundamentos de forma clara e envolvente, e no final, você terá um bom domínio dos conceitos básicos que o capacitarão a começar a criar seus próprios aplicativos iOS.</p>

Se você não conhece o [100 Days of SwiftUI][100_days_of_swiftui], confira este link.

## Variáveis e Constantes: Armazenando Dados com Flexibilidade e Imutabilidade

No mundo da programação, muitas vezes precisamos armazenar dados. Temos duas ferramentas principais para isso: **variáveis** e **constantes**. Ambas atuam como recipientes para dados, mas diferem em sua flexibilidade:

### Variáveis: As Mutáveis

Variáveis são como caixas rotuladas em nosso código que armazenam dados que podem ser modificados. Usamos a palavra-chave `var` para declarar uma variável:

{%- highlight swift -%}
var name = "Laura"
{%- endhighlight -%}

Podemos mudar o valor de `name` em qualquer ponto do nosso código:

{%- highlight swift -%}
name = "Laura Smith"
{%- endhighlight -%}

Agora, `name` contém o valor "Laura Smith".

### Constantes: As Imutáveis

Constantes são como recipientes selados. Depois de definir uma constante, seu valor não pode ser alterado. Usamos a palavra-chave `let` para declarar uma constante:

{%- highlight swift -%}
let name = "Laura"
{%- endhighlight -%}

Isso define `name` para o valor "Laura", e não podemos atribuir um valor diferente a ele posteriormente.

Constantes são úteis para evitar alterações acidentais em valores importantes, garantindo a integridade dos dados. Elas também tornam seu código mais claro e previsível, pois os valores que elas armazenam são fixos.

Então, leve isso em consideração ao decidir como usar variáveis e constantes em seu código.

## Tipos de Dados: Definindo a Natureza dos Dados

Na programação, precisamos de uma maneira de categorizar os tipos de dados que nossas variáveis e constantes podem conter. Essas categorias são chamadas de **tipos de dados**.

Pense nos tipos de dados como definindo a "natureza" ou "essência" dos dados. Eles dizem ao Swift como interpretar e manipular as informações. Aqui estão alguns tipos de dados essenciais em Swift:

### String: Para Dados Textuais

O tipo de dados `String` representa informações textuais. Ele é usado para armazenar qualquer coisa que possa ser escrita ou exibida, como nomes, endereços, frases e até mesmo código.

{%- highlight swift -%}
let name = "Laura"
var message = "Olá!"
{%- endhighlight -%}

### Int: Para Números Inteiros

O tipo de dados `Int` representa números inteiros, como 1, 10, 25, 1000 e assim por diante. Inteiros são comumente usados em contadores, cálculos e para representar quantidades.

{%- highlight swift -%}
let age = 30
var numberOfItems = 5
{%- endhighlight -%}

### Float, Double e Decimal: Representando Números com Precisão

Em Swift, temos três tipos de dados principais para representar números com casas decimais: `Float`, `Double` e `Decimal`. Embora todos eles manipulem valores fracionários, eles diferem em sua precisão e uso de memória:

#### Float: Precisão Mais Baixa, Faixa Menor

`Float` usa 32 bits de memória para armazenar seu valor, oferecendo uma faixa menor de valores e menos precisão do que `Double`. É geralmente usado quando a eficiência de memória é uma prioridade e uma precisão mais baixa é aceitável.

{%- highlight swift -%}
let floatNumber: Float = 0.00001 
{%- endhighlight -%}

#### Double: Alta Precisão, Faixa Grande

`Double` é a escolha mais comum para representar números de ponto flutuante em Swift. Ele fornece alta precisão, tornando-o adequado para cálculos que exigem uma ampla gama de valores. `Double` usa 64 bits de memória para armazenar seu valor, o dobro do tamanho do `Float`.

{%- highlight swift -%}
let doubleNumber: Double = 0.00001
{%- endhighlight -%}

#### Decimal: Alta Precisão, Cálculos Financeiros

`Decimal` é especializado no tratamento de cálculos financeiros onde a precisão é primordial. Ele oferece alta precisão, especialmente para números com um grande número de casas decimais. No entanto, ele é menos eficiente computacionalmente do que `Double` ou `Float` devido ao seu foco em precisão. `Decimal` é uma representação numérica de base 10 que fornece alta precisão, permitindo que você armazene muitos números.

Para criar um valor `Decimal`, você pode usar a seguinte sintaxe:

{%- highlight swift -%}
let decimalNumber: Decimal = 0.00001
{%- endhighlight -%}

#### Anotações de Tipo

Como você pode ver nos exemplos acima, há apenas uma palavra-chave que mudou nesses exemplos: o tipo. Aqui, o tipo define o tipo de valor numérico que você irá armazenar. Isso é chamado de "anotações de tipo", ou "Type Annotations" em Inglês, e você pode usá-lo para todos os tipos de dados ou estruturas.

Você pode criar um valor numérico simplesmente criando uma variável e atribuindo um valor, mas ele será criado como um tipo `Double` por padrão.

### Bool: Para Valores Lógicos

O tipo de dados `Bool` representa valores booleanos, que podem ser `true` ou `false`. Bools são fundamentais para a tomada de decisões em seu código, ajudando você a criar instruções condicionais e expressões lógicas.

{%- highlight swift -%}
let isAdmin = true
var hasError = false
{%- endhighlight -%}

## Arrays, Dicionários e Sets

Até agora, exploramos tipos de dados para valores individuais: strings, números, booleanos. Mas, muitas vezes, precisamos armazenar coleções de dados - vários valores relacionados uns aos outros. É aí que arrays, dicionários e sets (conjuntos) se tornam úteis.

### Arrays: Coleções Ordenadas de Valores

Arrays são listas ordenadas de elementos do mesmo tipo de dados. Pense nelas como caixas numeradas onde você pode armazenar uma coleção de itens relacionados. Você acessa elementos em uma array pelo seu índice, começando do zero.

{%- highlight swift -%}
let cities = ["Barcelona", "Londres", "São Paulo"]
print(cities[0]) // Output: Barcelona (primeiro elemento)
print(cities[2]) // Output: São Paulo (terceiro elemento)
{%- endhighlight -%}

Arrays são úteis quando você precisa de uma lista ordenada de elementos do mesmo tipo.

### Dicionários: Pares Chave-Valor

Dicionários são coleções não ordenadas de pares chave-valor. Cada chave é única e mapeia para um valor correspondente. Pense em dicionários como um dicionário do mundo real, onde cada palavra (chave) tem uma definição (valor).

{%- highlight swift -%}
let userData = ["name": "Laura", "surname": "Smith", "city": "Londres"]
print(userData["name"]) // Output: Optional("Laura")
print(userData["city"]) // Output: Optional("Londres")
{%- endhighlight -%}

Dicionários são úteis quando você precisa armazenar e recuperar dados com base em chaves exclusivas.

### Sets: Coleções Únicas e Não Ordenadas

Sets são coleções não ordenadas de elementos únicos. Eles não permitem duplicatas, tornando-os úteis para verificar a associação e remover duplicatas de uma coleção.

{%- highlight swift -%}
let uniqueNames = Set(["Laura", "Josh", "Laura", "Marie", "Josh"])
print(uniqueNames.count) // Output: 3 (removido os duplicados)
{%- endhighlight -%}

Sets são úteis quando você precisa trabalhar com valores únicos ou quando deseja verificar a associação rapidamente - essa estrutura é muito rápida.

## Enums: Definindo Valores Relacionados

Enums, abreviação de enumerações, são uma maneira poderosa de definir um tipo personalizado que representa um conjunto de valores relacionados. Eles fornecem uma maneira mais estruturada e legível de representar escolhas ou estados em seu código, em comparação com o uso de inteiros brutos.

Pense em enums como a criação de um vocabulário de termos específicos relacionados a um conceito particular. Por exemplo, imagine que você está construindo um aplicativo que lida com o status do pedido. Em vez de usar inteiros brutos como 0, 1 e 2, você pode criar um enum para representar os estados do pedido:

{%- highlight swift -%}
enum OrderStatus {
    case pending
    case processing
    case shipped
    case delivered 
    case cancelled
}
{%- endhighlight -%}

Agora, em vez de usar números, você pode usar diretamente os valores do enum:

{%- highlight swift -%}
var orderStatus = OrderStatus.pending 
print(orderStatus) // Output: OrderStatus.pending
{%- endhighlight -%}

Enums melhoram a legibilidade. Eles tornam seu código mais autodocumentado e mais fácil de entender. Eles também impõem segurança de tipo, evitando que você atribua acidentalmente valores incorretos.

## Coisas Legais

### Interpolação de String

Uma maneira fácil de concatenar strings sem usar "+" é usar a interpolação:

{%- highlight swift -%}
let name = "Laura"
let surname = "Smith"
print("A pessoa vencedora é \(name) \(surname)!")
{%- endhighlight -%}

### Strings de Múltiplas Linhas

Às vezes, precisamos criar uma string de várias linhas, e isso é muito fácil em Swift. Você apenas usa aspas triplas e escreve sua string dentro delas. Apenas certifique-se de que as aspas triplas sejam declaradas em uma linha diferente da string.

{%- highlight swift -%}
var multilineMessage = """
Esta é a mensagem de várias linhas.
Você pode adicionar muitas linhas.
Não se preocupe com isso!
"""
{%- endhighlight -%}

### Bools e a Função Toggle

Quando você cria uma variável, pode mudar seu valor depois. Então, podemos criar um valor booleano e alterá-lo usando a função `toggle`.

{%- highlight swift -%}
var isAdmin = false
print(isAdmin) // Output: false

isAdmin.toggle()
print(isAdmin) // Output: true
{%- endhighlight -%}

### Dicionário e a propriedade default

Como você pode ver no exemplo de dicionário, quando acessamos a chave, obtemos um opcional. Isso ocorre porque Swift não pode garantir que haja um valor nessa chave. Por causa disso, Swift nos fornece um opcional. Você pode lidar com isso usando uma propriedade chamada `default`. Dessa forma, você não recebe um opcional, e seu código não será interrompido se você lidar com o opcional de forma inadequada.

{%- highlight swift -%}
let userData = ["name": "Laura", "surname": "Smith", "city": "Londres"]
print(userData["name"]) // Output: Optional("Laura")
print(userData["name", default: "Unknown"]) // Output: Laura
print(userData["nickname", default: "Unknown"]) // Output: Unknown
{%- endhighlight -%}

## Conclusão

Vimos vários assuntos nesta primeira parte do "100DaysOfSwiftUI"! Exploramos variáveis, constantes, tipos de dados, interpolação de strings, enums e alguns tipos de coleção. Esses conceitos são essenciais para entender como os dados são armazenados, manipulados e usados em seu código.

Compreender esses fundamentos é como ter uma base sólida sobre a qual você pode construir estruturas mais complexas em sua jornada SwiftUI. Imagine-os como os tijolos e a argamassa que compõem as paredes de seus aplicativos iOS.

Eu o encorajo a praticar esses conceitos, experimentar exemplos diferentes e não hesite em fazer perguntas. Compartilhe seus pensamentos e experiências nos comentários abaixo!

Fique ligado(a) na próxima parte, e vamos continuar evoluindo nosso conhecimento em Swift juntos!

[100_days_of_swiftui]: https://www.hackingwithswift.com/100/swiftui