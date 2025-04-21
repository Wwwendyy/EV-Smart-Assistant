//
//  RangePredictor.swift
//  SmartEVNavigator
//
//
//

class RangePredictor {
    static func predictRange(input: VehicleData) -> Double {
        let baseRange = 400.0
        return baseRange * 0.95 * (input.batteryHealth / 100.0)
    }
}
