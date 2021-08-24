//
//  PaddingUILabel.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 17/01/2021.
//

import UIKit

final class PaddingLabel: UILabel {
    
    private enum Constants {
        static let topInset: CGFloat = 5.0
        static let bottomInset: CGFloat = 5.0
        static let leftInset: CGFloat = 5.0
        static let rightInset: CGFloat = 5.0
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: Constants.topInset,
                                  left: Constants.leftInset,
                                  bottom: Constants.bottomInset,
                                  right: Constants.rightInset
        )
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + Constants.leftInset + Constants.rightInset,
                      height: size.height + Constants.topInset + Constants.bottomInset)
    }
}
