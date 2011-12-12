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

![Screenshot showing split-screen](/images/screenshots/zed_and_ginger_17-2-player-cameras.png "Split-screen with 2 players")

<iframe class="youtube-player" type="text/html" width="640" height="480" src="http://www.youtube.com/embed/bg4phgKflDo" frameborder="0">

[Metro-cross]: http://en.wikipedia.org/wiki/Metro-Cross
[Ray]: http://mon-ouie.github.com/projects/ray.html
[Gosu]: http://www.libgosu.org/
