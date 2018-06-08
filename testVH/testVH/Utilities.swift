//
//  Utilites.swift
//  testVH
//
//  Created by Student on 5/25/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
class Utilities{
    
    static func roundToDecimalPoint(num:Double, decimalPoints:Double)->Double{
       // print("Rounding stuff  \(round(num*pow(10.0, decimalPoints))/pow(10.0, decimalPoints)) \(num)  \(pow(10.0, decimalPoints)) ")
        return round(num*pow(10.0, decimalPoints))/pow(10.0, decimalPoints)
    }
    
    static func getTime(time:Int) -> (String, String, String){
        let day = "Day:\(time%30 + 1)"
        let month = "Month:\(time/30%12 + 1)"
        let year = "Year:\(time/360 + 1)"
        return (day, month, year)
    }
}
