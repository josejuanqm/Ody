//
//  ViewController.swift
//  OdyiOS
//
//  Created by Jose Quintero on 01/05/2016.
//  Copyright (c) 2016 Jose Quintero. All rights reserved.
//

import UIKit
import OdyiOS

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        odytizeAll()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

