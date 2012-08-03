# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "vagrant-ansible"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dominik Sander"]
  s.date = "2012-08-03"
  s.description = "Develop & test your ansible playbooks with Vagrant"
  s.email = ["git@dsander.de"]
  s.extra_rdoc_files = ["Manifest.txt"]
  s.files = [".autotest", "CHANGELOG.md", "Manifest.txt", "README.md", "Rakefile", "Vagrantfile.sample", "lib/vagrant-ansible.rb", "lib/vagrant-ansible/provisioner.rb", "lib/vagrant_init.rb"]
  s.homepage = "https://github.com/dsander/vagrant-ansible"
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "vagrant-ansible"
  s.rubygems_version = "1.8.17"
  s.summary = "Vagrant-ansible is a provisioning plugin for Vagrant, that makes developing and testing playbooks for ansible easy."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<vagrant>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_development_dependency(%q<hoe>, ["~> 3.0"])
    else
      s.add_dependency(%q<vagrant>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_dependency(%q<hoe>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<vagrant>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.10"])
    s.add_dependency(%q<hoe>, ["~> 3.0"])
  end
end
