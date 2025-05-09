+++
title = "Swift Essentials: Structs, Classes, and More (Part 3)"
date = 2024-07-19
type = "post"
slug = "swift-essentials-structs-classes-and-more-part-3"
translationKey = "swift-essentials-structs-classes-and-more-part-3"
categories = ["TODO"]
tags = ["100DaysOfSwiftUI"]
social_image: "swift-essentials-structs-classes-and-more-part-3.en.webp"
+++

In the first two parts of "100DaysOfSwiftUI", we explored the fundamental building blocks of Swift - variables, data types, control flow, loops, functions, and closures. Now, we're ready to dive into a crucial aspect of Swift programming: structs and classes. These powerful tools allow us to create custom data structures that organize and represent real-world objects in our code. Understanding structs and classes is essential for building complex and modular applications in SwiftUI, and they will empower you to create more powerful and robust iOS apps. Let's learn about it!

## Structs: Value Types

Structs in Swift are value types that allow you to create custom data structures. Imagine them as blueprints for creating your own unique data containers, similar to how you might design a blueprint for a house.

Think of structs as "boxes" that hold related information. Each box has specific compartments (properties) to store different types of data, and you can define actions (methods) that can be performed on the data within the box. Here's a breakdown of structs.

### Basic Struct Definition

To define a struct, we use the `struct` keyword followed by the struct's name:

{%- highlight swift -%}
struct User {
    // Properties and methods will go here
}
{%- endhighlight -%}

Let's create a `User` struct to represent a user profile:

{%- highlight swift -%}
struct User {
    var firstName: String
    var lastName: String
}
{%- endhighlight -%}

This defines a `User` struct with two properties: `firstName` and `lastName`.

### Stored Properties

Stored properties hold data within a struct. They act like variables inside the struct. The properties showed above are stored properties.

{%- highlight swift -%}
let userLaura = User(firstName: "Laura", lastName: "Campbell")
{%- endhighlight -%}

### Computed Properties

Computed properties don't store values directly. Instead, they calculate and return a value based on other properties.

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

This `User` struct now has a `fullName` computed property that returns the concatenation of `firstName` and `lastName`. 

Computed properties are very used on SwiftUI, mainly on views.

### Property Observers (didSet, willSet)

Property observers allow you to perform actions whenever a property's value changes. We have two:

- `didSet`: This observer is called after a property's value changes.
- `willSet`: This observer is called before a property's value changes.

{%- highlight swift -%}
struct User {
    var firstName: String
    var lastName: String {
        willSet {
            print("The new value is \(newValue)")
        }

        didSet {
            print("The old value is \(oldValue)")
        }
    }
}

var userLaura = User(firstName: "Laura", lastName: "Campbell")
userLaura.lastName = "Johnson"

// Output:
// The new value is Johnson
// The old value is Campbell
{%- endhighlight -%}

The `newValue` and `oldValue` are automatically powered by Swift when using these property observers. You can use this to develop something reactive. But be careful, because your code can be slow with a lot of actions in a simple property called many times.

### Memberwise Initializers (Default Constructor)

Structs automatically get a memberwise initializer, which is a default initializer that allows you to create instances by providing values for all properties. As showed previously, we didn't create any constructor for the struct, but we were capable to initialize the object and put values inside.

### Custom Initializers

We can create our own custom initializers for structs to control instance creation based on specific parameters.

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

Here, we create a custom initializer that takes the same parameters as the memberwise initializer. However, we can add additional logic or validation within the initializer before assigning values to the properties. If you create a custom initializer, you need to ensure that all property will be initialized with a value.

### Mutating Methods

Methods that modify the properties of a struct needs the `mutating` keyword.

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

Here, `changeLastName` modifies the `lastName` property, so it needs to be marked as `mutating`.

Structs are incredibly useful for creating custom data types, and understanding their features is crucial for building well-organized and efficient code in Swift. In the next section, we'll dive into classes, another powerful tool for representing data and behavior in Swift.

## Classes: Reference Types

Classes in Swift are like blueprints for creating objects that represent real-world entities. They're similar to structs in that they can hold properties and methods, but they have some crucial differences. Classes are **reference types**, meaning that they're passed around as references (pointers) instead of copies. This has significant implications for how they behave.

Let's explore classes in more detail to understand some differences.

### Basic Class Definition

To define a class, we use the `class` keyword followed by the class name. I'll use the same example of `User` struct that I showed previously.

{%- highlight swift -%}
class User {

}
{%- endhighlight -%}

Let's add some properties.

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

Notice now we need to specify the initializer method. Different from struct, Swift doesn't create memberwise initialize for classes.

### Inheritance

Inheritance allows us to create subclasses that inherit properties and methods from superclasses. This promotes code reusability and reduces redundancy.

{%- highlight swift -%}
class AdminUser: User {
    var canDeleteAccount: Bool

    init(firstName: String, lastName: String, canDeleteAccount: Bool) {
        self.canDeleteAccount = canDeleteAccount
        super.init(firstName: firstName, lastName: lastName)
    }
}
{%- endhighlight -%}

In this example, `AdminUser` inherits from `User`. It has its own property (canDeleteAccount) and overrides the initializer to take an additional `canDeleteAccount` parameter.

Note we're using an initializer for inheritance class with `super.init`.

