---
kind: article
title: Set up new website
created_at: 2011-12-02
tags: [ 'nanoc', 'website', 'ruby' ]
---

I started using [nanoc] in order to generate a bit more interesting site. Previously, I just had a single, hand-generated page, which was fine as a list of links really, but it wasn't useful as a showcase of my projects and I quite liked the idea of having my own blog. Whether I'll blog more than once a year or not, is another question.

[nanoc] seems to be pretty good overall and I think it was a better choice for me than [Jekyll], which I'd used previously (this is because [Jekyll] can be used at [Github], but there aren't actually any significant advantages to using it over generating flat pages and uploading them). It isn't too complicated and manages HAML for layout, kramdown for content and SASS for style quite nicely.

One thing that dismays me a little with [nanoc] is that you have to manually manage rules for compilation and routing, when it could have much more reasonable defaults set up and a bit more assumption of standard practice.

[Github]: https://github.com/
[nanoc]: http://nanoc.stoneship.org/
[Jekyll]: http://nanoc.stoneship.org/