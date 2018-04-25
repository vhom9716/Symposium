//
//  ViewController.swift
//  testVH
//
//  Created by Student on 4/12/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class CharacterScreen: UIViewController {
    
    @IBOutlet weak var male: SelectButton!
    @IBOutlet weak var female: SelectButton!
    @IBOutlet weak var chooseCharacter: SelectButton!
    var imgSrc: String = ""
    @IBAction func selectCharacter(_ sender: Any) {
        if male.select{
        
        }else if female.select{
            
        }else{
            //popup
        }
    }
    @IBAction func chooseCharacter(_ sender: SelectButton) {
        sender.change()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateScreen()
        // Do any additional setup after loading the view.
    }
    
    func updateScreen(){
       male.imgSrc = "onedollar.jpg"
        female.imgSrc = "onedollar.jpg"
        male.setBackgroundImage(UIImage(named:"onedollar.jpg"), for: .normal)
        female.setBackgroundImage(UIImage(named:"onedollar.jpg"), for: .normal)
        
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
