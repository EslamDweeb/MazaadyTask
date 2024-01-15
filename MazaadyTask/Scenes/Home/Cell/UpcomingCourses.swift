//
//  UpcomingCourses.swift
//  MazaadyTask
//
//  Created by eslam dweeb on 15/01/2024.
//

import UIKit

class UpcomingCourses: UICollectionReusableView {

    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpAttributedString()
    }
    private func setUpAttributedString() {
           let fullString = "Upcoming course of this week"

           // Create an attributed string with the full string
           let attributedString = NSMutableAttributedString(string: fullString)

           // Find the range of the word "Upcoming"
           if let upcomingRange = fullString.range(of: "Upcoming") {
               // Apply bold font to the found range
               attributedString.addAttributes([.font: Fonts.bold(name: Fonts.FontName.Poppins.rawValue, size: 18)], range: NSRange(upcomingRange, in: fullString))
           }

           // Find the range of the rest of the string
           if let restRange = fullString.range(of: " course of this week") {
               // Apply semi-bold font to the found range
               attributedString.addAttributes([.font: Fonts.bold(name: Fonts.FontName.Poppins.rawValue, size: 18)], range: NSRange(restRange, in: fullString))
           }

           // Apply the attributed string to your label
           titleLbl.attributedText = attributedString
       }
}
