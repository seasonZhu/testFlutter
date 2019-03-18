//
//  AppDelegate.swift
//  Runner
//
//  Created by season on 2019/3/11.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import Foundation

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
    var flutterEngine : FlutterEngine?
    var flutterViewController: FlutterViewController!
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let controller = window?.rootViewController as! FlutterViewController
        flutterViewController = controller
        
        //  加个导航栏
        let navi = UINavigationController(rootViewController: controller)
        navi.navigationBar.isHidden = true
        window.rootViewController = navi
        
        //  添加一个FPS的Label
        setupFPSLabel()
        
        //  添加对于Flutter原生界面的方法监听
        addOberverFromFlutterMethod(controller: controller)
        
        //  注册
        GeneratedPluginRegistrant.register(with: self)
        
        return true
    }
}

// MARK: - 添加对于Flutter原生界面的方法监听
extension AppDelegate {
    private func addOberverFromFlutterMethod(controller: FlutterViewController) {
        //  电池信息
        let batteryChannel = FlutterMethodChannel(name: "samples.flutter.io/battery", binaryMessenger: controller)
        batteryChannel.setMethodCallHandler {
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            guard call.method == "getBatteryLevel" else {
                result(FlutterMethodNotImplemented)
                return
            }
            self?.receiveBatteryLevel(result: result)
        }
        
        //  推到原生界面
        let pushChannel = FlutterMethodChannel(name: "samples.flutter.io/pushToASwiftViewController", binaryMessenger: controller)
        pushChannel.setMethodCallHandler {
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            guard call.method == "swiftPush" else {
                result(FlutterMethodNotImplemented)
                return
            }
            self?.pushToASwiftViewController(result: result)
        }
    }
}

// MARK: - Flutter界面方法的具体实现
extension AppDelegate {
    private func receiveBatteryLevel(result: FlutterResult) {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        if device.batteryState == UIDevice.BatteryState.unknown {
            result(FlutterError(code: "UNAVAILABLE",
                                message: "Battery info unavailable",
                                details: nil))
        } else {
            result(Int(device.batteryLevel * 100))
        }
    }
    
    private func pushToASwiftViewController(result: FlutterResult) {
        print("在原生已经接受到了")
        let controller = window?.rootViewController as! UINavigationController
        controller.pushViewController(ViewController(), animated: true)
    }
}

extension AppDelegate {
    private func setupFPSLabel() {
        #if DEBUG
        DispatchQueue.main.async {
            let label = FPSLabel(frame: CGRect(x: Int((self.window!.bounds.width) - 55 - 8), y: Int(kNavigationBarHeight), width: 55, height: 20))
            label.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
            self.window!.addSubview(label)
        }
        #endif
    }
}
