+++
title = "Redmine Time Tracker plugin"
date = 2013-03-02
type = "post"
slug = "redmine-time-tracker-plugin"
categories = ["TODO"]
tags = ["misc"]
+++

<p class="intro"><span class="dropcap">I</span>n the initial tests I performed with Redmine, I noticed that the time tracking feature it provides is somewhat limited, and as far as I could see, there isn't a client similar to Worklog, especially an open-source one, for seamless time tracking.</p>

That's when I found the Redmine Time Tracker plugin. With it, you can have a more user-friendly interface for time tracking. It doesn't have all the convenience of a client, but you can choose an issue and then start tracking time on it.

However, during the initial tests, I encountered some issues.

In the default time tracking feature of Redmine, you can choose the type of hours tracked, such as support, development, and other types that the administrator can configure. But in the time tracking done by this plugin, you can't make that selection. The type of time tracking recorded for all these entries is a proprietary mark of the plugin.

As I needed to have control over the types of activities performed in the time tracking using the plugin, I decided to fork the plugin and implement the "Activity" field on the time tracking entry form.

The plugin can be found [in this repository][redmine-time-tracker] on GitHub.

As you can see below, the only implementation was adding the "Activity" field to the form.

<figure>
	<img src="/assets/img/redmine-time-tracker-plugin-custom-by-ionixjunior.png" alt="Image of the Redmine screen with the added Activity field."> 
	<figcaption>Image of the Redmine screen with the added Activity field.</figcaption>
</figure>

With this modification, it is possible to obtain time tracking reports more accurately, as each entry will be linked to its correct activity type.

[redmine-time-tracker]: https://github.com/ionixjunior/redmine_time_tracker