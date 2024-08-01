---
layout: post
title:  "Swift Essentials: Protocols, Extensions, and More (Part 4)"
date:   2024-07-31
translations: ["pt"]
tags: ["100DaysOfSwiftUI"]
---

<p class="intro"><span class="dropcap">W</span>e're back on the "100 Days Of SwiftUI" posts again! In today's post we'll continue the Swift Essentials saga, exploring about protocols, extensions, and optionals. This will be the last one about Swift Essentials. Let's get start.</p>

## What's a Protocol?

To simplify the things: protocols are like interfaces. I really don't know why Apple change the name of the things, but that's it. In the Apple's world, you'll see a lot about this, because there are a lot of things on iOS development who is protocol-oriented programming (POP).

### How to Create a Protocol

To create a protocol is very simple. Just use the `protocol` keyword and choose a name. By convention, I've chosen to suffix it as `Protocol`. 

{%- highlight swift -%}
protocol SearchProtocol {
    func search(text: String)
}
{%- endhighlight -%}

This code defines a protocol named `SearchProtocol`. This protocol requires conforming types to implement a `search(text:)` function, which presumably would perform some kind of search operation using the provided text as input. So, how to use it?

### How to Use a Protocol

Here's how you could use this protocol:

{%- highlight swift -%}
struct YourStruct: SearchProtocol {
    func search(text: String) {
        print("Searching for: \(text)")
    }
}
{%- endhighlight -%}

The `YourStruct` conform to `SearchProtocol` and provide their own implementation for the `search(text:)` function. As I said previously, it's the same as interfaces. But on iOS this is very important, so let's explore an example a little bit different. Suppose we need to create a small component to represent some type of search UI element, like this:

{%- highlight swift -%}
import SwiftUI

struct SearchComponent: View {
    @State private var text: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("What you're looking for?")

            TextField("Type here", text: $text)
                .onChange(of: text) { oldValue, newValue in
                    print(newValue)
                }
        }
    }
}
{%- endhighlight -%}

Here we have a view with a `TextField` and we're monitor changes using `onChange` event and capturing the text typed inside it using the `print` function. It works. Now we can use it in some screen, like this:

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

The component is show correctly, but how can we get the value typed inside the `TextField`? Now we can use protocols and delegates. It's very common on iOS to use it to make a decoupled implementation. Instead of the view knows all details about the component, we just make it conformable about the `SearchComponent` protocol and use it. Let's see.

I've put the protocol nearby the component, create an optional property on the component, and replace the `print` function calling the protocol function though the delegate.

{%- highlight swift -%}
import SwiftUI

protocol SearchProtocol {
    func search(text: String)
}

struct SearchComponent: View {
    // rest of the code

    var delegate: SearchProtocol?

    var body: some View {
        // rest of the code

        TextField("Type here", text: $text)
            .onChange(of: text) { oldValue, newValue in
                delegate?.search(text: newValue)
            }
        
        // rest of the code
    }
}
{%- endhighlight -%}

Now I can go back to the view, make it conform to the protocol and pass the delegate parameter when create the instance of the component.

{%- highlight swift -%}
import SwiftUI

struct SearchView: View, SearchProtocol {
    var body: some View {
        // rest of the code

        SearchComponent(delegate: self)

        // rest of the code
    }

    func search(text: String) {
        print(text)
    }
}
{%- endhighlight -%}

Now we can get the values typed on the component right here on the screen, keeping low coupling between then. 

This is very common when we're using `UITableView` on iOS. It works with some protocols to keep the component easy to use and reusable.

Let's continue, now talking about extensions.

## What's an Extension?

Extensions are an easy way to add more functionality on your code. Extensions in Swift are very powerful, because you can create it even in primitive types. Let's explore it.

### How to Create an Extension

In Swift, is very simple to create one. You just use the `extension` keyword followed by the type name you want to make the extension. The `String` type has a property called `isEmpty`, and sometimes we want to make some expression to validate if a string type is not empty. We can do this in three ways. 

1. Use `yourStringVariable.isEmpty == false`. 
1. Use `!yourStringVariable.isEmpty`. 
1. Create an extension, choosing one of the options above.

{%- highlight swift -%}
extension String {
    var isNotEmpty: Bool {
        return self.isEmpty == false
    }
}
{%- endhighlight -%}

