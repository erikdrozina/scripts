#   export some variables from vars.txt
source vars.txt

#   handle error
error_exit()
{
  echo "$1" 1>&2
  exit 1
}

echo -e "\nYou are going to initialize Octavi-OS repo and sync it\nFor more info check https://github.com/Octavi-OS/platform_manifest"
echo -e "\nPS: this will overwrite any existing folder with the same name\n\n" 
read -p "How do you want to call the folder? " foldername

#   initializing repo
cd $working_dir && rm -rf $foldername && mkdir $foldername && cd $foldername 
if repo init -u https://github.com/Octavi-OS/platform_manifest.git -b 11 --depth=1; then
    #   syncing repo
    echo -e "repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j8" >> reposync.sh
    bash reposync.sh
    echo -e "DONE! You can start building now :)"
else
    error_exit "Cannot initialize the repo successfully, Aborting."
    cd $local_path
fi
