//
//  HotelDetailsViewController.swift
//  ElegantMediaHotelAssignment
//
//  Created by Akila J Wasala on 7/5/19.
//  Copyright © 2019 AkilaWasala. All rights reserved.
//

import UIKit
import SDWebImage

class HotelDetailsViewController: BaseViewController {

    @IBOutlet var imgHotel: UIImageView!
    @IBOutlet var lblHotelName: UILabel!
    @IBOutlet var txtViewDescription: UITextView!
    
    var selectedHotel: Hotel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblHotelName.text = selectedHotel?.title
        
        //Used a textview to get a scrollable description
        self.txtViewDescription.text = selectedHotel?.description
        
        if let url = URL(string: (selectedHotel!.image?.large)!) {
            self.imgHotel.sd_setImage(with: url, completed: nil)
        } else {
            //Set default image or so
        }

        let rightBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "location"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(menuButtonTapped))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }

    @objc fileprivate func menuButtonTapped() {
        performSegue(withIdentifier: NamedSegues.DetailsToMap, sender: selectedHotel)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        (segue.destination as? MapViewController)?.selectedHotel = sender as? Hotel
    }

}
