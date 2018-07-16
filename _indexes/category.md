---
title: By Category
excerpt: Shenanigans by Category
---
{% assign categories = site.empty %}
{% assign entries = site.entries %}
{% for entry in entries %}{% for tag in entry.tags %}
{% unless categories contains tag %}{% assign categories = categories | push: tag %}{% endunless %}
{% endfor %}{% endfor %}
{% assign categories = categories | sort %}

{% for category in categories %}
{% assign page = site.category | where: "slug", category | first %}
{% if page %}
<h3><a href="{{ site.baseurl }}{{ page.url }}">{{page.title}} ({{category}})</a></h3>
{{page.excerpt | markdownify }}
{% else %}
<h3>({{category}})</h3>
{% endif %}
{% include entries_by_category.html slug=category %}

{% endfor %}

{% assign entries = site.entries | where_exp:"item","item.stub != true" | where_exp: "e","e.tags.size == 0" | sort: "title" %}

{% if entries.size>0 %}
<h3>No Assigned Categories</h3>
<div class="columns"><ul>
{% for item in entries %}
    <li><a href="{{ site.baseurl }}{{ item.url }}">{{ item.title }}</a></li>
{% endfor %}
</ul></div>
{% endif %}
