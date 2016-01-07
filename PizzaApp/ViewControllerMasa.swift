//
//  ViewControllerMasa.swift
//  PizzaApp
//
//  Created by Mario E Salvatierra V on 1/6/16.
//  Copyright © 2016 Mario E Salvatierra V. All rights reserved.
//

import UIKit

class ViewControllerMasa: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var ordenDeViewMasa = ["":[""]]
    //var dicciOfarray = ["Tamaño":["Chico"], "Masa":["Delagada"], "Queso":["Mozarela"], "x5ingredientes":["jamøn"]]
    var arrayMasa = ["Delgada", "Crujiente", "Gruesa"]
    var masaSeleccionada = "Delgada"
    
    @IBOutlet weak var masaPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("Tamaño de pizza \(ordenDeViewMasa["Tamaño"]![0])")
        
        self.masaPicker.delegate = self
        self.masaPicker.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        ordenDeViewMasa["Masa"] = [masaSeleccionada]
        let sigVista = segue.destinationViewController as! ViewControllerQueso
        sigVista.ordenDeViewQueso = ordenDeViewMasa
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayMasa[row]
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayMasa.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        
        return 1
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        masaSeleccionada = arrayMasa[row]
        //NSLog(masaSeleccionada)
    }
    

}
