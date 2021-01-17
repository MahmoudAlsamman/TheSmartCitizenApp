//
//  UIView+Layout.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 31/12/2020.
//

import UIKit

extension UIView {
	
	func addSubviews(_ subviews: UIView...) {
		subviews.forEach(addSubview)
	}
}
