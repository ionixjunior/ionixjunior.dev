+++
title = "Swift Essentials: Loops, Closures e Mais (Parte 2)"
date = 2024-07-12
type = "post"
slug = "swift-essentials-loops-closures-and-more-part-2"
aliases = ["/swift-essentials-loops-closures-and-more-part-2"]
translationKey = "swift-essentials-loops-closures-and-more-part-2"
categories = ["mobile"]
tags = ["swift", "100 days of swift ui"]
image = "/img/cards/swift-essentials-loops-closures-and-more-part-2.pt.webp"
+++

Na primeira parte do "100DaysOfSwiftUI", exploramos os blocos de construção fundamentais do Swift - variáveis, tipos de dados e muito mais. Agora, vamos mergulhar mais fundo no fluxo de controle, loops, funções e closures. Esses são conceitos essenciais para construir aplicativos dinâmicos e interativos em SwiftUI, e eles nos ajudarão a escrever código mais poderoso e flexível. Prepare-se para liberar o verdadeiro potencial do Swift e desbloquear novas possibilidades para sua jornada de desenvolvimento iOS!

## Fluxo de Controle: Tomando Decisões e Repetindo Ações

No mundo da programação, precisamos criar código que possa responder a diferentes situações e repetir ações de forma eficiente. É aí que o fluxo de controle entra em ação. Ele nos permite tomar decisões com base em condições e executar blocos de código repetidamente com base em critérios específicos.

Vamos explorar alguns elementos-chave do fluxo de controle em Swift:

### Instruções If e Comparações

As instruções `if` são usadas para executar código apenas se uma determinada condição for verdadeira. Usamos operadores de comparação para comparar valores e determinar se uma condição é satisfeita. Os operadores de comparação comuns incluem:

- `>` (maior que)
- `<` (menor que)
- `>=` (maior que ou igual a)
- `<=` (menor que ou igual a)
- `==` (igual a)
- `!=` (diferente de)

Aqui está um exemplo simples:

```swift
let age = 25

if age >= 18 {
    print("Você é um adulto.")
}
```

Este código verifica se a variável `age` é maior ou igual a 18. Se for, a mensagem "Você é um adulto." é impressa.

### Else e Else If

A palavra-chave `else` nos permite executar um bloco de código diferente se a condição `if` for falsa. A palavra-chave `else if` pode ser usada para criar condições adicionais a serem verificadas.

Outro exemplo simples:

```swift
let temperature = 20

if temperature > 25 {
    print("Está quente!")
} else if temperature < 15 {
    print("Está frio!")
} else {
    print("A temperatura está agradável.")
}
```

### Operadores Lógicos (&&, ||): Combinando Condições

Os operadores lógicos nos permitem combinar várias condições dentro de uma instrução `if`.

- `&&` (E): O operador `&&` verifica se ambas as condições são verdadeiras.
- `||` (OU): O operador `||` verifica se pelo menos uma condição é verdadeira.

Aqui está um exemplo de `AND`:

```swift
let isLoggedIn = true
let isAdmin = true

if isLoggedIn && isAdmin {
    print("Você tem privilégios administrativos.")
}
```

Aqui está um exemplo de `OU`:

```swift
let isAdmin = false
let isSimpleUserWithGrantAccess = true

if isAdmin || isSimpleUserWithGrantAccess {
    print("Você pode executar a ação.")
}
```

### Instruções Switch: Avaliando Múltiplos Casos

As instruções `switch` fornecem uma maneira mais concisa e legível de lidar com várias condições, especialmente quando lidamos com um número limitado de casos.

```swift
let trafficLight = "Red"

switch trafficLight {
case "Red":
    print("Pare!")
case "Yellow":
    print("Reduza a velocidade.")
case "Green":
    print("Siga!")
default:
    print("Cor de semáforo inválida.")
}
```

Este código verifica o valor de `trafficLight`. Ele compara o valor com diferentes casos e executa o bloco de código correspondente. O caso `default` lida com quaisquer valores que não sejam explicitamente correspondidos.

