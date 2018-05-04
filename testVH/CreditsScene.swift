//
//  CreditsScene.swift
//  testVH
//
//  Created by Student on 3/23/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import UIKit

class CreditsScene: SKScene {
    
    private var sceneNext: SKScene?
    private var NewGameScene: SKScene?
    var creditNode: SKLabelNode?
    var dev1Node: SKLabelNode?
    var dev2Node: SKLabelNode?
    var dev3Node: SKLabelNode?
    var clockTimer = Timer()
    
    
    
    
    override func didMove(to view: SKView) {
        //let textNodeNew = SKLabelNode(fontNamed: "Chalkduster")
        //textNodeNew.text = "Credits Scene!"
        //textNodeNew.fontSize = 65
        //textNodeNew.fontColor = SKColor.green
        //textNodeNew.position = CGPoint(x: frame.midX, y: frame.midY + 200)
        
        //addChild(textNodeNew)
        
        creditNode = SKLabelNode(fontNamed: "Papyrus")
        creditNode?.name = "creditNode"
        creditNode?.text = "Credit:"
        creditNode?.fontSize = 80
        creditNode?.fontColor = SKColor.black
        creditNode?.position = CGPoint(x: frame.midX, y: frame.midY + 300)
        addChild(creditNode!)
        
        // let menuNode = SKLabelNode(fontNamed: "Papyrus")
        //menuNode.name = "menuNode"
        //menuNode.text = "Return to Menu"
        //menuNode.fontSize = 80
        //menuNode.fontColor = SKColor.black
        //menuNode.position = CGPoint(x: frame.midX, y: frame.midY - 150)
        //addChild(menuNode)
        
        
        dev1Node = SKLabelNode(fontNamed: "Papyrus")
        dev1Node?.name = "dev1Node"
        dev1Node?.text = "Jason Yan - Developer"
        dev1Node?.fontSize = 65
        dev1Node?.fontColor = SKColor.black
        dev1Node?.position = CGPoint(x: frame.midX, y: frame.midY + 100)
        addChild(dev1Node!)
        
        dev2Node = SKLabelNode(fontNamed: "Papyrus")
        dev2Node?.name = "dev2Node"
        dev2Node?.text = "Zhehao Lin - Developer"
        dev2Node?.fontSize = 65
        dev2Node?.fontColor = SKColor.black
        dev2Node?.position = CGPoint(x: frame.midX, y: frame.midY - 50)
        addChild(dev2Node!)
        
        dev3Node = SKLabelNode(fontNamed: "Papyrus")
        dev3Node?.name = "dev3Node"
        dev3Node?.text = "Victor Hom - Devloper"
        dev3Node?.fontSize = 65
        dev3Node?.fontColor = SKColor.black
        dev3Node?.position = CGPoint(x: frame.midX, y: frame.midY - 200)
        addChild(dev3Node!)
        
        change()
    
        
        
    }
    func change(){
        
        let fadeAway = SKAction.fadeOut(withDuration: 2.0)
        let fadeIn = SKAction.fadeIn(withDuration: 2.0)
        let sequence = SKAction.sequence([fadeAway,fadeIn])
        clockTimer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block: {
            timer in
            self.creditNode?.run(sequence)
            self.dev1Node?.run(sequence)
            self.dev2Node?.run(sequence)
            self.dev3Node?.run(sequence)
        })
    }
    
    //override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
       // let touch:UITouch = touches.first! as UITouch
        //let positionInScene = touch.location(in: self)
        //let touchedNode = self.atPoint(positionInScene)
        //print("clicked")
        //if let name = touchedNode.name,
          //  name == "menuNode"{
           // print("menuNode clicked")
            //sceneNext = SKScene(fileNamed: "GameScene")
        //}else{
          //  return
            
        //}
        
       // let transition = SKTransition.reveal(
         //   with: .down, duration: 1.0)
        //clockTimer.invalidate()
        //clockTimer = Timer()
        //let nextScene = sceneNext
        //nextScene?.scaleMode = .aspectFill
        
        //scene?.view?.presentScene(sceneNext!, transition: transition)
        //print("transitionToMenu from Credits")
        
    //}
}
