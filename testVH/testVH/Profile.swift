//
//  Profile.swift
//  testVH
//
//  Created by Student on 5/1/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

class Profile{
    
    var name:String
    var money = 10000.00
    var dividens = 0.0
    var assetVal = 0.0
    var stockNums: [Double] = [0.0, 0.0, 0.0, 0.0, 0.0]
    var netWorth = 0.0
    
    init(name:String){
        self.name = name
    }
    
    func updateProfile(stocks:[Stock]){
        dividens = 0.0
        for index in 0...stockNums.count - 1{
            dividens += stockNums[index] * stocks[index].dividens * stocks[index].price
        }
        money += dividens
        calculateNetWorth(stocks:stocks)
        print("Updated Profile: Money: \(money) Dividens: \(dividens)")
    }
    
    func calculateNetWorth(stocks:[Stock]){
        netWorth = 0
        for index in 0...stockNums.count - 1{
            netWorth += stockNums[index] * stocks[index].price
        }
        netWorth += money
        print("Networth:\(netWorth)  Stocks:\(netWorth-money)  Money:\(money)")
    }
}

