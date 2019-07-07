//
//  FacebookLoginManager.swift
//  ElegantMediaHotelAssignment
//
//  Created by Akila J Wasala on 7/6/19.
//  Copyright © 2019 AkilaWasala. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore

class FacebookLoginManager {

    func login(fromViewController: UIViewController, delegate: @escaping (User?, Int?) -> (), activityIndicatorDelegate: @escaping() -> ()) {

        LoginManager().logIn(readPermissions: [ReadPermission.email, ReadPermission.publicProfile], viewController: fromViewController) { loginResult in

            switch loginResult {
            case .cancelled:
                delegate(nil, 2)

            case .failed(let error):
                print(error.localizedDescription)
                delegate(nil, 1)

            case .success(_, _, _):
                activityIndicatorDelegate()
                self.getUserInfo(delegate: delegate)
            }
        }

    }

    func logout() {
        LoginManager().logOut()
    }

    private func getUserInfo(delegate: @escaping (User?, Int?) -> ()) {

        var request = GraphRequest(graphPath: "/me")
        request.parameters = ["fields": "name,email"]

        request.start { (urlResponse, graphResult) in
            switch graphResult {
            case .failed(let error):
                print(error.localizedDescription)
                delegate(nil, 3)

            case .success(let response):
                let dict = response.dictionaryValue
                let email = dict?["email"] as? String
                let name = dict?["name"] as? String

                if email != nil && name != nil {
                    let user = User(email: email!, name: name!)
                    delegate(user, nil)
                    
                } else {
                    delegate(nil, 5)
                    
                }
            }
        }
    }
}
