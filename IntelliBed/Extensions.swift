////
////  Extensions.swift
////  IntelliBed
////
////  Created by Vikram Singh on 5/12/22.
////
//
//import Foundation
//
//extension Array where Element: FloatingPoint {
//    
//    func sum() -> Element {
//        return self.reduce(0, +)
//    }
//    
//    func mean() -> Element {
//        return self.sum() / Element(self.count)
//    }
//    
//    func standardDeviation() -> Element {
//        let mean = self.mean()
//        let v = self.reduce(0, { $0 + ($1-mean)*($1-mean) })
//        return sqrt(v / (Element(self.count) - 1))
//    }
//    
//    /// Returns an array of the squared deviations from the mean
//    func squaredDeviations() -> [Double] {
//        let average = self.mean()
//        return self.map { pow(Double($0) - average, 2) }
//    }
//    
//    /// Returns the variance of the Array
//    func variance() -> Double {
//        return self.squaredDeviations().mean()
//    }
//    
//}
