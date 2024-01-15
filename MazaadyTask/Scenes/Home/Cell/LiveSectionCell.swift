//
//  LiveSectionCell.swift
//  MazaadyTask
//
//  Created by eslam dweeb on 15/01/2024.
//

import UIKit
class LiveSectionCell:UICollectionViewCell {
    lazy var horizontalBannerVC = LiveSectionVC()
    
    //MARK:- Initializers
    var getSelectedIndex:((_ index:Int)->Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    //MARK:- Helper functions
    private func setupViews(){
        addSubViews()
        addConstraintsToElements()
       
    }
    private func addSubViews(){
       
        addSubview(horizontalBannerVC.view)
        
    }
    private func addConstraintsToElements(){
        horizontalBannerVC.view.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
}
