//
//  CodeView.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 11/12/2020.
//

import UIKit

class CodeView: UIView {
    
    private var isLayedout: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
   
    @available(*, unavailable) required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard !isLayedout else { return }
		guard let setupableView = self as? ViewSetupable else { return }
		setupableView.setupView()
        isLayedout = true
    }
}