Eu acho muito estranha essa maneira de criar `switch` e `case` no Swift, porque eles estão no mesmo nível de indentação. Mas esse é o padrão, fazer o que!

### Operador Condicional Ternário

O operador ternário é uma maneira abreviada de escrever expressões condicionais simples. Ele assume a forma:

```
condition ? valueIfTrue : valueIfFalse
```

Aqui está um exemplo:

```swift
let age = 25

let message = age >= 18 ? "Você é um adulto." : "Você não é um adulto."

print(message)
```

Este código verifica o valor de `age`. Se for maior ou igual a 18, a variável `message` é atribuída a "Você é um adulto.". Caso contrário, é atribuída a "Você não é um adulto."

As instruções de fluxo de controle são blocos de construção fundamentais de qualquer linguagem de programação. Elas nos permitem criar código que pode tomar decisões e repetir ações, tornando nossos programas mais interativos e eficientes. Na próxima seção, exploraremos outro aspecto importante da programação Swift: loops.

## Loops: Repetindo Ações

Loops são ferramentas poderosas em Swift que nos permitem repetir blocos de código várias vezes. Eles são essenciais para automatizar tarefas, iterar sobre coleções e lidar com operações repetitivas. Vamos explorar dois tipos comuns de loops: loops `for` e loops `while`.

### Loops For

Os loops `for` são usados para iterar sobre uma sequência de valores, como uma faixa de números ou elementos em uma array.

Aqui está um exemplo de iteração sobre uma array:

```swift
let fruits = ["Apple", "Banana", "Orange"]
for fruit in fruits {
    print(fruit)
}

// Output:
// Apple
// Banana
// Orange
```

Aqui está um exemplo de iteração sobre uma faixa, ou range, como acredito que fica melhor no termo em inglês:

```swift
for number in 1...5 {
    print(number)
}

// Output:
// 1
// 2
// 3
// 4
// 5
```

Swift fornece uma boa maneira de trabalhar com ranges. Muito fácil de usar.

### Loops While

Os loops `while` são usados para repetir um bloco de código enquanto uma condição específica for verdadeira.

```swift
var counter = 0

while counter < 5 {
    print(counter)
    counter += 1
}

// Output:
// 0
// 1
// 2
// 3
// 4
```

Este loop continua a ser executado enquanto o valor de `counter` for menor que 5. Dentro do loop, o valor de `counter` é impresso e, em seguida, incrementado em 1.

Quando estamos usando `while`, precisamos ter cuidado para sempre controlar a variável que é determinística para sair do loop. Se não incrementarmos o `counter` neste exemplo, o código não irá parar.

### Break e Continue

Às vezes, precisamos de mais controle sobre como os loops são executados. As instruções `break` e `continue` nos fornecem esse controle.

#### Break

A instrução `break` sai imediatamente de um loop, independentemente da condição do loop.

```swift
for number in 1...5 {
    if number == 3 {
        break
    }
    print(number)
}

// Output:
// 1
// 2
```

#### Continue

A instrução `continue` ignora a iteração atual de um loop e pula para a próxima iteração.

```swift
for number in 1...5 {
    if number == 3 {
        continue
    }
    print(number)
}

// Output:
// 1
// 2
// 4
// 5
```

Loops são ferramentas poderosas para repetir código de forma eficiente, e `break` e `continue` fornecem controle adicional sobre a execução do loop. Entender como usar loops de forma eficaz é essencial para construir algoritmos complexos e eficientes em Swift. Agora, vamos passar para outro aspecto importante da programação Swift: funções.

## Funções: Blocos de Código Reutilizáveis

Funções são como mini-programas dentro do seu código Swift. Elas permitem que você encapsule um bloco de código que executa uma tarefa específica, tornando seu código mais organizado, reutilizável e fácil de manter.

Vamos analisar os fundamentos das funções em Swift.

### Definição Básica de uma Função

