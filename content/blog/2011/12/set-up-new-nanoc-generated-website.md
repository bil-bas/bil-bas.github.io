---
kind: article
title: Set up new nanoc-generated website
created_at: 2011-12-02
tags: [ 'nanoc', 'website', 'ruby' ]
---

I started using [nanoc] in order to generate a bit more interesting site. Previously, I just had a single, hand-generated page, which was fine as a list of links really, but it wasn't useful as a showcase of my projects and I quite liked the idea of having my own blog. Whether I'll blog more than once a year or not, is another question.

[nanoc] seems to be pretty good overall and I think it was a better choice for me than [Jekyll], which I'd used previously (this is because [Jekyll] can be used to directly host at [Github], which is good, but it doesn't support HAML in that usage, which is bad). It isn't too complicated to set up and I use HAML for layout, kramdown for content and Sass for style quite nicely.

One thing that dismays me a little with [nanoc] is that you have to manually manage rules for compilation and routing, when it could have much more reasonable defaults set up and a bit more assumption of standard practice.

I know it is probably not exemplary, but the generator source for this whole site is freely available at [Github](https://github.com/Spooner/spooner.github.com/tree/generator).

[Github]: https://github.com/
[nanoc]: http://nanoc.stoneship.org/
[Jekyll]: http://jekyllrb.com/