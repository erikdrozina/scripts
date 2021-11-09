#   export some variables from vars.txt
source vars.txt

#   handle error
error_exit()
{
  echo "$1" 1>&2
  exit 1
}

echo -e "\nYou are going to initialize ArrowOS repo and sync it\nFor more info check https://github.com/ArrowOS/android_manifest"
echo -e "\nPS: this will overwrite any existing folder with the same name\n\n" 
read -p "How do you want to call the folder? " foldername

#   initializing repo
cd $android_working_dir && rm -rf $foldername && mkdir $foldername && cd $foldername 
if  repo init -u https://github.com/ArrowOS/android_manifest.git -b arrow-11.0 --depth=1; then
    #   syncing repo
    echo -e "repo sync -j$(nproc --all)" >> reposync.sh
    bash reposync.sh
    echo -e "DONE! You can start building now :)"
else
    error_exit "Cannot initialize the repo successfully, Aborting."
    cd $local_path
fi
