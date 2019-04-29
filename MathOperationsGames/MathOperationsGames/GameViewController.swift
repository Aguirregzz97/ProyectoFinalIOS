//
//  GameViewController.swift
//  MathOperationsGames
//
//  Created by Alumno on 3/22/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    var currentOperacion: Operations!
    var operacion: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sumaBasicaEjercicio"{
            var vistaTipoEjercicio = segue.destination as! SumaEjercicioBasicoViewController
            
            vistaTipoEjercicio.opActual = self.operacion
        }
        else if segue.identifier == "sumaSecuenciaEjercicio"{
            let vistaTipoEjercicio = segue.destination as! SumaEjercicioSecuenciaViewController
        }
        else if segue.identifier == "sumaOrdenaEjercicio"{
            var vistaTipoEjercicio = segue.destination as! SumaEjercicioOrdenaViewController
            vistaTipoEjercicio.currentOperacion = currentOperacion
        }
        
        
    }


   
    
    
    
}
