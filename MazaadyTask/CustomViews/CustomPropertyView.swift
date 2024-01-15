//
//  CustomPropertyView.swift
//  MazaadyTask
//
//  Created by eslam dweeb on 15/01/2024.
//

import UIKit
import iOSDropDown

class CustomPropertyView:UIView {
    var dropDownPlaceHolder:String?{
        didSet {
            guard let dropDownPlaceHolder else{return}
            mainCategoryDropDown.placeholder = dropDownPlaceHolder
        }
    }
    
    lazy var mainCategoryDropDown: DropDown = {
            let dropDown = DropDown()
            dropDown.translatesAutoresizingMaskIntoConstraints = false
//            dropDown.placeholder = "Select Main Category"
        
            dropDown.didSelect { [weak self] (selectedItem, index, id) in
//               self?.updateSubcategoryDropDown(selectedCategoryIndex: index)
//                if index = dropDown.optionArray.count - 1 {
//
//                }else{
//
//                }
                self?.otherTxtField.isHidden = index == dropDown.optionArray.count - 1 ? false:true
            }
            return dropDown
        }()
    lazy var otherTxtField:UITextField = {
       let txt = UITextField()
        txt.isHidden = true
        return txt
    }()
    
    lazy var staclView:UIStackView = {
       let stack = UIStackView(arrangedSubviews: [mainCategoryDropDown,otherTxtField], customSpacing: 20)
        stack.distribution = .fillEqually
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        mainCategoryDropDown.heightAnchor.constraint(equalToConstant: 45).isActive = true
        staclView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
