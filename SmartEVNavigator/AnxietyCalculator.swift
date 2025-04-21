//
//  AnxietyCalculator.swift
//  SmartEVNavigator
//
//
//

class AnxietyCalculator {
    static func calculateAnxietyScore(predictedRange: Double, targetDistance: Double) -> Int {
        if predictedRange >= targetDistance {
            return 0
        } else {
            let ratio = predictedRange / targetDistance
            let score = Int((1 - ratio) * 100)
            return min(score, 100)
        }
    }
}
