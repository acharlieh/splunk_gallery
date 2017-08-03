---
title: Playing Cards
date: 2017-07-28
contributors:
    - firebus
    - sideview
    - erin
media:
    - url: https://www.co-store.com/Default.aspx?Product=439953
      description: Splunk Store Link
    - image: signed_deck.jpg
      contributor: firebus
      thumb: true
---

The deck of Splunk playing cards was thought up by {% include person.html id="monzy" %}. The thought being, it would be a slightly different way for people to learn search commands. The face cards are all the pictures of a number of long time Splunk employees, primarily trying to get folks who were influential in the development of [SPL](https://www.splunk.com/en_us/resources/search-processing-language.html). {% include person.html id="firebus" %} took his copy of the deck one step further, and got all of the face cards signed by the corresponding people.

The deck was initally distributed at a .conf... believed to be 2013 (but could be off).

{% capture vi %}{% include person.html id="vi" %}{% endcapture %}
{% capture george %}{% include person.html id="gyoshinaga" %}{% endcapture%}

<h3>Deck Index</h3>
{% assign suits="joker,diamonds,clubs,hearts,spades" | split: ',' %}
{% for s in suits %}{% assign suit=site.data.cards[s] %}<dl class="deck">{% for card in suit.cards %}
<dt class="{{card.color | default: suit.color }}">{{card.rank}} {{suit.suit}}</dt>
{% if card.person %}<dd>{% include person.html id=card.person %}</dd>{% endif %}
{% if card.command %}<dd><a href="https://docs.splunk.com/Documentation/Splunk/latest/SearchReference/{{card.command}}" target="_new">{{card.command}}</a></dd>{% endif %}
{% if card.reason %}<dd><i>{{card.reason | markdownify | remove: '<p>' | remove: '</p>' | replace_first: "Vi",vi | replace_first: "George",george }}</i></dd>{% endif %}
{% endfor %}</dl>{% endfor %}
