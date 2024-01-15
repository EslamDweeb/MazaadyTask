//
//  CourseCat.swift
//  MazaadyTask
//
//  Created by eslam dweeb on 15/01/2024.
//

import UIKit

class CourseCat: UICollectionViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override var isSelected: Bool {
        willSet {
            onSelected(newValue)
        }
    }
    func onSelected(_ newValue: Bool) {
        titleLbl.textColor = newValue ? .white : .gray3
        contentView.backgroundColor = newValue ? .primry : .white
    }
}
