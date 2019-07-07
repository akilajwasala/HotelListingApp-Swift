//
//  LoginViewModel.swift
//  ElegantMediaHotelAssignment
//
//  Created by Akila J Wasala on 7/5/19.
//  Copyright © 2019 AkilaWasala. All rights reserved.
//

import UIKit

internal protocol UILoginDelegate {
    func onUserLoggedInSuccess()
    func onUserLoggedInFailed()
    func startActivityIndicatorForFacebookLogin()
}

class LoginViewModel: NSObject {
    
    private var loginDelegate: UILoginDelegate? = nil
    private var facebookLoginManager = FacebookLoginManager()
    
    func loginWithFacebook(fromViewController: UIViewController, delegate: UILoginDelegate) {
        facebookLoginManager.login(fromViewController: fromViewController, delegate: { (user, errorCode) in
            if errorCode == nil {
                AppSettings.setUserName(name: user?.name)
                AppSettings.setUserEmail(email: user?.email)
                delegate.onUserLoggedInSuccess()
            } else {
                delegate.onUserLoggedInFailed()
            }
        }) {
            delegate.startActivityIndicatorForFacebookLogin()
        }
    }

}
