//
//  WindowViewController.swift
//  IntelliBed
//
//  Created by Vikram Singh on 5/12/22.
//

import Foundation
import UIKit
//import Charts
//import SwiftChart

class WindowViewController: UIViewController{
    var window: Window? = nil
    
    var tableViewDataLabels: [String] = []
    var tableViewData: [[Double]] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var xChart: LineChart!
    @IBOutlet weak var yChart: LineChart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if let window = window{
            tableView.dataSource = self
            tableView.delegate = self
            
            tableViewDataLabels.append("Mean")
            tableViewData.append(window.mean())
            
            tableViewDataLabels.append("Standard Deviation")
            tableViewData.append(window.standardDeviation())
            
            tableViewDataLabels.append("Median")
            tableViewData.append(window.mean())
            
            tableViewDataLabels.append("Variance")
            tableViewData.append(window.variance())
            
            tableViewDataLabels.append("Class")
//            tableViewData.append([window.classLabel])

            

            var xValuesFloat:[CGFloat] = []
            var yValuesFloat:[CGFloat] = []
            for xValue in window.xValues{
                xValuesFloat.append(CGFloat(xValue))
            }
            for yValue in window.yValues{
                yValuesFloat.append(CGFloat(yValue))
            }
            xChart.addLine(xValuesFloat)
            yChart.addLine(yValuesFloat)

        }
        
    }
    
}

extension WindowViewController: UITableViewDelegate{
    
}

extension WindowViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDataLabels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        print("ROW: \(indexPath.row)")
        if tableViewDataLabels[indexPath.row] == "Class"{
            cell.textLabel?.text = "\(tableViewDataLabels[indexPath.row]): \(Window.classConverterDict[window?.classLabel ?? ""]!)"
        }else{
            cell.textLabel?.text = "\(tableViewDataLabels[indexPath.row]) : X: \(tableViewData[indexPath.row][0]), Y: \(tableViewData[indexPath.row][1])"
        }
        return cell
    }
}


//extension WindowViewController: ChartViewDelegate{
//    func setData(){
//        if let window = window{
//            var chartEntries: [ChartDataEntry] = []
//            var count = 0
//            for dataPoint in window.dataPoints{
//                chartEntries.append(ChartDataEntry(x: Double(count), y: dataPoint.xValue))
//                count += 1
//            }
//            let set = LineChartDataSet(entries: chartEntries, label: "Entries")
////            let data = LineChartData(dataSet: set)
////            chartView.data = data
//        }
//    }
//
//    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
//        print(entry)
//    }
//}
