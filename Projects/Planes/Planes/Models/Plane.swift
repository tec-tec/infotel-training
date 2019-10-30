//
//  Plane.swift
//  Planes
//
//  Created by Ludovic Ollagnier on 30/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import Foundation

struct Plane: Equatable, Flying {

    // Enum with rawValue and protocol
    enum EngineType: Int, CaseIterable {
        case jet
        case turboProp

        var title: String {
            //Break is implicit
            switch self {
            case .jet:
                return "Jet"
            case .turboProp:
                return "TurboProp"
            }
        }
    }

    let registrationNumber: String
    let companyName: String
    let buildDate: Date
    let engine: EngineType

    var flyingHours: Double
    var altitude: Int
    var speed: Int

    // Bool with observers
    var hasValidFlightAllowance: Bool {
        willSet {
            print("Current : \(hasValidFlightAllowance), will be \(newValue)")
        }

        didSet {
            print("Current : \(hasValidFlightAllowance), was \(oldValue)")
            hasValidFlightAllowance = false
        }
    }

    func takeOff() {

    }

    func land() {

    }

    func fly() {
        takeOff()
    }

    static func ==(lhs: Plane, rhs: Plane) -> Bool {
        return lhs.registrationNumber == rhs.registrationNumber
    }
}
