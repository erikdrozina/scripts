source vars.txt

error_exit()
{
  echo "$1" 1>&2
  exit 1
}

read -p "Device codename: " codename
read -p "Folder name with source inside: " foldername

echo -e "\nReady to build!\n"

cd $android_working_dir && cd $foldername
. build/envsetup.sh

if lunch octavi_$codename-userdebug; then

    #   change the value as you desire
    mka octavi -j8
else
    echo -e "\nIssue encountered with lunch, check the error, fix your trees and retry\n"
    cd $local_path
fi