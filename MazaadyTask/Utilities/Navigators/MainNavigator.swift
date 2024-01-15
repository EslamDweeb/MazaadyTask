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
        case main
        case home
        case form
    }
    
    required init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func viewController(for destination: Destination) -> UIViewController {
        switch destination{
        case .splash:
            return SplashVC(coordinator)
        case .main:
            return MainTabBarVC(coordinator: coordinator)
        case .home:
            let viewModel = HomeViewModel()
            return HomeVC(viewModel: viewModel, coordinator: coordinator)
        case .form:
            let viewModel = FormViewModel()
            return FormVC(viewModel: viewModel, coordinator: coordinator)
        }
    }
}
