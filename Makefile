.PHONY: all test docs gem tar pkg email
all: test

test:
	ruby -Ilib test/test_all.rb

docs:
	rdoc lib/*

pkg: gem tar

gem:
	gem build ron.gemspec

tar:
	tar czf Ron-`ruby -r ./lib/ron/version.rb -e 'puts Ron::VERSION'`.tar.gz `git ls-files`

email: README.txt History.txt
	ruby -e ' \
  require "rubygems"; \
  load "./ron.gemspec"; \
  spec= Gem::Specification.list.find{|x| x.name=="Ron"}; \
  puts "\
Subject: [ANN] Ron #{spec.version} Released \
\n\nRon version #{spec.version} has been released! \n\n\
#{Array(spec.homepage).map{|url| " * #{url}\n" }} \
 \n\
#{Ron::Description} \
\n\nChanges:\n\n \
#{Ron::Latest_changes} \
"\
'
