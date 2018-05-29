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

    private var sceneNext: SKScene?
    private var NewGameScene: SKScene?
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.lightGray
        NewGameScene = SKScene(fileNamed: "NewGameScene")
//        let testingNode = SKSpriteNode(imageNamed: "onedollar")
//        testingNode.position = CGPoint(x: 300, y: 300)
//        self.addChild(testingNode)
//        testingNode.name = "testingNode"
        self.backgroundColor = SKColor.lightGray
        
        let newGameNode = SKLabelNode(fontNamed: "Papyrus")
        newGameNode.name = "newGameNode"
        newGameNode.text = "New Game"
        newGameNode.fontSize = 80
        newGameNode.fontColor = UIColor(red:0.27, green:0.52, blue:0.00, alpha:1.0)
        newGameNode.position = CGPoint(x: frame.midX, y: frame.midY + 300)
        addChild(newGameNode)
        
        let loadGameNode = SKLabelNode(fontNamed: "Papyrus")
        loadGameNode.name = "loadGameNode"
        loadGameNode.text = "Load Game"
        loadGameNode.fontSize = 80
        loadGameNode.fontColor = UIColor(red:0.27, green:0.52, blue:0.00, alpha:1.0)
        loadGameNode.position = CGPoint(x: frame.midX, y: frame.midY + 150)
        addChild(loadGameNode)
        
        let optionsNode = SKLabelNode(fontNamed: "Papyrus")
        optionsNode.name = "optionsNode"
        optionsNode.text = "Options"
        optionsNode.fontSize = 80
        optionsNode.fontColor = UIColor(red:0.27, green:0.52, blue:0.00, alpha:1.0)
        optionsNode.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(optionsNode)
        
        let creditsNode = SKLabelNode(fontNamed: "Papyrus")
        creditsNode.name = "creditsNode"
        creditsNode.text = "Credits"
        creditsNode.fontSize = 80
        creditsNode.fontColor = UIColor(red:0.27, green:0.52, blue:0.00, alpha:1.0)
        creditsNode.position = CGPoint(x: frame.midX, y: frame.midY - 150)
        addChild(creditsNode)
        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event:UIEvent?){
        guard let touch = touches.first else{
            return
        }
        let touchLocation = touch.location(in: self)

        let money = SKSpriteNode(imageNamed: "onedollar")
        money.position = touchLocation

        addChild(money)

        money.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                             SKAction.fadeOut(withDuration: 0.5),
                                             SKAction.removeFromParent()]))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        print("clicked")
        let name = touchedNode.name
        
        switch name {
            case "newGameNode"?:
                sceneNext = SKScene(fileNamed: "NewGameScene")
                print("newGameNode clicked")
            
            case "optionsNode"?:
                sceneNext = SKScene(fileNamed: "OptionsScene")
                print("optionsNode clicked")
            
            case "loadGameNode"?:
                print("loadGameNode clicked")
                sceneNext = SKScene(fileNamed: "NewGameScene")
        
            case "creditsNode"?:
                sceneNext = SKScene(fileNamed: "CreditsScene")
                print("creditsNode clicked")
            
            default:
                return
        }

        let transition = SKTransition.reveal(
            with: .down, duration: 1.0)

        let nextScene = sceneNext
        nextScene?.scaleMode = .aspectFill

        scene?.view?.presentScene(sceneNext!, transition: transition)
        print("transition")

    }
}
