+++
title = "Swift Essentials: Variables, Data Types, and More (Part 1)"
date = 2024-07-05
type = "post"
slug = "swift-essentials-variables-data-types-and-more-part-1"
translationKey = "swift-essentials-variables-data-types-and-more-part-1"
categories = ["TODO"]
tags = ["100DaysOfSwiftUI"]
social_image: "swift-essentials-variables-data-types-and-more-part-1.en.webp"
+++

I'm diving headfirst into the "100 Days of SwiftUI" challenge by Paul Hudson, and I'm thrilled to be on this journey of discovery. But before I can create dazzling iOS apps, I know that building a strong foundation in Swift is crucial. This blog series, which I'm calling "100DaysOfSwiftUI," is my way of sharing my learning journey with you, especially those who are new to Swift. We'll explore the fundamental building blocks of this powerful language together. In this first part, we'll tackle the core concepts of variables, data types, string interpolation, and enums. These seemingly simple elements are the pillars upon which we'll build more complex and powerful applications in SwiftUI. So buckle up, grab your coffee (or your preferred drink!), and let's embark on this journey together! We'll cover the basics in a clear and engaging way, and by the end, you'll have a solid grasp of the foundational concepts that will empower you to start crafting your own iOS apps.

If you don't know about the [100 Days of SwiftUI][100_days_of_swiftui], please check out this link.

## Variables and Constants: Storing Data with Flexibility and Immutability

In the world of programming, we often need to store data. We have two primary tools for doing this: **variables** and **constants**. Both act as containers for data, but they differ in their flexibility:

### Variables: The Changeable Ones

Variables are like labeled boxes in our code that hold data that can be modified. We use the `var` keyword to declare a variable:

{%- highlight swift -%}
var name = "Laura"
{%- endhighlight -%}

We can change the value of `name` at any point in our code:

{%- highlight swift -%}
name = "Laura Smith"
{%- endhighlight -%}

Now, `name` holds the value "Laura Smith".

### Constants: The Immutable Ones

Constants are like sealed containers. Once you define a constant, its value cannot be changed. We use the `let` keyword to declare a constant:

{%- highlight swift -%}
let name = "Laura"
{%- endhighlight -%}

This sets `name` to the value "Laura", and we cannot assign a different value to it later.

Constants are good for preventing accidental changes to important values, ensuring data integrity. They also make your code clearer and more predictable, as the values they hold are fixed.

So, consider this when deciding how to use variables and constants in your code.

## Data Types: Defining the Nature of Data

In programming, we need a way to categorize the kinds of data our variables and constants can hold. These categories are called **data types**.

Think of data types as defining the "nature" or "essence" of the data. They tell Swift how to interpret and manipulate the information. Here are some essential data types in Swift:

### String: For Textual Data

The `String` data type represents textual information. It's used to store anything that can be written or displayed, such as names, addresses, sentences, and even code.

{%- highlight swift -%}
let name = "Laura"
var message = "Hello!"
{%- endhighlight -%}

### Int: For Whole Numbers

The `Int` data type represents whole numbers (integers), such as 1, 10, 25, 1000, and so on. Integers are commonly used in counters, calculations, and for representing quantities.

{%- highlight swift -%}
let age = 30
var numberOfItems = 5
{%- endhighlight -%}

### Float, Double and Decimal: Representing Numbers with Precision

In Swift, we have three primary data types for representing numbers with decimal points: `Float`, `Double`, and `Decimal`. While they all handle fractional values, they differ in their precision and memory usage:

#### Float: Lower Precision, Smaller Range

`Float` uses 32 bits of memory to store its value, offering a smaller range of values and less precision than `Double`. It's generally used when memory efficiency is a priority and lower precision is acceptable.

{%- highlight swift -%}
let floatNumber: Float = 0.00001 
{%- endhighlight -%}

#### Double: High Precision, Large Range

`Double` is the most common choice for representing floating-point numbers in Swift. It provides a high degree of precision, making it suitable for calculations requiring a wide range of values. `Double` uses 64 bits of memory to store its value, which is twice the size of `Float`.

{%- highlight swift -%}
let doubleNumber: Double = 0.00001
{%- endhighlight -%}

#### Decimal: High Precision, Financial Calculations

`Decimal` is specialized for handling financial calculations where accuracy is paramount. It offers a high degree of precision, especially for numbers with a large number of decimal places. However, it is less computationally efficient than `Double` or `Float` due to its focus on accuracy. `Decimal` is a base-10 number representation that provides high precision, allowing you to store a lot of numbers.

To create a `Decimal` value, you can use the following syntax:

{%- highlight swift -%}
let decimalNumber: Decimal = 0.00001
{%- endhighlight -%}

#### Type Annotations

As you can see in the samples above, there's only one keyword that changed in these examples: the type. Here, the type defines what kind of numeric value you'll store. This is called "type annotations," and you can use it for all data types or structures. 

You can create a numeric value simply by creating a variable and assigning a value, but it will be created as a `Double` type by default.

### Bool: For Logical Values

