//
//  ViewControllerQueso.swift
//  PizzaApp
//
//  Created by Mario E Salvatierra V on 1/6/16.
//  Copyright © 2016 Mario E Salvatierra V. All rights reserved.
//

import UIKit

class ViewControllerQueso: UIViewController, UIPickerViewDelegate {

    var ordenDeViewQueso = ["":[""]]
    var arrayQueso = ["Mozarela", "Cheddar", "Parmesano", "Sin queso"]
    var quesoSeleccionado = "Mozarela"
    
    @IBOutlet weak var pickerQueso: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerQueso.delegate = self
       /*
        for (k,v) in ordenDeViewQueso {
            print(k)
            for dec2 in v {
                print(" \(dec2)")
            }
        }*/
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        ordenDeViewQueso["Queso"] = [quesoSeleccionado]
        let sigVista = segue.destinationViewController as! ViewController5ingredientes
        
        sigVista.ordenDeView5Ingredientes = ordenDeViewQueso
        
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayQueso[row]
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayQueso.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        
        return 1
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        quesoSeleccionado = arrayQueso[row]
        //NSLog(masaSeleccionada)
    }
    
}
