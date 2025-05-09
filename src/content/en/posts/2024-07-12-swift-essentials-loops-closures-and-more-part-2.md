+++
title = "Swift Essentials: Loops, Closures, and More (Part 2)"
date = 2024-07-12
categories = ["TODO"]
tags = ["100DaysOfSwiftUI"]
social_image: "swift-essentials-loops-closures-and-more-part-2.en.webp"
+++

<p class="intro"><span class="dropcap">I</span>n the first part of "100DaysOfSwiftUI," we explored the foundational building blocks of Swift — variables, data types, and more. Now, let's dive deeper into the control flow, loops, functions, and closures. These are essential concepts for building dynamic and interactive apps in SwiftUI, and they'll help us write more powerful and flexible code. Get ready to unleash the true potential of Swift and unlock new possibilities for your iOS development journey!</p>

## Control Flow: Making Decisions and Repeating Actions
In the world of programming, we need to create code that can respond to different situations and repeat actions efficiently. This is where control flow comes in. It allows us to make decisions based on conditions and execute code blocks repeatedly based on specific criteria.

Let's explore some key elements of control flow in Swift:

### If Statements and Comparisons
`if` statements are used to execute code only if a certain condition is true. We use comparison operators to compare values and determine if a condition is met. Common comparison operators include:

- `>` (greater than)
- `<` (less than)
- `>=` (greater than or equal to)
- `<=` (less than or equal to)
- `==` (equal to)
- `!=` (not equal to)

Here's a simple example:

```swift
let age = 25

if age >= 18 {
    print("You are an adult.")
}
```

This code checks if the variable `age` is greater than or equal to 18. If it is, the message "You are an adult." is printed.

### Else and Else If
The `else` keyword allows us to execute a different block of code if the `if` condition is false. The `else if` keyword can be used to create additional conditions to check.

Another simple example:

```swift
let temperature = 20

if temperature > 25 {
    print("It's hot!")
} else if temperature < 15 {
    print("It's cold!")
} else {
    print("The temperature is pleasant.")
}
```

### Logical Operators (&&, ||): Combining Conditions
Logical operators allow us to combine multiple conditions within an if statement.

- `&&` (AND): The `&&` operator checks if both conditions are true.
- `||` (OR): The `||` operator checks if at least one condition is true.

Here's an `AND` example:

```swift
let isLoggedIn = true
let isAdmin = true

if isLoggedIn && isAdmin {
    print("You have administrative privileges.")
}
```

Here's an `OR` example:

```swift
let isAdmin = false
let isSimpleUserWithGrantAccess = true

if isAdmin || isSimpleUserWithGrantAccess {
    print("You can execute the action.")
}
```

### Switch Statements: Evaluating Multiple Cases
`switch` statements provide a more concise and readable way to handle multiple conditions, especially when dealing with a limited number of cases.

```swift
let trafficLight = "Red"

switch trafficLight {
case "Red":
    print("Stop!")
case "Yellow":
    print("Slow down.")
case "Green":
    print("Go!")
default:
    print("Invalid traffic light color.")
}
```

This code checks the value of `trafficLight`. It matches the value against different cases and executes the corresponding code block. The `default` case handles any values not explicitly matched.

I think this way to create `switch` and `case` is the strangest thing in Swift, because they're on the same indentation. But this is the pattern, that's okay.

### Ternary Conditional Operator
The ternary operator is a shorthand way to write simple conditional expressions. It takes the form:

```
condition ? valueIfTrue : valueIfFalse
```

Here's an example:

```swift
let age = 25

let message = age >= 18 ? "You are an adult." : "You are not an adult."

print(message)
```

This code checks the value of `age`. If it's greater than or equal to 18, the variable message is assigned "You are an adult." Otherwise, it's assigned "You are not an adult."

Control flow statements are fundamental building blocks of any programming language. They allow us to create code that can make decisions and repeat actions, making our programs more interactive and efficient. In the next section, we'll explore another important aspect of Swift programming: loops.

