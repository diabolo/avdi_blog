# NOTES

This is now being used to store notes about what I think is especially
important to remember about what I've learnt from the book.

## Dependency Injection

Dependency injection is really easy in ruby. Combining it with convention over
configuration allows us to avoid the 'having to wire everything' problems that
we have in things like Spring. The mechanism for Post.publish receiving a
clock and the Blog sourcing its posts are examples of this.

## Factories

Factories are really easy in Ruby, the Blog sourcing its posts mechanism is
actually an example of the Factory pattern done in Ruby. Again because we are
using a default this becomes really easy. 

## SRM

Using factories and di as above makes our classes do SRP (Single
Responsibility Principle). If you look at the source you can see how this
usage means there are no references to other classes in the implementation
code. So our class is decoupled.


## Controller Lone Wolf anti-pattern

Any method in a controller that calls a class method directly is suspicious.
The following occur all the time in standard rails controllers

    foo = Foo.create  # or new, find etc.

This creates a lone wolf, on object that is not part of any hierarchy. This
makes testing much more painful (not that I do controller tests). Instead all
object should come from methods called on existing objects, so a FooController
should do something like

    foo = @blog.new_foo

Now of course this means you have to get the existing object before the
controller method is called, and that leads to some interesting questions, but
the value of spotting this anti-pattern is really important.

