---
title: Alpha Channel v1.4.0
kind: article
layout: article
created_at: 2011-12-22 23:00:00 +0000
tags: [ 'alpha-channel', 'game', 'gosu', 'ruby' ]
---

<%= render 'downloads' %>

### Changelog

  - Settings and high scores now stored in ~/.alpha_channel_spooner
  - Added Easy/Normal/Hard difficulties ('Normal' is a bit easier than previous; 'Hard' is a bit harder)
  - Top 20 global scores are recorded and can be viewed ingame and online: http://www.gamercv.com/gamers/9-spooner
  - Top 20 of your own scores, ignoring global scores, are stored locally (so you don't have to compete with people with reflexes).
  - Pixel glow shrinks as a pixel is wounded, as well as some other minor tweaks.
  - Made the game entirely independent of frames per second, so it can be played on older hardware.
  - Fixed: Mistyped filename meant previous version wouldn't work on Linux :(
  - Fixed: Physics messy when window is dragged while playing.