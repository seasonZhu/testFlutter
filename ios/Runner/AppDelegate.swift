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
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let controller = window?.rootViewController as! FlutterViewController
        
        //  加个导航栏
        let navi = UINavigationController(rootViewController: controller)
        navi.navigationBar.isHidden = true
        window.rootViewController = navi
        
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
            self?.pushToASwiftViewController()
        }
        
        GeneratedPluginRegistrant.register(with: self)
        return true
    }
}

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
    
    private func pushToASwiftViewController() {
        print("在原生已经接受到了")
        let controller = window?.rootViewController as! UINavigationController
        //let navi = UINavigationController(rootViewController: controller)
        //navi.pushViewController(ViewController(), animated: true)
        controller.pushViewController(ViewController(), animated: true)
        //controller.present(ViewController(), animated: true, completion: nil)
    }
}
