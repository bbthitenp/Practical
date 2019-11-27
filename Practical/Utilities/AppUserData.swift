//
//  AppUserData.swift
//  Roolian
//
//  Created by PK iMac on 03/04/19.
//  Copyright © 2019 HIten. All rights reserved.
//

import Foundation

class AppUserData: NSObject {
    
    class var shared : AppUserData {
        
        struct Static {
            static let instance : AppUserData = AppUserData()
        }
        return Static.instance
    }
    
    func getUserName()-> String{
        return (UserDefaults.standard.value(forKey: "username") as? String ?? "")
    }
    
    func setUserName(str:String) {
        UserDefaults.standard.set(str, forKey: "username")
    }
    
    func setName(str:String) {
        UserDefaults.standard.set(str, forKey: "name")
    }
    
    func getName()-> String{
        return (UserDefaults.standard.value(forKey: "name") as? String ?? "")
    }
    
    func setCoachId(str:String) {
        UserDefaults.standard.set(str, forKey: "coachid")
    }
    
    func getCoachId()-> String{
        return (UserDefaults.standard.value(forKey: "coachid") as? String ?? "")
    }
    
    func setEmail(str:String) {
        UserDefaults.standard.set(str, forKey: "email")
    }
    
    func getEmail()-> String{
        return (UserDefaults.standard.value(forKey: "email") as? String ?? "")
    }
    
    func setId_regional_centre(str:String) {
        UserDefaults.standard.set(str, forKey: "id_regional_centre")
    }
    
    func getId_regional_centre()-> String{
        return (UserDefaults.standard.value(forKey: "id_regional_centre") as? String ?? "")
    }
    
    func setAllData(userData:NSDictionary) {
        print(userData)
        
        //let email = userData.value(forKey: "email") as? String
        let user_name = userData.value(forKey: "Username") as? String
        let idcoach = userData.value(forKey: "UserId") as? Int
        let name = "\(String(describing: userData.value(forKey: "FirstName") as? String)) \(String(describing: userData.value(forKey: "LastName") as? String))"
        let id_regional_centre = userData.value(forKey: "CurrentRegionalCentreId") as? Int
        
        //self.setEmail(str: email!)
        self.setUserName(str: user_name!)
        self.setCoachId(str: "\(idcoach!)")
        self.setName(str: name)
        self.setId_regional_centre(str: "\(id_regional_centre!)")
        
        
//        let email = userData.value(forKey: "email") as? String
//        let user_name = userData.value(forKey: "username") as? String
//        let idcoach = userData.value(forKey: "idcoach") as? String
//        let name = userData.value(forKey: "name") as? String
//        let id_regional_centre = userData.value(forKey: "id_regional_centre") as? String
//
//        self.setEmail(str: email!)
//        self.setUserName(str: user_name!)
//        self.setCoachId(str: idcoach!)
//        self.setName(str: name!)
//        self.setId_regional_centre(str: id_regional_centre!)
        
    }
    
    
    func removeUserAllData() {
        UserDefaults.standard.removeObject(forKey: "coachid")
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "name")
        UserDefaults.standard.removeObject(forKey: "username")
    }
}
