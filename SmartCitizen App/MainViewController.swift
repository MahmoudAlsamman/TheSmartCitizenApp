//
//  MainViewController.swift
//  SmartCitizen App
//
//  Created by Mahmoud Alsamman on 23/09/2020.
//

import UIKit

class MainViewController: UIViewController {

    var mainView: UIView = MainView()
    let api = APIClient()

    typealias Devicex = Result<[Device], Error>

    override func viewDidLoad() {
        
        super.viewDidLoad()
        api.fetch(.allWorldDevices) { (result: Devicex) in
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    print(data.filter {$0.systemTags!.contains("online")})
                }
            case .failure(_):
                print("error")
            }
            
        }
    }

    override func loadView() {
        super.loadView()
        view = mainView
    }

}

