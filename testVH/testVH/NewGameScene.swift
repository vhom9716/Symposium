//
//  NewGameScene.swift
//  testVH
//
//  Created by Student on 3/16/18.
//  Copyright © 2018 Student. All rights reserved.
//

import SpriteKit
import GameplayKit


class NewGameScene: SKScene {
    
    var sceneNext: SKScene?
    var BackGameButton: SKLabelNode?
    var otherGameScene: SKScene?
    var moneyNode: SKLabelNode?
    var timerNode: SKLabelNode?
    var clockTimer = Timer()
    var money = 0.0
    var dividens = 0.0
    var timeVal = 0
    var stockChangeVal = 0
    var stocks: [Stock] = []
    var stockLabels: [SKLabelNode] = []
    var sPrices: [Double] = [10.4, 30.1, 40.5, 37.3, 93.5]
    var sDividens: [Double] = [0.2, 0.4, 0.5, 0.2, 0.3]
    var sNames: [String] = ["Goggle", "IBN", "Blah", "Blah2", "Blah3"]
    var userProf = Profile(name:"Bob")
    var ownedStocks: SKLabelNode?
    
    override func didMove(to view: SKView) {
        let textNodeNew = SKLabelNode(fontNamed: "Papyrus")
        textNodeNew.name = "ab"
        textNodeNew.text = "Click For Money!"
        textNodeNew.fontSize = 50
        textNodeNew.fontColor = SKColor.green
        textNodeNew.position = CGPoint(x: frame.midX, y: frame.midY + 250)
        addChild(textNodeNew)
        
        ownedStocks = SKLabelNode(fontNamed: "Papyrus")
        ownedStocks?.name = "stocksOwned"
        ownedStocks?.text = "Stocks: "
        ownedStocks?.fontSize = 33
        ownedStocks?.fontColor = SKColor.green
        ownedStocks?.position = CGPoint(x: frame.midX - 100, y: frame.midY + 200)
        addChild(ownedStocks!)
        
        for index in 0...sPrices.count - 1 {
            let a = Stock(price: sPrices[index], dividens: sDividens[index], name: sNames[index])
            stocks.append(a)
            let b = SKLabelNode(fontNamed: "Papyrus")
            b.name = "\(stocks[index].name)"
            b.text = "\(stocks[index].name)  Price:\(stocks[index].price)  Dividens:\(stocks[index].dividens)"
            b.fontSize = 35
            b.fontColor = SKColor.green
            b.position = CGPoint(x: frame.midX, y: frame.midY - CGFloat(80*index))
            addChild(b)
            stockLabels.append(b)
        }
        
        
        
        let menuNode = SKLabelNode(fontNamed: "Papyrus")
        menuNode.name = "menuNode"
        menuNode.text = "Return to Menu"
        menuNode.fontSize = 80
        menuNode.fontColor = SKColor.black
        menuNode.position = CGPoint(x: frame.midX, y: frame.midY - 400)
        addChild(menuNode)
        
        moneyNode = SKLabelNode(fontNamed: "Papyrus")
        moneyNode?.fontSize = 40
        moneyNode?.text = "Money: \(userProf.money)"
        moneyNode?.position = CGPoint(x : frame.midX, y: frame.midY + 300)
        addChild((moneyNode)!)
        
        
        /*
         template for buttons
         let  = SKLabelNode(fontNamed: "Chalkduster")
         .name = "ab"
         .text = "Click For Money!"
         .fontSize = 65
         .fontColor = SKColor.green
         .position = CGPoint(x: frame.midX, y: frame.midY + 200)
         addChild()
         */
        
        timerNode = SKLabelNode(fontNamed: "Papyrus")
        timerNode?.name = "timerNode"
        timerNode?.fontSize = 40
        timerNode?.text = "\(timeVal)/2 per month  \(stockChangeVal)/5 months"
        timerNode?.position = CGPoint(x : frame.midX + 100, y: frame.midY + 500)
        addChild((timerNode)!)
        
        clockTimer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block:{
            timer in
            self.timeVal += 1
            self.timerNode?.text = "\(self.timeVal)/2 per month  \(self.stockChangeVal)/5 months"
            if(self.timeVal == 2){
                self.timeVal = 0
                self.userProf.money += self.userProf.updateDividens(stocks: self.stocks)
                self.moneyNode?.text = "Money:\(round(self.userProf.money*100)/100)  Dividens: \(round(self.userProf.dividens*100)/100)"
                self.stockChangeVal += 1
                //print("money updated \(self.stockChangeVal)")
            }
            if(self.stockChangeVal == 5){
                self.stockChangeVal = 0
                self.updateStocks()
                //print("stockUpdating")
            }
        })
        
    }
    
    func updateStocks(){
        for index in 0...stocks.count-1{
            var priceChange = round(drand48()*1000)/100
            var divChange = round(drand48()*100)/1000
            if(drand48() > 0.5){
                stocks[index].price =  round((stocks[index].price + priceChange)*100)/100
                stocks[index].dividens = round((stocks[index].dividens + divChange)*100)/100
                //print("\(stocks[index].name) stock rose by \(priceChange) in price and \(divChange) in dividens")
            }else{
                if(stocks[index].price <= 0){
                    priceChange = 0.0
                }else{
                    while(priceChange > stocks[index].price){
                        priceChange = round(drand48()*1000)/100
                    }
                }
                stocks[index].price = round((stocks[index].price - priceChange)*100)/100
                if(stocks[index].dividens <= 0){
                    divChange = 0.0
                }else{
                    while(divChange > stocks[index].dividens){
                        divChange = round(drand48()*100)/1000
                    }
                }
                stocks[index].dividens = round((stocks[index].dividens - divChange)*100)/100
                //print("\(stocks[index].name) stock fell by \(priceChange) in price and \(divChange) in dividens")
            }
            
        }
        //print("jcs")
        updateStockLabels()
    }
    
    func updateStockLabels(){
        for index in 0...stockLabels.count - 1{
            stockLabels[index].text = "\(stocks[index].name)  Price:\(round(stocks[index].price*100)/100)  Dividens:\(round(stocks[index].dividens*100)/100) :\(round(stocks[index].dividens*stocks[index].price*100)/100)"
        }
    }
    
    func updateStocksOwned(){
        var s:String = "Stocks: "
        for index in 0...stocks.count - 1{
            s += "\(stocks[index].name):\(userProf.stockNums[index]) "
        }
        ownedStocks?.text = s
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        //print("clicked")
        
        let name = touchedNode.name
        
        switch name{
            
        case "menuNode"?:
            //print("menuNode clicked")
            sceneNext = SKScene(fileNamed: "GameScene")
            
        case "ab"?:
            //print("getCash")
            userProf.money += 1788
            moneyNode?.text = "Money: \(userProf.money)" + "  Dividens: \(userProf.dividens)"
            
        case "Goggle"?:
            if(userProf.money >= stocks[0].price){
                userProf.money -= stocks[0].price
                userProf.stockNums[0]+=1.0
            }
            
            
            
        case "IBN"?:
            if(userProf.money >= stocks[1].price){
                userProf.money -= stocks[1].price
                userProf.stockNums[1]+=1.0
            }
            
        case "Blah"?:
            if(userProf.money >= stocks[2].price){
                userProf.money -= stocks[2].price
                userProf.stockNums[2]+=1.0
            }
            
            
        case "Blah2"?:
            if(userProf.money >= stocks[3].price){
                userProf.money -= stocks[3].price
                userProf.stockNums[3]+=1.0
            }
            
            
        case "Blah3"?:
            if(userProf.money >= stocks[4].price){
                userProf.money -= stocks[4].price
                userProf.stockNums[4]+=1.0
                
            }
            
            
        default:
            return
            
        }
        moneyNode?.text = "Money: \(round(userProf.money*100)/100)" + "  Dividens: \(round(userProf.dividens*100)/100)"
        updateStocksOwned()
        let transition = SKTransition.reveal(
            with: .down, duration: 1.0)
        
        guard let nextScene = sceneNext else{
            return
        }
        clockTimer.invalidate()
        clockTimer = Timer()
        nextScene.scaleMode = .aspectFill
        
        scene?.view?.presentScene(sceneNext!, transition: transition)
        //print("transitionToMenu from newGameScene")
        
    }
}

