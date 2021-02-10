//
//  MyValurFormatter.swift
//  chartTest
//
//  Created by Joy Massey on 07/02/21.
//

import Foundation
import Charts
class MyValueFormatter : DefaultValueFormatter{
  
    override fun getPointLabel(entry: Entry?): String {
        return format.format(entry?.y)
    }
    // override this for BarChart
    override fun getBarLabel(barEntry: BarEntry?): String {
        return format.format(barEntry?.y)
    }
    // override this for custom formatting of XAxis or YAxis labels
    override fun getAxisLabel(value: Float, axis: AxisBase?): String {
        return format.format(value)
    }
    // ... override other methods for the other chart types
}
