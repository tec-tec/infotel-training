//
//  ViewController.swift
//  Planes
//
//  Created by Ludovic Ollagnier on 30/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var engineTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var registrationTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var altitudeSlider: UISlider!
    @IBOutlet weak var altitudeValueLabel: UILabel!
    @IBOutlet weak var speedStepper: UIStepper!
    @IBOutlet weak var speedValueLabel: UILabel!
    @IBOutlet weak var allowedToFlySwitch: UISwitch!
    @IBOutlet weak var buildDatePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!

    private var altitude: Float = 0 {
        didSet {
            altitudeValueLabel.text = "\(altitude) ft"
        }
    }
    private var speed: Double = 0 {
        didSet {
            speedValueLabel.text = "\(speed) kts"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        configureUI()
    }

    private func configureUI() {
        altitudeSlider.value = altitude
        speedStepper.value = speed
    }

    @IBAction func altitudeChanged(_ sender: UISlider) {
        altitude = sender.value
    }

    @IBAction func speedChanged(_ sender: UIStepper) {
        speed = sender.value
    }

    @IBAction func save(_ sender: UIButton) {
    }

}

