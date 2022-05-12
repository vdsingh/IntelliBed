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
    
    var xValues: [Double] = []
    var yValues: [Double] = []
    
    init(dataPoints: [DataPoint]){
        self.dataPoints = dataPoints
    }
    
    func numDataPoints() -> Int{
        return dataPoints.count
    }
    
    func addDataPoint(dataPoint: DataPoint){
        dataPoints.append(dataPoint)
    }
    
    func addValuesOrReturn(){
        if xValues.count > 0 && yValues.count > 0{
            return
        }
        var xValues: [Double] = []
        var yValues: [Double] = []

        for dataPoint in dataPoints {
            xValues.append(dataPoint.xValue)
            yValues.append(dataPoint.yValue)
        }
        
        xValues.sort()
        yValues.sort()
    }
    
    func sum() -> [Double]{
        return [xValues.reduce(0, +), yValues.reduce(0, +)]
    }
    
    func mean() -> [Double]{
        addValuesOrReturn()
        let sum = sum()
        return [sum[0] / Double(xValues.count), sum[1] / Double(yValues.count)]
    }
    
    func mean(array: [Double]) -> Double{
        let sum = array.reduce(0, +)
        return sum / Double(xValues.count)
    }
    
    func median() -> [Double]{
        addValuesOrReturn()
        return [xValues[xValues.count/2], yValues[yValues.count/2]]
    }
    
    func standardDeviation() -> [Double]{
        addValuesOrReturn()

        let mean = mean()
        
        let x = xValues.reduce(0, { $0 + ($1-mean[0])*($1-mean[0]) })
        let y = yValues.reduce(0, { $0 + ($1-mean[1])*($1-mean[1]) })

//        return sqrt(v / (Element(self.count) - 1))
        
        return [sqrt(x / Double((xValues.count - 1))), sqrt(y / Double((yValues.count - 1)))]
    }
    
    func squaredDeviations() -> [[Double]] {
        let average = mean()
        return [xValues.map { pow(Double($0) - average[0], 2) }, yValues.map { pow(Double($0) - average[1], 2) }]
    }
    
    func variance() -> [Double]{
        return [mean(array: squaredDeviations()[0]), mean(array: squaredDeviations()[1])]
    }
    
    func slope() -> [Double]{
        return [0]
    }
    
    func rootMeanSquared() -> [Double]{
        return [0]
    }
}
