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
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "hoja")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sumaBasicaEjercicio"{
            var vistaTipoEjercicio = segue.destination as! SumaEjercicioBasicoViewController
            
            vistaTipoEjercicio.currentOperation = currentOperacion
        }
        else if segue.identifier == "sumaSecuenciaEjercicio"{
            let vistaTipoEjercicio = segue.destination as! SumaEjercicioSecuenciaViewController
            
             vistaTipoEjercicio.currentOperation = currentOperacion
        }
        else if segue.identifier == "sumaOrdenaEjercicio"{
            var vistaTipoEjercicio = segue.destination as! SumaEjercicioOrdenaViewController
            print("sexo")
            vistaTipoEjercicio.currentOperacion = currentOperacion
        }
        
        
    }


   
    
    
    
}
