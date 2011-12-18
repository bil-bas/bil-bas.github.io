---
layout: project
title: Wrath
full_title: "Wrath: Appease or Die!"
status: Beta
---

A game of sacrifice and wearing a chicken on your head (2 players, locally or networked).

[Downloads](releases/)

<%= render "project_links", tig_source: 19459, gosu: 554 %>

The game is played on a number of maps (which are semi-randomly generated), such as:

<%=
 gallery ["wrath-21-lightning", "Pirate ship level", "Yarrrrrrrrr!!!!!!"],
         ["wrath-22-volcano-island", "Desert island level", "The desert island, where the priests have to keep the volcano god from getting angry"],
         ["wrath-29-better_craters", "Yuggoth level", "In space, no-one can hear you wear a chicken on your head"],
         ["wrath-30-the_kraken", "Undersea level", "Deep under the sea, where the probing tentacles of the Kraken threaten to crush the priests"]
%>

## Music

<%= render 'music', pieces: [
        "http://dl.dropbox.com/u/33370854/games/wrath/music/Give_Me_A_Map",
        "http://dl.dropbox.com/u/33370854/games/wrath/music/No_Map",
        "http://dl.dropbox.com/u/33370854/games/wrath/music/Turn_For_The_Worst"
    ]
%>
