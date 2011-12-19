---
kind: article
layout: article
title: Deconstructing Alpha Channel
created_at: 2010-08-28 23:00:00 +0000
tags: [ 'alpha-channel', 'ruby', 'ludum-dare' ]
---

Well, it is a week now since I started working on Alpha Channel for LD#18, my first such competition. In fact, the first time I tried to make a real-time game in nearly a decade, I think!

I came in with no pre-conceived game-ideas, but was really happy that the theme was one that would give me ideas on how the develop game mechanics. I already wrote a journal of how the steps in development went, but I thought I’d discuss my post-competition thoughts now that I’ve had time to relax and to look at 30 other entries.

Apologies now, in case I go on a bit (I know I will  )…


### How did the competition environment compare with regular development?

One of the biggest problems with my own projects, games or not, is that I am both a perfectionist and a feature-creeper. Not particularly unusual among developers, but it does mean a lot of overly ambitious, though unfinished, projects lying around.

<%= screenshot "journal_bad_pixels", "Early version" %>

Working within the competition time constraint was frankly liberating! My ability to throw something together in the most slapdash fashion with a “That’s good enough; I’ll do it properly if I have time at the end” was great. Although I did come back to redo a few things better on the second day, the changes were more to do with directly improving game-play rather than less tangible improvements (like improving the frames per second by 0.1 through excessive attempts at optimisation  ).

The fact that I could get out a moderately playable version so quickly, then iterate towards the final product, was great. Well, that part isn’t so far away from my regular style, but I usually end up getting more involved with re-factoring during the iterations than actually adding new things, which slows apparent progress significantly and is thus demotivating.


### Does Alpha Channel have a future?

After my testers and scorers had played my game and seemed to quite enjoy my game, as far as it went, I was seriously considering further development. I was actually surprised how much people liked it, to tell the truth. The thing is, with a bit more variety and polish, I think it would actually make a decent casual browser game. The problem is that Alpha Channel is not a browser game and I don’t have a lot of interest in learning how to re-make it as one.

<%= screenshot "journal_death", "The death of a pixel" %>

So, I think I failed a little. In trying to make the game and its mechanics simple (though, I hope, elegant), so that I could largely complete it in the time frame, I sort of missed the opportunity to start making a game with depth, even if I barely managed to scratch the surface of its potential in the 48 hours. Only this sort of more involved game, I think, can have potential outside the browser environment.

### Where the graphics stylish or lazy?

<%= screenshot "alpha_channel_linux_v1_1", "Final graphics" %>

Weeeell, that is a difficult question! As I mentioned in my journal, I had originally intended to use a pixellated graphical style, but instead grew attached to the place-holder block graphics and developed that style instead, changing the original concept (wizard and monsters) to one that fitted with the style I’d developed (pixel wars). The background score/level indicators, although most people felt they would be distracting before actually playing, just add to the feeling of being inside a computer screen and, since they barely change except in the top right hand corner, weren’t visually disruptive.

I think the basic idea of going for bold colours and blocks worked to a large degree. It also allowed me to give feedback on health (via alpha channel) and energy (via blue channel) quite elegantly. I do think, however, that I could have made more effort with particles and perhaps other special effects, necessary to liven up what was otherwise a rather flat display.

I’m honestly hoping that [Lair of Fungal Wonder](http://www.niallmoody.com/games/the-lair-of-fungal-wonder) has inspired me to really put some real visual flair into my next game! I’d be using pastels rather than watercolours, but the idea would be the same.


### What would you do differently in the next Ludum Dare?

Although I am not at all sure that Alpha Channel is really worth continued development effort, I like it! I really enjoyed making it and people actually enjoyed playing it, so it definitely was a success in a lot of ways.

I don’t know that I’d have enjoyed making a barely playable game that was complex enough to have a lot of potential, so I’m not sure I would want to try that tack in future competitions. Admittedly, with experience of LD now under my belt, I probably wouldn’t have to aim so low as I did. I’d also want to learn a few of the facets of the libraries I was using that I realised I wanted to use, but knew I didn’t have time to learn or wanted to risk not being able to get working (specifically on-line high scores & hooking up a proper physics engine). I’ve already started committing some improvements to libraries I’ve used (and will use) if only so I’m better prepared and less likely to find bugs when I’m in the next competition!

The biggest thing I’d do differently is to improve the interface. A simple title screen and/or some nice instructions pages would have made a big difference (I had an instructions page, but it was just one big page with tiny writing; should ideally have been a couple of pages with large text and illustrations of how to play). I needn’t have spent much time at the end on something like that to make the game a lot more pleasant to use, considering that game-play wasn’t immediately obvious. However, having made a game-play video and the fact that the game was pretty simple once you got the hang of it, I don’t think I was crippled by lacking decent instructions in this instance.

