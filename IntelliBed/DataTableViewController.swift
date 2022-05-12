//
//  AnotherBarChartViewController.swift
//  ChartsDemo-iOS
//
//  Created by Jacob Christie on 2017-07-09.
//  Copyright © 2017 jc. All rights reserved.
//

import UIKit
import Charts
import Firebase
import FirebaseDatabase

class DataTableViewController: UITableViewController {
    
    var ref: DatabaseReference!
    var windows: [Window] = []
    
    let dateTimeFormat: String = "MM-dd-yyyy HH:mm"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        ref.child("data").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return;
            }
            guard let dictionary = snapshot.value as? [String: Any] else {return}
            var window: Window = Window(dataPoints: [])
            for timestamp in dictionary.keys{
                let usableDate = Date(timeIntervalSince1970: TimeInterval(timestamp.replacingOccurrences(of: "-", with: ".")) ?? 0)
                
                guard let windowData = dictionary[timestamp] as? [String: Any] else {
                    print("ERROR: Issue getting window data")
                    return
                }
                
                guard let windowData1 = windowData["data"] as? [String: Any] else {
                    print("ERROR: Issue getting nested window data")
                    return
                }
                
                guard let sensorData = windowData1["sensor"] as? [Double] else {
                    print("ERROR: Issue getting sensor data")
                    return
                }
                
//                let sensorData = windowData1["sensor"] as! [Int: Double]
                
                let sensorValues: [Double] = [
                    sensorData[0],
                    sensorData[1],
                    sensorData[2],
                    sensorData[3],
                ]
                let dataPoint: DataPoint = DataPoint(timestamp: usableDate, classLabel: windowData["class"] as? String ?? "", xValue: windowData1["X"] as? Double ?? 0, yValue: windowData1["Y"] as? Double ?? 0, sensorValues: sensorValues)
                
                window.addDataPoint(dataPoint: dataPoint)
                if window.numDataPoints() >= 32 {
                    self.windows.append(window)
                    window = Window(dataPoints: [])
                }
            }
            self.windows.append(window)
//            print("windows count: \(self.windows.count). total points: \(dictionary.keys.count)")
            self.tableView.reloadData()
        });
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        let window: Window = windows[indexPath.row]
        
//        window.dataPoints[0]
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return windows.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toViewWindow", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? WindowViewController {
            if let indexPath = tableView.indexPathForSelectedRow{
                print("LOG: SETTING DESTINATION WINDOW")
                destinationVC.window = windows[indexPath.row]
            }else{
                print("ERROR: error getting indexPath when seguing to window view controller screen.")
            }
        }else{
            print("ERROR: destination viewcontroller is nil when trying to segue to window view controller screen.")
        }
    }
}
