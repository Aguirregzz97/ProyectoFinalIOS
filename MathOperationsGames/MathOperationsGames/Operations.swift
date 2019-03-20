//
//  Operations.swift
//  MathOperationsGames
//
//  Created by Alumno on 3/20/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

class Operations: NSObject {
    
    var operationName: String
    var operationImage: UIImage
    
    init(operationName: String, operationImage: UIImage) {
        self.operationName = operationName
        self.operationImage = operationImage
    }

}
