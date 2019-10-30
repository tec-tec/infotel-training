//
//  ViewController.swift
//  Planes
//
//  Created by Ludovic Ollagnier on 30/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!

    var name: String = "Ludovic"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.backgroundColor = UIColor.red

    }

    @IBAction func sayHello(_ sender: UIButton) {

        nameLabel.text = nameTextField.text
        sender.isEnabled = false

        let double = 35.987
        let strValue = String(double)
        let strValue2 = "\(double)"

        let doubleValue = Double("45.98")
    }

}

