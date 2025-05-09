+++
title = "Customizing SeparatorInset of UITableView in iOS – Xamarin.Forms"
date = 2018-07-30
type = "post"
slug = "customizing-separatorinset-of-ios-uitableview-in-xamarin-forms"
translationKey = "customizing-separatorinset-of-ios-uitableview-in-xamarin-forms"
categories = ["TODO"]
tags = ["xamarin", "ios"]
+++

Important notice: this post is intended for perfectionist developers. Hello, folks! Today, I bring a small tip on how to customize the SeparatorInset of a UITableView in iOS in a Xamarin.Forms application. But what is that? What are we talking about? Let's find out in this post!

As I mentioned at the beginning of the post, only those who are truly perfectionists will notice this detail. So, let's show a few things that happen in **iOS** development with **Xamarin.Forms** before we get to the main topic of the post.

Talking about developing a screen with a **ListView**, we can build its items using built-in cells – remember them? **TextCell**, **ImageCell**, **SwitchCell**, **EntryCell** – or with a **ViewCell** containing the customization you desire.

Looking at a **ListView** populated with a **TextCell** in its items, we get the following result:

<figure>
	<img src="/assets/img/text-cell-577x1024.png" width="300" alt="ListView using TextCell in each item"> 
	<figcaption>ListView using TextCell in each item</figcaption>
</figure>

Now, let's populate the same list using an **ImageCell**, and we get the following result:

<figure>
	<img src="/assets/img/image-cell-577x1024.png" width="300" alt="ListView using ImageCell in each item"> 
	<figcaption>ListView using ImageCell in each item</figcaption>
</figure>

Comparing the two images, we can see that the separator line of each item has a left margin defined. This margin has a default value in **iOS** when using **TextCell**, unlike **ImageCell**, which has a margin related to the inserted image.

You probably had noticed that already. Now, let's get to the part that maybe you never paid attention to or didn't give importance to: Let's customize the same **ListView** using **ViewCell** for its items:

<figure>
	<img src="/assets/img/view-cell-577x1024.png" width="300" alt="ListView using ViewCell in each item"> 
	<figcaption>ListView using ViewCell in each item</figcaption>
</figure>

Notice what happened: The margin of the item separators now doesn't respect the inserted image and has the same spacing as the **TextCell** example. Below is the comparison of the shown examples:

<figure>
	<img src="/assets/img/comparacao-cells.png" width="600" alt="Comparison between TextCell, ImageCell, and ViewCell"> 
	<figcaption>Comparison between TextCell, ImageCell, and ViewCell</figcaption>
</figure>

This happens because the insertion of controls in **ViewCell** is dynamic, and **Xamarin.Forms** cannot automatically determine what should be the left margin spacing of the list separator.

Before discussing "how to solve this," I just want to make it clear that this is not a problem or error. In my opinion, it's just a detail that those who are very detail-oriented will want to customize to achieve the appearance of the standard **iOS** behavior.

Alright, so how do we "solve" it? Simple, just create a renderer for the **ViewCell** and override the **GetCell** method to manually customize the **SeparatorInset** attribute of the **UITableView**, as seen below:

{%- highlight cs -%}
using Core.Controls;
using Core.iOS.Renderers;
using UIKit;
using Xamarin.Forms;
using Xamarin.Forms.Platform.iOS;

[assembly: ExportRenderer(typeof(CustomViewCell), typeof(CustomViewCellRenderer))]
namespace Core.iOS.Renderers
{
    public class CustomViewCellRenderer : ViewCellRenderer
    {
        public override UITableViewCell GetCell(Cell item, UITableViewCell reusableCell, UITableView tv)
        {
            tv.SeparatorInset = new UIEdgeInsets(0, 66, 0, 0);

            return base.GetCell(item, reusableCell, tv);
        }
    }
}
{%- endhighlight -%}

Note that the value inserted for the margin was set manually and will depend on the size of the image contained in the item.

Since it's a **ViewCell** renderer, you probably won't want to configure this value for all the **ViewCells** in the application. So, I created a specific **ViewCell** for the list and used it in the **ListView**.

Below is the custom control:

{%- highlight cs -%}
using Xamarin.Forms;

namespace Core.Controls
{
    public class CustomViewCell : ViewCell
    {
    }
}
{%- endhighlight -%}

Below is the screen:

{%- highlight xml -%}
<?xml version="1.0" encoding="UTF-8"?>
<ContentPage 
    ...
    xmlns:controls="clr-namespace:Core.Controls"
    ...
>
    <ContentPage.Content>
        <ListView
            x:Name="lvlItem"
            HasUnevenRows="true"
            RowHeight="60"
        >
            <ListView.ItemTemplate>
                <DataTemplate>
                    <controls:CustomViewCell>
                        <controls:CustomViewCell.View>
                            ...
                        </controls:CustomViewCell.View>
                    </controls:CustomViewCell>
                </DataTemplate>
            </ListView.ItemTemplate>
        </ListView>
    </ContentPage.Content>
</ContentPage>
{%- endhighlight -%}

Now, the final result looks much better:

<figure>
	<img src="/assets/img/custom-view-cell-577x1024.png" width="300" alt="ListView using CustomViewCell in each item"> 
	<figcaption>ListView using CustomViewCell in each item</figcaption>
</figure>

There you go! Now the **ViewCell** with an image has the standard left margin spacing.

The example project used in this article can be found on [GitHub][projeto].

That's it, folks! I hope you enjoyed today's tip.

Best regards, and until next time!

[projeto]: https://github.com/ionixjunior/XamarinPlayground/tree/master/XFViewCellRenderer