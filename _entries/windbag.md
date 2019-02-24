---
title: windbag
date: 2019-02-24
contributors:
    - sideview
---
`| windbag` is an undocumented generating command in your Splunk instance.

This command, created by {% include person.html id="johnvey" %}, came about to help ensure that engineering teams had completed their internationalization projects correctly. If you run the command you will see it create 100 events spanning the last 30 or so hours, most of them with a [rough](https://en.wikipedia.org/wiki/Babel_Fish_%28website%29) translation of the phrase ["I can eat glass, it does not hurt me"](https://en.wikipedia.org/wiki/I_Can_Eat_Glass). While today, this is a harmless command, showing some interesting edge cases being handled in Splunk for [host=HAL_9000 source=SpaceOdyssey](https://en.wikipedia.org/wiki/2001:_A_Space_Odyssey), during the i18n project it often caused crashes in development builds and in doing so helped find a number of places where UTF-8 wasn't finished being implemented.

Today this command can sometimes still be useful since unlike [`| makeresults`](https://docs.splunk.com/Documentation/Splunk/latest/SearchReference/makeresults), `windbag` actually generates events as opposed to results, so can help with certain mockups and tests requiring the same.
