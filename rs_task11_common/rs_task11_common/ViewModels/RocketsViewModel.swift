//
//  RocketsViewModel.swift
//  rs_task11_common
//
//  Created by Dzmitry Semenovich on 12.09.21.
//

import Foundation

final class RocketsViewModel {
    
    private let rocketsManager = RocketsManager()
    
    let rocketsCellsData: Box<[RocketCellModel]> = Box([])
    let rocketsData: Box<[RocketModel]> = Box([])
    
    init() {
        self.fetchRocketsData()
    }
    
    func fetchRocketsData() {
        self.rocketsManager.getAllRockets { [weak self] result in
            guard
                let self = self
            else { return }
            switch result {
            case .success(let rocketsResonse):
                self.rocketsData.value = rocketsResonse
                self.rocketsCellsData.value = rocketsResonse.map {
                    guard let rocketImage = $0.frickrImages.first,
                          let imageURL = URL(string: rocketImage) else {
                        return RocketCellModel(rocketImage: nil,
                                               rocketName: $0.name,
                                               launchDate: $0.firstFlight,
                                               cost: "\($0.cost)$",
                                               successPercent: "\($0.success)%")
                    }
                    return RocketCellModel(rocketImage: imageURL,
                                           rocketName: $0.name,
                                           launchDate: $0.firstFlight,
                                           cost: "\($0.cost)$",
                                           successPercent: "\($0.success)%")
                }
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
}
