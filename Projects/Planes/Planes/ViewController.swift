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

            let roundAltitude = altitude.rounded()
            altitudeValueLabel.text = String(format: "%.0f ft", roundAltitude)
        }
    }
    private var speed: Double = 0 {
        didSet {
            speedValueLabel.text = "\(speed) kts"
        }
    }

    let manager = FlightManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        configureUI()
    }

    private func configureUI() {
        altitudeSlider.value = altitude
        speedStepper.value = speed

        configureSegmentedControl()
    }

    private func configureSegmentedControl() {
        let engineTypes = Plane.EngineType.allCases
        engineTypeSegmentedControl.removeAllSegments()
        for type in engineTypes {
            engineTypeSegmentedControl.insertSegment(withTitle: type.title, at: engineTypeSegmentedControl.numberOfSegments, animated: false)
        }
        engineTypeSegmentedControl.selectedSegmentIndex = 0
    }

    @IBAction func altitudeChanged(_ sender: UISlider) {
        altitude = sender.value
    }

    @IBAction func speedChanged(_ sender: UIStepper) {
        speed = sender.value
    }

    @IBAction func save(_ sender: UIButton) {

        guard altitude >= 0 else { return }
        guard speed >= 0 else { return }

        guard let type = Plane.EngineType(rawValue: engineTypeSegmentedControl.selectedSegmentIndex) else { return }
        guard let registration = registrationTextField.text, registration.count > 2 else { return }
        guard let company = companyTextField.text, company.count > 2 else { return }

        let plane = Plane(registrationNumber: registration, companyName: company, buildDate: buildDatePicker.date, engine: type, flyingHours: 0, altitude: Int(altitude), speed: Int(speed), hasValidFlightAllowance: allowedToFlySwitch.isOn)

        manager.add(plane)

        print(manager.allPlanes)
    }

}

