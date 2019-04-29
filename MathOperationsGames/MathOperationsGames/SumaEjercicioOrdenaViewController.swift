//
//  SumaEjercicioOrdenaViewController.swift
//  MathOperationsGames
//
//  Created by Reynaldo Almanza on 24/03/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

class SumaEjercicioOrdenaViewController: UIViewController {
    
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    var currentOperacion: Operations!
    
    var arrBtns = [UIButton]()
    
    var numSquares: Int!
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var directions = [Float]()
    
    var speeds = [Float]()
    
    var actTimer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        actTimer = Timer.scheduledTimer(timeInterval: 0.006, target: self, selector: #selector(act), userInfo: nil, repeats: true)
        directions = [1, 1, 1, 1, 1]
        speeds = [Float.random(in: 1 ... 2.5), Float.random(in: 1 ... 2.5), Float.random(in: 1 ... 2.5), Float.random(in: 1 ... 2.5), Float.random(in: 1 ... 2.5)]
        arrBtns += [btn0, btn1, btn2, btn3, btn4]
        paintViewsInScreen()
        // Do any additional setup after loading the view.
    }
    
    @objc func act () {
        for btn in arrBtns {
            if (btn.frame.origin.y >= screenHeight - 80) {
                directions[btn.tag] = directions[btn.tag] * Float(-1)
            }
            if (btn.frame.origin.y <= 80) {
                directions[btn.tag] = directions[btn.tag] * Float(-1)
            }
            if (directions[btn.tag] >= 0) {
                moveView(btn, speeds[btn.tag] * directions[btn.tag])
            } else {
                moveView(btn, speeds[btn.tag] * directions[btn.tag])
            }
        }
    }
    
    func paintViewsInScreen() {
        var numBtn = 0
        for btn in arrBtns {
            if (numBtn == 0) {
                btn.frame = CGRect(x: 0, y: 89, width: screenWidth / 5, height: 80)
            }
            if (numBtn == 1) {
                btn.frame = CGRect(x: (screenWidth / 5), y: 89, width: screenWidth / 5, height: 80)
            }
            if (numBtn == 2) {
                btn.frame = CGRect(x: (screenWidth / 5) * 2, y: 89, width: screenWidth / 5, height: 80)
            }
            if (numBtn == 3) {
                btn.frame = CGRect(x: (screenWidth / 5) * 3, y: 89, width: screenWidth / 5, height: 80)
            }
            if (numBtn == 4) {
                btn.frame = CGRect(x: (screenWidth / 5) * 4, y: 89, width: screenWidth / 5, height: 80)
            }
            numBtn += 1
        }
    }
    
    func moveView(_ btn: UIButton, _ speed: Float) {
        btn.frame.origin.y = btn.frame.origin.y + CGFloat(speed)
    }

    @IBAction func btn0Pressed(_ sender: Any) {
        btn0.isHidden = true
    }
    
    @IBAction func btn1Pressed(_ sender: Any) {
        btn1.isHidden = true
    }
    
    @IBAction func btn2Pressed(_ sender: Any) {
        print("yes")
    }
    
    @IBAction func btn4Pressed(_ sender: Any) {
        print("moving matters")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