## Loops: Repeating Actions
Loops are powerful tools in Swift that allow us to repeat blocks of code multiple times. They're essential for automating tasks, iterating over collections, and handling repetitive operations. Let's explore two common types of loops: `for` loops and while loops.

### For Loops
`for` loops are used to iterate over a sequence of values, such as a range of numbers or elements in an array.

Here's an example iterating over an array:

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

Here's an example iterating over a range:

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

Swift provides a good way to create ranges. Very easy to use.

### While Loops
`while` loops are used to repeat a block of code as long as a specific condition is true.

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

This loop continues to execute as long as the value of `counter` is less than 5. Inside the loop, the value of `counter` is printed, and then incremented by 1. 

When we're using `while` we need to be careful to always control the variable who is deterministic to go out of the while. If we don't increment the `counter` in this example, the code won't stop.

### Break and Continue
Sometimes, we need more control over how loops execute. `break` and `continue` statements provide us with this control.

#### Break
The `break` statement immediately exits a loop, regardless of the loop's condition.

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
The `continue` statement skips the current iteration of a loop and jumps to the next iteration.

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

Loops are powerful tools for repeating code efficiently, and `break` and `continue` provide additional control over loop execution. Understanding how to use loops effectively is essential for building complex and efficient algorithms in Swift. Now, let's move on to another important aspect of Swift programming: functions.

## Functions: Reusable Code Blocks
Functions are like mini-programs within your Swift code. They allow you to encapsulate a block of code that performs a specific task, making your code more organized, reusable, and easier to maintain.

Let's break down the fundamentals of functions in Swift.

### Basic Function Definition
To define a function, we use the `func` keyword followed by the function's name and parentheses `()`. You can optionally add parameters within the parentheses. The code block that executes when the function is called is enclosed in curly braces `{}`.

```swift
func greet(name: String) {
    print("Hello, \(name)!")
}

greet(name: "Laura") 

// Output: Hello, Laura!
```

In this example, we define a function named `greet` that takes a single parameter `name` of type `String`. The function prints a greeting message to the console. We call the function by using its name followed by parentheses and passing the argument "Laura" for the `name` parameter.

### Returning Values
Functions can also return values. We use the `return` keyword to specify the value to be returned. The return type is specified after the parentheses in the function definition.

```swift
func getGreet(name: String) -> String {
    return "Hello, \(name)!"
}

let greet = getGreet(name: "Laura")
print(greet) // Output: Hello, Laura!
```

If you have a function with a single-line, you can suppress the `return` keyword.

```swift
func getGreet(name: String) -> String {
    "Hello, \(name)!"
}

let greet = getGreet(name: "Laura")
print(greet) // Output: Hello, Laura!
```

### Default Values for Parameters
We can provide default values for function parameters, making our functions more flexible. If a value is not provided when calling the function, the default value will be used.

```swift
func getGreet(name: String, greeting: String = "Hello") -> String {
    return "\(greeting), \(name)!"
}

let greetLaura = getGreet(name: "Laura")
print(greetLaura) // Output: Hello, Laura!

let greetAdrian = getGreet(name: "Adrian", greeting: "Hi")
print(greetAdrian) // Output: Hi, Adrian!
```

### Functions That Can Throw Errors
In Swift, we can define functions that can throw errors using the `throws` keyword. This indicates that the function might not complete successfully and could throw an error.

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

To use functions with `throws` keyword you need to use the following syntax to ensure you'll capture the exception error:

```swift
do {
    let result = try divide(number1: 10, number2: 0)
    print(result)
} catch DivisionByZeroError.zeroDivision {
    print("Error: Division by zero.")
} catch {
    print("An error occurred.")
}
```

Here, the `divide` function throws a `DivisionByZeroError` if the `number2` is 0. We use a `do-catch` block to handle the error: the `try` keyword indicates that the code inside the block might throw an error, and the `catch` block handles the thrown error.

Functions are fundamental building blocks of Swift code, making our programs more modular, reusable, and efficient. Next, we'll explore another powerful feature: closures.

