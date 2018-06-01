import Foundation
import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

class CreditsScene: SKScene {
    
    private var sceneNext: SKScene?
    private var NewGameScene: SKScene?
    var creditNode: SKLabelNode?
    var dev1Node: SKLabelNode?
    var dev2Node: SKLabelNode?
    var dev3Node: SKLabelNode?
    var clockTimer = Timer()
    var player: AVAudioPlayer?
    
    
    
    
    
    
    override func didMove(to view: SKView) {
        //let textNodeNew = SKLabelNode(fontNamed: "Chalkduster")
        //textNodeNew.text = "Credits Scene!"
        //textNodeNew.fontSize = 65
        //textNodeNew.fontColor = SKColor.green
        //textNodeNew.position = CGPoint(x: frame.midX, y: frame.midY + 200)
        
        //addChild(textNodeNew)
        self.backgroundColor = SKColor.lightGray
        

        
        
        
        creditNode = SKLabelNode(fontNamed: "MontereyFLF-Bold")
        creditNode?.name = "creditNode"
        creditNode?.text = "Credit:"
        creditNode?.fontSize = 80
        creditNode?.fontColor = UIColor(red:0.27, green:0.52, blue:0.00, alpha:1.0)
        creditNode?.position = CGPoint(x: frame.midX, y: frame.midY + 300)
        addChild(creditNode!)
        
        let menuNode = SKLabelNode(fontNamed: "MontereyFLF-Bold")
        menuNode.name = "menuNode"
        menuNode.text = "Return to Menu"
        menuNode.fontSize = 30
        menuNode.fontColor = UIColor(red:0.27, green:0.52, blue:0.00, alpha:1.0)
        menuNode.position = CGPoint(x: frame.midX-200, y: frame.midY + 500)
        addChild(menuNode)
        
        
        dev1Node = SKLabelNode(fontNamed: "MontereyFLF-Bold")
        dev1Node?.name = "dev1Node"
        dev1Node?.text = "Jason Yan - Developer"
        dev1Node?.fontSize = 50
        dev1Node?.fontColor = UIColor(red:0.27, green:0.52, blue:0.00, alpha:1.0)
        dev1Node?.position = CGPoint(x: frame.midX, y: frame.midY + 100)
        addChild(dev1Node!)
        
        dev2Node = SKLabelNode(fontNamed: "MontereyFLF-Bold")
        dev2Node?.name = "dev2Node"
        dev2Node?.text = "Zhehao Lin - Developer"
        dev2Node?.fontSize = 50
        dev2Node?.fontColor = UIColor(red:0.27, green:0.52, blue:0.00, alpha:1.0)
        dev2Node?.position = CGPoint(x: frame.midX, y: frame.midY - 50)
        addChild(dev2Node!)
        
        dev3Node = SKLabelNode(fontNamed: "MontereyFLF-Bold")
        dev3Node?.name = "dev3Node"
        dev3Node?.text = "Victor Hom - Devloper"
        dev3Node?.fontSize = 50
        dev3Node?.fontColor = UIColor(red:0.27, green:0.52, blue:0.00, alpha:1.0)
        dev3Node?.position = CGPoint(x: frame.midX, y: frame.midY - 200)
        addChild(dev3Node!)
        playSound()
        change()
        
    
        
        
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "Coin01", withExtension: "aif")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.numberOfLoops = -1
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
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
    //func playBackgroundMusic(filename: String){
      //  let url = Bundle.main.url(forResource: filename, withExtension: "aif")
        
        //Returns an error if it can't find the file name
        //if (url == nil) {
          //  print("Could not find the file \(filename)")
       // }
        
        //var error: NSError? = nil
        
        //Assigns the actual music to the music player
        
         //   backgroundMusicPlayer = try? AVAudioPlayer(contentsOfURL: url, error: &error)
        
        
        
        //Error if it failed to create the music player
       // if backgroundMusicPlayer == nil {
         //   print("Could not create audio player: \(error!)")
           // return
        //}
        
        //A negative means it loops forever
      //  backgroundMusicPlayer?.numberOfLoops = -1
       // backgroundMusicPlayer?.prepareToPlay()
        // backgroundMusicPlayer?.play()
        
    //}
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        print("clicked")
        if let name = touchedNode.name,
            name == "menuNode"{
            print("menuNode clicked")
            sceneNext = SKScene(fileNamed: "GameScene")
        }else{
            return
            
        }
        
        let transition = SKTransition.reveal(
            with: .down, duration: 1.0)
        clockTimer.invalidate()
        clockTimer = Timer()
        let nextScene = sceneNext
        nextScene?.scaleMode = .aspectFill
        
        scene?.view?.presentScene(sceneNext!, transition: transition)
        print("transitionToMenu from Credits")
        
    }
}
