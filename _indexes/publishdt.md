---
title: By Publish Date
---
<div class="columns">
<ul>
{% assign collection = site.entries | where_exp:"item","item.stub != true" | sort: 'date' | reverse %}
{% for item in collection %}
    <li><a href="{{ site.baseurl }}{{ item.url }}">{{ item.title }} ({{ item.date | date: "%Y-%m-%d" }})</a></li>
{% endfor %}
</ul>
</div>
