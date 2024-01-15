//
//  LinearIndecatorTabBar.swift
//  MazaadyTask
//
//  Created by eslam dweeb on 15/01/2024.
//


import UIKit

class LinearIndecatorTabBar: UITabBar {
    private var lineIndicator: UIView = UIView()
    override var selectedItem: UITabBarItem?{
        didSet {
            guard let selectedItem else{return}
            updateLineIndicatorPosition()
        }
    }
    let indicatorWidth: CGFloat = 20
    let indicatorHeight: CGFloat = 3
       override init(frame: CGRect) {
           super.init(frame: frame)
           backgroundColor = .white
           setupLineIndicator()
       }

       required init?(coder: NSCoder) {
           super.init(coder: coder)
           setupLineIndicator()
       }

       private func setupLineIndicator() {
           lineIndicator.backgroundColor = UIColor.primry
           lineIndicator.cornerRadius = indicatorHeight / 2
           addSubview(lineIndicator)
       }

       override func layoutSubviews() {
           super.layoutSubviews()
           updateLineIndicatorPosition()
       }
    
    private func updateLineIndicatorPosition() {
        guard let selectedItem = selectedItem, let items = items else { return }
        
        if let index = items.firstIndex(of: selectedItem), subviews.count > index + 1 {
            let itemFrame = self.frame(for: selectedItem)
            
            // Calculate the position of the line indicator
            
            let indicatorX = itemFrame.midX - (indicatorWidth / 2)
            let indicatorY = itemFrame.maxY - (indicatorWidth + 8)
            
            let lineIndicatorFrame = CGRect(
                x: indicatorX,
                y: indicatorY,
                width: indicatorWidth,
                height: indicatorHeight
            )
            
            lineIndicator.frame = lineIndicatorFrame
            
        }
    }
    
    private func frame(for item: UITabBarItem) -> CGRect {
        guard let index = items?.firstIndex(of: item) else { return .zero }
        let itemWidth = self.frame.width / CGFloat(items?.count ?? 1)
        return CGRect(x: CGFloat(index) * itemWidth, y: 0, width: itemWidth, height: self.frame.height)
    }
}
