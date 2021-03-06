require 'spec_helper'

class Hash
  def method_missing(mn,*a)
    mn = mn.to_s
    if mn =~ /=$/
      super if a.size > 1
      self[mn[0...-1]] = a[0]
    else
      #super unless has_key?(mn) and a.empty?
      self[mn] || self[mn.to_sym]
    end
  end
end

describe "Provisioner" do
  
  let(:e) { Vagrant::Config::ErrorRecorder.new }
  let(:config) { 
    c = Vagrant::Provisioners::Ansible::Config.new
    c.playbook = "playbook"
    c.hosts    = "hosts"
    c
  }
  let(:env) { 
    {:vm  => 
      {:config => 
        {:vm => 
          {:forwarded_ports => [{:guestport => 2222, :hostport => 22}]},
         :ssh => {:host => "localhost", :guest_port => 2222, :username => 'sshuser'}
        },
        :env => {:default_private_key_path => "private_key_path"}
      }
    }
  }
  let(:provisioner) { Vagrant::Provisioners::Ansible.new(env, config) }
  let(:filemock) {
    filemock = double(:tempfile)
    filemock.should_receive(:write).with("[#{config.hosts}]\n")
    filemock.should_receive(:write).with("localhost:22")
    filemock.should_receive(:fsync)
    filemock.should_receive(:close)
    filemock.should_receive(:path).and_return("path")
    filemock.should_receive(:unlink)
    filemock
  }

  it "should provide the correct config class" do
    Vagrant::Provisioners::Ansible.config_class.should == Vagrant::Provisioners::Ansible::Config
  end

  it "should write the correct inventory to a temp file" do
    Tempfile.stub(:new).and_return(filemock)
    provisioner.with_inventory_file({:host => "localhost", :guest_port => 2222}) do |path|
      path.should == "path"
    end
  end

  it "should call ansible-playboot with the right arguments" do
    Tempfile.stub(:new).and_return(filemock)
    provisioner.should_receive(:safe_exec).with(
          "ansible-playbook", 
          "--user=sshuser", 
          "--inventory-file=path", 
          "--private-key=private_key_path", 
          "playbook")
    provisioner.provision!
  end
end