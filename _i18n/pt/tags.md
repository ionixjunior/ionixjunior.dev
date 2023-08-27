{% assign split_mark = '<|>' %}

{% assign tags = '' %}
{% for tag in site.tags %}
  {% assign name = tag | first %}
  {% assign tags = tags | append: split_mark  | append: name %}
{% endfor %}

{% assign tags = tags
  | remove_first: split_mark
  | split: split_mark
  | sort: self %}

{% capture date_format %}{% t date_format %}{% endcapture %}

<div>
	<h1 class="pageTitle">Tags</h1>
    <div>
        <ul class="noList">
            {% for tag in tags %}
            <h2 id="{{ tag }}">#{{ tag }}</h2>
            {% for post in site.posts %}
            {% if post.tags contains tag %}
            <li>
                <span class="date">{{ post.date | date: date_format }}</span>
                <a href="{{ site.baseurl | append: post.url }}">{{ post.title }}</a>
            </li>
            {% endif %}
            {% endfor %}
            <br />
            {% endfor %}
        </ul>
    </div>
</div>