//
//  LinearIndecatorTabBar.swift
//  MazaadyTask
//
//  Created by eslam dweeb on 15/01/2024.
//


import UIKit

class LinearIndecatorTabBar: UITabBar {
    private var highlightLine: UIView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHighlightLine()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupHighlightLine()
    }

    private func setupHighlightLine() {
        highlightLine.backgroundColor = UIColor.systemBlue
        addSubview(highlightLine)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateHighlightLinePosition()
    }

    private func updateHighlightLinePosition() {
        guard let selectedItem = selectedItem else { return }

        let itemIndex = CGFloat(items?.firstIndex(of: selectedItem) ?? 0)
        let itemWidth = frame.width / CGFloat(items?.count ?? 1)

        let highlightLineFrame = CGRect(
            x: itemIndex * itemWidth,
            y: 0,
            width: itemWidth,
            height: 2 // Adjust the height of the highlight line as needed
        )

        highlightLine.frame = highlightLineFrame
    }
}
