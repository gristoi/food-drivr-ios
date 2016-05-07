//
//  DonorDonationPresenter.swift
//  hackathon-for-hunger
//
//  Created by Anas Belkhadir on 07/05/2016.
//  Copyright © 2016 Hacksmiths. All rights reserved.
//

import Foundation
import RealmSwift

protocol DonationView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func donations(sender: DonationPresenter, didSucceed donations: Results<Donation>)
    func donations(sender: DonationPresenter, didFail error: NSError)

}


class DonationPresenter {
    private let donationService:DonationService
    private var donationView : DonationView?
    
    init(donationService:DonationService){
        self.donationService = donationService
    }
    
    func attachView(view:DonationView){
        donationView = view
    }
    
    func detachView() {
        donationView = nil
    }
    
    
    

    
    
}