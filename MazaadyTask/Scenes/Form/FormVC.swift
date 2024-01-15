//
//  FormVC.swift
//  MazaadyTask
//
//  Created by eslam dweeb on 15/01/2024.
//

import UIKit
import iOSDropDown
class FormVC: BaseWireFrame<FormViewModel> {

    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var subCategoryTxt: DropDown!
    @IBOutlet weak var processTypeTxt: DropDown!
    @IBOutlet weak var specifyProcessTxt: UITextField!
    @IBOutlet weak var categoryTxt: DropDown!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidload()
        handleSelectCat()
        handleSelectSubCat()
        handleSelectProcessType()
    }
    override func bind(viewModel: FormViewModel) {
        viewModel.isLoading.subscribe {[weak self] loading in
            guard let self else{return}
            guard let isLoading = loading.element else{return}
            if isLoading{
                self.showIndicator(withTitle: "", and: "")
            }else{
                self.hideIndicator()
            }
        }.disposed(by: disposeBag)
        viewModel.hasErrInTxt.subscribe {[weak self] msg in
            guard let self,let msg = msg.element else{return}
            if msg != "" {
                DispatchQueue.main.async {
                    self.createAlert(title: "Error",erroMessage: msg)
                }
            }
        }.disposed(by: disposeBag)
        viewModel.categories.subscribe {[weak self] items in
            guard let self,let cat = items.element else{return}
            if !cat.isEmpty{
                self.categoryTxt.optionArray = cat.map({$0.name})
            }
        }.disposed(by: disposeBag)
        viewModel.subCategories.subscribe {[weak self] items in
            guard let self,let cat = items.element else{return}
            if !cat.isEmpty{
                self.subCategoryTxt.optionArray = cat.map({$0.name})
            }
        }.disposed(by: disposeBag)
        viewModel.processType.subscribe {[weak self] items in
            guard let self,let cat = items.element else{return}
            if !cat.isEmpty{
                self.processTypeTxt.optionArray = cat.map({$0.name})
            }
        }.disposed(by: disposeBag)
    }
   
    private func handleSelectCat(){
        categoryTxt.didSelect {[weak self] selectedText, index, id in
            self?.viewModel.handleSelectedCategory(index: index)
        }
    }
    private func handleSelectSubCat(){
        subCategoryTxt.didSelect {[weak self] selectedText, index, id in
            self?.viewModel.handleSelectedSubcategory(index: index)
        }
    }
    private func handleSelectProcessType(){
        processTypeTxt.didSelect {[weak self] selectedText, index, id in
            self?.specifyProcessTxt.isHidden = index == (self?.processTypeTxt.optionArray.count)! - 1 ? false:true
           // self?.viewModel.handleSelectedSubcategory(index: index)
        }
    }
}
