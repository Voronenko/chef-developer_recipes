remote_file "#{Chef::Config[:file_cache_path]}/phpstorm.tar.gz" do
  source "http://download.jetbrains.com/webide/PhpStorm-7.0.tar.gz"
  owner node[:user][:name]
  action :create_if_missing
  notifies :run, "bash[install_phpstorm]", :immediately
end

directory node[:developer_bootstrap][:apps_dir] do
  owner node[:user][:name]
  mode "0755"
  action :create
end

bash "install_phpstorm" do 
  cwd "#{Chef::Config[:file_cache_path]}"
  code <<-EOH
    echo installing PHPStorm from #{Chef::Config[:file_cache_path]}
    tar -zxf #{Chef::Config[:file_cache_path]}/phpstorm.tar.gz 
    mv #{Chef::Config[:file_cache_path]}/PhpStorm*  #{Chef::Config[:file_cache_path]}/PhpStorm
    mv #{Chef::Config[:file_cache_path]}/PhpStorm #{node[:developer_bootstrap][:apps_dir]}/PhpStorm    
    chown -R #{node[:user][:name]} #{node[:developer_bootstrap][:apps_dir]}/PhpStorm 
  EOH
  action :run
end
