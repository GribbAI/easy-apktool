![](logo.png)



## English 🏴󠁧󠁢󠁥󠁮󠁧󠁿 🇺🇸
This project is a simplified version of Apktool written in Bash. It is designed to help developers decompile and recompile Android APK files easily. After the build process, the tool automatically signs the APK with RSA, ensuring that your application is ready for distribution.
### Features
- Decompile APK files to access and modify their contents.
- Recompile APK files after modifications.
- Automatic RSA signing of the APK after recompilation.
- Simple command-line interface for ease of use.
### Installation
**Please install [apktool](https://apktool.org/) before launching.**

Update and upgrade package.
```sh
apt update
apt upgrade
```

Installing git if not already installed.
```sh
apt install git
```

Clone repository.
```sh
git clone https://github.com/GribbAI/easy-apktool.git
```

Run Easy Apktool.
```sh
cd easy-apktool
bash tool.bash
```
