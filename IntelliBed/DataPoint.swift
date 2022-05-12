//
//  dataPoint.swift
//  IntelliBed
//
//  Created by Vikram Singh on 5/12/22.
//

import Foundation
class DataPoint{
    let timestamp: Date
    let classLabel: String
    let xValue: Double
    let yValue: Double
    
    let sensorValues: [Double]
    
    init(timestamp: Date, classLabel: String, xValue: Double, yValue: Double, sensorValues: [Double]){
        self.timestamp = timestamp
        self.classLabel = classLabel
        self.xValue = xValue
        self.yValue = yValue
        self.sensorValues = sensorValues
    }
}