Para definir uma função, usamos a palavra-chave `func` seguida pelo nome da função e parênteses `()`. Você pode adicionar parâmetros opcionalmente dentro dos parênteses. O bloco de código que é executado quando a função é chamada é delimitado por chaves `{}`.

```swift
func greet(name: String) {
    print("Olá, \(name)!")
}

greet(name: "Laura") 

// Output: Olá, Laura!
```

Neste exemplo, definimos uma função chamada `greet` que recebe um único parâmetro `name` do tipo `String`. A função imprime uma mensagem de saudação no console. Chamamos a função usando seu nome seguido por parênteses e passando o argumento "Laura" para o parâmetro `name`.

### Retornando Valores

As funções também podem retornar valores. Usamos a palavra-chave `return` para especificar o valor a ser retornado. O tipo de retorno é especificado após os parênteses na definição da função.

```swift
func getGreet(name: String) -> String {
    return "Olá, \(name)!"
}

let greet = getGreet(name: "Laura")
print(greet) // Output: Olá, Laura!
```

Se você tiver uma função com uma única linha, poderá suprimir a palavra-chave `return`.

```swift
func getGreet(name: String) -> String {
    "Olá, \(name)!"
}

let greet = getGreet(name: "Laura")
print(greet) // Output: Olá, Laura!
```

### Valores Padrão para Parâmetros

Podemos fornecer valores padrão para parâmetros de função, tornando nossas funções mais flexíveis. Se um valor não for fornecido ao chamar a função, o valor padrão será usado.

```swift
func getGreet(name: String, greeting: String = "Olá") -> String {
    return "\(greeting), \(name)!"
}

let greetLaura = getGreet(name: "Laura")
print(greetLaura) // Output: Olá, Laura!

let greetAdrian = getGreet(name: "Adrian", greeting: "Oi")
print(greetAdrian) // Output: Oi, Adrian!
```

### Funções Que Podem Lançar Erros

Em Swift, podemos definir funções que podem lançar erros usando a palavra-chave `throws`. Isso indica que a função pode não ser concluída com sucesso e pode lançar uma exceção.

```swift
enum DivisionByZeroError: Error {
    case zeroDivision
}

func divide(number1: Int, number2: Int) throws -> Int {
    if number2 == 0 {
        throw DivisionByZeroError.zeroDivision
    }

    return number1 / number2
}
```

Para usar funções com a palavra-chave `throws`, você precisa usar a seguinte sintaxe para garantir que capturará o erro de exceção:

```swift
do {
    let result = try divide(number1: 10, number2: 0)
    print(result)
} catch DivisionByZeroError.zeroDivision {
    print("Erro: Divisão por zero.")
} catch {
    print("Ocorreu um erro.")
}
```

Aqui, a função `divide` lança um `DivisionByZeroError` se o `number2` for 0. Usamos um bloco `do-catch` para lidar com o erro: a palavra-chave `try` indica que o código dentro do bloco pode lançar um erro, e o bloco `catch` lida com o erro lançado.

Funções são blocos de construção fundamentais do código Swift, tornando nossos programas mais modulares, reutilizáveis e eficientes. A seguir, exploraremos outro recurso poderoso: closures.

## Closures: Passando Código como Valores

Closures são blocos de código que podem ser passados como variáveis. Elas são incrivelmente versáteis, permitindo que você encapsule comportamento e o reutilize em diferentes partes do seu código. Imagine closures como mini-programas autocontidos que podem ser executados sob demanda. Em SwiftUI, é muito importante entender esse conceito. Vamos mergulhar nele.

### Closures Básicas

A maneira mais simples de criar um closure é usar chaves `{}`. Um closure sem parâmetros pode ser definido assim:

```swift
let greet = {
    print("Olá, mundo!")
}

greet() // Output: Olá, mundo!
```

Atribuímos esse closure a uma constante chamada `greet`. Para executar o closure, chamamos ele como uma função. Se você pensar sobre o tipo desse closure, ele pode ser representado com `() -> Void`, pois a função não possui parâmetros e também não retorna nada. Isso pode ser representado desta forma:

