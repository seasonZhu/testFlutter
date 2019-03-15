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

}
