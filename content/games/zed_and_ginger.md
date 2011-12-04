---
kind: project
title: Zed and Ginger
status: Beta / CURRENT PROJECT
---

A cat runs! Why does the cat run? (1 or 2 players locally; game based on [Metro-Cross])

[Downloads](downloads/)

[![TIGSource forum](/images/tigsource.png)](http://forums.tigsource.com/index.php?topic=20797.0 "TIGSource forum")
[![Github project](/images/github.png)](https://github.com/Spooner/zed_and_ginger "Github project")

This game was quite a departure for me, since I chose to implement using the [Ray] game library. Although this enabled certain special features, such as access to GPU shaders via GLSL, it isn't widely used as more usual library, [Gosu].

When played with two players, they share the screen if they are close together, but otherwise the screen automagically splits:

![Screenshot showing split-screen](/images/screenshots/zed_and_ginger_17-2-player-cameras.png "Split-screen with 2 players")

[Metro-cross]: http://en.wikipedia.org/wiki/Metro-Cross
[Ray]: http://mon-ouie.github.com/projects/ray.html
[Gosu]: http://www.libgosu.org/
