//
//  Rocket.swift
//  rs_task11_common
//
//  Created by Dzmitry Semenovich on 10.09.21.
//

import Foundation

public struct RocketModel: Codable {
    let name: String
    let type: String
    let active: Bool
    let stages: Int
    let boosters: Int
    let cost: Int
    let success: Int
    let firstFlight: String
    let country: String
    let company: String
    let height: Size
    let diameter: Size
    let mass: Mass
    let payloadWeights: [Rocket]
    let firstStage: Stage?
    let secondStage: Stage?
    let engines: Engines?
    let landingLegs: LandingLegs
    let frickrImages: [String]
    let wikipedia: String
    let description: String
    
    public enum CodingKeys: String, CodingKey {
        case name
        case type
        case active
        case stages
        case boosters
        case cost = "cost_per_launch"
        case success = "success_rate_pct"
        case firstFlight = "first_flight"
        case country
        case company
        case height
        case diameter
        case mass
        case payloadWeights = "payload_weights"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case engines
        case landingLegs = "landing_legs"
        case frickrImages = "flickr_images"
        case wikipedia
        case description
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(String.self, forKey: .type)
        active = try container.decode(Bool.self, forKey: .active)
        stages = try container.decode(Int.self, forKey: .stages)
        boosters = try container.decode(Int.self, forKey: .boosters)
        cost = try container.decode(Int.self, forKey: .cost)
        success = try container.decode(Int.self, forKey: .success)
        firstFlight = try container.decode(String.self, forKey: .firstFlight)
        country = try container.decode(String.self, forKey: .country)
        company = try container.decode(String.self, forKey: .company)
        height = try container.decode(Size.self, forKey: .height)
        diameter = try container.decode(Size.self, forKey: .diameter)
        mass  = try container.decode(Mass.self, forKey: .mass)
        payloadWeights = try container.decode([Rocket].self, forKey: .payloadWeights)
        firstStage = try container.decodeIfPresent(Stage.self, forKey: .firstStage)
        secondStage = try container.decodeIfPresent(Stage.self, forKey: .secondStage)
        engines = try container.decodeIfPresent(Engines.self, forKey: .engines)
        landingLegs = try container.decode(LandingLegs.self, forKey: .landingLegs)
        frickrImages = try container.decode([String].self, forKey: .frickrImages)
        wikipedia = try container.decode(String.self, forKey: .wikipedia)
        description = try container.decode(String.self, forKey: .description)
    }
}

struct Size: Codable {
    let meters: Double?
    let feet: Double?
    
    public enum CodingKeys: String, CodingKey {
        case meters
        case feet
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        meters = try container.decodeIfPresent(Double.self, forKey: .meters)
        feet = try container.decodeIfPresent(Double.self, forKey: .feet)
    }
}

struct Mass: Codable {
    let kg: Int
    let lb: Int
    
    public enum CodingKeys: String, CodingKey {
        case kg
        case lb
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        kg = try container.decode(Int.self, forKey: .kg)
        lb = try container.decode(Int.self, forKey: .lb)
    }
}

struct Rocket: Codable {
    let id: String
    let name: String
    let kg: Int
    let lb: Int
    
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case kg
        case lb
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        kg = try container.decode(Int.self, forKey: .kg)
        lb = try container.decode(Int.self, forKey: .lb)
    }
}

struct Stage: Codable {
    let reusable: Bool
    let engines: Int
    let fuelAmount: Double
    let burnTime: Double?
    let thrustVacum: SeaLevel?
    let payloads: Payload?
    
    public enum CodingKeys: String, CodingKey {
        case reusable
        case engines
        case fuelAmount = "fuel_amount_tons"
        case burnTime = "burn_time_sec"
        case thrustVacum = "thrust_sea_level"
        case payloads
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        reusable = try container.decode(Bool.self, forKey: .reusable)
        engines = try container.decode(Int.self, forKey: .engines)
        fuelAmount = try container.decode(Double.self, forKey: .fuelAmount)
        burnTime = try container.decodeIfPresent(Double.self, forKey: .burnTime)
        thrustVacum = try container.decodeIfPresent(SeaLevel.self, forKey: .thrustVacum)
        payloads = try container.decodeIfPresent(Payload.self, forKey: .payloads)
    }
}

struct SeaLevel: Codable {
    let kN: Double
    let lbf: Double
    
    public enum CodingKeys: String, CodingKey {
        case kN
        case lbf
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        kN = try container.decode(Double.self, forKey: .kN)
        lbf = try container.decode(Double.self, forKey: .lbf)
    }
    
    init(kn: Double, lbf: Double) {
        self.kN = kn
        self.lbf = lbf
    }
}

struct Payload: Codable {
    let compositeFairing: CompositeFairing?
    let option: String
    
    public enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
        case option = "option_1"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        compositeFairing = try container.decodeIfPresent(CompositeFairing.self, forKey: .compositeFairing)
        option = try container.decode(String.self, forKey: .option)
    }
}
struct CompositeFairing: Codable {
    let height: Size?
    let diameter: Size?
    
    public enum CodingKeys: String, CodingKey {
        case height
        case diameter
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        height = try container.decodeIfPresent(Size.self, forKey: .height)
        diameter = try container.decodeIfPresent(Size.self, forKey: .diameter)
    }
}

struct Engines: Codable {
    let number: Int
    let type: String
    let version: String
    let layout: String?
    let isp: ISP
    let engineLossMax: Int?
    let propellatn1: String
    let propellatn2: String
    let thrustSeaLevel: SeaLevel
    let thrustVacum: SeaLevel
    let thrustToWeight: Double
    
    public enum CodingKeys: String, CodingKey {
        case number
        case type
        case version
        case layout
        case isp
        case engineLossMax = "engine_loss_max"
        case propellatn1 = "propellant_1"
        case propellatn2 = "propellant_2"
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacum = "thrust_vacuum"
        case thrustToWeight = "thrust_to_weight"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        number = try container.decode(Int.self, forKey: .number)
        type = try container.decode(String.self, forKey: .type)
        version = try container.decode(String.self, forKey: .version)
        layout = try container.decodeIfPresent(String.self, forKey: .layout)
        isp = try container.decode(ISP.self, forKey: .isp)
        engineLossMax = try container.decodeIfPresent(Int.self, forKey: .engineLossMax)
        propellatn1 = try container.decode(String.self, forKey: .propellatn1)
        propellatn2 = try container.decode(String.self, forKey: .propellatn2)
        thrustSeaLevel = try container.decode(SeaLevel.self, forKey: .thrustSeaLevel)
        thrustVacum = try container.decode(SeaLevel.self, forKey: .thrustVacum)
        thrustToWeight = try container.decode(Double.self, forKey: .thrustToWeight)
    }
}

struct LandingLegs: Codable {
    let number: Int
    let material: String
    
    public enum CodingKeys: String, CodingKey {
        case number
        case material
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        number = try container.decode(Int.self, forKey: .number)
        material = try container.decodeIfPresent(String.self, forKey: .material) ?? "No information"
    }
}

struct ISP: Codable {
    let seaLevel: Int
    let vacuum: Int
    
    public enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        seaLevel = try container.decode(Int.self, forKey: .seaLevel)
        vacuum = try container.decode(Int.self, forKey: .vacuum)
    }
}
