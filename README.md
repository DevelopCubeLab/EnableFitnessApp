# EnableFitnessApp
![80](https://github.com/user-attachments/assets/17f4a639-ef85-4eae-800d-b95d9325c119)  
iOS Utils Enable the 'Fitness' Application for iOS version lower than iOS 16.0
⚠️Need install via TrollStore. Applicable iOS version [14.0, 16.0)

⚠️需要通过TrollStore安装。适用系统版本iOS [14.0, 16.0)  
⚠️超小众需求，您需要满足以下条件：
1. iOS设备版本低于iOS16.0
2. 需要你有Apple Watch
3. 你有超过1个iPhone

⚠️Super niche demand, you need to meet the following conditions:
1. The iOS device version is lower than iOS16.0
2. You need to have an Apple Watch
3. You have more than 1 iPhone

本项目只适用于有Apple ID下有多个iPhone，并且有Apple Watch的用户，iPhone系统版本又在iOS 16.0以下的用户。  
因为iOS 16.0开始系统已经为所有iPhone默认开启了健身应用，所以无需本插件。  
如果您没有Apple Watch那么开启了也没有什么用。  
**如果你觉得没有什么用，那就对了，这个工具本身就是超小众需求。**  

<img src="https://github.com/user-attachments/assets/4e4e5024-06e7-49cd-bf1c-5be27544de0b" width="300px"/>
<img src="https://github.com/user-attachments/assets/81dd7cea-1b98-4a82-b677-b6892f00aee6" width="300px"/>

## Usage
1. Download the `EnableFitnessApp.tipa` file from [Releases](https://github.com/DevelopCubeLab/EnableFitnessApp/releases) page.
2. Use `TrollStore` to install.

Zh:
1. 从[Releases](https://github.com/DevelopCubeLab/EnableFitnessApp/releases)页面下载`EnableFitnessApp.tipa`文件。
2. 使用`TrollStore`安装。

## Working principle
1. When installing [Fitness](https://apps.apple.com/app/fitness/id1208224953), system versions below iOS16.0 will detect whether the current iPhone has been paired with the Apple Watch, or has been paired before. If This App cannot be installed without pairing.
2. So by checking whether the `com.apple.Fitness.plist` file in the `/var/mobile/Library/Preferences` directory exists, we can directly complete this file.
3. You can also do it manually through `Filza`, download [com.apple.Fitness.plist](https://github.com/DevelopCubeLab/EnableFitnessApp/blob/main/Resources/com.apple.Fitness.plist) and [ com.apple.Fitness.activity-w idget.plist](https://github.com/DevelopCubeLab/EnableFitnessApp/blob/main/Resources/com.apple.Fitness.activity-widget.plist) into the `/var/mobile/Library/Preferences` directory, Then log out of the device from the App Just install it from Store [Fitness](https://apps.apple.com/app/fitness/id1208224953).

## 工作原理
1. iOS16.0以下系统版本在安装[Fitness](https://apps.apple.com/app/fitness/id1208224953)的时候会检测当前的iPhone是否已经与Apple Watch配对，或者曾经配对过，如果没有配对则无法安装这个App。
2. 所以通过检查`/var/mobile/Library/Preferences`目录下的`com.apple.Fitness.plist`文件是否存在，所以我们直接补全这个文件即可。
3. 您也可以手动通过`Filza`进行操作，下载[com.apple.Fitness.plist](https://github.com/DevelopCubeLab/EnableFitnessApp/blob/main/Resources/com.apple.Fitness.plist)和[com.apple.Fitness.activity-widget.plist](https://github.com/DevelopCubeLab/EnableFitnessApp/blob/main/Resources/com.apple.Fitness.activity-widget.plist)放到`/var/mobile/Library/Preferences`目录下，然后注销设备，从App Store安装即可[Fitness](https://apps.apple.com/app/fitness/id1208224953)。


## Build
1. Download [Theos](https://theos.dev/)  
2. run `make package FINALPACKAGE=1 PACKAGE_FORMAT=ipa`

## License
Apache License 2.0

## Thanks
[TrollStore](https://github.com/opa334/TrollStore)  
Powered by ChatGPT 4o  
icon by `SF Symbols`
