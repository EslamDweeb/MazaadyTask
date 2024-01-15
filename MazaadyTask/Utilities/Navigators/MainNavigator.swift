//
//  MainNavigator.swift
//  Leedo
//
//  Created by eslam dweeb on 21/09/2022.
//

import UIKit
import CoreLocation


class MainNavigator:Navigator{
    var coordinator: Coordinator
    
    enum Destination {
        case splash
       
    }
    
    required init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func viewController(for destination: Destination) -> UIViewController {
        switch destination{
        case .splash:
            return SplashVC(coordinator)
        }
    }
}
