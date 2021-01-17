//
//  CodeViewController.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 11/12/2020.
//

import UIKit

class CodeViewController<View: UIView>: UIViewController {
    
    let customView: View
    
    init(customView: View = View()) {
        self.customView = customView
        super.init(nibName: nil, bundle: nil)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }
}
