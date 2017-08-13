---
layout: default
contributors:
    - teddybfez
---
The Splunk Gallery is a community run site to collect stories and artifacts from the history of <a href="https://splunk.com">Splunk, Inc</a>. Many <a href="{{ site.baseurl }}{% link index-people.md %}">people</a> have already contributed to this repository, and we hope [to gather your stories soon]({{ site.baseurl }}{% link CONTRIBUTING.md %})!

<h3>Recent News</h3>
If you're going to be at [.conf2017](https://conf.splunk.com/), make sure to check out the "Literal Data Fabrics" talk at [2:45p on Wednesday, 27 September in the Community Theater](https://conf.splunk.com/sessions/2017-sessions.html#search=Fabric)!

<h3>Recent <a href="{{ site.baseurl }}{% link index-entries.md %}">Gallery Additions</a></h3>
<ul>
{% assign collection = site.entries | sort: 'date' | reverse %}
{% for item in collection limit: 5 %}
    <li><a href="{{ site.baseurl }}{{ item.url }}">{{ item.title }}</a></li>
{% endfor %}
</ul>

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
<dt><a href="{{ site.baseurl }}{% link index-entries.md %}">Entry Count:</a></dt><dd>{{ site.entries | size }}</dd>
<dt><a href="{{ site.baseurl }}{% link index-people.md %}">Person Profile Count:</a></dt><dd>{{ allkeys | size }}</dd>
<dt>Contributor Count:</dt><dd>{{ contributorkeys | size }}</dd>
<dt>Last Update:</dt><dd>{{ updatedate | date: site.date_format }}</dd>
</dl>
