# ansible-config
Software management configuration using ansible 

System: Red Hat Enterprise Linux Server release 7.1

Softwares: 
* Apache 
* Mysql 
* PHP
* Wordpress 
* OpenJDK 7
* Tomcat

Required: Ansible 

## Enable EPEL 
```
sudo yum install wget
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
sudo rpm -ivh epel-release-7-5.noarch.rpm
```

Add mysql in repos 
```
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm
```

Setup ansible: `yum install ansible` 

Configure mysql and setup a test db

`ansible-playbook -i hosts mysql.yml` 

Configure apache 

`ansible-playbook -i hosts apache.yml` 

Only php

`ansible-playbook -i hosts apache.yml --tags "php"` 

Configure tomcat 

`ansible-playbook -i hosts tomcat.yml`

**Single Step Configuration**

```
ansible-playbook -c local -i hosts site.yml
```