The `Bool` data type represents boolean values, which can be either `true` or `false`. Bools are fundamental for decision-making in your code, helping you create conditional statements and logical expressions.

{%- highlight swift -%}
let isAdmin = true
var hasError = false
{%- endhighlight -%}

## Arrays, Dictionaries, and Sets

So far, we've explored data types for individual values: strings, numbers, booleans. But often, we need to store collections of data—multiple values related to each other. This is where arrays, dictionaries, and sets come in handy.

### Arrays: Ordered Collections of Values

Arrays are ordered lists of elements of the same data type. Think of them as numbered boxes where you can store a collection of related items. You access elements in an array by their index, starting from zero.

{%- highlight swift -%}
let cities = ["Barcelona", "London", "São Paulo"]
print(cities[0]) // Output: Barcelona (first element)
print(cities[2]) // Output: São Paulo (third element)
{%- endhighlight -%}

Arrays are useful when you need an ordered list of elements of the same type.

### Dictionaries: Key-Value Pairs

Dictionaries are unordered collections of key-value pairs. Each key is unique and maps to a corresponding value. Think of dictionaries like a real-world dictionary, where each word (key) has a definition (value).

{%- highlight swift -%}
let userData = ["name": "Laura", "surname": "Smith", "city": "London"]
print(userData["name"]) // Output: Optional("Laura")
print(userData["city"]) // Output: Optional("London")
{%- endhighlight -%}

Dictionaries are useful when you need to store and retrieve data based on unique keys.

### Sets: Unique and Unordered Collections

Sets are unordered collections of unique elements. They don't allow duplicates, making them useful for checking membership and removing duplicates from a collection.

{%- highlight swift -%}
let uniqueNames = Set(["Laura", "Josh", "Laura", "Marie", "Josh"])
print(uniqueNames.count) // Output: 3 (duplicates removed)
{%- endhighlight -%}

Sets are useful when you need to work with unique values or when you want to check for membership quickly - this structure is very fast.

## Enums: Defining Related Values

Enums, short for enumerations, are a powerful way to define a custom type that represents a set of related values. They provide a more structured and readable way to represent choices or states within your code, compared to using raw integers.

Think of enums as creating a vocabulary of specific terms related to a particular concept. For example, imagine you're building an app that handles order status. Instead of using raw integers like 0, 1, and 2, you can create an enum to represent the order states:

{%- highlight swift -%}
enum OrderStatus {
    case pending
    case processing
    case shipped
    case delivered 
    case cancelled
}
{%- endhighlight -%}

Now, instead of using numbers, you can directly use the enum values:

{%- highlight swift -%}
var orderStatus = OrderStatus.pending 
print(orderStatus) // Output: OrderStatus.pending
{%- endhighlight -%}

Enums improve readability. They make your code more self-documenting and easier to understand. They also enforce type safety, preventing you from accidentally assigning incorrect values.

## Cool Things

### String Interpolation

An easy way to concatenate strings without using "+" is using interpolation:

{%- highlight swift -%}
let name = "Laura"
let surname = "Smith"
print("The name of the winner is \(name) \(surname)!")
{%- endhighlight -%}

### Multi-line Strings

Sometimes we need to create a multi-line string, and this is very easy in Swift. You just use triple quotes and write your string inside them. Just ensure that the triple quotes are declared on a different line from the string.

{%- highlight swift -%}
var multilineMessage = """
This is the multi-line message.
You can add a lot of lines.
Don't worry about it!
"""
{%- endhighlight -%}

### Bools and the Toggle Function

When you create a variable, you can change its value later. So, we can create a bool value and change it using the `toggle` function.

{%- highlight swift -%}
var isAdmin = false
print(isAdmin) // Output: false

isAdmin.toggle()
print(isAdmin) // Output: true
{%- endhighlight -%}

### Dictionary Default

As you can see in the dictionary example, when we access the key, we get an optional. This occurs because Swift can't ensure that there is a value in that key. Because of this, Swift gives us an optional. You can handle this using a property called `default`. This way you don't get an optional, and your code won't break if you handle the optional without careful.

{%- highlight swift -%}
let userData = ["name": "Laura", "surname": "Smith", "city": "London"]
print(userData["name"]) // Output: Optional("Laura")
print(userData["name", default: "Unknown"]) // Output: Laura
print(userData["nickname", default: "Unknown"]) // Output: Unknown
{%- endhighlight -%}

## Conclusion

We've covered a lot of ground in this first part of "100DaysOfSwiftUI"! We've explored variables, constants, data types, string interpolation, enums, and some collection types. These concepts are essential for understanding how data is stored, manipulated, and used in your code.

Understanding these fundamentals is like having a solid foundation upon which you can build more complex structures in your SwiftUI journey. Imagine them as the bricks and mortar that make up the walls of your iOS apps.

I encourage you to practice these concepts, experiment with different examples, and don't hesitate to ask questions. Share your thoughts and experiences in the comments below!

Stay tuned for the next part, and let's continue to build our Swift knowledge together!

[100_days_of_swiftui]: https://www.hackingwithswift.com/100/swiftui