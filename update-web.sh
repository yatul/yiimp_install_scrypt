#!/bin/bash
################################################################################
# Original Author:   yatul
# Web:     
#
# Program:
#  Updates yiimp from git applying settings from answers file I
# 
# 
################################################################################
output() {
    printf "\E[0;33;40m"
    echo $1
    printf "\E[0m"
}

displayErr() {
    echo
    echo $1;
    echo
    exit 1;
}

    output " "
    output "Make sure you double check before hitting enter! Only one shot at these!"
    output " "
    read -e -p "Please enter a new location for /site/adminRights this is to customize the admin entrance url (e.g. myAdminpanel) : " admin_panel
	
    output " "
    output " Updating yiimp"
    output " "
    output "Grabbing yiimp fron Github, building files and setting file structure."
    output " "
    sleep 3
    
    
    cd ~/yiimp
    git reset --hard && git pull 
    sudo sed -i 's/AdminRights/'$admin_panel'/' $HOME/yiimp/web/yaamp/modules/site/SiteController.php
   
 output  " Copying new web sources "
     sudo cp -rf $HOME/yiimp/web /var/
    

output " Update completed"
