include_recipe "mysql::server"

apt_repository "mariadb" do
  platform = node['platform']
  unless ['debian', 'ubuntu'].include?(platform)
    raise "Unsupported platform: #{platform}"
  end
  uri "http://mirrors.supportex.net/mariadb/repo/#{node[:mariadb][:version]}/#{node[:platform]}"
  distribution node['lsb']['codename']
  components ['main']
  keyserver "keyserver.ubuntu.com"
  key "0xcbcb082a1bb943db"
  action :add
end

# Reload package list through 'apt-get update'
include_recipe "apt::default"

include_recipe "mysql::server"