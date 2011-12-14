---
title: Wrath v0.1.0
kind: article
layout: article
created_at: 2011-06-07 12:00:00 +0000
tags: [ 'wrath', 'game', 'gosu', 'ruby' ]
---

* [Windows executable](http://dl.dropbox.com/u/33370854/games/wrath/wrath_v0_1_0_WIN32.zip) [2.5MB]
* [OS X 10.6 executable](http://dl.dropbox.com/u/33370854/games/wrath/wrath_v0_1_0_OSX_10_6.zip) [9.6MB]
* [Linux - Ruby source](http://dl.dropbox.com/u/33370854/games/wrath/wrath_v0_1_0_SOURCE.zip) [184K]


### Changelog

* Changed default online player controls to same as player 1. Reset everyone's settings to default.
* Collects game-play statistics locally (for achievements).
* Added achievements and unlocks system.
* Added some more sound effects (but nowhere near enough).
* Can't pick up creatures that can hurt you, or the other player, unless they are knocked down first.
* Knocked back when hit by a monster, rather than taking damage-over time (fire still burns slowly, however).
* Gods love certain sacrifices at any given time, which will net greatly increased favour.
* Favour of object currently carried is indicated next to favour bars.
* Can set sound volume and window size in options (sorry, no full-screen mode yet).
* Added 2 new playable priests.
* Added creature spawning (how could I not have put it in yet?) and reduced favour value of most objects.
* Containers, such as chests, spawn items if left empty.
* Added level under the sea.
* Added level in a tech facility (AI _are_ gods, aren't they?).
* Added level in a desert (reused lighting storm disaster effect, though, until unique one created)
* Added level on a moon with radioactive meteors.
* Network stats overlay (Ctrl-N).
* Poison/growth status effects are not properly synchronised in network play.
* Countless other things I forgot to write down.

### Changelog

* Possible to juggle (continually pick up and throw) the other player, so they never get to act.
* Possible to get killed by being continually hit into a wall.
* Enemies don't care if they are getting killed in lava, etc.
