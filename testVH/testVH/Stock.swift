//
//  Stock.swift
//  testVH
//
//  Created by Student on 4/25/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

public class Stock{
    var price = 0.0
    var dividens = 0.0
    var name = ""
    
    init(price:Double, dividens:Double, name:String){
        self.price = price
        self.dividens = dividens
        self.name = name
    }
    
    func setPrice(price:Double){
        self.price = price
    }
    
    func setDividens(dividens:Double){
        self.dividens = dividens
    }
}

