//
//  ViewController.swift
//  PizzaApp
//
//  Created by Mario E Salvatierra V on 1/6/16.
//  Copyright © 2016 Mario E Salvatierra V. All rights reserved.
//

import UIKit
@IBDesignable
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var tamañoPicker: UIPickerView!
    @IBOutlet weak var imagenesSizeView: UIImageView!
    
    var ArrayTamaño = ["Chica", "Mediana", "Grande"];
    var ArrayImagenesSize = ["chicaSize.png","medianaSize.png","grandeSize.png"]
    var TamañoSelecionado = "Chica"
    
    var ordenDeViewTamaño = ["":[""]]
    //var ordenDeViewTamaño = ["Tamaño":["Chico"], "Masa":["Delagada"], "Queso":["Mozarela"], "x5ingredientes":["Jamon"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tamañoPicker.delegate = self
        self.tamañoPicker.dataSource = self
         self.view.backgroundColor =  UIColor(patternImage: UIImage(named: "sliceofpizza.png")!)
        self.imagenesSizeView.image = UIImage(named: ArrayImagenesSize[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        ordenDeViewTamaño["Tamaño"] = [TamañoSelecionado]
        let sigVista = segue.destinationViewController as! ViewControllerMasa
        ordenDeViewTamaño[""] = nil
        sigVista.ordenDeViewMasa = ordenDeViewTamaño
        
       // let prevVista = segue.destinationViewController as! ViewControllerInicios
       // prevVista.luigiOK.center = prevVista.view.center
        
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ArrayTamaño[row]
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ArrayTamaño.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        
        return 1
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        TamañoSelecionado = ArrayTamaño[row]
        //print(ArrayImagenesSize[row])
        let laimagen = UIImage(named: ArrayImagenesSize[row])
        self.imagenesSizeView.image = laimagen
       
    }
    
    
}

