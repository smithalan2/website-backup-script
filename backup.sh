###################
#Website Backup Script
#Alan Smith | smithalan2@gmail.com
# 28/01/2016
###################
#!/bin/sh
##You need to change the below values##
#MySQL Username
mysql_user="db_user"
#MySql user password
mysql_pass="db_pass"
#MySql host
mysql_host="localhost"
#Database to backup
mysql_db="db_name"
#Path to website foler/folder to backup
file_dir="/var/www/html/mysite"
#The folder to save the backups in
backupfolder="/var/home/user/backups"
##No need to change anything below here##
#Get The current date/time
now="$(date +'%d_%m_%Y_%H_%M_%S')"
#Set the backup filename with todays date/time
filename="backup_$now".zip
#Temp path for database dump
temp_mysql="$backupfolder"/db.sql
#Temp path for file dump
temp_files="$backupfolder"/files.zip
#Path to the final backup
fullpathbackupfile="$backupfolder/$filename"
#Start MYSQL Dump
echo "Starting mysql dump"
mysqldump --user=$mysql_user --password=$mysql_pass --host=$mysql_host $mysql_db > $temp_mysql
echo "Finished mysql dump, starting file dump"
#Zip all files in specified directory
zip -r -q $temp_files $file_dir
echo "File Dump Finished, Adding DB And Files to a single zip"
#Add database dump and file dump to a zip
zip -r -q $fullpathbackupfile $temp_mysql $temp_files
echo "Done with zip, removing unneeded files"
#Remove temp mysql file and temp files zip file
rm $temp_mysql
rm $temp_files
echo "Backup finished. Your backup is located at "$fullpathbackupfile
