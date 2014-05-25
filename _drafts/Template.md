---
layout: blog_entry
title: "Post Template"
---

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
