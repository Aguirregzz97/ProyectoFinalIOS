//
//  SumaEjercicioOrdenaViewController.swift
//  MathOperationsGames
//
//  Created by Reynaldo Almanza on 24/03/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

class SumaEjercicioOrdenaViewController: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var lb1Outlet: UILabel!
    @IBOutlet weak var lb2Outlet: UILabel!
    
    var arrViews = [UIView]()
    
    var numSquares: Int!
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()
        numSquares = 2
        let myNewView = UIView(frame: CGRect(x: 0, y: 89, width: screenWidth / 5, height: 80))
        view1 = myNewView
        view1.addSubview(lb1Outlet)
        let myNewView2 = UIView(frame: CGRect(x: 0, y: screenWidth / 5, width: screenWidth / 5, height: 80))
        view2 = myNewView2
        view2.addSubview(lb2Outlet)
        view1.backgroundColor = UIColor.red
        view2.backgroundColor = UIColor.blue
        arrViews.append(view1)
        arrViews.append(view2)
        paintViewsInScreen()
        // Do any additional setup after loading the view.
    }
    
    
    func generateRandSum() {
        var num1 = Int.random(in: 1...30)
    }
    
    func paintViewsInScreen() {
        var numSquare = 1
        for view in arrViews {
            self.view.addSubview(view)
            if (numSquare == 1) {
                view.frame = CGRect(x: 0, y: 89, width: screenWidth / 5, height: 80)
            }
            if (numSquare == 2) {
                view.frame = CGRect(x: screenWidth / 5, y: 0, width: screenWidth / 5, height: 80)
            }
            numSquare += 1
        }
        moveView(arrViews[0], 2.5)
        moveView(arrViews[1], 2.8)
    }
    
    func moveView(_ view: UIView, _ speed: Float) {
        UIView.animate(withDuration: TimeInterval(speed), delay: 0.0 , options: .curveLinear, animations: {
            view.frame.origin.y = self.screenHeight
        }, completion: { (_) in
            view.frame.origin.y = 0
            self.moveView(view, speed)
        })
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
