//
//  ApplicationFactory+KitDetails.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 17/01/2021.
//

protocol KitDetailsViewControllerFactory {
    func makeKitDetailsViewController(kit: SmartKit) -> KitDetailsViewController
}

extension ApplicationFactory: KitDetailsViewControllerFactory {
    func makeKitDetailsViewController(kit: SmartKit) -> KitDetailsViewController {
        KitDetailsViewController(
            viewModel: KitDetailsViewModel(
                kit: kit
            )
        )
    }
}
