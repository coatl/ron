# -*- encoding: utf-8 -*-

require './lib/ron/version'
Ron::Description=open("README.txt"){|f| f.read[/^==+ ?description[^\n]*?\n *\n?(.*?\n *\n.*?)\n *\n/im,1] }
Ron::Latest_changes="###"+open("History.txt"){|f| f.read[/\A===(.*?)(?====)/m,1] }

Gem::Specification.new do |s|
  s.name = "Ron"
  s.version = Ron::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Caleb Clausen"]
  s.date = Time.now.strftime("%Y-%m-%d")
  s.email = %q{caleb (at) inforadical (dot) net}
  s.extra_rdoc_files = ["README.txt", "COPYING", "GPL"]
  s.files = `git ls-files`.split
  s.has_rdoc = true
  s.homepage = %{http://github.com/coatl/ron}
  s.rdoc_options = %w[--inline-source --main README.txt]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ron}
  s.rubygems_version = %q{1.3.0}
  s.test_files = %w[test/test_all.rb]
  s.summary = "Ruby Object Notation (Ron) is a ruby-based textual format for representing Ruby data."
  s.description = Ron::Description

=begin
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mime-types>, [">= 1.15"])
      s.add_runtime_dependency(%q<diff-lcs>, [">= 1.1.2"])
    else
      s.add_dependency(%q<mime-types>, [">= 1.15"])
      s.add_dependency(%q<diff-lcs>, [">= 1.1.2"])
    end
  else
    s.add_dependency(%q<mime-types>, [">= 1.15"])
    s.add_dependency(%q<diff-lcs>, [">= 1.1.2"])
  end
=end
end
