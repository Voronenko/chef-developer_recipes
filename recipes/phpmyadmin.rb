package "phpmyadmin"

link "#{node['apache']['dir']}/conf.d/phpmyadmin.conf" do
  to "/etc/phpmyadmin/apache.conf"  
end


