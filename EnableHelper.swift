import Foundation
import UIKit

class EnableHelper {
    
    func checkInstallPremission() -> Bool {
        let path = "/var/mobile/Library/Preferences"
        let writeable = access(path, W_OK) == 0
        return writeable
    }
    
    func checkURLSchemeExists(urlScheme: String) -> Bool {
        if let url = URL(string: urlScheme) {
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    
    func copyFileToPreferences() -> Bool {
        let fileManager = FileManager.default
        
        // 获取 App 包内的 plist 文件路径
        let appBundlePath = Bundle.main.bundlePath
        
        // 文件路径
        let sourceFile1 = appBundlePath + "/com.apple.Fitness.plist"
        let sourceFile2 = appBundlePath + "/com.apple.Fitness.activity-widget.plist"
        
        // 目标目录 /var/mobile/Library/Preferences
        let destinationDirectory = "/var/mobile/Library/Preferences"
        
        // 确保目标目录存在
        if !fileManager.fileExists(atPath: destinationDirectory) {
            do {
                try fileManager.createDirectory(atPath: destinationDirectory, withIntermediateDirectories: true, attributes: nil)
            } catch {
                return false
            }
        }
        
        // 复制文件
        let destinationFile1 = destinationDirectory + "/com.apple.Fitness.plist"
        let destinationFile2 = destinationDirectory + "/com.apple.Fitness.activity-widget.plist"
        
        do {
            // 检查源文件是否存在
            if fileManager.fileExists(atPath: sourceFile1) {
                if fileManager.fileExists(atPath: destinationFile1) {
                    try fileManager.removeItem(atPath: destinationFile1) // 文件存在，先删除
                }
                try fileManager.copyItem(atPath: sourceFile1, toPath: destinationFile1) // 复制文件
            }
            
            if fileManager.fileExists(atPath: sourceFile2) {
                if fileManager.fileExists(atPath: destinationFile2) {
                    try fileManager.removeItem(atPath: destinationFile2) // 文件存在，先删除
                }
                try fileManager.copyItem(atPath: sourceFile2, toPath: destinationFile2) // 复制文件
            }
            
            return true // 成功复制文件
        } catch {
            return false
        }
    }
}
