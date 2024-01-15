//
//  FormViewModeL.swift
//  MazaadyTask
//
//  Created by eslam dweeb on 15/01/2024.
//

import Foundation
import RxSwift
import RxCocoa

protocol FormViewModelOutputs{
    var categories:BehaviorRelay<[Category]>{get set}
    var subCategories:BehaviorRelay<[Subcategory]>{get set}
    var processType:BehaviorRelay<[Property]>{get set}
}
protocol FormViewModelInputs{
    var selectedCategory:BehaviorRelay<String>{get set}
    var selectedSubcategory:BehaviorRelay<String>{get set}
    func viewDidload()
    func handleSelectedCategory(index:Int)
    func handleSelectedSubcategory(index:Int)
}
class FormViewModel:ViewModel,FormViewModelInputs,FormViewModelOutputs{
    
    var isLoading: BehaviorRelay<Bool> = .init(value: false)
    var hasErrInTxt: PublishSubject<String> = .init()
    var selectedCategory: BehaviorRelay<String> = .init(value: "")
    var selectedSubcategory: BehaviorRelay<String> = .init(value: "")
    var categories: BehaviorRelay<[Category]> = .init(value: [])
    var subCategories: BehaviorRelay<[Subcategory]> = .init(value: [])
    var processType:BehaviorRelay<[Property]> = .init(value: [])
    func viewDidload() {
        categories.accept(MockedData.Categories)
    }
    func handleSelectedCategory(index:Int){
        subCategories.accept(categories.value[index].subcategories)
    }
    func handleSelectedSubcategory(index:Int) {
        let arr = subCategories.value[index].properties + [.init(id: 0, name: "other")]
        processType.accept(arr)
    }
}
