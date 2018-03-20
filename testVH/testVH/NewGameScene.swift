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
    
    private var sceneNext: SKScene?
    private var BackGameButton: SKLabelNode?
    private var otherGameScene: SKScene?
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        otherGameScene = SKScene(fileNamed: "GameScene")
        let testNode = SKSpriteNode(imageNamed: "onedollar")
        
        self.addChild(testNode)
        testNode.name = "testNode"
        let textNode = SKLabelNode(fontNamed: "Chalkduster")
        textNode.text = "New Game Scene!"
        textNode.fontSize = 65
        textNode.fontColor = SKColor.green
        textNode.position = CGPoint(x: frame.midX - 100, y: frame.midY - 100)
        
        addChild(textNode)
        //self.newGameButton = self.childNode(withName: "//newGameButton") as? SKLabelNode
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        print("clicked")
        if let name = touchedNode.name,
            name == "testNode"{
            print("testNode clicked")
            sceneNext = otherGameScene
        }else{
            return
            
        }

        let transition = SKTransition.reveal(
            with: .down, duration: 1.0)
        
        let nextScene = sceneNext
        nextScene?.scaleMode = .aspectFill
        
        scene?.view?.presentScene(sceneNext!, transition: transition)
        print("transitionToOriginal")
        
    }
}
