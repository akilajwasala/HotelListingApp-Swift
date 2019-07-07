//
//  APIManager.swift
//  ElegantMediaHotelAssignment
//
//  Created by Akila J Wasala on 7/7/19.
//  Copyright © 2019 AkilaWasala. All rights reserved.
//

import UIKit
import Alamofire

class APIManager {
    
    func getHotelList(delegate: @escaping ([Hotel], Bool) -> ()) {
        
        Alamofire.request(URLProvider.HOTEL_API_URL, method: .get, headers: URLProvider.getHeaders()).responseJSON { response in
            
            if response.response?.statusCode == 200 {
                if let hotelResponce = try? response.deserialize(HotelResponce.self) {
                    delegate(hotelResponce.data ?? [], true)
                } else {
                    delegate([],false)
                }
            } else {
                delegate([],false)
            }
        }

    }
    
}

//Can use seperate file for all extentions
extension DataResponse {
    
    func deserialize<T>(_ type: T.Type) throws -> T where T: Decodable {
        return try JSONDecoder().decode(type, from: self.data!)
    }
    
}
