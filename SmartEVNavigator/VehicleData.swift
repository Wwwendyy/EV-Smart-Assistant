//
//  VehicleData.swift
//  SmartEVNavigator
//
// 
//

import Foundation

struct VehicleData: Codable {
    var temperature: Double
    var windSpeed: Double
    var passengers: Int
    var cargoWeight: Double
    var isUphill: Bool
    var batteryHealth: Double
    var usesAC: Bool
}
