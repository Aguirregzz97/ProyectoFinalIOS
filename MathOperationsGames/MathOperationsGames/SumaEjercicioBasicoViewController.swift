//
//  SumaEjercicioBasicoViewController.swift
//  MathOperationsGames
//
//  Created by Reynaldo Almanza on 24/03/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

class SumaEjercicioBasicoViewController: UIViewController {

    @IBOutlet weak var lbOp1: UILabel!
    @IBOutlet weak var lbOp2: UILabel!
    
    var opA: Int!
    var opB: Int!
    var respuesta1: Int!
    var respuesta2: Int!
    var respuesta3: Int!
    var respuesta4: Int!
    var puntos: Int!
    var correctas: Int!
    var totalPreguntas: Int!
    
    var aux : Bool!
    var aux2 : Bool!
    var aux3 : Bool!
    var aux4 : Bool!
    
    
    @IBOutlet weak var btOpcion1: UIButton!
    @IBOutlet weak var btOpcion2: UIButton!
    @IBOutlet weak var btOpcion3: UIButton!
    @IBOutlet weak var btOpcion4: UIButton!
    @IBOutlet weak var lbPuntos: UILabel!
    @IBOutlet weak var lbCorrectas: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        totalPreguntas = 0
        puntos = 0
        correctas = 0
        aux = false
        aux2 = false
        aux3 = false
        aux4 = false
        random()
       
    }
    
    
    
    func random (){
        opA = Int.random(in: 0...50)
        opB = Int.random(in: 0...50)
        
        lbOp1.text = String(opA)
        lbOp2.text = String(opB)
        
        var respuesta : Int!
        var respFalsa1 : Int!
        var respFalsa2 : Int!
        var respFalsa3 : Int!
        
        
        
        respuesta = opA + opB
        respFalsa1 = respuesta + 1
        respFalsa2 = respuesta - 1
        respFalsa3 = respuesta + 2
        
        respuesta1 = Int.random(in: 1...4)
        
        
        if(respuesta1 == 1 ){
            btOpcion1.setTitle(String(respuesta), for: .normal)
            btOpcion2.setTitle(String(respFalsa1), for: .normal)
            btOpcion3.setTitle(String(respFalsa2), for: .normal)
            btOpcion4.setTitle(String(respFalsa3), for: .normal)
        }
        else if (respuesta1 == 2){
            btOpcion1.setTitle(String(respFalsa2), for: .normal)
            btOpcion2.setTitle(String(respuesta), for: .normal)
            btOpcion3.setTitle(String(respFalsa3), for: .normal)
            btOpcion4.setTitle(String(respFalsa1), for: .normal)
        }
        else if (respuesta1 == 3){
            btOpcion1.setTitle(String(respFalsa3), for: .normal)
            btOpcion2.setTitle(String(respFalsa1), for: .normal)
            btOpcion3.setTitle(String(respuesta), for: .normal)
            btOpcion4.setTitle(String(respFalsa2), for: .normal)
        }
        else if (respuesta1 == 4){
            btOpcion1.setTitle(String(respFalsa1), for: .normal)
            btOpcion2.setTitle(String(respFalsa3), for: .normal)
            btOpcion3.setTitle(String(respFalsa2), for: .normal)
            btOpcion4.setTitle(String(respuesta), for: .normal)
        }
        lbPuntos.text = String(puntos)
        lbCorrectas.text = String(correctas) + "/5"
        
        cambiaVistaFinal()
        
    }

    @IBAction func reps1(_ sender: Any) {
        if(respuesta1 == 1){
           puntos+=50
           correctas+=1
        }
        random()
        totalPreguntas+=1
    }
    
    
    @IBAction func resp2(_ sender: Any) {
        if(respuesta1 == 2){
            puntos+=50
            correctas+=1
        }
        random()
        totalPreguntas+=1
        
    }
    
    
    @IBAction func resp3(_ sender: Any) {
        
        if(respuesta1 == 3){
           puntos+=50
            correctas+=1
        }
        random()
        totalPreguntas+=1
    }
    
    
    @IBAction func resp4(_ sender: Any) {
        if(respuesta1 == 4){
            puntos+=50
            correctas+=1
        }
        random()
        totalPreguntas+=1
        
    }
    
    func cambiaVistaFinal(){
        if(totalPreguntas == 5){
            /*
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "FindelJuego") as! FindelJuegoViewController
            self.present(newViewController, animated: true, completion: nil)*/
            performSegue(withIdentifier: "FindelJuego", sender: self)
            
            
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        var vc = segue.destination as! FindelJuegoViewController
        vc.puntuacion = self.puntos
        vc.preguntasCorrectas = self.correctas
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
       
    }
    
    
    

}
