# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugin :git
Hoe.plugin :gemspec
Hoe.plugin :bundler
Hoe.plugin :gemcutter
Hoe.plugins.delete :rubyforge

Hoe.spec 'vagrant-ansible' do
  developer('Dominik Sander', 'git@dsander.de')

  self.readme_file = 'README.md'
  self.history_file = 'CHANGELOG.md'
  self.extra_deps << ["vagrant"]
end

# vim: syntax=ruby