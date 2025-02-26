#!/bin/bash


apt update
apt upgrade



if ! command -v openjdk &> /dev/null; then
  echo -e "\e[34minstallation openjdk...\e[0m"
  apt install openjdk
fi

if ! command -v apksigner &> /dev/null; then
  echo -e "\e[34minstallation apksigner...\e[0m"
  apt install apksigner
fi

if ! command -v openssl-tool &> /dev/null; then
  echo -e "\e[34minstallation openssl...\e[0m"
  apt install openssl-tool
fi

if ! command -v keytool &> /dev/null; then
  echo -e "\e[34minstallation keytool...\e[0m"
  apt install keytool
fi

if ! command -v apktool &> /dev/null; then
  echo -e "\e[31mapktool not found.\e[0m"
  echo -e "\e[34minstall apktool.\e[0m"

fi