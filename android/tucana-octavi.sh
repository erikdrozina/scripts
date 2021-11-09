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
    git clone https://github.com/OctaviOS-Devices/device_xiaomi_tucana-common device/xiaomi/sm6150-common

    echo -e "\nCloning Kernel Tree\n"
    git clone https://github.com/OctaviOS-Devices/kernel_xiaomi_tucana kernel/xiaomi/sm6150

    echo -e "\nCloning Vendor Tree\n"
    git clone https://gitlab.com/erikdrozina/android_vendor_xiaomi -b 12 vendor/xiaomi

    echo -e "\nCloning Xiaomi Hardware\n"
    git clone https://github.com/erikdrozina/android_hardware_xiaomi -b 12 hardware/xiaomi
else
    error_exit "Cannot find the path, Aborting."
    cd $local_path
fi

