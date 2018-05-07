//
//  Profile.swift
//  testVH
//
//  Created by Student on 5/1/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

class Profile{
    
    var name = ""
    var money = 0.0
    var dividens = 0.0
    var stockNums: [Double] = [0.0, 0.0, 0.0, 0.0, 0.0]
    
    init(name:String){
        self.name = name
    }
    
    func updateDividens(stocks:[Stock]) -> Double{
        dividens = 0
        for index in 0...4{
            dividens += stockNums[index] * stocks[index].dividens
            print("\(stocks[index].name)   \(stockNums[index])  \(stocks[index].dividens)" )
        }
        return dividens
    }
}

