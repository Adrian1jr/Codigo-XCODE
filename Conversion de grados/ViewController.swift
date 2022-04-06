//
//  ViewController.swift
//  ClaseMartes
//
//  Created by Karla Rodriguez on 29/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var swInvertir: UISwitch!
    @IBOutlet weak var lblResultado: UILabel!
        
    @IBOutlet weak var lblFarenheit: UILabel!
    @IBOutlet weak var lblCentigrados: UILabel!
    @IBOutlet weak var sldGrados: UISlider!
    @IBOutlet weak var txtGrados: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResultado.text=""
        lblFarenheit.text = ""
        lblCentigrados.text = ""
        

    }

    @IBAction func btnResultado(_ sender: Any) {
        var C: Double
        C = Double(txtGrados.text!)!
        var Resultado: Double
        if(swInvertir.isOn){
            Resultado = Double((C*9/5) + 32)
        }else{
            Resultado = Double((C-32)*5/9)
        }
        lblResultado.text = String(Resultado)
    }
    
    @IBAction func Invertir(_ sender: Any) {
        txtGrados.text = ""
        lblResultado.text=""
        lblFarenheit.text = ""
        lblCentigrados.text = ""
        sldGrados.value = 0
    }
    
    @IBAction func Aumentar(_ sender: Any) {
        var C: Int
        C = Int(sldGrados.value)
        var Resultado: Int
        if(swInvertir.isOn){
            Resultado = Int((C*9/5) + 32)
        }else{
            Resultado = Int((C-32)*5/9)
        }
        lblCentigrados.text = String(C)
        lblFarenheit.text = String(Resultado)
    }
    
}

