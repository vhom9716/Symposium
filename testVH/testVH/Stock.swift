//
//  Stock.swift
//  testVH
//
//  Created by Student on 4/25/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

public class Stock{
    var color : UIColor
    var value = 0.0
    var percentChange = 0.0
    var priceChange : Double = 0.0
    var price : Double
    {
        get{
            return value
        }
        set(newvalue){
            priceChange = newvalue - value
            percentChange = (newvalue - value)/(value)*100
            if newvalue > value {
                color = UIColor.green
            }else{
                color = UIColor.red
            }
            
            value = newvalue
        }
    }
    
    var dividens = 0.0
    var name = ""
    
    init(price:Double, dividens:Double, name:String){
        self.value = price
        self.dividens = dividens
        self.name = name
        self.color = UIColor.green
    }
    
    func setPrice(price:Double){
        self.price = price
    }
    
    func setDividens(dividens:Double){
        self.dividens = dividens
    }
}

