Well, who needed another serialization format? Not me, but that's
what I've made. Ruby Object Notation (Ron) is a textual format for
the representation of Ruby data structures. It's somewhat like
YAML, XML, or (most of all) JSON. However, since it is defined 
entirely within and as a subset of Ruby, it has the slick 
property that Ron expressions are legal Ruby. Thus it is very
like JSON, except that it's Ruby-centered instead of being 
JavaScript-centered.

Another way to look at Ron is as a purely declarative language 
for creating (almost) any type of Ruby data structure.

Ruby already has formats for representing a literal Array, Hash,
Set, String, Symbol, Integer, etc. Ron simply reuses the same
notations for those data types. The major new feature of Ron is
that it provides a literal syntax for representing arbitrary 
Ruby Objects. 

Say you have a class that looks like this:

  class K
    attr :a
    attr :b
  end

A Ron literal that represents a K instance might look like this:

  K-{:@a=>1, :@b=>2}

Better yet, if you provide setters as well as getters, you can 
leave off the @ signs:

  class K 
    attr_accessor :a,:b
  end

  K-{:a=>1, :b=>2}


This construct breaks encapsulation, so use the capability with 
moderation and prudence, please. 

An existing object can be rendered into Ron form with a call to 
Ron.dump:

  Ron.dump([1,2,3])   #=>"[1, 2, 3]"

Ron.load is the inverse operation; it takes a Ron-formatted
string and converts it back to a live Ruby object. (This is
just an alias of eval.):

  Ron.load("K-{:@a=>1, :@b=>2}")  #=> #<K:@a=2, @b=2>


Most objects also have a #to_ron method which works just like
Ron.dump; however, Ron.dump is the preferred form.

In order to facilitate the dumping of bindings, two methods are 
provided that rip out the guts of a Binding and stuff them back 
in again: Binding#to_h and Binding.from_h.

bugs and limitations
Currently, some types of ruby object cannot be dumped. In some 
cases, this is because it is impossible to (correctly) dump those
objects. In others, it's merely difficult. Here are the ones I 
think I should eventually be doing, mostly with ParseTree help:

(anonymous) Class and Module
Method
UnboundMethod
Proc

These are very difficult, and I don't see how to approach them 
correctly (but it would be very nice...):

Thread
Continuation

These are more or less impossible:

File
Dir
Process
IO
