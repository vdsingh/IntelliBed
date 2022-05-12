//
//  Window.swift
//  IntelliBed
//
//  Created by Vikram Singh on 5/12/22.
//

import Foundation
class Window{

//FEATURES:
//    Mean
//    Median
//    Std
//    Var
//    Slope
//    Rms (root mean squared)

    var dataPoints: [DataPoint]
    
    init(dataPoints: [DataPoint]){
        self.dataPoints = dataPoints
    }
    
    func numDataPoints() -> Int{
        return dataPoints.count
    }
    
    func addDataPoint(dataPoint: DataPoint){
        dataPoints.append(dataPoint)
    }
    
    func mean() -> [Double]{
        return [0]
    }
    
    func median() -> [Double]{
        return [0]
    }
    
    func standardDeviation() -> [Double]{
        return [0]
    }
    
    func variance() -> [Double]{
        return [0]
    }
    
    func slope() -> [Double]{
        return [0]
    }
    
    func rootMeanSquared() -> [Double]{
        return [0]
    }
}
