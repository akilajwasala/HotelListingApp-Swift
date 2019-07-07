//
//  HotelListViewController.swift
//  ElegantMediaHotelAssignment
//
//  Created by Akila J Wasala on 7/5/19.
//  Copyright © 2019 AkilaWasala. All rights reserved.
//

import UIKit

class HotelListViewController: BaseViewController {

    private var hotelsArray = [Hotel]()
    
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblEmailAddress: UILabel!
    @IBOutlet var tblHotelList: UITableView!
    
    private var viewModel = HotelListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NavigationTitles.HotelList
        
        viewModel.getOtherData(delegate: self)
        viewModel.getAllHotels(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setBackButtonHidden(hidden: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        setBackButtonHidden(hidden: false)
    }
    
    @IBAction func btnLogoutClicked(_ sender: UIButton) {
        viewModel.logoutUser()
        self.navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        (segue.destination as? HotelDetailsViewController)?.selectedHotel = sender as? Hotel
    }
}

extension HotelListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.HotelListReusableIdentifier, for: indexPath) as! HotelTableViewCell
        cell.setHotel(hotel: hotelsArray[indexPath.row])
        return cell
    }
    
}

extension HotelListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(CellHeights.HotelListCellHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: NamedSegues.HotelListToDetails, sender: hotelsArray[indexPath.row])
    }
}

extension HotelListViewController : UIGetHotelsDelegate {
    
    func onGetHotelsSuccess(hotels: [Hotel]) {
        hotelsArray = hotels
        tblHotelList.reloadData()
    }
    
    func onGetHotelsFailed(reason: String) {
        //Show error message
    }
    
}

extension HotelListViewController : UIGetOtherDataDelegate {
    
    func onGetUserName(userName: String) {
        self.lblUserName.text = userName
    }
    
    func onGetUserEmail(email: String) {
        self.lblEmailAddress.text = email
    }
    
}
