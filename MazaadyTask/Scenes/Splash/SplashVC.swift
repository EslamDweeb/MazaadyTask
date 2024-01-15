//
//  SplashVC.swift
//  EasySchool
//
//  Created by eslam dweeb on 08/01/2024.
//

import UIKit

class SplashVC: UIViewController {
    var coordinator:Coordinator
    let authRepo = DefaultLoginRepo()
    //MARK: - Initializers
    init(_ coordinator:Coordinator){
        self.coordinator = coordinator
        super.init(nibName: "SplashVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            print("Navigate to another screen")
            Task {[weak self] in
                guard let self else{return}
                let result = await self.authRepo.login(email: "kminchelle", password: "0lelplR")
                switch result {
                case .success(let success):
                    print(success)
                case .failure(let failure):
                    print(failure.customMessage)
                }
            }
        }
    }

}
