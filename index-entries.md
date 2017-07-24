---
title: All Entries
layout: page
permalink: /entries/
---

<ul>
{% assign collection = site.entries | sort: 'title' %}
{% for item in collection %}
    <li><a href="{{ site.baseurl }}{{ item.url }}">{{ item.title }}</a></li>
{% endfor %}
</ul>