//
//  GameViewController.swift
//  MathOperationsGames
//
//  Created by Alumno on 3/22/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sumaBasicaEjercicio"{
            let vistaTipoEjercicio = segue.destination as! SumaEjercicioBasicoViewController
        }
        else if segue.identifier == "sumaSecuenciaEjercicio"{
            let vistaTipoEjercicio = segue.destination as! SumaEjercicioSecuenciaViewController
        }
        else if segue.identifier == "sumaOrdenaEjercicio"{
            let vistaTipoEjercicio = segue.destination as! SumaEjercicioOrdenaViewController
        }
        
        
    }


   
    
    
    
}
