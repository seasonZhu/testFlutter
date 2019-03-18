# Flutter的使用入坑指南

## 准备工作

下载一定要注意是mac版本的,然后是stable版本
下载完成后建议直接丢在根目录

season是我的用户名,每个人的电脑情况不一样

```
/Users/season/
```

在根目录下面找到隐藏文件.bash_profile
在尾行添加下面的代码

```
export PATH=/Users/season/flutter/bin:$PATH
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```


使用doctor命令进行检查

```
flutter doctor
```

可能会出现下面的信息

```
[!] Android toolchain - develop for Android devices (Android SDK version 28.0.2)
    ✗ Flutter requires Android SDK 28 and the Android BuildTools 28.0.3
      To update using sdkmanager, run:
        /Users/season/Library/Android/sdk/tools/bin/sdkmanager
        "platforms;android-28" "build-tools;28.0.3"
      or visit https://flutter.io/setup/#android-setup for detailed
      instructions.
    ! Some Android licenses not accepted.  To resolve this, run: flutter doctor
      --android-licenses
[!] iOS toolchain - develop for iOS devices (Xcode 10.1)
    ✗ ideviceinstaller is not installed; this is used to discover connected iOS
      devices.
      To install with Brew, run:
        brew install --HEAD usbmuxd
        brew link usbmuxd
        brew install --HEAD libimobiledevice
        brew install ideviceinstaller
[✓] Android Studio (version 3.3)
[✓] VS Code (version 1.32.2)
[✓] Connected device (2 available)
```

或者直接在编译的时候出现下面的信息

```
ideviceinfo returned an error: 
ERROR: Could not connect to lockdownd, error code -3

```

安卓这边信息不用看,主要看iOS这边的信息,一般的做法如下

先USB断开连接 然后 卸载

```
brew unlink usbmuxd
brew uninstall usbmuxd
brew uninstall libimobiledevice
brew uninstall ideviceinstaller
```

再重新安装

```
brew update
brew install --HEAD usbmuxd
brew link usbmuxd
brew install --HEAD libimobiledevice
brew install ideviceinstaller
```

最后可以试试这个命令


```
sudo chmod -R 777 /var/db/lockdown

```

使用VSCode打开这个工程文件,然后编译可以直接在真机上面进行编译.而Android Studio只能在模拟器上面运行.


如果进行原生与Flutter混编的话其实编译时间更长,你需要VS和XCode切换的写代码然后在VS下面进行编译运行.

## 集成第三方
找到工程下的文件pubspec.yaml,找到dependencies添加第三方

```
dependencies:
  flutter:
    sdk: flutter
  english_words: ^3.1.0
  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^0.1.2
  dio: ^2.1.0

```

VS下切换到终端输入命令

```
flutter packages get
```

然后在impor试试


