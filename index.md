---
layout: default
contributors:
    - teddybfez
---
The Splunk Gallery is a community run site to collect stories and artifacts from the history of <a href="https://splunk.com">Splunk, Inc</a>. Many <a href="{{ site.baseurl }}{% link index-people.md %}">people</a> have already contributed to this repository, and we hope [to gather your stories soon]({{ site.baseurl }}{% link CONTRIBUTING.md %})!

<h3>Check out these most recent Splunk Gallery additions</h3>
{% assign collection = site.entries | group_by_exp: 'i', 'i.date | append: i.last_modified_at | append: i.title | append: i.slug' | sort: 'name' | reverse | map: 'items' %}
<ul>
{% for item in collection limit: 10 %}
    <li><a href="{{ site.baseurl }}{{ item.first.url }}">{{ item.first.title }}</a></li>
{% endfor %}
</ul>
... or browse all gallery entries {% assign collection = site.indexes | sort: 'title' %}{% for item in collection %}{% if forloop.last %}or {% endif %}<a href="{{ site.baseurl }}{{ item.url }}"> {{ item.title | downcase }}</a>{% unless forloop.last %}, {% endunless %}{% endfor %}!

{% assign contributorkeys = site.empty %}
{% assign entries = site.pages | where: "url","/" | map: "contributors" | first %}{% for key in entries %}{% if key %}{% assign contributorkeys = contributorkeys | push: key %}{% endif %}{% endfor %}
{% assign entries = site.entries | map: "contributors" %}{% for entryset in entries %}{% for key in entryset %}{% if key %}{% assign contributorkeys = contributorkeys | push: key %}{% endif %}{% endfor %}{% endfor %}
{% assign entries = site.entries | map: "media" | map: "contributor" %}{% for key in entries %}{% if key %}{% assign contributorkeys = contributorkeys | push: key %}{% endif %}{% endfor %}
{% assign contributorkeys = contributorkeys | uniq %}
{% assign mentionkeys="" | split: "," %}
{% assign entries=site.entries | map: "content" %}{% for entry in entries %}{% assign data = entry | split: 'span class="person"' | where_exp: "item","item contains 'data-person-slug='" %}{% for mention in data %}{% assign split = mention | split: '"' %}{% assign mentionkeys = mentionkeys | push: split[1] %}{% endfor %}{% endfor %}
{% assign mentionkeys = mentionkeys | uniq %}
{% assign allkeys=mentionkeys %}{% for key in contributorkeys %}{% assign allkeys = allkeys | push: key %}{% endfor %}{% assign allkeys=allkeys | uniq %}
{% assign updatedate = site.entries | group_by_exp: 'item','item.last_modified_at' | sort: "name" | map: "name" | last %}{% assign testdate = site.people | group_by_exp: 'item','item.last_modified_at' | sort: "name" | map: "name" | last %}{% if updatedate < testdate %}{% assign updatedate = testdate %}{% endif %}{% assign testdate = site.pages | where_exp: 'item','item.name!="sitemap.xml"' | group_by_exp: 'item','item.last_modified_at' | sort: "name" | map: "name" | last %}{% if updatedate < testdate %}{% assign updatedate = testdate %}{% endif %}
<hr/>
<dl class="metadates">
<dt>Site Statistics:</dt>
<dt>Entry Count:</dt><dd>{{ site.entries | size }}</dd>
<dt><a href="{{ site.baseurl }}{% link index-people.md %}">Person Profile Count:</a></dt><dd>{{ allkeys | size }}</dd>
<dt>Contributor Count:</dt><dd>{{ contributorkeys | size }}</dd>
<dt>Last Update:</dt><dd>{{ updatedate | date: site.date_format }}</dd>
</dl>
