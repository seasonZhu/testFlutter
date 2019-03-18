//
//  ViewController.swift
//  Runner
//
//  Created by season on 2019/3/15.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "这个是一个Swift原生界面"
        view.backgroundColor = UIColor.white
        
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(handleButtonAction), for: .touchUpInside)
        button.setTitle("Press to FlutterView", for: .normal)
        button.frame = CGRect(x: 80.0, y: 210.0, width: 240.0, height: 40.0)
        button.backgroundColor = UIColor.blue
        button.center = view.center
        view.addSubview(button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        //navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
        //navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc
    func handleButtonAction() {
        
        let toPushFlutterController = FlutterViewController()
        toPushFlutterController.title = "这是从原生界面push过来的Flutter控制器"
        toPushFlutterController.setInitialRoute("third")
        
        let channelName = "samples.flutter.io/flutterPush"
        let evenChannal = FlutterEventChannel(name: channelName, binaryMessenger: toPushFlutterController)
        evenChannal.setStreamHandler(self)
        
        navigationController?.pushViewController(toPushFlutterController, animated: true)
    }

}

extension ViewController: FlutterStreamHandler {
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        events("这段文字是从原生界面顺传过来的")
        print(arguments)
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        print(arguments)
        return nil
    }
    
    
}
