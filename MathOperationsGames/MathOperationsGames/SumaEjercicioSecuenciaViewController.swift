//
//  SumaEjercicioSecuenciaViewController.swift
//  MathOperationsGames
//
//  Created by Reynaldo Almanza on 24/03/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit
import AVFoundation

class SumaEjercicioSecuenciaViewController: UIViewController {
    
    @IBOutlet weak var lbOpcion1: UILabel!
    @IBOutlet weak var lbOpcion2: UILabel!
    @IBOutlet weak var lbOpcion3: UILabel!
    @IBOutlet weak var lbOpcion4: UILabel!
    
    @IBOutlet weak var lbPuntos: UILabel!
    @IBOutlet weak var lbTiempo: UILabel!
    @IBOutlet weak var lbVidas: UILabel!
    
    
    @IBOutlet weak var btRespuesta1: UIButton!
    @IBOutlet weak var btRespuesta2: UIButton!
    @IBOutlet weak var btRespuesta3: UIButton!
    @IBOutlet weak var btRespuesta4: UIButton!
    
    
    var currentOperation: Operations!
    
    var respuesta1 : Int!
    var respFalsa1: Int!
    var respFalsa2: Int!
    var respFalsa3: Int!
    var puntos: Int!
    var vidas: Int!
    
    var timer = Timer()
    var time: Int!
    
    var aux:Int!
    
     var opActual : String!
    var randBackground: Int!
    var secuencia: Int!
    
