source vars.txt

error_exit()
{
  echo "$1" 1>&2
  exit 1
}

read -p "Folder name with source inside: " foldername

if cd $android_working_dir$foldername; then

    echo -e "\nCloning Tucana DT\n"
    git clone https://github.com/OctaviOS-Devices/device_xiaomi_tucana device/xiaomi/tucana

    echo -e "\nCloning Common DT\n"
    git clone https://github.com/OctaviOS-Devices/device_xiaomi_tucana device/xiaomi/sm6150-common

    echo -e "\nCloning Kernel Tree\n"
    git clone https://github.com/OctaviOS-Devices/kernel_xiaomi_tucana kernel/xiaomi/sm6150

    echo -e "\nCloning Vendor Tree\n"
    git clone https://gitlab.com/alibei/android_vendor_xiaomi-oss vendor/xiaomi

    echo -e "\nCloning Xiaomi Hardware\n"
    git clone https://github.com/alibei/android_hardware_xiaomi hardware/xiaomi -b lineage-18.1
else
    error_exit "Cannot find the path, Aborting."
    cd $local_path
fi

