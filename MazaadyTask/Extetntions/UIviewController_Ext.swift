//
//  UIviewController_Ext.swift
//  Leedo
//
//  Created by eslam dweeb on 21/09/2022.
//

import UIKit

@available(iOS 12.0, *)
extension UIViewController {
    func makePhoneCall(phoneNumber: String) throws {
        let phoneURLString = "tel://\(phoneNumber)"
        
        guard let phoneURL = URL(string: phoneURLString) else {
            throw NSError(domain: "Can't call this number", code: 422,userInfo: [NSLocalizedDescriptionKey:"Invalid phone number."])
        }
        
        if UIApplication.shared.canOpenURL(phoneURL) {
            UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
        } else {
            throw NSError(domain: "Phone Call Not Supported", code: 500,userInfo: [NSLocalizedDescriptionKey:"Your device does not support phone calls."])
        }
    }
    func createAlert(title: String? = nil,erroMessage: String,createButton:Bool? = true,completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title ?? "", message: erroMessage, preferredStyle: UIAlertController.Style.alert)
//        alert.setBackgroundColor(color: .darkGray)
//        alert.setMessage(font: nil, color: .white)
        if createButton == true{
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { action in
                if let completion = completion {
                    completion()
                }else{
                    alert.dismiss(animated: true)
                }
            }
        alert.addAction(okButton)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    

    class func loadController() -> Self {
            let controller = Self(nibName: String(describing: self), bundle: nil)
//        if MOLHLanguage.currentAppleLanguage() == "ar"{
//            UIView.appearance().semanticContentAttribute = .forceRightToLeft
//           
//        }else{
//            UIView.appearance().semanticContentAttribute = .forceLeftToRight
//        }
             return controller
             //Or You can use this as well
             //Self.init(nibName: String(describing: self), bundle: nil)
        }
    func presentInFullScreen(_ viewController: UIViewController,transition:UIModalTransitionStyle = .coverVertical,
                             animated: Bool,
                             completion: (() -> Void)? = nil) {
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = transition
        present(viewController, animated: animated, completion: completion)
    }
    func presentPopScreen(_ viewController: UIViewController,
                             animated: Bool,
                             completion: (() -> Void)? = nil) {
        viewController.modalPresentationStyle = .overCurrentContext
        present(viewController, animated: animated, completion: completion)
    }
    func presentMenu(_ vc:UIViewController,delegate:UIViewControllerTransitioningDelegate,animated: Bool,completion: (() -> Void)? = nil){
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = delegate
        present(vc, animated: animated, completion: completion)
    }
    func navigateToNewVC(_ VC:UIViewController){
        navigationController?.pushViewController(VC, animated: true)
    }
    func PopToOldPage(){
        navigationController?.popViewController(animated: true)
    }
    func cleanNavStackWithNewVC(_ VC:UIViewController){
        navigationController?.setViewControllers([VC], animated: true)
    }
    func getError (error : [String : [String]]) -> String {
        var   text = ""
        for (_,v) in error {
            for i in v {
                text += " \(i) "
            }
        }
        return text
    }
//
//    func startActivityIndicator(){
//        ProgressHUD.animationType = .systemActivityIndicator
//        ProgressHUD.colorHUD = .purpleColor2
//        ProgressHUD.colorBackground = .lightGray
//        ProgressHUD.colorAnimation = .darkGray
//        ProgressHUD.colorProgress = .darkGray
//        ProgressHUD.colorStatus = .systemGray
//        ProgressHUD.show()
//    }
//    @available(iOS 13.0, *)
//    func stopActivityIndicator(){
//        ProgressHUD.dismiss()
//    }
//
//    func callFBAnalyticsEvent(with eventName:String,for userID:Int){
//        if UserDefaults.standard.bool(forKey: Constants.allowTracking.rawValue){
//            Analytics.logEvent(eventName, parameters: [
//              "user_id": userID as NSObject,
//            ])
//        }
//    }
    func createUpdateAlert(title:String = "UPDATE",message:String = "Please Update Your App"){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let updateButton = UIAlertAction(title: "Update", style: UIAlertAction.Style.default) {[weak self] _ in
            guard let _ = self else{return}
            if let url = URL(string: "itms-apps://apple.com/app/id1639618299") {
                UIApplication.shared.open(url)
            }
        }
        alert.addAction(updateButton)
        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(cancelButton)
        
        self.present(alert, animated: true, completion: nil)
    }
    func saveDictionaryToUserDefaults(dictionary: [String: Any], forKey key: String) {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: dictionary, requiringSecureCoding: false)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Error saving dictionary to UserDefaults: \(error)")
        }
    }
    func loadDictionaryFromUserDefaults(forKey key: String) -> [String: Any]? {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                if let dictionary = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [String: Any] {
                    return dictionary
                }
            } catch {
                print("Error loading dictionary from UserDefaults: \(error)")
            }
        }
        return nil
    }
}

import MBProgressHUD
//import CleanyModal

extension UIViewController {
    func showIndicator(withTitle title: String, and description: String) {
        let indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
        indicator.label.text = title
        indicator.isUserInteractionEnabled = false
        indicator.detailsLabel.text = description
        indicator.show(animated: true)
        self.view.isUserInteractionEnabled = false
    }
    func hideIndicator() {
        MBProgressHUD.hide(for: self.view, animated: true)
        self.view.isUserInteractionEnabled = true
    }
//    func showAlertWithImage(withTitle: String, andMessage message: String, andImage image: String? = nil,addCansel:Bool = false, completion: (() -> Void)? = nil) {
//
//        let alert = MyAlertViewController( title: withTitle, message: message,
//            imageName: image)
//
//        let okButton = CleanyAlertAction(title: "ok", style: .default) { (_) in
//                    (completion ?? {})()
//        }
//        if addCansel {
//            let cancel = CleanyAlertAction(title: "Cancel", style: .cancel)
//            alert.addAction(cancel)
//
//        }
//        alert.addAction(okButton)
//        present(alert, animated: true, completion: nil)
//    }

}