    var sonido1 = try? AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "acierto",ofType:"mp3")!) as URL)
    
    var sonido2 = try? AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "error",ofType:"mp3")!) as URL)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        
        opActual = currentOperation.operationName
        randBackground = Int.random(in: 1...5)
        respFalsa1 = 0
        respFalsa2 = 0
        respFalsa3 = 0
        vidas = 5
        if(opActual == "Multiplicaciones"){
            time = 31
        }
        else if(opActual == "Divisiones"){
            time = 31
        }
        else{
            time = 11
        }
           timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SumaEjercicioSecuenciaViewController.action), userInfo: nil, repeats: true)
        puntos = 0
       asignaValor()
       imgFondo()

    }
    

    
    func asignaValor(){
        
        randBackground = Int.random(in: 1...5)
        imgFondo()
        
        var respuesta: Int!
        
        var op1: Int!
        var op2: Int!
        var op3: Int!
        var op4: Int!
        
        respFalsa1 = 0
        respFalsa2 = 0
        respFalsa3 = 0
        
        
        secuencia = Int.random(in: 1...4)
        
        
        
        respuesta1 = Int.random(in: 1...4)
        
        if(opActual == "Divisiones"){
            op1 = Int.random(in: 2...20)
        }
        else if (opActual == "Restas"){
            op1 = Int.random(in: 20...40)
        }
        else if (opActual == "Multiplicaciones"){
            op1 = Int.random(in: 1...10)
        }
        else{
            op1 = Int.random(in: 1...35)
        }
        
        
     
      
        if(secuencia == 1){
            if(opActual == "Sumas" ){
            op2 = op1 + 2
            op3 = op2 + 2
            op4 = op3 + 2
            }
            else if(opActual == "Restas"){
                op2 = op1 - 2
                op3 = op2 - 2
                op4 = op3 - 2
            }
            else if(opActual == "Multiplicaciones"){
                op2 = op1 * 3
                op3 = op2 * 3
                op4 = op3 * 3
            }
            
            else if(opActual == "Divisiones"){
                op2 = op1 / 2
                op3 = op2 / 2
                op4 = op3 / 2
            }
        
            lbOpcion1.text = String(op1)
            lbOpcion2.text = String(op2)
            lbOpcion3.text = "?"
            lbOpcion4.text = String(op4)
        
        
        
        
        respuesta = op3
        print(respuesta)
        }
            
       
        else if(secuencia == 2){
            if(opActual == "Sumas" ){
                op2 = op1 + 1
                op3 = op2 + 1
                op4 = op3 + 1
            }
            else if(opActual == "Restas"){
                op2 = op1 - 3
                op3 = op2 - 3
                op4 = op3 - 3
            }
            else if(opActual == "Multiplicaciones"){
                op2 = op1 * 2
                op3 = op2 * 2
                op4 = op3 * 2
            }
                
            else if(opActual == "Divisiones"){
                op2 = op1 / 2
                op3 = op2 / 2
                op4 = op3 / 2
            }
         
         lbOpcion1.text = String(op1)
         lbOpcion2.text = "?"
         lbOpcion3.text = String(op3)
         lbOpcion4.text = String(op4)
         
         
            respuesta = op2
            print(respuesta)
            
         
        }
        
        else if(secuencia == 3){
            if(opActual == "Sumas" ){
                op2 = op1 + 3
                op3 = op2 + 3
                op4 = op3 + 3
            }
            else if(opActual == "Restas"){
                op2 = op1 - 5
                op3 = op2 - 5
                op4 = op3 - 5
            }
            else if(opActual == "Multiplicaciones"){
                op2 = op1 * 3
                op3 = op2 * 3
                op4 = op3 * 3
            }
                
            else if(opActual == "Divisiones"){
                op2 = op1 / 2
                op3 = op2 / 2
                op4 = op3 / 2
            }

         
        
            lbOpcion1.text = String(op1)
            lbOpcion2.text = String(op2)
            lbOpcion3.text = String(op3)
            lbOpcion4.text = "?"
         
         respuesta = op4
         print(respuesta)
        }
        
        else if(secuencia == 4){
            if(opActual == "Sumas" ){
                op2 = op1 + 4
                op3 = op2 + 4
                op4 = op3 + 4
            }
            else if(opActual == "Restas"){
                op2 = op1 - 6
                op3 = op2 - 6
                op4 = op3 - 6
            }
            else if(opActual == "Multiplicaciones"){
                op2 = op1 * 2
                op3 = op2 * 2
                op4 = op3 * 2
            }
                
            else if(opActual == "Divisiones"){
                op2 = op1 / 2
                op3 = op2 / 2
                op4 = op3 / 2
            }

            
         
            
            lbOpcion1.text = "?"
            lbOpcion2.text = String(op2)
            lbOpcion3.text = String(op3)
            lbOpcion4.text = String(op4)
         
            respuesta = op1
            print(respuesta)
        }
        if(opActual == "Divisiones"){
            respFalsa1 = respuesta - 3
            respFalsa2 = respuesta + 2
            respFalsa3 = respuesta + 5
        }
        else{
            respFalsa1 = respuesta - 1
            respFalsa2 = respuesta + 1
            respFalsa3 = respuesta + 2
        }
        
        if(respFalsa1 < 0){
            respFalsa1 = respFalsa1 + 2
        }
        else if(respFalsa2 < 0){
            respFalsa2 = respFalsa2 + 3
        }
        else if(respFalsa3 < 0){
            respFalsa3 = respFalsa3 + 4
        }
        
        
        
        if(respuesta1 == 1 ){
            btRespuesta1.setTitle(String(respuesta), for: .normal)
            btRespuesta2.setTitle(String(respFalsa1), for: .normal)
            btRespuesta3.setTitle(String(respFalsa2), for: .normal)
            btRespuesta4.setTitle(String(respFalsa3), for: .normal)
           
        }
        else if (respuesta1 == 2){
            btRespuesta1.setTitle(String(respFalsa2), for: .normal)
            btRespuesta2.setTitle(String(respuesta), for: .normal)
            btRespuesta3.setTitle(String(respFalsa3), for: .normal)
            btRespuesta4.setTitle(String(respFalsa1), for: .normal)
        }
        else if (respuesta1 == 3){
            btRespuesta1.setTitle(String(respFalsa3), for: .normal)
            btRespuesta2.setTitle(String(respFalsa1), for: .normal)
            btRespuesta3.setTitle(String(respuesta), for: .normal)
            btRespuesta4.setTitle(String(respFalsa2), for: .normal)
        }
        else if (respuesta1 == 4){
            btRespuesta1.setTitle(String(respFalsa1), for: .normal)
            btRespuesta2.setTitle(String(respFalsa3), for: .normal)
            btRespuesta3.setTitle(String(respFalsa2), for: .normal)
            btRespuesta4.setTitle(String(respuesta), for: .normal)
        }
        
        lbPuntos.text = String(puntos)
        lbVidas.text = String(vidas)
        cambiaVistaFinal()
     
    
     
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
    
    @objc func action(){

        if(opActual == "Multiplicaciones"){
            if(time <= 1){
                time = 31
                vidas-=1
                asignaValor()
                sonido2!.play()
                
            }
        }
        else if (opActual == "Divisiones"){
            if(time <= 1){
                time = 31
                vidas-=1
                asignaValor()
                sonido2!.play()
                
            }
        }
        else{
            if(time <= 1){
                time = 11
                vidas-=1
                asignaValor()
                sonido2!.play()
           
            }
        }
          time-=1
        
        lbTiempo.text = String(time)
    }
    
    
    @IBAction func resp1(_ sender: Any) {
       
        if(opActual == "Multiplicaciones"){
            if(respuesta1 == 1){
                time = 31
                puntos+=50
                sonido1!.play()
                
            }
            else{
                sonido2!.play()
                time = 31
                vidas-=1
            }
            asignaValor()
            
            
        }
        else if(opActual == "Divisiones"){
            if(respuesta1 == 1){
                time = 31
                puntos+=50
                sonido1!.play()
                
            }
            else{
                sonido2!.play()
                time = 31
                vidas-=1
            }
            asignaValor()
            
            
        }
        else{
            if(respuesta1 == 1){
                time = 11
                puntos+=50
                sonido1!.play()
                
            }
            else{
                sonido2!.play()
                time = 11
                vidas-=1
            }
            asignaValor()
        }
        
    }
    
    
    @IBAction func resp2(_ sender: Any) {
       
        if(opActual == "Multiplicaciones"){
            if(respuesta1 == 2){
                time = 31
                puntos+=50
                sonido1!.play()
                
            }
            else{
                sonido2!.play()
                time = 31
                vidas-=1
            }
            asignaValor()
        }
        else if(opActual == "Divisiones"){
            if(respuesta1 == 2){
                time = 31
                puntos+=50
                sonido1!.play()
                
            }
            else{
                sonido2!.play()
                time = 31
                vidas-=1
            }
            asignaValor()
        }
        else{
            if(respuesta1 == 2){
                time = 11
                puntos+=50
                sonido1!.play()
                
            }
            else{
                sonido2!.play()
                time = 11
                vidas-=1
            }
            asignaValor()
        }
        
        
        
    }
    
    
    @IBAction func resp3(_ sender: Any) {
       
        if(opActual == "Multiplicaciones"){
            if(respuesta1 == 3){
                time = 31
                puntos+=50
                sonido1!.play()
                
            }
            else{
                sonido2!.play()
                time = 31
                vidas-=1
            }
            asignaValor()
            
            
        }
        else if(opActual == "Divisiones"){
            if(respuesta1 == 3){
                time = 31
                puntos+=50
                sonido1!.play()
                
            }
            else{
                sonido2!.play()
                time = 31
                vidas-=1
            }
            asignaValor()
        }
        else{
            if(respuesta1 == 3){
                time = 11
                puntos+=50
                sonido1!.play()
                
            }
            else{
                sonido2!.play()
                time = 11
                vidas-=1
            }
            asignaValor()
        }
        
    }
    
    
    @IBAction func resp4(_ sender: Any) {
        
        if(opActual == "Multiplicaciones"){
            if(respuesta1 == 4){
                time = 31
                puntos+=50
                sonido1!.play()
                
            }
            else{
                sonido2!.play()
                time = 31
                vidas-=1
            }
            asignaValor()
            
            
        }
        else if(opActual == "Divisiones"){
            if(respuesta1 == 4){
                time = 31
                puntos+=50
                sonido1!.play()
                
            }
            else{
                sonido2!.play()
                time = 31
                vidas-=1
            }
            asignaValor()
            
            
        }
        else{
            if(respuesta1 == 4){
                time = 11
                puntos+=50
                sonido1!.play()
                
            }
            else{
                sonido2!.play()
                time = 11
                vidas-=1
            }
            asignaValor()
        }
        
        
    }
    
    func cambiaVistaFinal(){
        if(vidas == 0){
            
            /*
             let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
             let newViewController = storyBoard.instantiateViewController(withIdentifier: "FindelJuego") as! FindelJuegoViewController
             self.present(newViewController, animated: true, completion: nil)*/
            time = 0
            performSegue(withIdentifier: "Final", sender: self)
            timer.invalidate()
            
            
            
        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        var vc = segue.destination as! FindelJuegoViewController
        vc.puntuacion = self.puntos
        vc.datosJuegos2 = true
        vc.datosJuegos1 = false
       
    
    }
    

}
