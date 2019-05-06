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
    @IBOutlet weak var lbPoints: UILabel!
    
    var currentOperacion: Operations!
    
    var tmpResults = [Int]()
    
    var tmpResultsSorted = [Int]()
    
    var btnOrderClicked = [Int]()
    
    var arrBtns = [UIButton]()
    
    var numSquares: Int!
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var directions = [Float]()
    
    var speeds = [Float]()
    
    var actTimer: Timer!
    
    var timePassed: Timer!
    
    var timePassedNum: Int!
    
    var totalPoints: Int!
    
    var alertCorrectTimer: Timer!
    
    var alertCorrect: UIAlertController!
    
    var alertIncorrect: UIAlertController!
    
     var randBackground: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        randBackground = Int.random(in: 1...5)
        timePassedNum = 50
        totalPoints = 0
        arrBtns += [btn0, btn1, btn2, btn3, btn4]
        let operationName = currentOperacion.operationName
        getOperationsInSquares(operation: operationName)
        actTimer = Timer.scheduledTimer(timeInterval: 0.006, target: self, selector: #selector(act), userInfo: nil, repeats: true)
        timePassed = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timePassedF), userInfo: nil, repeats: true)
        directions = [1, 1, 1, 1, 1]
        speeds = [Float.random(in: 0.5 ... 1.6), Float.random(in: 0.5 ... 1.6), Float.random(in: 0.5 ... 1.6), Float.random(in: 0.5 ... 1.6), Float.random(in: 0.5 ... 1.6)]
        imgFondo()
        paintViewsInScreen()
        // Do any additional setup after loading the view.
    }
    
    func getOperationsInSquares (operation: String) {
        switch operation {
        case "Sumas":
            for i in 0 ... 4 {
                let firstNum = Int.random(in: 1 ... 25)
                let secondNum = Int.random(in: 1 ... 25)
                arrBtns[i].setTitle(String(firstNum) + " + " + String(secondNum), for: .normal)
                tmpResults.append((firstNum + secondNum))
            }
            tmpResultsSorted = tmpResults.sorted()
            break
        case "Restas":
            for i in 0 ... 4 {
                let firstNum = Int.random(in: 1 ... 12)
                let secondNum = Int.random(in: 13 ... 42)
                arrBtns[i].setTitle(String(secondNum) + " - " + String(firstNum), for: .normal)
                tmpResults.append((secondNum - firstNum))
            }
            tmpResultsSorted = tmpResults.sorted()
            break
        case "Multiplicaciones":
            for i in 0 ... 4 {
                let firstNum = Int.random(in: 1 ... 10)
                let secondNum = Int.random(in: 1 ... 10)
                arrBtns[i].setTitle(String(firstNum) + " X " + String(secondNum), for: .normal)
                tmpResults.append((firstNum * secondNum))
            }
            tmpResultsSorted = tmpResults.sorted()
            break
        case "Divisiones":
            for i in 0 ... 4 {
                let firstNum = Int.random(in: 1 ... 10)
                let secondNum = firstNum * Int.random(in: 1 ... 10)
                arrBtns[i].setTitle(String(secondNum) + " ÷ " + String(firstNum), for: .normal)
                tmpResults.append((secondNum / firstNum))
            }
            tmpResultsSorted = tmpResults.sorted()

            break
        default:
            print("Operation name does not exist")
            break
        }
    }
    
    @objc func timePassedF() {
        if (timePassedNum == 0) {
            return
        } else {
            timePassedNum -= 1
        }
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
    
    func imgFondo(){
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        if(randBackground == 1){
            self.view.backgroundColor = #colorLiteral(red: 0.8446564078, green: 0.5145705342, blue: 1, alpha: 1)
        }
        else if(randBackground == 2){
            self.view.backgroundColor = #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1)
        }
        else if(randBackground == 3){
            self.view.backgroundColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
        }
        else if(randBackground == 4){
            self.view.backgroundColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
        }
        else if(randBackground == 5){
            self.view.backgroundColor = #colorLiteral(red: 0.5808190107, green: 0.0884276256, blue: 0.3186392188, alpha: 1)
        }
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
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
    
    func dispAlertIncorrect() {
        let imageView = UIImageView(frame: CGRect(x: screenWidth / 2 - 120, y: 0, width: 120, height:105))
        imageView.image = UIImage(named: "incorrecto")
        alertIncorrect = UIAlertController(title: "", message: nil, preferredStyle: .alert)
        alertIncorrect.view.addSubview(imageView)
        
        self.present(alertIncorrect, animated: true, completion: nil)
        alertCorrectTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(dismissAlert2), userInfo: nil, repeats: false)
        totalPoints -= 10
        lbPoints.text = "Points: " + String(totalPoints)
    }
    
    func dispAlertCorrect() {
        let imageView = UIImageView(frame: CGRect(x: screenWidth / 2 - 120, y: 0, width: 120, height:105))
        imageView.image = UIImage(named: "correcto")
        alertCorrect = UIAlertController(title: "", message: nil, preferredStyle: .alert)
        alertCorrect.view.addSubview(imageView)
        
        self.present(alertCorrect, animated: true, completion: nil)
        alertCorrectTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(dismissAlert), userInfo: nil, repeats: false)
        totalPoints += timePassedNum
        lbPoints.text = "Points: " + String(totalPoints)
    }
    
    func dispFinished() {
        let delay = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(dispAlertPoints), userInfo: nil, repeats: false)
    }
    
    @objc func dispAlertPoints() {
        let genericAlert = UIAlertController(title: "Puntos: " + String(totalPoints), message: "¿Quiere regresar a juegos?", preferredStyle: .alert)
        genericAlert.addAction(UIAlertAction(title: "Si", style: .default, handler: {
            action in self.navigationController?.popViewController(animated: true)
        }))
        self.present(genericAlert, animated: true)
    }
    
    @objc func dismissAlert() {
        alertCorrect.dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissAlert2() {
        alertIncorrect.dismiss(animated: true, completion: nil)
    }

    @IBAction func btn0Pressed(_ sender: Any) {
        if (tmpResults[0] == tmpResultsSorted[0]) {
            dispAlertCorrect()
            tmpResultsSorted.remove(at: 0)
            btn0.isHidden = true
            if (tmpResultsSorted.count == 0) {
                dispFinished()
            }
        } else {
            dispAlertIncorrect()
        }
    }
    
    @IBAction func btn1Pressed(_ sender: Any) {
        if (tmpResults[1] == tmpResultsSorted[0]) {
            dispAlertCorrect()
            tmpResultsSorted.remove(at: 0)
            btn1.isHidden = true
            if (tmpResultsSorted.count == 0) {
                dispFinished()
            }
        } else {
            dispAlertIncorrect()
        }
    }
    
    
    @IBAction func btn2Pressed(_ sender: Any) {
        if (tmpResults[2] == tmpResultsSorted[0]) {
            dispAlertCorrect()
            tmpResultsSorted.remove(at: 0)
            btn2.isHidden = true
            if (tmpResultsSorted.count == 0) {
                dispFinished()
            }
        } else {
            dispAlertIncorrect()
        }
    }
    
    @IBAction func btn3Pressed(_ sender: Any) {
        if (tmpResults[3] == tmpResultsSorted[0]) {
            dispAlertCorrect()
            tmpResultsSorted.remove(at: 0)
            btn3.isHidden = true
            if (tmpResultsSorted.count == 0) {
                dispFinished()
            }
        } else {
            dispAlertIncorrect()
        }
    }
    
    @IBAction func btn4Pressed(_ sender: Any) {
        if (tmpResults[4] == tmpResultsSorted[0]) {
            dispAlertCorrect()
            tmpResultsSorted.remove(at: 0)
            btn4.isHidden = true
            if (tmpResultsSorted.count == 0) {
                dispFinished()
            }
        } else {
            dispAlertIncorrect()
        }
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
