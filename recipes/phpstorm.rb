remote_file "#{Chef::Config[:file_cache_path]}/phpstorm.tar.gz" do
  source "http://download.jetbrains.com/webide/PhpStorm-7.0.tar.gz"
  action :create_if_missing
  notifies :run, "bash[install_phpstorm]", :immediately
end

bash "install_phpstorm" do 
  cwd "#{Chef::Config[:file_cache_path]}"
  code <<-EOH
    echo installing PHPStorm from #{Chef::Config[:file_cache_path]}
    tar -zxf #{Chef::Config[:file_cache_path]}/phpstorm.tar.gz 
    mv #{Chef::Config[:file_cache_path]}/PhpStorm*  #{Chef::Config[:file_cache_path]}/PhpStorm
    cp #{Chef::Config[:file_cache_path]}/PhpStorm #{node[:developer_bootstrap][:apps_dir]}/PhpStorm     
  EOH
  action :run
end
