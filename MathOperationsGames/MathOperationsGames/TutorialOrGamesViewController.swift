//
//  TutorialOrGamesViewController.swift
//  MathOperationsGames
//
//  Created by Alumno on 3/20/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

class TutorialOrGamesViewController: UIViewController {
    
    var currentOperacion: Operations!
    
    var auxOperacion: String!
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet var tapTutorialOutlet: UITapGestureRecognizer!
    
    @IBOutlet var tapPlayOutlet: UITapGestureRecognizer!
    
    @IBOutlet weak var imageTutorialOutlet: UIImageView!
    @IBOutlet weak var imagePlayOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageTutorialOutlet.isUserInteractionEnabled = true
        imagePlayOutlet.isUserInteractionEnabled = true
        titleOutlet.text = currentOperacion.operationName
        
        auxOperacion = currentOperacion.operationName
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapTutorialPressed(_ sender: UITapGestureRecognizer) {
        print("Pressed")
    }
    
    @IBAction func tapPlayPressed(_ sender: UITapGestureRecognizer) {
        print("Pressed")
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueTutorialIdentifier"{
            let vistaTutorial = segue.destination as! TutorialViewController
            vistaTutorial.currentOperacion = currentOperacion
        }
        else{
            var vistaPlay = segue.destination as! GameViewController
            
            vistaPlay.operacion = self .auxOperacion
            
           
        
            
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
