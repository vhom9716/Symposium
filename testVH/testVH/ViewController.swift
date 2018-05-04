//
//  ViewController.swift
//  testVH
//
//  Created by Student on 4/12/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class CharacterScreen: UIViewController {
    
    var bounds = UIScreen.main.bounds
    var maleOrigin : CGPoint = CGPoint(x:0,y:0)
    var femaleOrigin : CGPoint = CGPoint(x:0,y:0)
    @IBOutlet weak var male: SelectButton!
    @IBOutlet weak var female: SelectButton!
    @IBOutlet weak var chooseCharacter: SelectButton!
    var imgSrc: String = ""
    @IBAction func selectCharacter(_ sender: Any) {
        if male.select{
        
        }else if female.select{
            
        }else{
            //popupsasdaslkmgehmkp
        }
    }
    @IBAction func selectChar(_ sender: UIButton) {
        
    }
    @IBAction func chooseCharacter(_ sender: SelectButton) {
        if male.select == false && female.select == false{
            sender.change()
        }
        else if sender == male {
            if(!male.select && female.select){
                sender.change()
                female.change()
            }else{
                sender.change()
            }
        }
        else{
            if(!female.select && male.select){
                sender.change()
                male.change()
            }else{
                sender.change()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateScreen()
        maleOrigin = male.frame.origin
        male.frame.origin = CGPoint(x:-male.frame.width, y: maleOrigin.y)
        femaleOrigin = female.frame.origin
        female.frame.origin = CGPoint(x: bounds.width, y: femaleOrigin.y)
        // Do any additional setuping the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.male.frame.origin = self.maleOrigin
            self.female.frame.origin = self.femaleOrigin
        }, completion: nil)
       
    
    }
    
    func updateScreen(){
       male.imgSrc = "maleavatar.png"
        female.imgSrc = "femaleavatar.png"
        male.layer.cornerRadius = 10
        male.clipsToBounds = true
        female.layer.cornerRadius = 10
        female.clipsToBounds = true
        male.setBackgroundImage(UIImage(named:"maleavatar.png"), for: .normal)
        female.setBackgroundImage(UIImage(named:"femaleavatar.png"), for: .normal)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
