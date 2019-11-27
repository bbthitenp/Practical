
//  AppUtilites.swift
//
//
//  Created by Hiten on /6/18.
//  Copyright © 2018 Harry. All rights reserved.
//

import UIKit
import SVProgressHUD
import Photos
import AudioToolbox


let AppDarkColor = UIColor(red: 224.0/255.0, green: 29.0/255.0, blue: 8.0/255.0, alpha: 1.0)
let AppPinkColor = UIColor(red: 255.0/255.0, green: 49.0/255.0, blue: 87.0/255.0, alpha: 1.0)  //#FF3157

let RNsrdMain = UIStoryboard(name: "Main", bundle: nil)

class AppUtilites: NSObject {
    
    var params = NSDictionary()
   
    let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
    
    class var shared : AppUtilites {
        
        struct Static {
            static let instance : AppUtilites = AppUtilites()
        }
        return Static.instance
    }
    
    func isValidatePresence(string: String) -> Bool {
        
        let trimmed: String = string.trimmingCharacters(in: CharacterSet.whitespaces)
        return !trimmed.isEmpty
    }
    
    func isValidPostalCode(string:String) -> Bool {
        let emailRegEx = "^[0-9A-Za-z]{5,7}$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: string)
    }
 
    
    
    func isValidEmail(string:String) -> Bool {
        
      
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
//               let emailRegEx = "^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: string)
    }
    
    func isValiCodeNumber(string: String) -> Bool {
        let PHONE_REGEX = "^\\d{4}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        return  phoneTest.evaluate(with: string)
    }
    
    
    func isValidPhoneNumber(string: String) -> Bool {
        let PHONE_REGEX = "^\\d{11}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        return  phoneTest.evaluate(with: string)
    }
    
    func isOnlyNumber(string: String) -> Bool {
        let PHONE_REGEX = "^[0-9]*"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        return  phoneTest.evaluate(with: string)
    }
    
    func isValidPhoneNumberWithCode(string: String) -> Bool {
        let PHONE_REGEX = "^\\+?91?\\s*\\(?-*\\.*(\\d{3})\\)?\\.*-*\\s*(\\d{3})\\.*-*\\s*(\\d{4})$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        return  phoneTest.evaluate(with: string)
    }
    
    func setCallContactNO(number: String) -> String {
        
        let contact_no : String = number
        var finalContactNo = contact_no.replacingOccurrences(of: " ", with: "")
        finalContactNo = finalContactNo.replacingOccurrences(of: "(", with: "")
        finalContactNo = finalContactNo.replacingOccurrences(of: ")", with: "")
        finalContactNo = finalContactNo.replacingOccurrences(of: "-", with: "")
        return finalContactNo
    }

    
    //MARK: - SimpleAlertView
    class func SimpleAlertView(title:String, message: String) -> UIAlertController{
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        {
            (result : UIAlertAction) -> Void in
            print("You pressed OK")
        }
        alertController.addAction(okAction)
        
        return alertController
    }
    
    //MARK: - AlertView
    class func showError(title: String,message: String) {
        //ISMessages.showCardAlert(withTitle: title, message: message, duration: 3, hideOnSwipe: true, hideOnTap: true, alertType: .error, alertPosition: .top, didHide: nil)
        
        let alert = ISMessages.cardAlert(withTitle: title, message: message, iconImage: UIImage(named: "isErrorIcon"), duration: 3.0, hideOnSwipe: true, hideOnTap: true, alertType: .error, alertPosition: .top)
        alert?.alertViewBackgroundColor = UIColor(red: 255.0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 1.0)
        alert?.show(nil, didHide: nil)
        
    }
    
    class func showSucess(title: String,message: String) {
        //  ISMessages.showCardAlert(withTitle: title, message: message, duration: 3, hideOnSwipe: true, hideOnTap: true, alertType: .success, alertPosition: .top, didHide: nil)
        
        let alert = ISMessages.cardAlert(withTitle: title, message: message, iconImage: UIImage(named: "isSuccessIcon"), duration: 3.0, hideOnSwipe: true, hideOnTap: true, alertType: .success, alertPosition: .top)
        alert?.alertViewBackgroundColor = UIColor(red: 75.0 / 255.0, green: 183.0 / 255.0, blue: 77.0 / 255.0, alpha: 1.0)
        alert?.show(nil, didHide: nil)
        
    }
    
    class func showNotice(title: String,message: String) {

        let alert = ISMessages.cardAlert(withTitle: title, message: message, iconImage: UIImage(named: "isInfoIcon"), duration: 3.0, hideOnSwipe: true, hideOnTap: true, alertType: .success, alertPosition: .top)
        alert?.alertViewBackgroundColor = AppPinkColor
        alert?.show(nil, didHide: nil)
        
    }
    
    class func showNotice(message: String) {
        SCLAlertView().showNotice("Notice", subTitle: message)
    }
    
    class func showWarning(message: String) {
        SCLAlertView().showWarning("Warning", subTitle: message)
    }
    
    
    class func showInfo(message: String) {
        SCLAlertView().showInfo("Info", subTitle: message)
    }
    
