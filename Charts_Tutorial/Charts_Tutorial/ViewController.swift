//
//  ViewController.swift
//  Charts_Tutorial
//
//  Created by Zhenyu Xu on 7/22/21.
//

import UIKit
import Charts
class ViewController: UIViewController {

    @IBOutlet weak var PieChart: PieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let data = [6,3,5,5,4,8,7,7,1]
        graphPieChart(dataArray: data)
    }
    
    func graphPieChart(dataArray: [Int]){
        PieChart.frame = CGRect(x:0, y:0,
                                width: self.view.frame.size.width,
                                height: self.view.frame.size.width)
        PieChart.center.x = self.view.center.x
        PieChart.center.y = self.view.center.y
        
        PieChart.noDataText = "No Data Avaliable"
        PieChart.noDataTextColor = UIColor.red
        
        var entries = [ChartDataEntry]()
        
        for i in 0..<dataArray.count{
            let value = ChartDataEntry(x: Double(i), y: Double(dataArray[i]))
            entries.append(value)
        }
        
        let dataSet = PieChartDataSet(entries: entries, label: "Pie Chart")
        
        dataSet.colors = ChartColorTemplates.joyful()
        
        let data = PieChartData(dataSet: dataSet)
        PieChart.data = data
        
        PieChart.chartDescription?.text = "My QQ"
        
        PieChart.animate(xAxisDuration: 1.5, yAxisDuration: 1.5, easingOption: .easeInSine)

}

}
