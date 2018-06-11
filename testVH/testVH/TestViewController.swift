//
//  TestViewController.swift
//  testVH
//
//  Created by Student on 6/1/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit
import SpriteKit

class TestViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    //change?
    
    @IBOutlet weak var gameScene: SKView!
    var stocks: [Stock] = []
    
    var selectedStock: Stock?
    @IBOutlet weak var selectedStockLabel: UILabel!
    @IBOutlet weak var ownedStockLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var sellButton: UIButton!
    @IBOutlet weak var moneyOwned: UILabel!
    
    
    
    var game: NewGameScene!
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        game = gameScene.scene as! NewGameScene
        game.porfolioView = self
        print("dkhflk")
        game.startRunning()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateMoney(){
        //let v = "$100"
        moneyOwned.text = "\(game.userProf.money)"
    }
    
    //MARK: Buttons
    
    @IBAction func sellButtonTapped(_ sender: Any) {
        if let stock = selectedStock{
            let game = (gameScene.scene as! NewGameScene)
            for index in 0...game.stocks.count-1{
                if game.stocks[index].name == stock.name{
                    if(game.userProf.stockNums[index] == 0){
                        break
                    }
                    game.userProf.stockNums[index] = game.userProf.stockNums[index]-1
                    table.reloadData()
                    break
                }
            }
        }
    }
    @IBAction func buyButtonTapped(_ sender: Any) {
        if let stock = selectedStock{
            let game = (gameScene.scene as! NewGameScene)
            for index in 0...game.stocks.count-1{
                if game.stocks[index].name == stock.name && game.stocks[index].price <= game.userProf.money{
                    game.userProf.stockNums[index] = game.userProf.stockNums[index]+1
                    game.userProf.money -= game.stocks[index].price
                    table.reloadData()
                    break
                }
                
            }
        }
    }
    
    
    // MARK: - TableViewDelegat methods
     public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cell = tableView.cellForRow(at: indexPath) as! StockTableViewCell
        selectedStock = cell.stock
        selectedStockLabel.text = cell.stock.name
    }
    // MARK: -TableViewDataSource methods
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return stocks.count
    }
    
    
    
   
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell") as! StockTableViewCell
        cell.stockName.text = stocks[indexPath.row].name
        cell.price.text = "$\(stocks[indexPath.row].price)"
        cell.percentChange.text = "\(stocks[indexPath.row].percentChange)%"
        cell.percentChange.backgroundColor = stocks[indexPath.row].color
        cell.stockOwned.text = "\((gameScene.scene as! NewGameScene).userProf.stockNums[indexPath.row])"
        cell.stock = stocks[indexPath.row]
        return cell
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
