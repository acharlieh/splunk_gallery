---
title: All Entries
layout: page
permalink: /entries/
excerpt: All Splunk shenanigans documented so far
---

<h3>By Name</h3>
<div class="columns">
<ul>
{% assign collection = site.entries | sort: 'title' %}
{% for item in collection %}
    <li><a href="{{ site.baseurl }}{{ item.url }}">{{ item.title }}</a></li>
{% endfor %}
</ul>
</div>
<hr/>

<h3>By Publish Date</h3>
<div class="columns">
<ul>
{% assign collection = site.entries | sort: 'date' | reverse %}
{% for item in collection %}
    <li><a href="{{ site.baseurl }}{{ item.url }}">{{ item.title }} ({{ item.date | date: "%Y-%m-%d" }})</a></li>
{% endfor %}
</ul>
</div>
<hr/>

<h3>By Last Updated Date</h3>
<div class="columns">
<ul>
{% assign collection = site.entries | group_by_exp: 'item','item.last_modified_at' | sort: 'name' | reverse | map: 'items' %}
{% for array in collection %}
  {% assign array = array | sort: 'title' %}
  {% for item in array %}
    <li><a href="{{ site.baseurl }}{{ item.url }}">{{ item.title }}  ({{ item.last_modified_at | date: "%Y-%m-%d" }})</a></li>
  {% endfor %}
{% endfor %}
</ul>
</div>