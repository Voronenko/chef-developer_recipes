remote_file "#{Chef::Config[:file_cache_path]}/vagrant.deb" do
  source "https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.1_i686.deb"
  mode 0644
end

dpkg_package "vagrant" do
  source "#{Chef::Config[:file_cache_path]}/vagrant.deb"
  action :install
end
