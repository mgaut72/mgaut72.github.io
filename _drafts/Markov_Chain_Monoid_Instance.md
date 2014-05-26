---
layout: blog_entry
title: "A Markov Chain as a Monoid Instance"
---

# Markov Chains
Markov chains are neat little data structures.  Conceptually, a markov chain
is just a weighted, directed graph.  Each node represents some state, and each
edge represents the probability of transitioning to that next state.

Here is a simple example from wikipedia

<img src="http://upload.wikimedia.org/wikipedia/commons/2/2b/Markovkate_01.svg"
     width="250px" />

This markov chain indicates that if we are on the $E$ node, there is a $30%$
chance we stay on the $E$ node, and a $70%$ chance we transition to the $A$
node. Similiarly, if we are on the $A$ node, there is a $60%$ chance of staying
on the $A$ node, and a $40%$ chance we transition to the $E$ node.

Markov chains really aren't all that complicated, but have some fun
applications.


Some mathjax

$$
\begin{array}{c c c c}
 a & b & c & d & \cdots & z \\\\
 \downarrow & \downarrow & \downarrow & \downarrow & \cdots & \downarrow \\\\
 0 & 1 & 2 & 3 & \cdots & 25 \\\\
 \end{array}
$$


Some syntax highlighting
{% highlight haskell %}
-- file : CryptoTools.hs

import Data.Char (toUpper)

alphaIdxToChar :: Int -> Char
alphaIdxToChar = toEnum . (+ 65)
{% endhighlight %}

`inline code`
