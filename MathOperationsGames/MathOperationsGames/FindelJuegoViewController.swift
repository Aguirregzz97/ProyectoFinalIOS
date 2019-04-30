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
    
    var datosJuegos1: Bool!
    var datosJuegos2: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()

       
     
        if(datosJuegos1){
        lbPuntuacion.text = "Puntos: " + String(puntuacion)
       lbCorrectas.text = "Preguntas Correctas " + String(preguntasCorrectas) + " / 5"
        // Do any additional setup after loading the view.
        }
        else if (datosJuegos2){
             lbPuntuacion.text = "Puntos: " + String(puntuacion)
            preguntasCorrectas = 0
                  lbCorrectas.text = ""
        }
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
