---
layout: page
title: An Error Page
---
Congratulations! You managed to get an error on a statically generated site! Which likely means the URL you were attempting doesn't exist.

Maybe you're interested in browsing our gallery entries {% assign collection = site.indexes | sort: 'title' %}{% for item in collection %}{% if forloop.last %}or {% endif %}<a href="{{ site.baseurl }}{{ item.url }}"> {{ item.title | downcase }}</a>{% unless forloop.last %}, {% endunless %}{% endfor %}. 

Or you might be interested in looking at the profiles of <a href="{{ site.baseurl }}{% link index-people.md %}">people related to this gallery</a>

Or maybe you'd like information on [contributing to the Splunk Gallery]({{ site.baseurl }}{% link CONTRIBUTING.md %}).

Whatever your fancy, it's probably not this. Unless it is, in which case good for you!
