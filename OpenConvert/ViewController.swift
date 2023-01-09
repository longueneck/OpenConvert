//
//  ViewController.swift
//  OpenConvert
//
//  Created by Kevin Longue on 06/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lbUnit: UILabel!
    @IBOutlet weak var tfInsert: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbTextResult: UILabel!
    @IBOutlet weak var lbResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        tfInsert.resignFirstResponder()
    }
    
    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {
        case "Temperatura":
            lbUnit.text = "Peso"
            btUnit1.setTitle("Quilograma", for: .normal)
            btUnit2.setTitle("Libras", for: .normal)
        case "Peso":
            lbUnit.text = "Moeda"
            btUnit1.setTitle("Dólar", for: .normal)
            btUnit2.setTitle("Real", for: .normal)
        case "Moeda":
            lbUnit.text = "Distancia"
            btUnit1.setTitle("Quilometro", for: .normal)
            btUnit2.setTitle("Milhas", for: .normal)
        default:
            lbUnit.text = "Temperatura"
            btUnit1.setTitle("Célcius", for: .normal)
            btUnit2.setTitle("Fahrenheit", for: .normal)
        }
        
        convert(nil)
        
    }
    
    
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1{
                btUnit2.alpha = 0.5
            }else{
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch lbUnit.text!{
        case "Temperatura":
            calcTemp()
        case "Peso":
            calcPeso()
        case "Moeda":
            calcMoeda()
        default:
            calcDistance()
            
        }
    }
    
    func calcTemp() {
        guard let temp = Double(tfInsert.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbTextResult.text = "Fahrenheit"
            lbResult.text = String(temp * 1.8 + 32.0)
        }else{
            lbTextResult.text = "Célcius"
            lbResult.text = String((temp - 32 ) / 1.8 )
        }
    }
    func calcPeso() {
        guard let peso = Double(tfInsert.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbTextResult.text = "Libra"
            lbResult.text = String(peso / 2.2046)
        }else {
            lbTextResult.text = "Quilograma"
            lbResult.text = String(peso * 2.2046)
        }
    }
    func calcMoeda() {
                guard let moeda = Double(tfInsert.text!) else {return}
                if btUnit1.alpha == 1.0{
                    lbTextResult.text = "Dólar"
                    lbResult.text = String(moeda * 5.25)
                }else{
                    lbTextResult.text = "Célcius"
                    lbResult.text = String(moeda / 5.23 )
            }
        }
    func calcDistance() {
                guard let moeda = Double(tfInsert.text!) else {return}
                if btUnit1.alpha == 1.0{
                    lbTextResult.text = "Dólar"
                    lbResult.text = String(moeda * 5.25)
                }else{
                    lbTextResult.text = "Célcius"
                    lbResult.text = String(moeda / 5.23 )
            }
        }
    
    
    
    
    
    
    
    
    
    
    
    
}
    
    
    
    
    
    
    
/*
    func calcPeso() {
        guard let peso = Double(tfInsert.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbTextResult.text = "Libra"
            lbResult.text = String(peso / 2.2046
        } else {
            lbTextResult.text = "Quilograma"
                lbResult.text = String((peso * 2.2046)
        }
    }
                                       
    
    func calcMoeda() {
        guard let moeda = Double(tfInsert.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbTextResult.text = "Dólar"
            lbResult.text = String(moeda * 5.25)
        }else{
            lbTextResult.text = "Célcius"
            lbResult.text = String((moeda / 5.23 )
        }
    }
    
    
    func calcDistance() {
        guard let dist = Double(tfInsert.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbTextResult.text = "Metro"
            lbResult.text = String(dist * 1.8 + 32.0)
        }else{
            lbTextResult.text = "Metro"
            lbResult.text = String((dist - 32 ) / 1.8 )
        }
    }
    
                                   } */
