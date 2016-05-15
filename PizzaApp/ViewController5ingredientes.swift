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
    @IBOutlet weak var pimientoSwitch: UISwitch!
    @IBOutlet weak var piñaSwitch: UISwitch!
    @IBOutlet weak var anchoaSwitch: UISwitch!
    @IBOutlet weak var cebollasSwitch: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =  UIColor(patternImage: UIImage(named: "sliceofpizza.png")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        let almenosUno = testAllSwitches()
        
        if (!almenosUno.0) {
            let alert = UIAlertController(title: "Los Ingredientes", message: "Al menos un ingrediente debe ser adicionado a la pizza para ordenar", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
            return almenosUno.0
        }
        
            if (almenosUno.1 > 5 )
            {
                let alert = UIAlertController(title: "Los Ingredientes", message: "No mas de 5 ingrediente deben ser adicionado a la pizza para ordenar", preferredStyle: UIAlertControllerStyle.Alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alert, animated: true, completion: nil)
                
                return false
            }
            
            
            
            else{return true}
        
        
        
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var arrayIngredients = [""]
        if( self.jamonSwitch.on ) { arrayIngredients.append("Jamon")}
        if(self.peperoniSwitch.on) {arrayIngredients.append("Pepperoni")}
        if(self.PavoSwitch.on) {arrayIngredients.append("Pavo")}
        if(self.salchichaSwitch.on) {arrayIngredients.append("Salchicha")}
        if(self.aceitunaSwitch.on) {arrayIngredients.append("Aceituna")}
        if(self.pimientoSwitch.on) {arrayIngredients.append("Pimiento")}
        if(self.anchoaSwitch.on) {arrayIngredients.append("Anchoa")}
        if(self.cebollasSwitch.on) {arrayIngredients.append("Cebolla")}
         if(self.piñaSwitch.on) {arrayIngredients.append("Piña")}
        arrayIngredients.removeFirst()
        
         ordenDeView5Ingredientes["Ingredientes"] = arrayIngredients
        
        let sigVista = segue.destinationViewController as! ViewControllerCocinar
        
        sigVista.ordenDeViewCocinar = ordenDeView5Ingredientes
        
    }
    
    
    
    
    func testAllSwitches()->(Bool,Int) {
        
        let alMenosUno =
        self.jamonSwitch.on || self.peperoniSwitch.on ||
        self.PavoSwitch.on || self.salchichaSwitch.on ||
        self.aceitunaSwitch.on || self.anchoaSwitch.on ||
        self.pimientoSwitch.on || self.piñaSwitch.on ||
        self.anchoaSwitch.on || self.cebollasSwitch.on
        
        var numberOfIngredients = 0
        if( self.jamonSwitch.on ) { numberOfIngredients += 1}
        if(self.peperoniSwitch.on) {numberOfIngredients += 1}
        if(self.PavoSwitch.on) {numberOfIngredients += 1}
        if(self.salchichaSwitch.on) {numberOfIngredients += 1}
        if(self.aceitunaSwitch.on) {numberOfIngredients += 1}
        if(self.pimientoSwitch.on) {numberOfIngredients += 1}
        if(self.anchoaSwitch.on) {numberOfIngredients += 1}
        if(self.cebollasSwitch.on) {numberOfIngredients += 1}
        if(self.piñaSwitch.on) {numberOfIngredients += 1}
        
        return (alMenosUno, numberOfIngredients)
    }

}
