//
//  ViewController.swift
//  chartTest
//
//  Created by Joy Massey on 06/02/21.
//

import UIKit
import Charts
import TinyConstraints
class ViewController: UIViewController{
   
    
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var chartStackVIew: UIStackView!
    @IBOutlet weak var upperStackView: UIStackView!
    @IBAction func mapKitButton(_ sender: UIButton) {
        performSegue(withIdentifier: "mapSegue", sender: sender)
    }
    var reaminingTime = PieChartDataEntry(value: 10)
    var totalFlyingTime = PieChartDataEntry(value: 90)
    var pieChartDataArray = [PieChartDataEntry]()
    
    lazy var barChartView:BarChartView = {
       let chartView = BarChartView()
        chartView.backgroundColor = .white
        chartView.rightAxis.enabled = false
        let yAxix = chartView.leftAxis
        yAxix.setLabelCount(6, force: true)
        yAxix.labelTextColor = .black
        yAxix.valueFormatter = MyValueFormatter()
        yAxix.drawAxisLineEnabled = true
        yAxix.drawGridLinesEnabled = true
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.drawBordersEnabled = false
     
        return chartView
    }()
   
   
    override func viewDidLoad() {
        let labels = ["Value 1", "Value 2", "Value 3","Value 3","Value 3","Value 3","Value 3"]
        super.viewDidLoad()
    
        chartStackVIew.addArrangedSubview(barChartView)
        view.addSubview(chartStackVIew)
        //barChartView.center(in: view)
        barChartView.width(to: view)
        barChartView.heightToWidth(of: view)
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: labels)
        barChartView.tintColor = UIColor.orange
        barChartView.xAxis.granularity = 1
    
        setData()
        //pieChartview

        pieChartView.chartDescription?.text = ""
        pieChartDataArray = [reaminingTime,totalFlyingTime]
        
    updatePieChartData()
        
    }
    
func setData()
{
  let  set1 = BarChartDataSet(entries: yValues, label: "Drones")
    set1.colors = [UIColor.yellow]
   
    
    let data1 = BarChartData(dataSet: set1)
    data1.setDrawValues(false)
    data1.barWidth = 0.5
    barChartView.data = data1
}
    let yValues:[BarChartDataEntry] = [
        BarChartDataEntry(x: 0.0, y: 2.0),
        BarChartDataEntry(x: 1.0, y: 3.0),
        BarChartDataEntry(x: 2.0, y: 2.0),
        BarChartDataEntry(x: 3.0, y: 3.0),
        BarChartDataEntry(x: 4.0, y: 4.0),
        BarChartDataEntry(x: 5.0, y: 5.0),
        BarChartDataEntry(x: 6.0, y: 6.0)
    ]
    
    func updatePieChartData()  {
        let dataSet = PieChartDataSet(entries: pieChartDataArray, label:nil)
     //   dataSet.label = "Total Flying Time"
        dataSet.drawValuesEnabled = false
        let chartData = PieChartData(dataSet: dataSet)
        let color = [UIColor.black,UIColor.yellow]
        dataSet.colors = color
        let legend = pieChartView.legend
        let legendEntry1 = LegendEntry(label:"Total Flying Time\(" (170M)")" , form: .default, formSize:1, formLineWidth: 1, formLineDashPhase: .nan, formLineDashLengths: .none, formColor: UIColor.yellow)  //set formSize, formLizeWidth, and formLineDashLengths to .nan to use default
        let legendEntry2 = LegendEntry(label: "Remaining Time", form: .default, formSize: 0.2, formLineWidth: .nan, formLineDashPhase: .nan, formLineDashLengths: .none, formColor: UIColor.black)
      
        legend.setCustom(entries: [legendEntry1,legendEntry2])
        pieChartView.centerAttributedText = NSAttributedString(string:"  300 \nMinutes")
        pieChartView.data = chartData
        pieChartView.holeRadiusPercent = 0.9
    }
    
   
}

