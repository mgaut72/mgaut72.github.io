---
layout: blog_entry
title: "Using the List Monad to Write Prolog-Inspired Haskell"
---

At the University of Arizona, there is a Comparative Languages course
that is designed to introduce students to different programming language
paradigms. This semester, the languages taught were Haskell, Ruby and Prolog.

Going in, I had a small Haskell background, and had never touched either
of Ruby or Prolog.  I found that using backtracking to solve problems
in Prolog was extremely powerful.  On my (long) walk to class today, I realized
that I could probably simulate backtracking in Haskell, using lists.
After some quick googling, I confirmed that the list monad (or non-determinism
monad, if you will) can be used for exactly that.  I came across
[Useful Idioms that will Blow Your Mind](http://www.haskell.org/haskellwiki/Blow_your_mind)
that had some simple(ish) examples
of using the list monad for a backtracking style solution, much like how
one would solve a problem in idiomatic Prolog.

## The Brick Laying Problem

Suppose we had a collection of bricks, all with the same height, and variable
lengths.  We might represent this collection as a multiset or a list.
The problem at hand is to make combinations of these bricks that when
placed side by side, all have the same length.  This will constitute a row.
Then we create multiple rows in order to create some sort of wall.

This problem is taken from the University of Arizona's CSc 372 Spring 2014,
as taught by Mr. William Mitchell.  Specifically, see
[his Prolog slides](http://www.cs.arizona.edu/classes/cs372/spring14/prolog.pdf)
page 184.

### Prolog Solution

We first have a predicate `layrow` that, given a multiset of bricks, and
a desired length for the row, create a possible ordering of bricks to make
up a row.

{% highlight prolog %}
layrow(Bricks, 0, Bricks, []).

layrow(Bricks, RowLen, Left, [Brick|MoreBricksForRow]) :-
  getone(Brick, Bricks, Left0),
  RemLen is RowLen - Brick, RemLen >= 0,
  layrow(Left0, RemLen, Left, MoreBricksForRow).
{% endhighlight %}

`layrow` works by selecting a brick, making sure we haven't gone over the
length of our desired row, then attempting to make a row with of length
`RowLen - Brick`.

Now we take `layrow` and use it to implement `laybricks`, which will create
multiple rows from the bricks provided.

{% highlight prolog %}
laybricks(_,0,_,[]).

laybricks(Bricks, Nrows, RowLen, [Row|Rows]) :-
  layrow(Bricks, RowLen, BricksLeft, Row),
  RowsLeft is Nrows - 1,
  laybricks(BricksLeft, RowsLeft, RowLen, Rows).
{% endhighlight %}

Note that the implementation of laybricks is structurally similar to that
of `layrow`, but now we must provide the desired row length as well as the
desired number of rows.

### Haskell Solution

For the Haskell solution, we will define functions `layrow` and `laybricks`
as we did before, this time using the list monad to non-deterministically
select elements of our multiset of bricks to add to a row.

{% gist mgaut72/6bf96ba3a1bca821d2b7 %}



### Haskell vs. Prolog

The only major difference between the Haskell and Prolog
solutions will be that the Prolog unifies the result variable with all
possible solutions, presenting them in order as we indicate at the prompt; and
the Haskell solution will produce a list of all possible rows of bricks.

Prolog is a pretty neat language.  It definitely encourages interesting
recursive backtracking solutions to problems.  However, Haskell is such
a powerful language that we can solve problems in a Prolog-ish manner using
standard Haskell types, namely the non-determinism monad (good ol' lists).

I think prolog is definitely worth learning, but there is a reason it never
really caught on.  Personally, if I wanted a backtracking solution to
a problem, I would use lists in Haskell.  I would have all the recursive
backtracking power, with a more friendly language with useful libraries.
