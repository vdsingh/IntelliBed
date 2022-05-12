//
//  WindowViewController.swift
//  IntelliBed
//
//  Created by Vikram Singh on 5/12/22.
//

import Foundation
import UIKit

class WindowViewController: UIViewController{
    var window: Window? = nil
    
    var tableViewData: [String: [Double]] = [:]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        if let window = window{
            tableViewData["Mean"] = window.mean()
            tableViewData["Median"] = window.mean()
            tableViewData["Standard Deviation"] = window.mean()
            tableViewData["Variance"] = window.mean()
            tableViewData["Slope"] = window.mean()
            tableViewData["Root Mean Squared"] = window.mean()

            setupUI(window: window)
        }
        
    }
    
    private func setupUI(window: Window){
        
    }
}

extension WindowViewController: UITableViewDelegate{
    
}

extension WindowViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
}
