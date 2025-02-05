#!/sbin/sh

module_dir="/data/adb/modules/Surfing"

[ -n "$(magisk -v | grep lite)" ] && module_dir=/data/adb/lite_modules/Surfing

scripts_dir="/data/adb/box_bll/scripts"

(
until [ $(getprop sys.boot_completed) -eq 1 ] ; do
  sleep 3
done
${scripts_dir}/start.sh
)&

inotifyd ${scripts_dir}/box.inotify ${module_dir} > /dev/null 2>&1 &