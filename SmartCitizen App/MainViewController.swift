//
//  MainViewController.swift
//  SmartCitizen App
//
//  Created by Mahmoud Alsamman on 23/09/2020.
//

import UIKit

class MainViewController: UIViewController {

    var mainView: UIView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        super.loadView()
        view = mainView
    }

}

