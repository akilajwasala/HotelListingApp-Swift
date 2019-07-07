//
//  Constants.swift
//  ElegantMediaHotelAssignment
//
//  Created by Akila J Wasala on 7/5/19.
//  Copyright © 2019 AkilaWasala. All rights reserved.
//

import Foundation

public struct URLProvider {
    public static let HOTEL_API_URL = "https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json"
    
    public static func getHeaders() -> Dictionary<String, String>{
        return ["Content-Type":"application/json"]
    }
}

public struct NamedSegues {
    public static let LoginToHotelList = "SegueToHotelList"
    public static let HotelListToDetails = "SegueHotelListToDetails"
    public static let DetailsToMap = "SegueDetailsToMap"
}

public struct ReuseIdentifiers {
    public static let HotelListReusableIdentifier = "HotelTableViewCell"
}

public struct CellHeights {
    public static let HotelListCellHeight = 82.0
}

public struct NavigationTitles {
    public static let HotelList = "List View"
}

public struct ErrorMessages {
    public static let HotelListError = "Error on loading hotel list"
}
