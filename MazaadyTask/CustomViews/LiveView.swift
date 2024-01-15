//
//  LiveView.swift
//  MazaadyTask
//
//  Created by eslam dweeb on 15/01/2024.
//

import UIKit

class LiveView:UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    private func setup(){
        cornerRadius = 24
        borderColor = UIColor.primry
        borderWidth = 3
    }
}
