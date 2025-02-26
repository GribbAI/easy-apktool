#!/bin/bash


clear
bash setup.bash

clear
logo=$(cat <<EOF



   █████████             ███  █████     █████
  ███░░░░░███           ░░░  ░░███     ░░███
 ███     ░░░  ████████  ████  ░███████  ░███████
░███         ░░███░░███░░███  ░███░░███ ░███░░███
░███    █████ ░███ ░░░  ░███  ░███ ░███ ░███ ░███
░░███  ░░███  ░███      ░███  ░███ ░███ ░███ ░███
 ░░█████████  █████     █████ ████████  ████████
  ░░░░░░░░░  ░░░░░     ░░░░░ ░░░░░░░░  ░░░░░░░░


 __  __
|   |  | |<< | |
|<< |><| --  \</
|__ |  | >>|  |
   __
  |  | |<<' |  /   >>|<<  >>   >>  |
  |><| |>>| |<<      |   |  | |  | |
  |  | |    |  \     |    <<   <<  |<<



\n
EOF
)

echo -e "\e[31m$logo\e[0m"



input_dir="original-apk"
output_dir="hacked-apk"
decomp_dir="decomp-apk"
config_file="hacked-apk/config.txt"

if [ ! -d "$input_dir" ]; then
  echo -e "\e[31mfolder $input_dir not found\e[0m"
  exit 1
fi

if [ ! -f "$config_file" ]; then
  echo -e "\e[31mconfig file $config_file not found\e[0m"
fi

if [ -z "$(ls -A $input_dir)" ]; then
    echo -e "\e[31minput directory $input_dir is empty\e[0m"
    exit 1
fi

echo -e "\e[36mEnter [CTRL + C] for exit\e[0m"
echo -e "\e[36mEnter [ckey] for create key storage\e[0m"
echo -e "\e[36mEnter [d] for decompilation or [b] for building\e[0m\n"

while true; do
  read -p "$(echo -e "> ")" action
  if [ "$action" == "d" ]; then
    for apk_file in "$input_dir"/*.apk; do
      if [ -f "$apk_file" ]; then
        apk_name=$(basename "$apk_file" .apk)
<<<<<<< HEAD
        echo -e "\e[32mstart decompilation \e[34m$apk_name\e[0m\n"
=======
        
        #echo -e "\e[32mstart decompilation in Java \e[34m$apk_name\e[0m\n"
        #apktool d -s "$apk_file" -o "$decomp_dir/$apk_name-jadx"
#        jadx -d "decomp-apk/$apk_name-jadx/classes" "decomp-apk/$apk_name-jadx/classes.dex"
        #jadx -d "$decomp_dir/$apk_name-jadx" "$apk_file"
        
        
        echo -e "\e[32mstart decompilation in Smali \e[34m$apk_name\e[0m\n"
>>>>>>> 0eef4d9 (new update)
        apktool d "$apk_file" -o "$decomp_dir/$apk_name"
        echo -e "\n\e[32mdone\e[0m"
      fi
    done
  
  elif [ "$action" == "b" ]; then
    name_key=$(grep 'name_key:' "$config_file" | cut -d' ' -f2)
    alias_key=$(grep 'alias-key:' "$config_file" | cut -d' ' -f2)
    password_key=$(grep 'password-key:' "$config_file" | cut -d' ' -f2)
  
    for apk_file in "$decomp_dir"/*; do
      if [ -d "$apk_file" ]; then
        apk_name=$(basename "$apk_file")
        echo -e "\e[32mstart building \e[34m$apk_name\e[0m\n"
        apktool b "$apk_file" -o "$output_dir/apk/$apk_name.apk"  &&
        
        echo -e "\e[32mapk file signature...\e[0m"
        cd "$output_dir"
        apksigner sign --ks "$name_key" --ks-key-alias "$alias_key" --ks-pass pass:"$password_key" "apk/$apk_name.apk"
        cd ..
        echo -e "\e[32mdone\e[0m"
      fi
    done
<<<<<<< HEAD
  
=======
   
>>>>>>> 0eef4d9 (new update)
  elif [ "$action" == "ckey" ]; then
    read -p "name key: " name_key
    read -p "alias key: " alias_key
    
    password=$(tr -dc 'A-Za-z0-9' < /dev/urandom | head -c24)
    
    keytool -genkeypair -alias "$alias_key" -keyalg RSA -keysize 2048 -keystore "$output_dir/$name_key.jks" -validity 36500 -storepass "$password" -keypass "$password"
    echo -e "\e[32mcreate config.txt...\e[0m"
<<<<<<< HEAD
    echo -e "----------------------> signature key config <----------------------\n\nname_key: ${name_key}\nalias-key: ${alias_key}\npassword-key: ${password}\n" > $output_dir/config.txt 2>/dev/null
=======
    echo -e "----------------------> signature key config <----------------------\n\nname_key: ${name_key}.jksq\nalias-key: ${alias_key}\npassword-key: ${password}\n" > $output_dir/config.txt 2>/dev/null
>>>>>>> 0eef4d9 (new update)
    echo -e "\e[32mdone\e[0m"
  else
    echo -e "\e[31mincorrect input. input d, b or ckey\e[0m"
  fi
  
  wait
done
