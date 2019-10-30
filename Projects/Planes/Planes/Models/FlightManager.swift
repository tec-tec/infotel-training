//
//  FlightManager.swift
//  Planes
//
//  Created by Ludovic Ollagnier on 30/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

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
