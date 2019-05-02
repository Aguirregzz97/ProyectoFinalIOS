//
//  SumaEjercicioBasicoViewController.swift
//  MathOperationsGames
//
//  Created by Reynaldo Almanza on 24/03/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit
import AVFoundation

class SumaEjercicioBasicoViewController: UIViewController {

    @IBOutlet weak var lbOp1: UILabel!
    @IBOutlet weak var lbOp2: UILabel!
    @IBOutlet weak var lbSign: UILabel!
    
    @IBOutlet weak var lbOp1Div: UILabel!
    @IBOutlet weak var lbSign1Div: UILabel!
    @IBOutlet weak var lbSign2Div: UILabel!
    @IBOutlet weak var lbOp2Div: UILabel!
    
    var opA: Int!
    var opB: Int!
    var respuesta1: Int!
    var respuesta2: Int!
    var respuesta3: Int!
    var respuesta4: Int!
    var puntos: Int!
    var correctas: Int!
    var totalPreguntas: Int!
    var randBackground: Int!
    
    var currentOperation: Operations!
    
    
    var aux : Bool!
    var aux2 : Bool!
    var aux3 : Bool!
    var aux4 : Bool!
    
    var opActual : String!
    
    var sonido1 = try? AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "acierto",ofType:"mp3")!) as URL)
    
    var sonido2 = try? AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "error",ofType:"mp3")!) as URL)
    
    @IBOutlet weak var btOpcion1: UIButton!
    @IBOutlet weak var btOpcion2: UIButton!
    @IBOutlet weak var btOpcion3: UIButton!
    @IBOutlet weak var btOpcion4: UIButton!
    @IBOutlet weak var lbPuntos: UILabel!
    @IBOutlet weak var lbCorrectas: UILabel!
    
    @IBOutlet weak var lbSigno: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        opActual = currentOperation.operationName
        randBackground = Int.random(in: 1...5)
        totalPreguntas = 1
        puntos = 0
        correctas = 0
        aux = false
        aux2 = false
        aux3 = false
        aux4 = false
        random()
        imgFondo()
       
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
    
    
    
    func random (){
        randBackground = Int.random(in: 1...5)
        imgFondo()
        var aux:Int!
        if(opActual == "Multiplicaciones"){
            
            opA = Int.random(in: 1...20)
            opB = Int.random(in: 1...20)
            
            if(opA < opB){
                aux = opA
                opA = opB
                opB = aux
            }
        }
        else if(opActual == "Divisiones") {
            
            opA = Int.random(in: 1...40)
            opB = Int.random(in: 1...10)
        
            
            if(opA < opB){
                aux = opA
                opA = opB
                opB = aux
            }
        }
        else{
            opA = Int.random(in: 1...50)
            opB = Int.random(in: 1...50)
            if(opActual == "Restas"||opActual == "Sumas"  ){
                if(opA < opB){
                    aux = opA
                    opA = opB
                    opB = aux
                }
            }
            
            
        }
        if(opActual != "Divisiones"){
            lbOp1Div.isHidden = true
            lbSign1Div.isHidden = true
            lbSign2Div.isHidden = true
            lbOp2Div.isHidden = true
            
            lbSign.isHidden = false
            lbOp1.isHidden = false
            lbOp2.isHidden = false
            
        if(opB < 10){
            lbOp1.text = String(opA)
            lbOp2.text = "  " + String(opB)
        }
        else if(opA < 10){
                lbOp1.text = String(opA)
                lbOp2.text = "  " + String(opA)
            }
        else{
            lbOp1.text = String(opA)
            lbOp2.text = String(opB)
            }
            
        }
        else{
            lbOp1Div.isHidden = false
            lbSign1Div.isHidden = false
            lbSign2Div.isHidden = false
            lbOp2Div.isHidden = false
            
            lbOp1.isHidden = true
            lbOp2.isHidden = true
            lbSign.isHidden = true
            
            lbOp2Div.text = String(opA)
            lbOp1Div.text = String(opB)
            
            
            
            
        }
        

        
        var respuesta : Int!
        var respFalsa1 : Int!
        var respFalsa2 : Int!
        var respFalsa3 : Int!
        
    
        if(opActual == "Sumas"){
            lbSigno.text = "+"
            respuesta = opA + opB
            
        }
        else if(opActual == "Restas"){
            lbSigno.text = "-"
            respuesta = opA - opB
        }
        else if(opActual == "Multiplicaciones"){
            lbSigno.text = "x"
            respuesta = opA * opB
        }
        else if(opActual == "Divisiones"){
            lbSigno.text = ""
            respuesta = opA / opB
        }
       
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
            sonido1!.play()
            if(totalPreguntas != 5){
                let showAlert = UIAlertController(title: "Sigue asi!", message: nil, preferredStyle: .alert)
                 let imageView = UIImageView(frame: CGRect(x: 15, y: 50, width: 240, height: 210))
                imageView.image = UIImage(named: "correcto")
                showAlert.view.addSubview(imageView)
                let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
                let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
                showAlert.view.addConstraint(height)
                showAlert.view.addConstraint(width)
                showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    // your actions here...
                }))
                self.present(showAlert, animated: true, completion: nil)
            }
        }
        else{
            if(totalPreguntas != 5){
                let showAlert = UIAlertController(title: "No te rindas!", message: nil, preferredStyle: .alert)
                 let imageView = UIImageView(frame: CGRect(x: 15, y: 50, width: 240, height: 210))
                imageView.image = UIImage(named: "incorrecto")
                showAlert.view.addSubview(imageView)
                let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
                let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
                showAlert.view.addConstraint(height)
                showAlert.view.addConstraint(width)
                showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    // your actions here...
                }))
                self.present(showAlert, animated: true, completion: nil)
            }
            sonido2!.play()
        }
        random()
        totalPreguntas+=1
    }
    
    
    @IBAction func resp2(_ sender: Any) {
        if(respuesta1 == 2){
            puntos+=50
            correctas+=1
            sonido1!.play()
            if(totalPreguntas != 5){
                let showAlert = UIAlertController(title: "Sigue asi!", message: nil, preferredStyle: .alert)
                 let imageView = UIImageView(frame: CGRect(x: 15, y: 50, width: 240, height: 210))
                imageView.image = UIImage(named: "correcto")
                showAlert.view.addSubview(imageView)
                let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
                let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
                showAlert.view.addConstraint(height)
                showAlert.view.addConstraint(width)
                showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    // your actions here...
                }))
                self.present(showAlert, animated: true, completion: nil)
            }
        }
        else{
            if(totalPreguntas != 5){
                let showAlert = UIAlertController(title: "No te rindas!", message: nil, preferredStyle: .alert)
                  let imageView = UIImageView(frame: CGRect(x: 15, y: 50, width: 240, height: 210))
                imageView.image = UIImage(named: "incorrecto")
                showAlert.view.addSubview(imageView)
                let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
                let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
                showAlert.view.addConstraint(height)
                showAlert.view.addConstraint(width)
                showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    // your actions here...
                }))
                self.present(showAlert, animated: true, completion: nil)
            }
            sonido2!.play()
        }
        random()
        totalPreguntas+=1
        
    }
    
    
    @IBAction func resp3(_ sender: Any) {
        
        if(respuesta1 == 3){
           puntos+=50
            correctas+=1
            sonido1!.play()
            if(totalPreguntas != 5){
                let showAlert = UIAlertController(title: "Sigue asi!", message: nil, preferredStyle: .alert)
                 let imageView = UIImageView(frame: CGRect(x: 15, y: 50, width: 240, height: 210))
                imageView.image = UIImage(named: "correcto")
                showAlert.view.addSubview(imageView)
                let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
                let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
                showAlert.view.addConstraint(height)
                showAlert.view.addConstraint(width)
                showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    // your actions here...
                }))
                self.present(showAlert, animated: true, completion: nil)
            }
        }
        else{
            if(totalPreguntas != 5){
                let showAlert = UIAlertController(title: "No te rindas!", message: nil, preferredStyle: .alert)
                 let imageView = UIImageView(frame: CGRect(x: 15, y: 50, width: 240, height: 210))
                imageView.image = UIImage(named: "incorrecto")
                showAlert.view.addSubview(imageView)
                let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
                let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
                showAlert.view.addConstraint(height)
                showAlert.view.addConstraint(width)
                showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    // your actions here...
                }))
                self.present(showAlert, animated: true, completion: nil)
            }
            sonido2!.play()
        }
        random()
        totalPreguntas+=1
    }
    
    
    @IBAction func resp4(_ sender: Any) {
        if(respuesta1 == 4){
            puntos+=50
            correctas+=1
            sonido1!.play()
            if(totalPreguntas != 5){
                let showAlert = UIAlertController(title: "Sigue asi!", message: nil, preferredStyle: .alert)
                let imageView = UIImageView(frame: CGRect(x: 15, y: 50, width: 240, height: 210))
                imageView.image = UIImage(named: "correcto")
                showAlert.view.addSubview(imageView)
                let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
                let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
                showAlert.view.addConstraint(height)
                showAlert.view.addConstraint(width)
                showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    // your actions here...
                }))
                self.present(showAlert, animated: true, completion: nil)
            }
        }
        else{
            if(totalPreguntas != 5){
                let showAlert = UIAlertController(title: "No te rindas!", message: nil, preferredStyle: .alert)
                let imageView = UIImageView(frame: CGRect(x: 15, y: 50, width: 240, height: 210))
                imageView.image = UIImage(named: "incorrecto")
                showAlert.view.addSubview(imageView)
                let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
                let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
                showAlert.view.addConstraint(height)
                showAlert.view.addConstraint(width)
                showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    // your actions here...
                }))
                self.present(showAlert, animated: true, completion: nil)
            }
            sonido2!.play()
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
        vc.datosJuegos2 = false
        vc.datosJuegos1 = true
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
       
    }
    
    
    

}
