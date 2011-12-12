---
layout: project
title: Zed and Ginger
status: Beta / CURRENT PROJECT
---

A cat runs! Why does the cat run? (1 or 2 players locally; game based on [Metro-Cross])

[Downloads](releases/)

### High scores

* [Level 1](http://gamercv.com/games/15-zed-and-ginger-level-1)
* [Level 2](http://gamercv.com/games/16-zed-and-ginger-level-2)
* [Level 3](http://gamercv.com/games/17-zed-and-ginger-level-3)
* [Level 4](http://gamercv.com/games/18-zed-and-ginger-level-4)
* [Level 5](http://gamercv.com/games/19-zed-and-ginger-level-5)

[![TIGSource forum](/images/tigsource.png)](http://forums.tigsource.com/index.php?topic=20797.0 "TIGSource forum")
[![Github project](/images/github.png)](https://github.com/Spooner/zed_and_ginger "Github project")

This game was quite a departure for me, since I chose to implement using the [Ray] game library. Although this enabled certain special features, such as access to GPU shaders via GLSL, it isn't widely used as more usual library, [Gosu].

When played with two players, they share the screen if they are close together, but otherwise the screen automagically splits:

<%=
 gallery ["zed_and_ginger_14-2-players_close", "Split-screen close", "Split-screen mode with 2 players close"],
         ["zed_and_ginger_15-2-players_wide", "Split-screen wide", "Split-screen mode with 2 players near, so the screen widens"],
         ["zed_and_ginger_15-2-players_split", "Split-screen split", "Split-screen mode with 2 players far, so the screen splits"]
%>

<%= video "bg4phgKflDo", 560, 315 %>

[Metro-cross]: http://en.wikipedia.org/wiki/Metro-Cross
[Ray]: http://mon-ouie.github.com/projects/ray.html
[Gosu]: http://www.libgosu.org/
