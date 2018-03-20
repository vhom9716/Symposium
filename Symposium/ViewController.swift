//
//  ViewController.swift
//  Symposium
//
//  Created by Student on 2/28/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
   let operations = ["add", "sub", "mult", "div"]
   var stringWhole = ""
   var currentOp = ""
   var num1 = ""
   var num2 = ""
    
 
 

    @IBOutlet weak var viewField: UILabel!
    @IBAction func b1(_ sender: Any) {
        passVal("1")
    }
    @IBAction func b2(_ sender: Any) {
        passVal("2")
    }
    @IBAction func b3(_ sender: Any) {
        passVal("3")
    }
    @IBAction func b4(_ sender: Any) {
        passVal("4")
    }
    @IBAction func b5(_ sender: Any) {
        passVal("5")
    }
    @IBAction func b6(_ sender: Any) {
        passVal("6")
    }
    @IBAction func b7(_ sender: Any) {
        passVal("7")
    }
    @IBAction func b8(_ sender: Any) {
        passVal("8")
    }
    @IBAction func b9(_ sender: Any) {
        passVal("9")
    }
    @IBAction func b0(_ sender: Any) {
        passVal("0")
    }
    @IBAction func bClear(_ sender: Any) {
        stringWhole = ""
        update()
    }
    @IBAction func bAdd(_ sender: Any) {
        num1 = stringWhole
        currentOp = operations[0]
        stringWhole = ""
        update()
    }
    @IBAction func bSubtract(_ sender: Any) {
        num1 = stringWhole
        currentOp = operations[1]
        stringWhole = ""
        update()
    }
    @IBAction func bMultiply(_ sender: Any) {
        num1 = stringWhole
        currentOp = operations[2]
        stringWhole = ""
        update()
    }
    @IBAction func bDivide(_ sender: Any) {
        num1 = stringWhole
        currentOp = operations[3]
        stringWhole = ""
        update()
    }
    @IBAction func bEqual(_ sender: Any) {
        if(stringWhole != "" && num1 != ""){
            num2 = stringWhole
            stringWhole = ""
        }
        executeOp()
    }
    
    func executeOp(){
        let val1:Double? = Double(num1)
        let val2:Double? = Double(num2)
        var answer:Double? = 0
        if(currentOp == "add"){
            answer = val1!+val2!
        }
        if(currentOp == "sub"){
            answer = val1!-val2!
        }
        if(currentOp == "mult"){
            answer = val1!*val2!
        }
        if(currentOp == "div"){
            if(val1 == 0 && val2 == 0){
                print("undefined")
            }else{
                answer = val1!/val2!
            }
        }
        stringWhole = String(Double(answer!))
        
            
        num1 = String(stringWhole)
        update()
    }
    
    func passVal(_ a: String){
        stringWhole += a
        update()
    }
    
    func update(){
        viewField.text = stringWhole
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

