//
//  Trend.swift
//  testVH
//
//  Created by Student on 5/16/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

class Trend{
    
    var isRising:Bool
    var rate:Double
    var accelRate:Double
    var stability:Double
    var consecutiveLimit:Int
    var consecutiveCount:Int
    var remainsActive:Bool
    var startCycle:Int
    
    init(isRis:Bool, rate:Double, accelRate:Double, stability:Double, decreaseLimit:Int, startCycle:Int){
        self.isRising = isRis
        self.rate = rate
        self.accelRate = accelRate
        self.stability = stability
        self.consecutiveLimit = decreaseLimit
        self.startCycle = startCycle
        remainsActive = true
        consecutiveCount = 0
    }
    /*This function has two purposes.
     1. To determine if a new trend will need to be created, if the stability check is passed consecutively a certain number of times as dictated in the trend's creation based on the relevent stock's volitability.
     2. To supply a variable, valDiff, that will determine
        -The stability wil always be decaying, making it easier for the check to be passed.
        -If rand is greater, then the check has been passed and the counter increases, but in this case, valDiff will be negative, and effect the trend consequently
    */
    
    func checkStabilityChange() -> Double{
        let rand = drand48()
        let valDiff = Utilities.roundToDecimalPoint(num: stability - rand, decimalPoints: 2.0);
        if(rand < stability){
            consecutiveCount = 0
        }else{
            
            if(consecutiveCount >= consecutiveLimit){
                remainsActive = false
            }
        }
        stability = Utilities.roundToDecimalPoint(num: stability - rand/10, decimalPoints: 2.0)
        return valDiff
    }
    
    func changeRate(){
        rate += accelRate
        if(rate < 0){
            isRising = false
        }else{
            isRising = true
        }
    }
    
    func modifyStock(s:Stock, modifier:Double){
        let oldDiv = s.dividens
        let oldPri = s.price
        
        s.dividens = Utilities.roundToDecimalPoint(num: (s.dividens + (rate/10) + drand48()) + modifier, decimalPoints: 2)
        if(s.dividens<0){
            s.dividens = 0
        }
        
        s.price += Utilities.roundToDecimalPoint(num: (s.price * (1 + rate)) * drand48() + modifier, decimalPoints: 2)
        if(s.price<0){
            s.price = 0
        }
        
        print("Stock Update:\(s.name) has been modified, from Price:\(oldPri) Dividens:\(oldDiv) to the new Price: \(s.price) and new Dividens:\(s.dividens) Price changing by \(s.price-oldPri) and Dividens changing by \(s.dividens-oldDiv)")
    }
    
    func toString() -> String{
        var state = ""
        if(isRising){
            state = "Rising"
        }else{
            state = "Falling"
        }
        return "Trend that is \(state) with Rate:\(rate) AccelRate\(accelRate) ConsecutiveCount:\(consecutiveCount)/\(consecutiveLimit) that was created on the  \(Utilities.getTime(time: startCycle)) with Stability: \(stability)"
    }
}
