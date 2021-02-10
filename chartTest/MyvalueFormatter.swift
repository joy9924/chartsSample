//
//  MyvalueFormatter.swift
//  chartTest
//
//  Created by Joy Massey on 07/02/21.
//

import Foundation
import Charts
class MyValueFormatter: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return String(format:"%.0f",value)+"M"
    }
    
    
}
