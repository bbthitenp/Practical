//
//  ViewController.swift
//  Practical
//
//  Created by PC on 27/11/19.
//  Copyright © 2019 PC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        if(self.validation()) {
//            AppUtilites.shared.params = ["uid":"AA",
//                                         "pwd":"BB"
//            ]
//            self.postLogin(param: AppUtilites.shared.params)
//        }
        
    }
    
    
    // MARK: - Api Call
    func postLogin(param : NSDictionary) {
        APIClient.showProgress()
        APIClient.sharedInstance.postAPICallLogin(url: BASE_URL.appending(login), parameters: param) { (response, error) in
            APIClient.dismissProgress()
            if (error == nil) {
                // code of responce...
                
                let resutls = response! as NSDictionary
                let userData = resutls.value(forKey: "d") as! NSDictionary
                print(userData)
                let UserId = userData.value(forKey: "UserId") as! Int
                if(UserId == 0){
                    AppUtilites.showError(title: "Error",message: "Username or password invalid!")
                }
            }else{
                AppUtilites.showError(title: "Error", message: (error?.localizedDescription)!)
            }
        }
    }
    
    //MARK:-  Textfield validation
    func validation() -> Bool {
        
        if (!AppUtilites.shared.isValidatePresence(string: "AA")) {
            AppUtilites.showError(title: "Error",message: "Enter a valid Email before continuing!")
            return false
        }else if (!AppUtilites.shared.isValidatePresence(string: "BB")) {
            AppUtilites.showError(title: "Error",message: "Enter a valid Password before continuing!")
            return false
        }
        else {
            return true
        }
    }

}

