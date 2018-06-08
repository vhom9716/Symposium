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
    var dividens:Double
    var name:String
    var volitability:Double //Likelihood that a trend will remain active
    var currentTrend:Trend
    var state = 0.5
    
    var price : Double
    {
        get{
            return value
        }
        set(newvalue){
            if newvalue > value {
                color = UIColor.green
            }else{
                color = UIColor.red
            }
            
            value = newvalue
        }
    }
    
    init(price:Double, dividens:Double, name:String, volitability:Double, startCycle:Int){
        self.value = price
        self.dividens = dividens
        self.name = name
        self.color = UIColor.green
        self.volitability = volitability
        currentTrend = Trend(isRis: false, rate: 0, accelRate: 0, stability: 0, decreaseLimit: 0, startCycle: startCycle)
    }
    
    func generateNewTrend(startCycle:Int){
        let rand = drand48()
        let oldTrend = currentTrend
        
        if(oldTrend.isRising){
            state += 0.1
        }else{
            state -= 0.1
        }
        var multiplier = 0.0
        let detIsRis = (rand > state)
        if(detIsRis){
            multiplier = 1.0
        }else{
            multiplier = -1.0
        }
        
        currentTrend = Trend(isRis: detIsRis, rate: multiplier*(oldTrend.rate+drand48()), accelRate: multiplier*(oldTrend.rate+drand48())/10, stability: oldTrend.stability*0.5 + 0.5, decreaseLimit: Int(12 - round(volitability*10))/2, startCycle: startCycle)
        print("A new trend has been created \(currentTrend.toString()) and the stock \(name) has state \(state)")
    }
    
    func setPrice(price:Double){
        self.price = price
    }
    
    func setDividens(dividens:Double){
        self.dividens = dividens
    }
}

