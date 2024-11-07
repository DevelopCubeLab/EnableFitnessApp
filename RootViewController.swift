import UIKit

class RootViewController: UIViewController {
    
    private let helper = EnableHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置背景颜色以区分
        self.view.backgroundColor = UIColor.systemBackground

        // 添加一个简单的标签
        let checkPermissionLabel = UILabel()
        checkPermissionLabel.translatesAutoresizingMaskIntoConstraints = false
        checkPermissionLabel.textAlignment = .center  // 设置文本居中
        
        var enable = helper.checkInstallPremission()
        
        if(enable) {
            checkPermissionLabel.text = NSLocalizedString("Install_With_TrollStore_text", comment: "")
            checkPermissionLabel.textColor = UIColor.green
        } else {
            checkPermissionLabel.text = NSLocalizedString("Need_Install_With_TrollStore_text", comment: "")
            checkPermissionLabel.textColor = UIColor.red
        }
        
//        checkPermissionLabel.textColor = UIColor.label
        
        let checkFitnessLabel = UILabel()
        checkFitnessLabel.translatesAutoresizingMaskIntoConstraints = false
        checkFitnessLabel.textAlignment = .center  // 设置文本居中
        checkFitnessLabel.numberOfLines = 0  // 允许自动换行
        checkFitnessLabel.lineBreakMode = .byWordWrapping  // 在单词边界换行
        
        if #available(iOS 16.0, *) {
            checkFitnessLabel.text = NSLocalizedString("iOS16_text", comment: "")
            checkFitnessLabel.textColor = UIColor.red
            enable = false
        } else {
            checkFitnessLabel.text = NSLocalizedString("iOS15_text", comment: "")
            checkFitnessLabel.textColor = UIColor.label
        }
        
        let installProfileButton = UIButton(type: .system)
        installProfileButton.translatesAutoresizingMaskIntoConstraints = false
        installProfileButton.setTitle(NSLocalizedString("Install_Profile_text", comment: ""), for: .normal)
        installProfileButton.addTarget(self, action: #selector(onClickInstallProfileButton), for: .touchUpInside)
        installProfileButton.isEnabled = enable //如果没有TrollStore安装app不允许点击安装按钮
        
        let respringButton = UIButton(type: .system)
        respringButton.translatesAutoresizingMaskIntoConstraints = false
        respringButton.setTitle(NSLocalizedString("Respring_text", comment: ""), for: .normal)
        respringButton.addTarget(self, action: #selector(onClickRespringButton), for: .touchUpInside)
        respringButton.isEnabled = enable //如果没有TrollStore安装app不允许点击安装按钮

        
        let installFitnessButton = UIButton(type: .system)
        installFitnessButton.translatesAutoresizingMaskIntoConstraints = false
        installFitnessButton.setTitle(NSLocalizedString("Install_Fitness_Application_text", comment: ""), for: .normal)
        installFitnessButton.addTarget(self, action: #selector(onClickInstallFitnessButton), for: .touchUpInside)
        
        // 获取应用图标
        let appIcon = UIImage(named: "AppIcon")

        // 创建一个 UIImageView，尺寸为 50x50
        let imageView = UIImageView(image: appIcon)
        imageView.translatesAutoresizingMaskIntoConstraints = false  // 禁用自动调整大小
        imageView.contentMode = .scaleAspectFit  // 设置图片适应方式

        let openSourceLabel = UILabel()
        openSourceLabel.translatesAutoresizingMaskIntoConstraints = false
        openSourceLabel.text = "GitHub"
        openSourceLabel.textAlignment = .center
        openSourceLabel.textColor = UIColor.label
        openSourceLabel.isUserInteractionEnabled = true // 可点击
        // 添加手势识别器
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickOpenSourceButton))
        openSourceLabel.addGestureRecognizer(tapGesture)
        
        // 将View添加到视图中
        self.view.addSubview(imageView)
        self.view.addSubview(checkPermissionLabel)
        self.view.addSubview(checkFitnessLabel)
        self.view.addSubview(installProfileButton)
        self.view.addSubview(respringButton)
        self.view.addSubview(installFitnessButton)
        self.view.addSubview(openSourceLabel)
        
        NSLayoutConstraint.activate([
            
            imageView.widthAnchor.constraint(equalToConstant: 100),  // 设置宽度
            imageView.heightAnchor.constraint(equalToConstant: 100), // 设置高度
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), // 水平居中
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100), // 距离顶部100点
            
            checkPermissionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), // 水平居中
            checkPermissionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30), // checkPermissionLabel 在 imageView 底部，间隔 20 点
            checkPermissionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20), // 左侧边距
            checkPermissionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20), // 右侧边距
            
            checkFitnessLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), // 水平居中
            checkFitnessLabel.topAnchor.constraint(equalTo: checkPermissionLabel.bottomAnchor, constant: 30),
            checkFitnessLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20), // 左侧边距
            checkFitnessLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20), // 右侧边距
            
            installProfileButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), // 水平居中
            installProfileButton.topAnchor.constraint(equalTo: checkFitnessLabel.bottomAnchor, constant: 20),
            installProfileButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20), // 左侧边距
            installProfileButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20), // 右侧边距
            
            respringButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), // 水平居中
            respringButton.topAnchor.constraint(equalTo: installProfileButton.bottomAnchor, constant: 30),
            respringButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20), // 左侧边距
            respringButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20), // 右侧边距
            
            installFitnessButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), // 水平居中
            installFitnessButton.topAnchor.constraint(equalTo: respringButton.bottomAnchor, constant: 30),
            installFitnessButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20), // 左侧边距
            installFitnessButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20), // 右侧边距
            
            openSourceLabel.widthAnchor.constraint(equalToConstant: 100),  // 设置宽度
            openSourceLabel.heightAnchor.constraint(equalToConstant: 20), // 设置高度
            openSourceLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), // 水平居中
            openSourceLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
        
        self.view.layoutIfNeeded()
        
    }
    
    @objc func onClickInstallProfileButton() {
    
        let alertController: UIAlertController
        if(helper.copyFileToPreferences()) {
            alertController = UIAlertController(title: NSLocalizedString("Install_Success_title", comment: ""), message: NSLocalizedString("Install_Success_text", comment: ""), preferredStyle: .alert)
        } else {
            alertController = UIAlertController(title: NSLocalizedString("Install_Failed_title", comment: ""), message: NSLocalizedString("Install_Failed_text", comment: ""), preferredStyle: .alert)
        }
        
        // 添加一个按钮来关闭弹窗
        alertController.addAction(UIAlertAction(title: NSLocalizedString("Close_text", comment: ""), style: .default, handler: nil))
        
        // 显示弹窗
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func onClickRespringButton() {
        let deviceManager = DeviceManager()
        deviceManager.respring();
    }
    
    @objc func onClickInstallFitnessButton() {
        if let url = URL(string: "https://apps.apple.com/app/fitness/id1208224953") {
            // 使用 UIApplication.shared.open 来打开链接
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc func onClickOpenSourceButton() {
        if let url = URL(string: "https://github.com/DevelopCubeLab/EnableFitnessApp") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    

}
