---
title: All People
layout: page
permalink: /people/
---

{% assign keys = '' | split: ',' %}

{% assign entries = site.pages | where: "url","/" | map: "contributors" | first %}
{% for key in entries %}
    {% if key %}{% assign keys = keys | push: key %}{% endif %}
{% endfor %}

{% assign entries = site.entries | map: "contributors" %}
{% for entryset in entries %}
    {% for key in entryset %}
        {% if key %}{% assign keys = keys | push: key %}{% endif %}
    {% endfor %}
{% endfor %}

{% assign entries = site.entries | map: "media" | map: "contributor" %}
{% for key in entries %}
    {% if key %}{% assign keys = keys | push: key %}{% endif %}
{% endfor %}

{% include person_list.html keys=keys title="Site Contributors" %}

{% assign mentionkeys="" | split: "," %}
{% assign entries=site.entries | map: "content" %}
{% for entry in entries %}
    {% assign data = entry | split: 'span class="person"' | where_exp: "item","item contains 'data-person-slug='" %} 
    {% for mention in data %}
        {% assign split = mention | split: '"' %}
        {% assign mentionkeys = mentionkeys | push: split[1] %}
    {% endfor %}
{% endfor %}

{% include person_list.html keys=mentionkeys title="Entry Actors" description="People who are mentioned in the various stories on this site." %}
