//
//  SignUpViewController.swift
//  hackathon-for-hunger
//
//  Created by ivan lares on 4/4/16.
//  Copyright © 2016 Hacksmiths. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelButtonClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didTapSignupUpInside(sender: AnyObject) {
        let userType = UserType.init(rawValue: sender.tag)
        switch userType {
        case .Donor: break
            
        case .Driver: break
            
        }
    }

}

/** Set a enum to match the type of user for triggering segues
 */
enum UserType {
    case Donor = 1, Driver
}
