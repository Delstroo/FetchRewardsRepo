//
//  UnderlineStringExtension.swift
//  FetchRewardsProject
//
//  Created by Delstun McCray on 2/19/22.
//

import Foundation
import UIKit

extension UILabel {
    func underline() {
        if let textString = text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}
