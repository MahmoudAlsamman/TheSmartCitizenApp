//
//  KitDetailsViewModel.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 02/01/2021.
//

final class KitDetailsViewModel {
    
    let kit: SmartKit
    var sensors: [KitSensor] {
        kit.data!.sensors
    }
    
    init(kit: SmartKit) {
        self.kit = kit
    }
}
