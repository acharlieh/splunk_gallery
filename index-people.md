---
title: Credits
layout: page
permalink: /people/
excerpt: The people listed below have contributions included in this gallery, are somehow involved in the shenanigans documented in this gallery, or both.
---

The people listed below have <span class="contributor">(c)ontributions</span> included in this gallery, are somehow <span class="character">(i)nvolved</span> in the shenanigans documented in this gallery, are <span class="depicted">(d)epicted</span> in the gallery media, or some combination of the above. Without these folks, and many others, the [Splunk Community](https://www.splunk.com/en_us/community.html) just wouldn't be quite as awesome. The page for each person at a minimum contains links to their respective gallery contributions and mentions.

{% assign contributorkeys = site.empty %}

{% assign entries = site.pages | where: "url","/" | map: "contributors" | first %}
{% for key in entries %}
    {% if key %}{% assign contributorkeys = contributorkeys | push: key %}{% endif %}
{% endfor %}

{% assign entries = site.entries | map: "contributors" %}
{% for entryset in entries %}
    {% for key in entryset %}
        {% if key %}{% assign contributorkeys = contributorkeys | push: key %}{% endif %}
    {% endfor %}
{% endfor %}

{% assign entries = site.entries | map: "media" | map: "contributor" %}
{% for key in entries %}
    {% if key %}{% assign contributorkeys = contributorkeys | push: key %}{% endif %}
{% endfor %}

{% assign contributorkeys = contributorkeys | uniq %}

{% assign mentionkeys= site.empty %}
{% assign entries=site.entries | map: "content" %}
{% for entry in entries %}
    {% assign data = entry | split: 'span class="person"' | where_exp: "item","item contains 'data-person-slug='" %} 
    {% for mention in data %}
        {% assign split = mention | split: '"' %}
        {% assign mentionkeys = mentionkeys | push: split[1] %}
    {% endfor %}
{% endfor %}
{% assign mentionkeys = mentionkeys | uniq %}


{% assign depictedkeys = site.empty %}
{% assign entries = site.entries | map: "media" | map: "depicting" %}
{% for key in entries %}
  {% if key.first %}
    {% for k in key %}{% assign depictedkeys = depictedkeys | push: k %}{% endfor %}
  {% elsif key %}
    {% assign depictedkeys = depictedkeys | push: key %}
  {% endif %}
{% endfor %}
{% assign depictedkeys = depictedkeys | uniq %}

{% assign allkeys=mentionkeys %}
{% for key in contributorkeys %}{% assign allkeys = allkeys | push: key %}{% endfor %}
{% for key in depictedkeys %}{% assign allkeys = allkeys | push: key %}{% endfor %}
{% assign allkeys=allkeys | uniq %}

{% assign entries = site.empty %}
{% for key in allkeys %}
    {% assign data = site.people | where: "slug",key | first %}
    {% assign entries = entries | push: data %}
{% endfor %}

<div class="columns">
{% assign entries = entries | sort: 'sort_key' %}
<ul>
{% for item in entries %}
    {% assign class = site.empty %}
    {% if mentionkeys contains item.slug %}{% assign class = class | push: 'character' %}{% endif %}
    {% if contributorkeys contains item.slug %}{% assign class = class | push: 'contributor' %}{% endif %}
    {% if depictedkeys contains item.slug %}{% assign class = class | push: 'depicted' %}{% endif %}
    <li class="{{ class | join: ' ' }}"><a href="{{ site.baseurl }}{{ item.url }}">{{ item.title }}</a>{% if contributorkeys contains item.slug %} (c){% endif %}{% if mentionkeys contains item.slug %} (i){% endif %}{% if depictedkeys contains item.slug %} (d){% endif %}</li>
{% endfor %}
</ul>
</div>
