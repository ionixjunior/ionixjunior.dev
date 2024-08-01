---
layout: post
title:  "Swift Essentials: Protocols, Extensions, and More (Part 4)"
date:   2024-07-31
translations: ["pt"]
tags: ["100DaysOfSwiftUI"]
---

<p class="intro"><span class="dropcap">W</span>e're back on the "100 Days Of SwiftUI" posts again! In today's post we'll continue the Swift Essentials saga, exploring about protocols, extensions, protocols extensions (what?), and optionals. This will be the last one about Swift Essentials. Let's get start.</p>

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
        NavigationStack {
            VStack {
                SearchComponent()
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Hello, Ione!")
            .navigationBarTitleDisplayMode(.large)
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
            .padding()

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

In Swift, is very simple to create one. You just use the `extension` keyword followed by the type name you want to make the extension. The `String` type has a property called `isEmpty`, and sometimes we want to make some expression to validate if a string type is not empty. We make three choices. One: use `yourStringVariable.isEmpty == false`. Two: use `!yourStringVariable.isEmpty`. Three: create an extension:

{%- highlight swift -%}
extension String {
    var isNotEmpty: Bool {
        return self.isEmpty == false
    }
}
{%- endhighlight -%}

Now you can use it `yourStringVariable.isNotEmpty`. This was a extension property, but you can create extensions functions too. It works the same way, even for primitives values, as you can see above.