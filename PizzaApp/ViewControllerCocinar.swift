//
//  ViewControllerCocinar.swift
//  PizzaApp
//
//  Created by Mario E Salvatierra V on 1/7/16.
//  Copyright © 2016 Mario E Salvatierra V. All rights reserved.
//

import UIKit

class ViewControllerCocinar: UIViewController {

    var ordenDeViewCocinar = ["":[""]]
    
    
    @IBOutlet weak var ordenDeCliente: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       /*
        print(" ")
        for (k,v) in ordenDeViewCocinar {
            print(k)
            for dec2 in v {
                print(" \(dec2)")
            }
        }*/
        
        var res = "Usted ordeno:  \n"
        for (k,v) in ordenDeViewCocinar {
            res = res + k + "\n"
            for dec2 in v {
                res = res + "  \(dec2)"
            }
            res = res + "\n"
        }

        
        //let ordenCliente = String()
        self.ordenDeCliente.text = res
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    echo "# MonterreyCurso2semana2" >> README.md
    git init
    git add README.md
    git commit -m "first commit"
    git remote add origin https://github.com/mesalvav/MonterreyCurso2semana2.git
    git push -u origin master
    
    ///
    git remote add origin https://github.com/mesalvav/MonterreyCurso2semana2.git
    git push -u origin master
    
    */

}
