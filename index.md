---
layout: default
contributors:
    - teddybfez
---
The Splunk Gallery is a community run site to collect stories and artifacts from the history of <a href="https://splunk.com">Splunk, Inc</a>. Many <a href="{{ site.baseurl }}{% link index-people.md %}">people</a> have already contributed to this repository, and we hope [to gather your stories soon]({{ site.baseurl }}{% link CONTRIBUTING.md %})!

<h3>Recent News</h3>
If you're going to be at [.conf2017](https://conf.splunk.com/), make sure to check out the "Literal Data Fabrics" talk on the community stage!

<h3>Recent <a href="{{ site.baseurl }}{% link index-entries.md %}">Gallery Additions</a></h3>
<ul>
{% assign collection = site.entries | sort: 'date' | reverse %}
{% for item in collection limit: 5 %}
    <li><a href="{{ site.baseurl }}{{ item.url }}">{{ item.title }}</a></li>
{% endfor %}
</ul>
