#!/bin/bash
sudo yum -y update
sudo yum localinstall -y https://dev.mysql.com/get/mysql80-community-release-el7-2.noarch.rpm   
sudo yum install -y mysql-community-server        