    class func showErrorCustom(title: String,message: String,cancelButtonTitle: String) {
        
        
        let margin = SCLAlertView.SCLAppearance.Margin(titleTop:40)
        
        let appearance = SCLAlertView.SCLAppearance(
            kCircleIconHeight:60,
            kTitleFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 12)!,
            showCloseButton: false,
            margin: margin,
            dynamicAnimatorActive: true,
            buttonsLayout: .horizontal
        )
        
        let alert = SCLAlertView(appearance: appearance)
        
        _ = alert.addButton(cancelButtonTitle, backgroundColor: AppUtilites.shared.hexColor(hex: "C1272D"), textColor: UIColor.white){
            
        }
        
        let icon = UIImage(named: "applogo")
        alert.showCustom(message, subTitle: nil, color: UIColor.clear, circleIconImage: icon)
    }
    
    
    class func showEdit(title:String,message: String) {
        //        let appearance = SCLAlertView.SCLAppearance(showCloseButton: true)
        //        let alert = SCLAlertView(appearance: appearance)
        //        let txt = alert.addTextField("Enter your name")
        //        _ = alert.addButton("Show Name") {
        //            print("Text value: \(txt.text ?? "NA")")
        //        }
        //        _ = alert.showEdit(title, subTitle:message)
    }
    
    class func showCustomAlert(title:String,message: String) {
        //        let appearance = SCLAlertView.SCLAppearance(
        //            kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
        //            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
        //            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
        //            showCloseButton: false,
        //            dynamicAnimatorActive: true,
        //            buttonsLayout: .horizontal
        //        )
        ////        let alert = SCLAlertView(appearance: appearance)
        ////        _ = alert.addButton("First Button", target:self, selector:#selector(ViewController.firstButton))
        ////        _ = alert.addButton("Second Button") {
        ////            print("Second button tapped")
        ////        }
        //
        //        let icon = UIImage(named:"custom_icon.png")
        //        let color = UIColor.orange
        //
        //        _ = alert.showCustom("Custom Color", subTitle: "Custom color", color: color, icon: icon!)
    }
    
    
    //MARK: - ProgressView
    class func showProgress() {
        
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.gradient)
        SVProgressHUD.show()
    }
    
    class func dismissProgress() {
         SVProgressHUD.dismiss()
    }
    
    class func mackVibrate() {
         AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    func hexColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
     func setIndicator(view : UIView){
        actInd.frame = CGRect(x:0.0,y: 0.0,width: 40.0,height: 40.0);
        actInd.center = view.center
        actInd.hidesWhenStopped = true
        actInd.style =
            UIActivityIndicatorView.Style.gray
        view.addSubview(actInd)
        actInd.startAnimating()
    }
    
     func hideIndicator(){
        actInd.stopAnimating()
    }
    
    func backToHome(){
//        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        var initialViewController = UIViewController()
//        initialViewController = mainStoryboard.instantiateViewController(withIdentifier: "WIHomeVC") as! WIHomeVC
//        let navigation = UINavigationController(rootViewController: initialViewController)
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
//        let rightViewController = mainStoryboard.instantiateViewController(withIdentifier: "FBRightViewControllerPro") as! FBRightViewControllerPro
//        let slideMenuController = SlideMenuController(mainViewController:navigation, leftMenuViewController: rightViewController)
//        appDelegate.window?.rootViewController = slideMenuController
//        appDelegate.window?.makeKeyAndVisible()
    }
    
    
    
    
 }

extension UINavigationController {
    
    func setColorFonts(size : CGFloat, colorFont : UIColor, colorBackground : UIColor,Shadow:Bool) {
        
        let attrs = [
            NSAttributedString.Key.foregroundColor: colorFont,
            NSAttributedString.Key.font: UIFont(name: "RobotoCondensed-Regular", size: size)!
        ]
        self.isNavigationBarHidden = false
        self.navigationBar.titleTextAttributes = attrs
        self.navigationBar.barTintColor = colorBackground
        self.navigationBar.isTranslucent = false
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        
        if (Shadow) {
            self.navigationBar.layer.masksToBounds = false
            self.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
            self.navigationBar.layer.shadowOpacity = 0.2
            self.navigationBar.layer.shadowRadius = 4
            self.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        } else {
            self.navigationBar.layer.masksToBounds = false
            self.navigationBar.layer.shadowColor = UIColor.clear.cgColor
            self.navigationBar.layer.shadowOpacity = 0
            self.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 0.0)
            
        }
    }
}


extension NSLayoutConstraint
{
    
    func checkSize(con : NSLayoutConstraint,height:Int)
    {
        //        Simulator
        //        iPhone X
        if (DeviceTypes.IS_IPHONE_XR || DeviceTypes.IS_IPHONE_X){
            con.constant = CGFloat(height)
        }
        
    }
    
    func checkHeader(con : NSLayoutConstraint)
    {
        //        Simulator
        //        iPhone X
        
        if (DeviceTypes.IS_IPHONE_XR || DeviceTypes.IS_IPHONE_X){
           con.constant = 88
        }else{
            con.constant = 64
        }
        
    }
}

extension Notification.Name {
    static let clickAds = Notification.Name("clickAds")
    static let checkTimer = Notification.Name("checkTimer")
}





