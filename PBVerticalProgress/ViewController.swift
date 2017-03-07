//
//  ViewController.swift
//  PBVerticalProgress
//
//  Created by Rattee Warriyawhutthiwat on 3/6/2560 BE.
//  Copyright © 2560 Rattee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var progress: PBVerticalProgress!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changed(_ sender: Any) {
        if let slider = sender as? UISlider {
            progress.progressValue = slider.value
        }
        
    }

}

