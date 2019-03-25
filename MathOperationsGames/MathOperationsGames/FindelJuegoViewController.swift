//
//  FindelJuegoViewController.swift
//  MathOperationsGames
//
//  Created by Reynaldo Almanza on 24/03/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

class FindelJuegoViewController: UIViewController {
    
    
    @IBOutlet weak var lbPuntuacion: UILabel!
    @IBOutlet weak var lbCorrectas: UILabel!
    
    var puntuacion : Int!
    var preguntasCorrectas : Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        lbPuntuacion.text = "Puntos: " + String(puntuacion)
       lbCorrectas.text = "Preguntas Correctas " + String(preguntasCorrectas) + " / 5"
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueTutorialIdentifier"{
            let vistaInicio = segue.destination as! OperationsMenuTableViewController
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    

    

}
