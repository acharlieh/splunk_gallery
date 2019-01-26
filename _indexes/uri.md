---
title: By URI
unlisted: true
---
<div class="columns">
<ul>
{% assign collection = site.entries | sort: 'slug' %}
{% for item in collection %}
    <li><a href="{{ site.baseurl }}{{ item.url }}" title="{{ item.title | xml_escape }}">{{ item.slug }}</a></li>
{% endfor %}
</ul>
</div>
