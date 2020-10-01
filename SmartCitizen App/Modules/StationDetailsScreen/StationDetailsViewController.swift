//
//  StationDetailsViewController.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 30/09/2020.
//

import UIKit

class StationDetailsViewController: UIViewController {
    
    var stationView = StationDetailsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        super.loadView()
        view = stationView
    }
}
