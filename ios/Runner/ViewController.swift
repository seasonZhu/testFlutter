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
        button.setTitle("Press me", for: .normal)
        button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
        button.backgroundColor = UIColor.blue
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
        //let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine
        //flutterEngine?.run(withEntrypoint: "third")
        //let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)!
        //flutterViewController.setInitialRoute("third")
        //navigationController?.pushViewController(flutterViewController, animated: true)
    }

}
