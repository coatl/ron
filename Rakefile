# Copyright (C) 2006  Caleb Clausen
# Distributed under the terms of Ruby's license.
require 'rubygems'
require 'hoe'
require 'lib/ron/version.rb'
 
if $*==["test"]
  #hack to get 'rake test' to stay in one process
  #which keeps netbeans happy
  $:<<"lib"
#  require 'ron.rb'
#  require "test/unit"
  require "test/test_all.rb"
  Test::Unit::AutoRunner.run
  exit
end

 
 
   Hoe.new("Ron", Ron::VERSION) do |_|

     _.author = "Caleb Clausen"
     _.email = "ron-owner @at@ inforadical .dot. net"
     _.url = "http://rubyforge.org/projects/ron"
     _.summary = "Ron is a ruby-based serialization format for representing any ruby 
object graph."

     _.description = <<'END'
Ron is very much like JSON, but based around Ruby instead of JavaScript.
Stardard Ruby literal notation is extended to include an object literal
and a way to create self-referencing data structures.
END
     _.changes='' #1st version, no changes
   end

   # add other tasks here

