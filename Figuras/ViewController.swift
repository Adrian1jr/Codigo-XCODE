//
//  ViewController.swift
//  Figuras
//
//  Created by Karla Rodriguez on 05/04/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sgcFigura: UISegmentedControl!
    @IBOutlet weak var lblEtiqueta1: UILabel!
    @IBOutlet weak var lblEtiqueta2: UILabel!
    @IBOutlet weak var txtEntrada1: UITextField!
    @IBOutlet weak var txtEntrada2: UITextField!
    @IBOutlet weak var lblResultado: UILabel!
    var seleccion: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblEtiqueta1.text = "Largo"
        lblEtiqueta2.text = "Ancho"
        lblResultado.text = ""
    }
    
    @IBAction func SeleccionarFigura(_ sender: UISegmentedControl) {
        seleccion = sgcFigura.selectedSegmentIndex
        switch seleccion{
        case 0:
            lblEtiqueta1.text = "Largo"
            lblEtiqueta2.text = "Ancho"
            lblResultado.text = ""
            txtEntrada1.isHidden = false
            txtEntrada2.isHidden = false
            txtEntrada1.text = ""
            txtEntrada2.text = ""
        case 1:
            lblEtiqueta1.text = "Altura"
            lblEtiqueta2.text = "Ancho"
            lblResultado.text = ""
            txtEntrada1.isHidden = false
            txtEntrada2.isHidden = false
            txtEntrada1.text = ""
            txtEntrada2.text = ""
        default:
            lblEtiqueta1.text = "Radio"
            lblEtiqueta2.text = ""
            lblResultado.text = ""
            txtEntrada1.isHidden = false
            txtEntrada2.isHidden = true
            txtEntrada1.text = ""
            txtEntrada2.text = ""
        }
    }
    @IBAction func CalcularArea(_ sender: UIButton) {
        var area: Double = 0
        switch seleccion{
        case 0:
            let rectangulo = Rectangulo(largo: Double(txtEntrada1.text!)!, ancho: Double(txtEntrada2.text!)!)
            
            area = rectangulo.CalcularArea()
        case 1:
            let triangulo = Triangulo(altura: Double(txtEntrada1.text!)!, ancho: Double(txtEntrada2.text!)!)
            
            area = triangulo.CalcularArea()
        default:
            let circunferencia = Circunferencia(radio: Double(txtEntrada1.text!)!)
            
            area = circunferencia.CalcularArea()
        }
        
        lblResultado.text = "Area = \(area)"
    }
    
}

