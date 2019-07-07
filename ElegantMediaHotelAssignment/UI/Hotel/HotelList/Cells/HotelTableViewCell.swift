//
//  HotelTableViewCell.swift
//  ElegantMediaHotelAssignment
//
//  Created by Akila J Wasala on 7/5/19.
//  Copyright © 2019 AkilaWasala. All rights reserved.
//

import UIKit
import SDWebImage

class HotelTableViewCell: UITableViewCell {

    @IBOutlet var imgHotel: UIImageView!
    @IBOutlet var lblHotelName: UILabel!
    @IBOutlet var lblAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imgHotel.layer.cornerRadius = self.imgHotel.bounds.height/2
        self.imgHotel.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setHotel(hotel: Hotel) {
        self.lblHotelName.text = hotel.title
        self.lblAddress.text   = hotel.address        
        
        if let url = URL(string: (hotel.image?.small)!) {
            self.imgHotel.sd_setImage(with: url, completed: nil)
        } else {
            //Set default image or so
        }
        
    }
}
