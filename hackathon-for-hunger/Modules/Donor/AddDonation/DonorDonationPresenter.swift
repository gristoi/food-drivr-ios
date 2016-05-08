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
    func donations(sender: DonationPresenter, didSucceed donations: Donation)
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
    
    
    func addDonation(donation: Donation){
        donationView?.startLoading()
        donationService.addDonations(donation).then() {
            donation -> () in
                let donations = Donation(dict: donation)
                self.donationView?.finishLoading()
                self.donationView?.donations(self, didSucceed: donations)
            }.error { error in
                self.donationView?.finishLoading()
                self.donationView?.donations(self, didFail: error as NSError)
        }

    }
    
}