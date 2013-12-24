# Summary #
Helper CHEF repository for my devbox box configuration. Suitable for:

- LAMP
- MEAN stack
- Java stack


## Attributes ##

**node[:user][:name]**

Requires you to specify name of the user for whom we are installing




**default[:developer_bootstrap][:home_dir]**

User's home folder, by default


*default[:developer_bootstrap][:home_dir] = '/home/'+node[:user][:name]*


**default[:developer_bootstrap][:apps_dir]**

Directory where user software will be installed, by default


default[:developer_bootstrap][:apps_dir] = default[:developer_bootstrap][:home_dir] + "/apps"


## Recipes ##

###apache_solr4
Performs default setup of the SOLR 4.6.0;  Reuses tomcat cookbook.
For best results with chef-solo, override ssl passwords in environment:
<pre>
 "override_attributes":{
      "tomcat" : {
                   "keystore_password": "devroot",
                    "truststore_password": "devroot"
                  }                 

    }
</pre>

also make sure that you have tomcat_users databag in place so the recipe could configure tomcat users rights.
Example of the databag item:
<pre>
{
  "id": "root",
  "password": "devroot",
  "roles": [
    "manager",
    "admin"
  ]
}
</pre>


###default
gpick - color picker,
xclip - console operations with clipboard, mc - midnight commander, htop - handy process monitor, nautilus-open-terminal - menu item to open current folder in terminal, rabbitVCS - gui for git/SVN/mercurial

###common_schema
Installs DBA framework Common_Schema 2.2  [http://code.openark.org/blog/mysql/common_schema-2-2-better-queryscript-isolation-tokudb-table_rotate-split-params](http://code.openark.org/blog/mysql/common_schema-2-2-better-queryscript-isolation-tokudb-table_rotate-split-params) , requires MySQL/MariaDB/Percona to be installed.

Check usage options: [http://www.percona.com/live/london-2013/sites/default/files/slides/common_schema-pllondon-2013_0.pdf](http://www.percona.com/live/london-2013/sites/default/files/slides/common_schema-pllondon-2013_0.pdf)

### googlechrome
Stable google chrome browser

### ideaj
IntelliJ IDEA — The Best Java and Polyglot IDE, community edition


### ideaj_pro
IntelliJ IDEA — The Best Java and Polyglot IDE, pro (trial) edition

### mailcatcher
Debug tool to catch emails send from the box. Nicely mocks sendmail and SMTP servers.
[http://mailcatcher.me/](http://mailcatcher.me/)
Web interface available on port **1080**

### mariadb_client
Client packages for mariaDB, note: requires appropriate environment settings:
<pre>
  "mariadb": {
                   "version":"5.5"
                },
     "mysql" :  {
                   "use_upstart": false,
                   "server_root_password": "devroot",
                   "server_repl_password": "devrepl",
                   "server_debian_password": "devdebian",                   
                   "client": {
                                "packages":["mariadb-client", "libmariadbclient-dev"]
                             },
                   "server": {
                                "packages":["mariadb-server"]
                             }          
                }

</pre>

###mariadb_server
MariaDB server (MySQL compatible) - see notes for **mariadb_client**

###percona_toolkit
Percona Toolkit for MySQL is a collection of advanced command-line tools used by Percona MySQL Support staff to perform a variety of MySQL server and system tasks that are too difficult or complex to perform manually, including:

- Verify master and replica data consistency
- Efficiently archive rows
- Find duplicate indexes
- Summarize MySQL servers
- Analyze queries from logs and tcpdump
- Collect vital system information when problems occur

More: [http://www.percona.com/doc/percona-toolkit/2.2/](http://www.percona.com/doc/percona-toolkit/2.2/)

### php_webgrind
Webgrind is a Xdebug profiling web frontend in PHP5. It implements a subset of the features of kcachegrind and installs in seconds and works on all platforms

- Super simple, cross platform installation - obviously :)
- Track time spent in functions by self cost or inclusive cost. Inclusive cost is time inside function + calls to other functions.
- See if time is spent in internal or user functions.
- See where any function was called from and which functions it calls.
- Generate a call graph using gprof2dot.py

[https://github.com/jokkedk/webgrind](https://github.com/jokkedk/webgrind)

### php_xdebug
Debug extension for PHP

### phpmyadmin

Classic web frontend for mysql, available at /phpmyadmin/ virtual folder

###phpstorm
Jetbrains IDE for PHP development

### pycharm 
Jetbrains IDE for python development, community edition, classic python only

### pycharm_pro
Jetbrains IDE for pythin development, professional edition, modern python frameworks support

### rabbitvcs
GUI for git, subversion, mercurial. Smth like TortoiseSVN/TortoiseGit on windows box

### rubymine
Jetbrains IDE for ruby development

### teamviewer
Remote access to your box (non commercial use only)

### webmin
Best web based administration tool for managing your servers without console.

# How to use #

See [https://github.com/Voronenko/chef-developer_bootstrap](https://github.com/Voronenko/chef-developer_bootstrap)
