//
//  User.swift
//  ElegantMediaHotelAssignment
//
//  Created by Akila J Wasala on 7/6/19.
//  Copyright © 2019 AkilaWasala. All rights reserved.
//

import UIKit

class User: NSObject {
    var email: String
    var name: String
    
    init(email: String, name: String) {
        self.email = email
        self.name  = name
    }
}
