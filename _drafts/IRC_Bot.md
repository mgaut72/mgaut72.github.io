---
layout: blog_entry
title: "Markov Chains in the 'Real World' (IRC Bot Part 2)"
---

Same intro from [last time](1):

So you know where we are going, the goal of this project is to create an IRC
bot that responds to the channel with statements seeds from that channel.  To
do this, I will create a Markov chain data structure, which can modify itself
to update with the current conversations of the room.

You can find the code for the Markov chain in [this repo](2).





[1]: {% post_url 2014-05-27-Markov_Chain_Monoid_Instance %}
[2]: https://github.com/mgaut72/MarkovChain
