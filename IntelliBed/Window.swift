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
    
    static var classConverterDict: [String: String] = ["0": "Stationary", "1": "Rollover", "2": "Situp", "3": "Slight Adjust"]

    var dataPoints: [DataPoint]
    
    var xValues: [Double] = []
    var yValues: [Double] = []
    
    var classLabel: String = ""
    
    init(dataPoints: [DataPoint], classLabel: String){
        self.dataPoints = dataPoints
        self.classLabel = classLabel
    }
    
    func numDataPoints() -> Int{
        return dataPoints.count
    }
    
    func addDataPoint(dataPoint: DataPoint){
        dataPoints.append(dataPoint)
    }
    
    func addValuesOrReturn(){
        if xValues.count > 0 && yValues.count > 0{
            print("LOG: values count is greater than 0")
            return
        }
        var xValues: [Double] = []
        var yValues: [Double] = []

        for dataPoint in dataPoints {
            print("LOG: appending data point values. \(dataPoint.xValue), \(dataPoint.yValue)")
            xValues.append(dataPoint.xValue)
            yValues.append(dataPoint.yValue)
        }
        
        xValues.sort()
        yValues.sort()
        
        self.xValues = xValues
        self.yValues = yValues
    }
    
    func sum() -> [Double]{
        addValuesOrReturn()
        print("SUMMING")
        var sums: [Double] = [0,0]
        for dataPoint in dataPoints {
            sums[0] += (dataPoint.xValue)
            sums[1] += (dataPoint.yValue)
        }
        return sums
    }
    
    func mean() -> [Double]{
        addValuesOrReturn()
        let sum = sum()
        print("xVALSU: \(xValues)")
        
        return [round(sum[0] / Double(xValues.count) * 1000) / 1000.0, round(sum[1] / Double(yValues.count) * 1000) / 1000.0]
    }
    
    func mean(array: [Double]) -> Double{
        let sum = array.reduce(0, +)
        return sum / Double(xValues.count)
    }
    
    func median() -> [Double]{
        addValuesOrReturn()
        
        print("Xvalues:\(xValues)")
        return [round(xValues[xValues.count/2] * 1000) / 1000.0, round(yValues[yValues.count/2] * 1000) / 1000.0]
    }
    
    func standardDeviation() -> [Double]{
        addValuesOrReturn()

        let mean = mean()
        
        let x = xValues.reduce(0, { $0 + ($1-mean[0])*($1-mean[0]) })
        let y = yValues.reduce(0, { $0 + ($1-mean[1])*($1-mean[1]) })

//        return sqrt(v / (Element(self.count) - 1))
        
        return [round(sqrt(x / Double((xValues.count - 1))) * 1000) / 1000.0, round(sqrt(y / Double((yValues.count - 1))) * 1000) / 1000.0]
    }
    
    func squaredDeviations() -> [[Double]] {
        let average = mean()
        return [xValues.map { pow(Double($0) - average[0], 2) }, yValues.map { pow(Double($0) - average[1], 2) }]
    }
    
    func variance() -> [Double]{
        return [round(mean(array: squaredDeviations()[0]) * 1000000) / 1000000.0 , round(mean(array: squaredDeviations()[1]) * 1000000) / 1000000.0 ]
    }
    
    func slope() -> [Double]{
        return [0, 0]
    }
    
    func rootMeanSquared() -> [Double]{
        return [0, 0]
    }
}
