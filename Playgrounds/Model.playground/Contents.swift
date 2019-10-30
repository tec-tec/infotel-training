import Foundation

enum EngineType {
    case jet
    case turboProp
}

// Protocol oriented programming (https://developer.apple.com/videos/play/wwdc2015/408/)
protocol LivingBeing {
    var age: Int { get set }
}

protocol Flying {
    var altitude: Int { get set }
    var speed: Int { get }
    func fly()
}

class Bird: Flying, LivingBeing {

    var age = 0
    var altitude: Int = 0
    var speed: Int = 0

    func fly() {

    }
}

func changeAltitude(_ altitude: Int, for flyingThing: Flying) {

}

struct Plane: Equatable, Flying {

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

class FlightManager {

    // The way we store our planes is our business, so let make the property private
    private var planes: [Plane] = []

    // Get-Only computed property
    var allPlanes: [Plane] { return planes }

    func add(_ plane: Plane) {
        planes.append(plane)
    }

    func remove(_ plane: Plane) {

        // Optional binding / if-let syntax
        if let index = planes.firstIndex(of: plane) {
            planes.remove(at: index)
        }
    }
}

let fm = FlightManager()

let planes = fm.allPlanes
//fm.allPlanes = []

var plane = Plane(registrationNumber: "F-ABCD", companyName: "", buildDate: Date(), engine: EngineType.turboProp, flyingHours: 0, altitude: 0, speed: 0, hasValidFlightAllowance: false)

var plane2 = Plane(registrationNumber: "F-GUJN", companyName: "", buildDate: Date(), engine: EngineType.turboProp, flyingHours: 0, altitude: 0, speed: 0, hasValidFlightAllowance: true)

plane.hasValidFlightAllowance.toggle()

if plane == plane2 { print() }
