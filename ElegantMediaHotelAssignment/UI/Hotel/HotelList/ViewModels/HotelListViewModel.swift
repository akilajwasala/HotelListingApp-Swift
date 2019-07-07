//
//  HotelListViewModel.swift
//  ElegantMediaHotelAssignment
//
//  Created by Akila J Wasala on 7/5/19.
//  Copyright © 2019 AkilaWasala. All rights reserved.
//

import UIKit

protocol UIGetHotelsDelegate {
    func onGetHotelsSuccess(hotels:[Hotel])
    func onGetHotelsFailed(reason: String)
}

protocol UIGetOtherDataDelegate {
    func onGetUserName(userName: String)
    func onGetUserEmail(email: String)
}

class HotelListViewModel: NSObject {

    private let apiManager = APIManager()
    private var facebookLoginManager = FacebookLoginManager()

    func getAllHotels(delegate: UIGetHotelsDelegate) {
        apiManager.getHotelList { (hotels, isSuccess) in
            if isSuccess {
                delegate.onGetHotelsSuccess(hotels: hotels)
            } else {
                delegate.onGetHotelsFailed(reason: ErrorMessages.HotelListError)
            }
        }
    }
    
    func getOtherData(delegate: UIGetOtherDataDelegate) {
        delegate.onGetUserEmail(email: AppSettings.getUserEmail() ?? "")
        delegate.onGetUserName(userName: AppSettings.getUserName() ?? "")
    }
    
    func logoutUser() {
        facebookLoginManager.logout()
    }
}
