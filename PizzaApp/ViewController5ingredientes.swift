//
//  ViewController5ingredientes.swift
//  PizzaApp
//
//  Created by Mario E Salvatierra V on 1/7/16.
//  Copyright © 2016 Mario E Salvatierra V. All rights reserved.
//

import UIKit

class ViewController5ingredientes: UIViewController {
    
    var ordenDeView5Ingredientes = ["":[""]]
    
    @IBOutlet weak var jamonSwitch: UISwitch!
    @IBOutlet weak var peperoniSwitch: UISwitch!
    @IBOutlet weak var PavoSwitch: UISwitch!
    @IBOutlet weak var salchichaSwitch: UISwitch!
    @IBOutlet weak var aceitunaSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBar.hidden = true
       /*
        print(" ")
        for (k,v) in ordenDeView5Ingredientes {
            print(k)
            for dec2 in v {
                print(" \(dec2)")
            }
        } */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        let almenosUno = testAllSwitches()
        
        if (!almenosUno) {
            let alert = UIAlertController(title: "Los Ingredientes", message: "Al menos un ingrediente debe ser adicionado a la pizza para ordenar", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        return almenosUno
        
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var arrayIngredients = [""]
        if( self.jamonSwitch.on ) { arrayIngredients.append("Jamon")}
        if(self.peperoniSwitch.on) {arrayIngredients.append("Pepperoni")}
        if(self.PavoSwitch.on) {arrayIngredients.append("Pavo")}
        if(self.salchichaSwitch.on) {arrayIngredients.append("Salchicha")}
        if(self.aceitunaSwitch.on) {arrayIngredients.append("Aceituna")}
        arrayIngredients.removeFirst()
        
         ordenDeView5Ingredientes["Ingredientes"] = arrayIngredients
        
        let sigVista = segue.destinationViewController as! ViewControllerCocinar
        
        sigVista.ordenDeViewCocinar = ordenDeView5Ingredientes
        
    }
    
    
    
    
    func testAllSwitches()->Bool {
        
        let alMenosUno =
        self.jamonSwitch.on || self.peperoniSwitch.on ||
        self.PavoSwitch.on || self.salchichaSwitch.on ||
        self.aceitunaSwitch.on
        
        return alMenosUno
    }

}
