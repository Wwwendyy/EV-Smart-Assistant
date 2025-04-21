//
//  EVInput.swift
//  SmartEVNavigator
//
//  Created by 刘唯琛 on 2025/4/17.
//

import Foundation

struct EVInput {
    var temperature: Double         // 摄氏度
    var windSpeed: Double           // km/h
    var passengers: Int
    var cargoWeight: Double         // kg
    var isUphill: Bool
    var batteryHealth: Double       // 百分比
    var usesAC: Bool
}
