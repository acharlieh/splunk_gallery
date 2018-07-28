---
title: By Update Date
---
<div class="columns">
<ul>
{% assign collection = site.entries | group_by_exp: 'item','item.last_modified_at' | sort: 'name' | reverse | map: 'items' %}
{% for array in collection %}
  {% assign array = array | sort: 'title' %}
  {% for item in array %}
    <li><a href="{{ site.baseurl }}{{ item.url }}">{{ item.title }} ({{ item.last_modified_at | date: "%Y-%m-%d" }})</a></li>
  {% endfor %}
{% endfor %}
</ul>
</div>
