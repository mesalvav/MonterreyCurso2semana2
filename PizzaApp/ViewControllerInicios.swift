//
//  ViewControllerInicios.swift
//  PizzaApp
//
//  Created by Mario E Salvatierra V on 5/13/16.
//  Copyright © 2016 Mario E Salvatierra V. All rights reserved.
//

import UIKit

class ViewControllerInicios: UIViewController {

    
    
    @IBOutlet weak var luigiOK: UIImageView!
   
    @IBOutlet weak var luigiOKtop: NSLayoutConstraint!
    
    
    @IBOutlet weak var comenzarBoton: UIButton!
    @IBOutlet weak var flyingSlide: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.view.backgroundColor =  UIColor(patternImage: UIImage(named: "sliceofpizza.png")!)
        // Do any additional setup after loading the view.
    self.view.backgroundColor =  UIColor(patternImage: UIImage(named: "sliceofpizza.png")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        luigiOKtop.constant -= self.view.bounds.height
       
    }
    
    override func viewDidAppear(animated: Bool) {
       super.viewDidAppear(animated)
     
        self.descendiendoLuigi()
        self.flyingSlideOfPizza()
        self.cambiaColorDelBoton()
    }
    
    func descendiendoLuigi() {
        
        UIView.animateWithDuration(2.0,
                                   delay: 0.0,
                                   options: UIViewAnimationOptions.CurveEaseInOut,
                                   animations: {
                                    self.luigiOKtop.constant += self.view.bounds.height
                                    self.view.layoutIfNeeded() },
                                   completion: { finished in self.rotateLuigi()})
    }
    
    func rotateLuigi() {
        UIView.animateWithDuration(2.5,
                                   delay: 0.0,
                                   options: .CurveEaseInOut ,
                                   animations: {
                                    self.luigiOK.transform = CGAffineTransformMakeRotation(CGFloat(0.2*M_PI))
                                    self.view.layoutIfNeeded() },
                                   completion: {finished in self.rotateLuigi2()})
        
    }
    
    func rotateLuigi2() {
        UIView.animateWithDuration(2.5,
                                   delay: 0.0,
                                   options: .CurveEaseInOut ,
                                   animations: {
                                    self.luigiOK.transform = CGAffineTransformMakeRotation(CGFloat(-0.2*M_PI))
                                    self.view.layoutIfNeeded() },
                                   completion: {finished in self.rotateLuigi()} )
        
    }
    
    func flyingSlideOfPizza() {
        let anchoview =  UInt32(self.view.bounds.width)
        let largoview = UInt32(self.view.bounds.height)
        let randomPositionX = CGFloat( arc4random_uniform(anchoview))
        let randomPositionY = CGFloat(arc4random_uniform(largoview))
        
        
        UIView.animateWithDuration(1.5,
                                   delay: 0.3,
                                   options: .CurveEaseInOut ,
                                   animations: {
                                    self.flyingSlide.center =
                                        CGPoint(x: randomPositionX, y: randomPositionY)
                                   
                                    self.view.layoutIfNeeded() },
                                   completion: {finished in self.flyingSlideOfPizza2()} )
    }
    
    func flyingSlideOfPizza2() {
        
        UIView.animateWithDuration(1.5,
                                   delay: 0.0,
                                   options: .CurveEaseInOut ,
                                   animations: {
                                    self.flyingSlide.center =
                                        self.comenzarBoton.center
                                    
                                    self.view.layoutIfNeeded() },
                                   completion: {finished in self.flyingSlideOfPizza()} )
    }
    
    
    func cambiaColorDelBoton() {
       
        
        let rojo = Float(drand48())//Float(arc4random_uniform(255))
        let verde = Float(drand48())//Float( arc4random_uniform(255))
        let azul = Float(drand48())//Float(arc4random_uniform(255))
        let randomColor = UIColor(colorLiteralRed: rojo, green: verde, blue: azul, alpha: 1.0)
        
        UIView.animateWithDuration(1.5,
                                   delay: 0.5,
                                   options: .CurveEaseInOut ,
                                   animations: {
                                    
                                    self.comenzarBoton.setTitleColor(randomColor, forState: UIControlState.Normal )
                                    self.view.layoutIfNeeded() },
                                   completion: {finished in self.cambiaColorDelBoton()} )
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