### Methods

Different from structs, classes doesn't need to be marked with the `mutating` keyword to change some property.

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

### Deinitializers

Deinitializers (`deinit`) are called when an instance of a class is about to be deallocated from memory. Some languages calling it as desctructors.

{%- highlight swift -%}
class User {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    deinit {
        print("\(firstName) is being deallocated.")
    }
}
{%- endhighlight -%}

To see it in action, try to use the playground and create this object in a loop. You'll see when the context of class finishes, the `deinit` will be called.

{%- highlight swift -%}
for index in 1...3 {
    var userLaura = User(firstName: "Laura \(index)", lastName: "Campbell")
    print(userLaura.lastName)
}

// Output:
// Campbell
// Laura 1 is being deallocated.
// Campbell
// Laura 2 is being deallocated.
// Campbell
// Laura 3 is being deallocated.
{%- endhighlight -%}

Classes are powerful tools for building complex and object-oriented applications in Swift. They allow you to model real-world entities, promote code reusability through inheritance, and manage object lifecycle. But I believe you thinking now: when I need to use a struct or a class?

## Struct or Class?

I'll try to simplify: use a struct when you want to create simple data containers that are copied and remain immutable. Use a class when you want to create complex objects that are referenced and modified, and when inheritance is necessary.

| Feature | Struct (Value Type) | Class (Reference Type) |
|---|---|---|
| **Copying** | Copies are made when passed as arguments or assigned to new variables | References are passed, so changes affect the original object |
| **Mutability** | Properties are immutable by default. `mutating` keyword is required to modify properties within methods | Properties are mutable by default. No need for `mutating` |
| **Inheritance** | Structs cannot inherit from other structs or classes | Classes can inherit from other classes (single inheritance) |
| **Reference Counting** | No reference counting | Reference counting is used to track object instances |
| **Deinitializers** | Structs do not have deinitializers | Classes can have deinitializers (`deinit`) |
| **Typical Use Cases** | Representing simple data structures, value types, where immutability is preferred, data structures passed by value | Representing complex objects, reference types, where inheritance or mutability is required, data structures passed by reference |

In the table above I show you the main differences for each one. One thing that I haven't showed yet is about "copying". Let's see it. 

In the following code, I've created a `user1` and copy it to a `user2`. I've changed the `user1` property and print both. Note that the name are different for each one because we're using a `struct`.

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

Now I just changed one keyword: I replaced the `struct` for a `class` and the result is different now.

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

This occurs because the differences between these two kinds of type. When you're using a class and pass a reference of it, any changes affect the original object, but this is not the same for structs.

We already see a lot about structs and classes, right? Let's see the next section to understand about the access control, which helps protect your code and ensure data integrity.

## Access Control: Protecting Your Code

Access control in Swift is a mechanism that allows you to restrict access to entities within your code, like properties, methods, and even entire types. This helps ensure data integrity, prevent accidental modifications, and improve code organization.

Swift provides several access modifiers to control the visibility and accessibility of entities:

- `public`: Accessible from anywhere, including other modules or frameworks.
- `private`: Accessible only in the same scope where the entity is defined (like a class or an extensino).
- `fileprivate`: Accessible only from within the same source file wher the entity is defined.

Also, for properties we can use the `private (set)` modifier to create properties only for public reading with private setter.

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

Access control is particularly important in SwiftUI because it helps you control the data and behavior of your views. By carefully using access modifiers, you can create more robust and well-structured UI components.

This example is very simple, only to you understand what's possible. Please, create a new playground project and explore it.

## Static Properties and Methods

Static properties and methods are associated with the struct or class itself, rather than individual instances of the struct or class. This means that they can be accessed directly on the type without needing to create an instance.

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

Static properties hold data that is shared among all instances of a class or struct. So, be careful. Also, methods can be static too.

{%- highlight swift -%}
struct User {
    static var totalOfUsers = 0

    var firstName: String

    init(firstName: String) {
        self.firstName = firstName
        User.totalOfUsers += 1
    }

    static func describeTotalOfUsers() {
        print("There are \(totalOfUsers) users created.")
    }
}

User.describeTotalOfUsers() // Output: There are 0 users created.
var user1 = User(firstName: "Laura")
User.describeTotalOfUsers() // Output: There are 1 users created.
{%- endhighlight -%}

## Wrap up

In this third installment of "100DaysOfSwiftUI," we've delved into the world of structs and classes, the building blocks for organizing and representing data in Swift. We've explored their differences, learned how to define properties, methods, and initializers, and discovered about the access control.

By mastering structs and classes, we unlock new levels of power and flexibility in Swift programming. We can now model complex objects, create reusable code through inheritance, and control data access for better code organization and security. 

As you continue your SwiftUI journey, remember that structs and classes are essential tools for building powerful and maintainable applications. They provide a structured approach to organizing your code, making it easier to manage, extend, and modify your projects. Structs are very important for SwiftUI, because they're using massively to create views.

Now it's your time. Take a time to practice and explore all described here using the playground, and practice using them in your own projects. The more you practice, the more confident you'll become in harnessing their power.

Stay tuned for the next part of the "100DaysOfSwiftUI" series, where we'll dive into more advanced topics, building upon the foundation we've laid together. Happy coding!