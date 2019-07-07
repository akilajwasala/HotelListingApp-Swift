//
//  ViewController.swift
//  ElegantMediaHotelAssignment
//
//  Created by Akila J Wasala on 7/5/19.
//  Copyright © 2019 AkilaWasala. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    private var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }

    @IBAction func btnFacebookLoginClicked(_ sender: UIButton) {
        self.viewModel.loginWithFacebook(fromViewController: self, delegate: self)
    }
}

extension LoginViewController : UILoginDelegate {
    
    func startActivityIndicatorForFacebookLogin() {
        //Start loading
    }
    
    func onUserLoggedInSuccess() {
        //Remove loading
        performSegue(withIdentifier: NamedSegues.LoginToHotelList, sender: nil)
    }
    
    func onUserLoggedInFailed() {
        //Remove loading
        //Error message
    }
    
}
