existingversion = `dpkg -s phpmyadmin | grep Version:`

if !existingversion.empty?  
  log "PhpMyAdmin already installed: " + existingversion
  return 
end

package "phpmyadmin"

link "#{node['apache']['dir']}/conf.d/phpmyadmin.conf" do
  to "/etc/phpmyadmin/apache.conf"
  not_if { ::File.directory?("#{node['apache']['dir']}/conf-enabled") }  
end


link "#{node['apache']['dir']}/conf-enabled/phpmyadmin.conf" do
  to "/etc/phpmyadmin/apache.conf"
  not_if { ::File.directory?("#{node['apache']['dir']}/conf.d") }  
end

