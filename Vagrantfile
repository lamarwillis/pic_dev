# -*- mode: ruby -*-
# vi: set ft=ruby :

#######################################
#                                     #
# Vagrantfile for PIC dev env         #
# Leverages Docker.                   #
#                                     #
#######################################

Vagrant.require_version ">= 1.8.0"
VAGRANTFILE_API_VERSION = "2"

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
DOCKER_HOST_VAGRANTFILE = './HostVagrantFile'

time = Time.new
timestamp = time.strftime("%Y%m%d")

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    # Disable synced folders for the Docker container
    # (prevents an NFS error on "vagrant up")
    #config.vm.synced_folder ".", "/vagrant", disabled: true

    # Local src directory
    config.vm.synced_folder "../src", "/src"

    config.vm.define "pic_dev" do |pic_dev|
        pic_dev.vm.provider "docker" do |d|
            d.build_dir = "."
            d.build_args = "-t=pic_dev:" + timestamp
            d.name = "pic_dev"
            d.remains_running = true
            d.cmd = ["/bin/bash"]
            d.create_args = ["-it"]

            # Uncomment to use Vagrant-managed host, not yet supported.
            # d.vagrant_vagrantfile = "#{DOCKER_HOST_VAGRANTFILE}"
        end
    end
end
