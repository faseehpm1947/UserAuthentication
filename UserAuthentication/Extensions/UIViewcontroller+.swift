//
//  UIViewcontroller+.swift
//  UserAuthentication
//
//  Created by faseeh-pixbit on 04/03/24.
//

import Foundation
import UIKit

extension UIViewController{
    
    func alert(message: String, title: String = "", animated: Bool = true) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: animated, completion: nil)
    }
    
    func alertError(){
        self.alert(message: NSLocalizedString("Please try again later.", comment: ""))
    }
    
    func alertNoInternet(){
        self.alert(message: NSLocalizedString("It seems that you are not connected to Internet.", comment: ""))
    }
    
    func alertServerMessage(data: Data?, completion:(()->Void)? = nil){
        
        guard let data = data else{
            self.alertError()
            return
        }
        
        print(String(data: data, encoding: String.Encoding.utf8)!)
        
        do{
            let responseJSON = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:Any]
            if let message = responseJSON["message"] as? String, message.count > 0{
                if (message == "Unauthenticated." || message == "Unauthorized"){
//                    logout()
                    return
                }
                self.alert(message: message)
                return
            }else{
                self.alertError()
                return
            }
        }catch{
            self.alertError()
            print(error)
            return
        }
        
    }
    
    func alertErrorServerValidation(data: Data?){
        guard let data = data else{
            self.alertError()
            return
        }
        
        print(String(data: data, encoding: String.Encoding.utf8)!)
        
        do{
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:Any]
            if let error = json["errors"] as? [String:[Any]]{
                for (key, value) in error{
                    print(key+": ")
                    print(value)
                    
                    if let message = value[0] as? String, message.count > 0 {
                        alert(message: message)
                        return
                    }else{
                        self.alertError()
                        return
                    }
                }
            } else if let message = json["message"] as? String, message.count > 0{
                self.alert(message: message)
                return
            }
        }catch{
            self.alertError()
            print(error)
            return
        }
        
    }
}
