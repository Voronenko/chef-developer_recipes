apt_repository "percona" do
  uri "http://repo.percona.com/apt"
  components ["main"]
  distribution node['lsb']['codename']
  keyserver "keys.gnupg.net"
  key "1C4CBDCDCD2EFD2A"
end

# Reload package list through 'apt-get update'
include_recipe "apt::default"

# Install percona toolkit
package "percona-toolkit" do
  action :install
end


