//
//  GameScene.swift
//  testVH
//
//  Created by Student on 3/14/18.
//  Copyright © 2018 Student. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //private var label : SKLabelNode?
    //private var spinnyNode : SKShapeNode?
    
    //private var money : SKSpriteNode?
    private var sceneNext: SKScene?
    private var newGameButton: SKLabelNode?
    private var NewGameScene: SKScene?
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        NewGameScene = SKScene(fileNamed: "NewGameScene")
        let testingNode = SKSpriteNode(imageNamed: "onedollar")
        testingNode.position = CGPoint(x: 300, y: 300)
        self.addChild(testingNode)
        testingNode.name = "testingNode"
        
        let textNode = SKLabelNode(fontNamed: "Chalkduster")
        textNode.text = "Menu Scene!"
        textNode.fontSize = 65
        textNode.fontColor = SKColor.green
        textNode.position = CGPoint(x: frame.midX, y: frame.midY - 100)
        
        addChild(textNode)
        //self.newGameButton = self.childNode(withName: "//newGameButton") as? SKLabelNode
        
    }
    
    
//    money.position = CGPoint(
//     money.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                     SKAction.fadeOut(withDuration: 0.5),
//                                     SKAction.removeFromParent()]))
    
   
//    override func touchesEnded(_ touches: Set<UITouch>, with event:UIEvent?){
//        guard let touch = touches.first else{
//            return
//        }
//        let touchLocation = touch.location(in: self)
//
//        let money = SKSpriteNode(imageNamed: "onedollar")
//        money.position = touchLocation
//
//        addChild(money)
//
//        money.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                             SKAction.fadeOut(withDuration: 0.5),
//                                             SKAction.removeFromParent()]))
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        print("clicked")
        if let name = touchedNode.name,
            name == "testingNode"{
                print("testingNode clicked")
                sceneNext = NewGameScene
            }else{
                return
            
        }
        
        
        
//        super.touchesBegan(touches, with : event)
//
//        guard let location = touches.first?.location(in: self),
//            let scene = scene,
//            atPoint(location).name == "newGameButton" else{
//                return
//            }
//        }
//
        let transition = SKTransition.reveal(
            with: .down, duration: 1.0)

        let nextScene = sceneNext
        nextScene?.scaleMode = .aspectFill

        scene?.view?.presentScene(sceneNext!, transition: transition)
        print("transition")

    }
}
