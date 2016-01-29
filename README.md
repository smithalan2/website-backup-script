# Website Backup Script
___
##Summary
This a a Linux bash script for backing up the files and mysql database for a website to the server. It creates a zip file with a MySQL DB dump and zip of all the files.
___
##Usage
To use this script, Login to your server via SSH. CD to a folder on your server to store the backup script. If GIT is not already installed on your server run the following command.

####Note - Ensure the file endings of the backup.sh file are set to Unix, not DOS.

Debian
''''bash
sudo apt-get install git-core
''''

Ubuntu
''''bash
sudo apt-get install git
''''

Once git is installed clone this repository using the following command
''''bash
git clone https://github.com/smithalan2/website-backup-script.git
''''
This will clone the repository into a new folder called website-backup-script, Inside this folder there is the backup.sh script. Make the changes outlined in the configuration section on this page. You can then run the script by cding ito the website-backup-script directory and executing the following command

''''bash
bash backup.sh
''''
The script will output what it is doing when executing and notify you of the path to the saved backup file.

To set up the script to run automatically, you can simply place the shell script in one of the following folders /etc/cron.daily, /etc/cron.hourly, /etc/cron.monthly or /etc/cron.weekly. Otherwise you can use crontab to schedule it yourself. Issue the following command in the terminal
''''bash
crontab -e
''''

It may prompt you to choose an editor, I generally prefer nano. You can then add a line to the bottom of this file in the following format

minute hour day-of-month month day-of-week /path/to/shell/script

Eg. 0 5 * * 6 /var/home/user/backup.sh 
This will execute the script at 05:05 every Saturday.

_____
##Configuration
A number of values need to be specified for the script to work. They are as listed below

###MySQL User
You should replace db_user with the database user with permission to access the database you wish to backup.
''''bash
mysql_user="db_user"
''''

###MySQL Password
You should replace db_pass with the password for the user mentioned above.
''''bash
mysql_pass="db_pass"
''''

###MySQL Host
If needed you should change localhost to your database server. Generally you can keep it as localhost.
''''bash
mysql_host="localhost"
''''

###MySQL Database
This is the database you want to backup. Replace db_name with the name of the database.
''''bash
mysql_db="db_name"
''''

###File Directory
This is the directory containing any subfolders and files belonging to the website you wish to backup. Generally this is something along the lines of /var/www/html
''''bash
file_dir="/var/www/html/mysite"
''''

###Backup Folder
This is the directory where you wish to store the backups that are generated. Ideally
this should be a directory that is not accessible via http. Do not include a trailing slash. This directory needs to be created before running this script.
''''bash
backupfolder="/var/home/user/backups"
''''
