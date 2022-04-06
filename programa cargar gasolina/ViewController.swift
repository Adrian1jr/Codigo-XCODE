//
//  ViewController.swift
//  Clase2
//
//  Created by Karla Rodriguez on 28/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sldCoche: UISlider!
    @IBOutlet weak var aiCargando: UIActivityIndicatorView!
    @IBOutlet weak var lblGasolina: UILabel!
    @IBOutlet weak var lblProgreso: UILabel!
    @IBOutlet weak var pvProgreso: UIProgressView!
    var progreso = 0
    @IBOutlet weak var stCochesCargados: UIStepper!
    @IBOutlet weak var lblCochesCargados: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblGasolina.text = ""
        lblProgreso.text = ""
        lblCochesCargados.text = ""
    }

    @IBAction func CargarGasolina(_ sender: UISlider) {
        //funcion para controlar el movimiento del Slider
        let litros = Int(sldCoche.value)
        lblGasolina.text = String(litros)
        
        //indicador de actividad
        aiCargando.startAnimating()
        
        if litros > 35{
            aiCargando.stopAnimating()
        }
    }
    
    @IBAction func CargarProgreso(_ sender: UIButton) {
        let inicio = progreso
        let final = 10
        
        if inicio <= final{
            let aumento = Float(inicio) / Float(final)
            
            pvProgreso.progress = aumento
            
            lblProgreso.text = "Cargando \(inicio) de \(final)..."
            progreso += 1
        }
    }
    
    @IBAction func OtroCoche(_ sender: UIStepper) {
        let coches = Int(stCochesCargados.value)
        lblCochesCargados.text = String(coches)
    }
    
    
}

