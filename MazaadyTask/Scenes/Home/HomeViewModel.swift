//
//  HomeViewModel.swift
//  MazaadyTask
//
//  Created by eslam dweeb on 15/01/2024.
//

import Foundation
import RxSwift
import RxCocoa


class HomeViewModel:ViewModel {
    var isLoading: BehaviorRelay<Bool> = .init(value: false)
    var hasErrInTxt: PublishSubject<String> = .init()
}
