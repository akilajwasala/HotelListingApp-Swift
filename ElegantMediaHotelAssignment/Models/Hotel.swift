//
//  Hotel.swift
//  ElegantMediaHotelAssignment
//
//  Created by Akila J Wasala on 7/7/19.
//  Copyright © 2019 AkilaWasala. All rights reserved.
//

import UIKit

class HotelResponce: Codable {
    var status: Int?
    var data: [Hotel]?
}

class Hotel: Codable {
    var id: Int?
    var title: String?
    var description: String?
    var address: String?
    var postcode: String?
    var phoneNumber: String?
    var latitude: String?
    var longitude: String?
    var image: HotelImage?
}

class HotelImage: Codable {
    var small: String?
    var medium: String?
    var large: String?
}
