
echo "welcome to A2z Cloud wordpress migration tool for CyberPanel & Wordpress All in One Migration"
echo "*****************************************"
echo "Script by: Ar Aditya Rathore World®. All rights reserved"
echo "*****************************************"
echo "Please enter the domain name to migrate without https:// or wwww? (ex. a2zcloud.net)"
read website
path="/home/$website/public_html/wp-content"
if [ ! -d $path ]
then
    echo "Either you had entered invalid domain name or wordpress is not installed on this path"
    exit 9999 # die with error code 9999
fi
USER=$(stat -c '%U' $path)
echo "$USER is selected as a USER for website."
path2="$path/ai1wm-backups"
if [ ! -d $path2 ]
then
    echo "Creating ai1wm-backups directory"
    mkdir $path2
    chown -R "$USER":"$USER" "$path2"
    chmod 775 -R "$path2"
fi
echo "Good changing directory to $path2"
cd $path2;
echo "*****************************************"
echo "Please enter the download url for backup file?"
read URLBACKUP
BASE=$(basename ${URLBACKUP})
FILE=$(printf '%b' ${BASE//%/\\x})
if [[ $FILE == *.wpress ]]
then
        wget $URLBACKUP
else
        echo "Invalid File extension for $FILE should be $website-xxx.wpress, Exiting Now!!"
        exit 9999 # die with error code 9999
fi
echo "*****************************************"
echo "Downloaded $FILE successfully, changing permissions!!"
chown -R "$USER":"$USER" "$FILE"
chmod 775 -R "$FILE"
echo "*****************************************"
echo "All set,You can now restore backup in your wordpress!! Bye."
