//
//  ViewSetupable.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 31/12/2020.
//

protocol ViewSetupable where Self: CodeView {
	
	func setupViewHierarchy()
	
	func setupConstraints()
	
	func setupProperties()
}

extension ViewSetupable {
	
	func setupProperties() {}
	
	func setupView() {
		setupViewHierarchy()
		setupConstraints()
		setupProperties()
	}
}
