//
//  TutorialViewController.swift
//  MathOperationsGames
//
//  Created by Alumno on 3/22/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit
import WebKit

class TutorialViewController: UIViewController, WKNavigationDelegate {
    
    var currentOperacion: Operations!

    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView = WKWebView()
        myWebView.navigationDelegate = self
        view = myWebView
        getVideo(videoCode: currentOperacion.operationTutorialCode)
        // Do any additional setup after loading the view.
    }
    
    func getVideo(videoCode: String) {
        print(videoCode)
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        myWebView.load(URLRequest(url: url!))
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
