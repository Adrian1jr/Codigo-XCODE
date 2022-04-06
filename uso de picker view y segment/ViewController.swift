//
//  ViewController.swift
//  Clase30
//
//  Created by Karla Rodriguez on 30/03/22.
//

import UIKit

class ViewController: UIViewController
    ,UIPickerViewDelegate
    ,UIPickerViewDataSource{
   
    @IBOutlet weak var lblSeleccion: UILabel!
    @IBOutlet weak var pkvSelecciones: UIPickerView!
    @IBOutlet weak var imvImagen: UIImageView!
        
    let selecciones = ["", "Qatar"
                           ,"Alemania"
                           ,"Dinamarca"
                           ,"Brasil"
                           ,"Francia"
                           ,"Belgica"
                           ,"Croacia"
                           ,"España"
                           ,"Serbia"
                           ,"Inglaterra"
                           ,"Suiza"
                           ,"Países Bajos"
                           ,"Argentina"
                           ,"Irán"]
    let ranking = [0, 1,2,3,4,5,6,7,8,9,10,11,12,13,14]
    let colores = ["","Morado", "Azul","Verde", "Amarillo", "Gris"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        lblSeleccion.text = ""
        //conexion de los datos
        pkvSelecciones.dataSource = self
        pkvSelecciones.delegate = self
    }

    //numero de componentes (columnas)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //numero de renglones
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //return selecciones.count
        /*if component == 0 {     //Columna 1
            return ranking.count
        }else{  //Columna 2
            return selecciones.count
        }*/
        return selecciones.count
    }
    
    //indicar el listado
    //devolver el dato seleccionado del control de acuerdo al componente y el renglon
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return selecciones[row]
        /*if component == 0 {     //Columna 1
            return String(ranking[row])
        }else{  //Columna 2
            return selecciones[row]
        }*/
        return selecciones[row]
    }
    
    //controlar el valor seleccionado
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //lblSeleccion.text = selecciones[row]
        //pickerView.selectRow(row, inComponent: 1, animated: true)
        lblSeleccion.text = colores[row]
        //colores = ["","Morado", "Azul","Verde", "Amarillo", "Gris"]
        switch row {
        case 1:
            lblSeleccion.backgroundColor = .purple
            imvImagen.image = UIImage(named: "purple")
        case 2:
            lblSeleccion.backgroundColor = .blue
            imvImagen.image = UIImage(named: "blue")
        case 3:
            lblSeleccion.backgroundColor = .green
            imvImagen.image = UIImage(named: "green")
        case 4:
            lblSeleccion.backgroundColor = .yellow
            imvImagen.image = UIImage(named: "yellow")
        case 5:
            lblSeleccion.backgroundColor = .gray
            imvImagen.image = UIImage(named: "gray")
        default:
            lblSeleccion.backgroundColor = .clear
            imvImagen.image = nil
        }
        
    }
    @IBAction func ControlSegmento(_ sender: UISegmentedControl)
    {
        let indice = sender.selectedSegmentIndex
        lblSeleccion.text = colores[indice + 1]
        
        switch indice {
        case 0:
            lblSeleccion.backgroundColor = .purple
            imvImagen.image = UIImage(named: "purple")
        case 1:
            lblSeleccion.backgroundColor = .blue
            imvImagen.image = UIImage(named: "blue")
        case 2:
            lblSeleccion.backgroundColor = .green
            imvImagen.image = UIImage(named: "green")
        case 3:
            lblSeleccion.backgroundColor = .yellow
            imvImagen.image = UIImage(named: "yellow")
        case 4:
            lblSeleccion.backgroundColor = .gray
            imvImagen.image = UIImage(named: "gray")
        default:
            lblSeleccion.backgroundColor = .clear
        }
    }
        

}

