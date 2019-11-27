//
//  APIClient.swift
//  SocialStatus
//
//  Created by Hiten on 28/6/18.
//  Copyright © 2017 Harry. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire

class APIClient: NSObject,NSURLConnectionDataDelegate {
    
//    let manager : AFHTTPSessionManager = AFHTTPSessionManager()
    class var sharedInstance : APIClient {
    
        struct Static {
            static let instance : APIClient = APIClient()
        }
        return Static.instance
    }

    //MARK:- POST API Call
    func postAPICall(url: String, parameters: NSDictionary!, completionHandler:@escaping (NSDictionary?, Error?)->()) ->() {
        
        print("Calling API: \(url)")
        print("Calling parameters: \(parameters!)")
        
        let param : Parameters = parameters as! Parameters
        Alamofire.request(url, method: .post, parameters: param, encoding: URLEncoding.httpBody, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                completionHandler(response.result.value as? NSDictionary, Error?.self as? Error)
                break
            case .failure(let error):
                completionHandler(nil, error)
                break
            }
        }
    }
    
    func postAPICallLogin(url: String, parameters: NSDictionary!, completionHandler:@escaping (NSDictionary?, Error?)->()) ->() {
        
        print("Calling API: \(url)")
        print("Calling parameters: \(parameters!)")
        
        let param : Parameters = parameters as! Parameters
        Alamofire.request(url, method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).responseJSON {  
            response in
            switch response.result {
            case .success:
                completionHandler(response.result.value as? NSDictionary, Error?.self as? Error)
                break
            case .failure(let error):
                completionHandler(nil, error)
                break
            }
        }
    }
    
    
    func postAPICallImages(url: String, parameters: NSDictionary!, completionHandler:@escaping (NSDictionary?, Error?)->()) ->() {
        
        print("Calling API: \(url)")
        print("Calling parameters: \(parameters!)")
        
        let image = UIImage.init(named: "ic_back")
        let imgData = image?.jpegData(compressionQuality: 0.2)
        
        let param : Parameters = parameters as! Parameters
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imgData!, withName: "fileset",fileName: "file.jpg", mimeType: "image/jpg")
            for (key,value) in param {
                multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
            }
        },to:url){ (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    print("Upload Progress: \(progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                   completionHandler(response.result.value as? NSDictionary, Error?.self as? Error)
                }
                
            case .failure(let encodingError):
                print(encodingError)
            }
        }
    }
    
    //MARK: - ProgressView
    class func showProgress(refreshControllor:UIRefreshControl = UIRefreshControl()) {
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.light)
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        if !refreshControllor.isRefreshing{
            SVProgressHUD.show()
        }
    }
    
    class func dismissProgress(refreshControllor:UIRefreshControl = UIRefreshControl()) {
        if refreshControllor.isRefreshing == true {
            DispatchQueue.main.async {
               refreshControllor.endRefreshing()
            }
        }
        SVProgressHUD.dismiss()
    }

}

