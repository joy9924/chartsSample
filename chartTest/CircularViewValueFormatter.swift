//
//  CircularViewValueFormatter.swift
//  chartTest
//
//  Created by Joy Massey on 07/02/21.
//

import Foundation
import Charts
import UICircularProgressRing
class CircularViewValueFormatter:UICircularRingValueFormatter{
    func string(for value: Any) -> String? {
        var val = value as? String
        
        return String(format:"%.0f",val ?? "300")+" Minutes"
    }
    
    

    
}
