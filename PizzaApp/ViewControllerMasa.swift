//
//  ViewControllerMasa.swift
//  PizzaApp
//
//  Created by Mario E Salvatierra V on 1/6/16.
//  Copyright © 2016 Mario E Salvatierra V. All rights reserved.
//

import UIKit
import AVFoundation

class ViewControllerMasa: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var ordenDeViewMasa = ["":[""]]
    //var dicciOfarray = ["Tamaño":["Chico"], "Masa":["Delagada"], "Queso":["Mozarela"], "x5ingredientes":["jamøn"]]
    var arrayMasa = ["Delgada", "Crujiente", "Gruesa"]
    var masaSeleccionada = "Delgada"
    var arrayDeGrosores = ["1/8\"=>","1/4\"=>","8/9\"=>"]
    @IBOutlet weak var masaPicker: UIPickerView!
    
    @IBOutlet weak var grosorDeMasa: UILabel!
    
       var audioPlayer = try? AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("soyunapizza", ofType: "mp3")!))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.masaPicker.delegate = self
        self.masaPicker.dataSource = self
        self.view.backgroundColor =  UIColor(patternImage: UIImage(named: "sliceofpizza.png")!)
        
       
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        audioPlayer!.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       audioPlayer!.stop()
        
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
        self.grosorDeMasa.text = arrayDeGrosores[row]
        //NSLog(masaSeleccionada)
    }
    

}
