#credits https://github.com/r8/vagrant-lamp/

php_pear "xdebug" do
  action :install
end

template "#{node['php']['ext_conf_dir']}/xdebug.ini" do
  source "xdebug.ini.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
  notifies :restart, resources("service[apache2]"), :delayed
end