Now you can use it `yourStringVariable.isNotEmpty`. This is an extension property, but you can create extensions functions too. It works the same way, even for primitives values, as you can see above.

## What's an optional?

In Swift, optionals stand as a powerful shield against a notorious coding nemesis: the dreaded "unexpectedly found nil" error. But what are these optionals, and why are they so important?

Imagine a variable as a container. A regular variable must always hold a value of its declared type. An optional, however, introduces the possibility of emptiness. It's like a container that can either hold a value or be explicitly marked as having nothing – a state represented by the keyword nil.

This "nullability" is incredibly valuable. For instance, when fetching data from a server or a user's device, there's no guarantee the operation will always succeed. Optionals elegantly handle these scenarios.

Consider a function that tries to convert a string to an integer:

{%- highlight swift -%}
func convertToInt(from text: String) -> Int? {
    return Int(text)
}
{%- endhighlight -%}

The `Int?` return type signifies that this function might return an integer, or it might return `nil` if the conversion fails (like trying to convert "hello" to an integer). Let's explore how to safely access an optional value.

### if let

To safely access the potential value inside an optional, you use "unwrapping" mechanisms. One common way is using if let:

{%- highlight swift -%}
let userInput = "123"
if let number = convertToInt(from: userInput) {
    print("The number is \(number)")
} else {
    print("Invalid input")
}
{%- endhighlight -%}

Here, `number` is only assigned a value if `convertToInt` succeeds. Otherwise, the `else` block executes, preventing crashes from trying to use a non-existent value.

### guard let
You can check "nullability" in different ways. For instance, you can use `guard let`. This way is better to use when you need to create an early return statement.

{%- highlight swift -%}
let userInput = "123"

func yourFunction() {
    guard let number = convertToInt(from: userInput) else {
        print("Invalid input")
        return
    }

    print("The number is \(number)")
}

yourFunction()
{%- endhighlight -%}

### nil coalescing
Nil coalescing provides a concise and elegant way to handle optional values by providing a default value when an optional is nil. 

Here's a simple example:

{%- highlight swift -%}
let userInput = "hello"
let convertedValue = convertToInt(from: userInput)
print(convertedValue ?? "empty value")
{%- endhighlight -%}

As a result, the `print` function will show "empty value" because `convertedValue` is an optional without value. 

### Optional Chaining

Optional chaining acts like a careful safeguard when you're accessing data that might be missing in your Swift code. Imagine you're following a treasure map with instructions like "Go to the old oak tree, then check under the loose rock, and you'll find the prize!" But what if the tree is gone, the rock is missing, or the prize was already taken? In code, when we access that's not exists, we receive a fatal error, but using optinal chaining this not happen. Let's see the previous example when I show you about protocols:

{%- highlight swift -%}
import SwiftUI

protocol SearchProtocol {
    func search(text: String)
}

struct SearchComponent: View {
    // rest of the code

    var delegate: SearchProtocol?

    var body: some View {
        // rest of the code

        TextField("Type here", text: $text)
            .onChange(of: text) { oldValue, newValue in
                delegate?.search(text: newValue)
            }
        
        // rest of the code
    }
}
{%- endhighlight -%}

In the line `delegate?.search(text: newValue)` we're accessing the `search` method of the `delegate` property, but it will only be called when the property contains a value.

Optionals, while initially appearing as an extra layer of complexity, are a fundamental safety net in Swift. They encourage you to think about and handle situations where data might be missing, leading to more robust and crash-resistant applications.

## Wrap Up

As we reach the end of our exploration, it's clear that protocols, extensions, and optionals form a powerful trio in the world of Swift programming.

**Protocols**, with their blueprint-like nature, empower you to define consistent behavior across different types, fostering code reusability and maintainability. They bring order to the chaos, ensuring your code adheres to a common standard.

**Extensions**, like skilled artisans, add functionality and elegance to existing types without requiring access to their original blueprints. They enhance and extend, making your code more expressive and adaptable.

**Optionals**, the ever-vigilant guardians, equip you to handle the uncertainty of missing data. They gracefully guide your code through potential pitfalls, preventing crashes and fostering resilience in the face of the unknown.

Together, this dynamic trio empowers you to write safer, cleaner, and more flexible Swift code. Embrace their strengths, experiment with their possibilities, and watch as your code transforms into a masterpiece of clarity and robustness.

See you in the next post!