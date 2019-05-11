The goal here is to build a network (all machines CentOS7):
- a server used as a reverse proxy (Apache HTTP Server) - adress 192.168.60.4
- an application server (Tomcat) - adress 192.168.60.5
- a Database Server -adress 192.168.60.6
We would like to be able to access the management of Tomcat, the app, and the database management through the web browser of the web server.
We have build this using Virtual Machines and Ansible, but it should be easily adapted to real machines.

We have simply used the mod_proxy modules of Apache and built <Virtual Host> VHs in a vhost.conf file (see apache/templates). To make the aliases understandable, we have also changed the local DNS of the machine in dns.conf (see apache/templates) - stating that the machines were brand new, we just replace the existing file but you might want to add the aliases through sed instead if you run the program on used machines.


To run : 
1. Install Ansible
2. Command: $ ansible-playbook -i hosts site.yml
3. Access tomcat : curl tomcat (or type tomcat in the adress bar of your graphic browser)
4. Acces the app : curl app (or type app in the adress bar of your graphic browser)
