source vars.txt

error_exit()
{
  echo "$1" 1>&2
  exit 1
}

read -p "Folder name with source inside: " foldername

if cd $android_working_dir$foldername; then

    echo -e "\nCloning Tucana DT\n"
    git clone https://github.com/erikdrozina/device_xiaomi_tucana device/xiaomi/tucana -b octavi-12

    echo -e "\nCloning Common DT\n"
    git clone https://github.com/erikdrozina/device_xiaomi_sm6150-common device/xiaomi/sm6150-common -b octavi-12

    echo -e "\nCloning Kernel Tree\n"
    git clone https://github.com/alibei/kernel_xiaomi_sm6150 kernel/xiaomi/sm6150 -b twelve

    echo -e "\nCloning Vendor Tree\n"
    git clone git@gitlab.com:erikdrozina/android_vendor_xiaomi.git -b 12 vendor/xiaomi

    echo -e "\nCloning Xiaomi Hardware\n"
    git clone https://github.com/erikdrozina/android_hardware_xiaomi -b 12 hardware/xiaomi
else
    error_exit "Cannot find the path, Aborting."
    cd $local_path
fi

