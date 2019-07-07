//
//  BaseViewController.swift
//  ElegantMediaHotelAssignment
//
//  Created by Akila J Wasala on 7/8/19.
//  Copyright © 2019 AkilaWasala. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setBackButtonHidden(hidden: Bool) {
        navigationItem.setHidesBackButton(hidden, animated: true)
    }
}
