//
//  Flying.swift
//  Planes
//
//  Created by Ludovic Ollagnier on 30/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

protocol Flying {
    var altitude: Int { get set }
    var speed: Int { get }
    func fly()
}
