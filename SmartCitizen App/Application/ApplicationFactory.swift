//
//  ApplicationFactory.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 11/12/2020.
//

fileprivate final class ApplicationDependencies {
    let apiClient = APIClient()
    let locationManager = LocationManager()
}

final class ApplicationFactory {
    fileprivate let dependencies = ApplicationDependencies()
}

extension ApplicationFactory {
    func makeKitsMapViewController() -> KitsMapViewController {
        KitsMapViewController(
            viewModel: KitsMapViewModel(
                apiClient: dependencies.apiClient,
                locationManager: dependencies.locationManager,
                factory: self
            )
        )
    }
}