```swift
let greet: () -> Void = {
    print("Olá, mundo!")
}

greet() // Output: Olá, mundo!
```

No fim das contas, é a mesma coisa.

### Closures com Parâmetros e a Palavra-Chave "in"

Closures também podem receber parâmetros e ter valores de retorno. Usamos a palavra-chave "in" para separar os parâmetros e o tipo de retorno do bloco de código do closure.

```swift
let greet = { (name: String) in
    print("Olá, \(name)!")
}

greet("Laura") 

// Output: Olá, Laura!
```

Esse closure tem um parâmetro do tipo `String` e não tem retorno. O tipo deste closure pode ser representado como `(String) -> Void`, e você pode escrever esse mesmo closure desta forma:

```swift
let greet: (String) -> Void = { name in
    print("Olá, \(name)!")
}

greet("Laura")

// Output: Olá, Laura!
```

Além disso, seu closure pode retornar um valor.

```swift
let greet = { (name: String) -> String in
    return "Olá, \(name)!"
}

let result = greet("Laura") 
print(result) // Output: Olá, Laura!
```

Agora o tipo do closure é `(String) -> String`. Você pode escrever esse mesmo closure acima desta forma:

```swift
let greet: (String) -> String = { name in
    return "Olá, \(name)!"
}

let result = greet("Laura")
print(result) // Output: Olá, Laura!
```

Mas onde podemos usá-lo? Em Swift, é muito comum ver uma função com um "completion handler". Normalmente, é um closure que é chamado quando algumas operações são concluídas, como uma animação ou um carregamento de dados. Vamos ver um exemplo:

```swift
func registerNewUser(name: String, completionHandler: (String) -> Void ) {
    // Faça uma operação longa, como chamar uma API ou alterar um banco de dados
    // Depois disso, chame o completion handler
    completionHandler(name)
}

let greet = { (name: String) in
    print("Olá, \(name)!")
}

registerNewUser(name: "Laura", completionHandler: greet)
// Output após a operação longa: Olá, Laura!
```

Criamos uma função chamada `registerNewUser` com dois parâmetros. O primeiro é o `name` e o segundo é um `closure` que espera um parâmetro do tipo `String` e sem retorno, representado pela palavra-chave `Void`.

### Sintaxe Abreviada para Closures Trailing

Swift fornece uma sintaxe abreviada para closures trailing quando o closure é o último argumento e possui apenas uma única expressão. Podemos omitiar a declaração do parâmetro da closure e simplesmente declará-la no final. Vou considerar a mesma função `registerNewUser` mostrada anteriormente, e vou incorporar o closure `greet` usando a sintaxe abreviada.


```swift
registerNewUser(name: "Laura") { name in
    print("Olá, \(name)!")
}
```

Muito fácil e claro. Você verá isso muito em SwiftUI.

## Conclusão

Cobrimos muito terreno nesta segunda parte do "100DaysOfSwiftUI"! Exploramos fluxo de controle, loops, funções e closures - recursos poderosos que nos permitem criar código Swift mais dinâmico e sofisticado (closures especialmente).

Dominar esses conceitos é como desbloquear um novo nível de proficiência na programação Swift. Essas ferramentas nos fornecem a capacidade de tomar decisões, repetir ações de forma eficiente e encapsular blocos de código reutilizáveis, o que é crucial para construir aplicativos complexos e interativos em SwiftUI.

À medida que continuamos nossa jornada pelo desafio "100 Days of SwiftUI", lembre-se de que a prática é fundamental. Experimente esses conceitos, experimente exemplos diferentes e não hesite em fazer perguntas. Quanto mais você praticar, mais confortável você ficará com essas ferramentas essenciais.

Eu o encorajo a explorar mais, e lembre-se, cada linha de código que você escreve o aproxima de dominar o Swift!

Fique ligado para a próxima parte da série "100DaysOfSwiftUI", onde exploraremos structs e controle de acesso, expandindo ainda mais nosso conhecimento de programação Swift.