## Closures: Passing Code as Values
Closures are blocks of code that can be passed around like variables. They're incredibly versatile, allowing you to encapsulate behavior and reuse it in different parts of your code. Imagine closures as self-contained mini-programs that can be executed on demand. In SwiftUI is very important to understand about this concept. Let's dive into it.

### Basic Closures
The simplest way to create a closure is to use curly braces `{}`. A closure without parameters can be defined like this:

```swift
let greet = {
    print("Hello, world!")
}

greet() // Output: Hello, world!
```

We assign this closure to a constant named `greet`. To execute the closure, we call it like a function. If you think about the type of this closure, it's `() -> Void`, because it's a function without parameter, and without return. It can be represented this way:

```swift
let greet: () -> Void = {
    print("Hello, world!")
}

greet() // Output: Hello, world!
```

It's the same.

### Closures with Parameters and the "in" Keyword
Closures can also take parameters and have return values. We use the "in" keyword to separate the parameters and return type from the closure's code block.

```swift
let greet = { (name: String) in
    print("Hello, \(name)!")
}

greet("Laura") 

// Output: Hello, Laura!
```

This closure has a parameter of type `String` without return. The type can be represented as `(String) -> Void`, and you can write this closure this way too:

```swift
let greet: (String) -> Void = { name in
    print("Hello, \(name)!")
}

greet("Laura")

// Output: Hello, Laura!
```

Also, your closure can return a value.

```swift
let greet = { (name: String) -> String in
    return "Hello, \(name)!"
}

let result = greet("Laura") 
print(result) // Output: Hello, Laura!
```

Now the closure type is `(String) -> String`. You can write the same closure above this way:

```swift
let greet: (String) -> String = { name in
    return "Hello, \(name)!"
}

let result = greet("Laura")
print(result) // Output: Hello, Laura!
```

But where can we use it? In Swift is very common you see a function with a "completion handler". Usualy, it is a closure that is called when some operations finish, like an animation or a data load. Let's se an example:

```swift
func registerNewUser(name: String, completionHandler: (String) -> Void ) {
    // Make a long operation like call an API or change a database
    // After it, call the completion handler
    completionHandler(name)
}

let greet = { (name: String) in
    print("Hello, \(name)!")
}

registerNewUser(name: "Laura", completionHandler: greet)
// Output after the long operation: Hello, Laura!
```

We create a function called `registerNewUser` with two parameters. The first one is the `name` and the second one is a `closure` that expect a parameter of type `String` and without return represented with `Void` keyword.

### Shorthand Syntax for Trailing Closures
Swift provides a shorthand syntax for trailing closures when the closure is the last argument and it has only a single expression. We can just omit the closure parameter declaration and embed it at the trailing. I'll consider the same `registerNewUser` function showed previously, and I'll embed the `greet` closure using the shorthand syntax.


```swift
registerNewUser(name: "Laura") { name in
    print("Hello, \(name)!")
}
```

Very easy, and clear. You'll see it a lot in SwiftUI.

## Conclusion
We've covered a lot of exciting ground in this second part of "100DaysOfSwiftUI"! We've explored control flow, loops, functions, and closures — powerful features that allow us to create more dynamic and sophisticated Swift code (closures specially).

Mastering these concepts is like unlocking a new level of proficiency in Swift programming. These tools provide us with the ability to make decisions, repeat actions efficiently, and encapsulate reusable code blocks, which are crucial for building complex and interactive applications in SwiftUI.

As we continue our journey through the "100 Days of SwiftUI" challenge, remember that practice is key. Experiment with these concepts, try out different examples, and don't hesitate to ask questions. The more you practice, the more comfortable you'll become with these essential tools.

I encourage you to explore further, and remember, every line of code you write brings you closer to mastering Swift!

Stay tuned for the next part of the "100DaysOfSwiftUI" series, where we'll delve into structs and access control, expanding our knowledge of Swift programming even more.