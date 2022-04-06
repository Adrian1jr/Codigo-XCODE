//
//  ViewController.swift
//  Clase1
//
//  Created by Karla Rodriguez on 15/03/22.
//

import UIKit

class ViewController: UIViewController {
    var numeros:[Int] = [4,9,3,1,8,0,5,7,16]
    var puntero = 0
    var orden = 0 //0 es de Izq -> Der y 1 es de Izq <- Der
        
    //etiquetas para mostrar valores
    @IBOutlet weak var lblPuntero: UILabel!
    @IBOutlet weak var lblNumero: UILabel!
    @IBOutlet weak var lblNumeroLetra: UILabel!
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var switchNombre: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblPuntero.text = ""
        lblNumero.text = ""
        lblNumeroLetra.text = ""
        switchNombre.isOn = false
        txtNombre.isEnabled = false
    }
        
    @IBAction func btnNumSiguiente(_ sender: UIButton) {
        //Se ejecuta este bloque cuando se da clic en el boton
        print("Le diste clic al boton")
        print("Numero en la posicion \(puntero) es \(numeros[puntero])")
        
        //mostrar los valores en pantalla
        lblPuntero.text = String(puntero)
        lblNumero.text = String(numeros[puntero])
        let numeroLetra = ConvertirNumeroLetra(numero: numeros[puntero])
        lblNumeroLetra.text = numeroLetra
        if orden == 0{
            if puntero < numeros.count{
                puntero += 1
            }
            if puntero == numeros.count
            {
                //ya se llegó al final del arreglo
                puntero = 0
            }
        }else{ //[4,9,3,1,8,0,5,7,16]
            //puntero = numeros.count - 1
            if puntero >= 0{
                puntero -= 1
            }
            if puntero < 0
            {
                //ya se llegó al final del arreglo
                puntero = numeros.count - 1
            }
        }
        
        if switchNombre.isOn{
            let nombre = txtNombre.text
            //print(nombre)
            if nombre != nil{
                print(nombre!)
            }
        }
    }
    
    func ConvertirNumeroLetra(numero: Int) -> String
    {
        var numeroConvertido = ""
        switch (numero)
        {
            case 0:
            numeroConvertido = "Cero"
            case 1:
            numeroConvertido = "Uno"
            case 2:
            numeroConvertido = "Dos"
            case 3:
            numeroConvertido = "Tres"
            case 4:
            numeroConvertido = "Cuatro"
            case 5:
            numeroConvertido = "Cinco"
            case 6:
            numeroConvertido = "Seis"
            case 7:
            numeroConvertido = "Siete"
            case 8:
            numeroConvertido = "Ocho"
            case 9:
            numeroConvertido = "Nueve"
            default:
                numeroConvertido = "Mayor a 9"
        }
        return numeroConvertido
    }
    
    //Control Switch
    @IBAction func switchInvertir(_ sender: UISwitch) {
        //controlar los cambios del control switch
        print("Switch activado/desactivado")
        
        //identificar si esta encedido o apagado
        if sender.isOn{
            print("Encendido")
            puntero = 0
            orden = 0
            mostarAlerta(tipoAlerta: 1, animacion: true, mensaje: "Se ha invertido el orden de la secuencia de los numeros")
        }else{
            print("Apagado")
            puntero = numeros.count - 1
            orden = 1
            mostarAlerta(tipoAlerta: 2, animacion: true, mensaje: "")
        }
        lblNumero.text = ""
        lblPuntero.text = ""
        lblNumeroLetra.text = ""
    }
    
    func mostarAlerta(tipoAlerta: Int, animacion: Bool, mensaje: String){
        //declarar alerta
        let alerta: UIAlertController
        
        if tipoAlerta == 1{
            //crear la alerta
            //inicializarla con un tituulo, mensaje, estilo
            alerta = UIAlertController(
                title: "Aviso"
                , message: mensaje
                , preferredStyle: .alert)
            
            //agregar acciones a una alerta (botones)
            //Titulo -> Lo que dira el boton
            //Estilo -> el tipo de boton
            //Default -> ok
            //Cancel -> para cancelar en negrita
            //Destructive -> Aparece en rojo. Para aquellas acciones que no se puedad deshacer.
            alerta.addAction(UIAlertAction(
                title: "Aceptar"
                , style: .default
                , handler: {action in print("Se presiono el boton de Aceptar")}))
            
            alerta.addAction(UIAlertAction(
                title: "Cancelar"
                , style: .cancel
                , handler: {action in print("Se presiono el boton de Cancelar")}))
            
            //una vez creada hay que mostrarla en pantalla
            present(alerta
                    , animated: animacion
                    , completion: nil)
        }
        else if tipoAlerta == 2{
            //crear la alerta
            //inicializarla con un tituulo, mensaje, estilo
            alerta = UIAlertController(
                title: "Aviso"
                , message: "Se ha invertido el orden de la secuencia de los numeros"
                , preferredStyle: .actionSheet)
            
            //agregar acciones a una alerta (botones)
            //Titulo -> Lo que dira el boton
            //Estilo -> el tipo de boton
            //Default -> ok
            //Cancel -> para cancelar en negrita
            //Destructive -> Aparece en rojo. Para aquellas acciones que no se puedad deshacer.
            alerta.addAction(UIAlertAction(
                title: "Aceptar"
                , style: .default
                , handler: {action in print("Se presiono el boton de Aceptar")}))
            
            //el boton cancelar siempre sale al final
            alerta.addAction(UIAlertAction(
                title: "Cancelar"
                , style: .cancel
                , handler: {action in print("Se presiono el boton de Cancelar")}))
            
            //Del Estilo .cancel y .destructive SOLAMENTE podemos tener 1 boton
            alerta.addAction(UIAlertAction(
                title: "Elimintar Todo"
                , style: .destructive
                , handler: {action in print("Se presiono el boton de Eliminar Todo")}))
            
            //Del Estilo .default se pueden agregar varios
            alerta.addAction(UIAlertAction(
                title: "OK"
                , style: .default
                , handler: {action in print("Se presiono el boton de OK")}))
            
            //para el orden de visualizacion se toman a como esten codificados. A excepcion del cancelar. Ese SIEMPRE sale al final
            
            //una vez creada hay que mostrarla en pantalla
            present(alerta
                    , animated: animacion
                    , completion: nil)
        }else if tipoAlerta == 3{
            //crear la alerta
            //inicializarla con un tituulo, mensaje, estilo
            alerta = UIAlertController(
                title: "Datos personales"
                , message: "Ingrese su correo/password"
                , preferredStyle: .alert)
            
            //agregar las cajas de texto
            alerta.addTextField{(email) in
                email.placeholder = "Correo"
                email.keyboardType = .emailAddress
            }
            
            alerta.addTextField{(password) in
                password.placeholder = "Password"
                password.isSecureTextEntry = true
            }
            
            //agregar acciones a una alerta (botones)
            alerta.addAction(UIAlertAction(
                title: "Aceptar"
                , style: .default
                , handler: {(_) in
                    guard let campos = alerta.textFields
                            ,campos.count == 2 else{
                                print("Deben ser 2 celdas de texto")
                                return
                            }
                    //tomar los campos de texto, son de tipo UITextField
                    let txtEmail = campos[0]
                    let txtPassword = campos[1]
                    
                    //obtener el valor dentro de los textbox
                    guard let email = txtEmail.text
                            ,!email.isEmpty
                            ,let password = txtPassword.text
                            ,!password.isEmpty else{
                                print ("Correo/Password no puede ser vacio")
                                return
                            }
                    
                    print("Correo: \(email)\nPassword: \(password)")
                }
            ))
            
            alerta.addAction(UIAlertAction(
                title: "Cancelar"
                , style: .cancel
                , handler: {action in print("Se presiono el boton de Cancelar")}))
            
            //una vez creada hay que mostrarla en pantalla
            present(alerta
                    , animated: animacion
                    , completion: nil)
        }else if tipoAlerta == 4{
            //crear la alerta
            //inicializarla con un tituulo, mensaje, estilo
            alerta = UIAlertController(
                title: "Nuevo Arreglo"
                , message: "Ingrese la cantidad de elementos que desea"
                , preferredStyle: .alert)
            
            //agregar las cajas de texto
            alerta.addTextField()
            
            //agregar acciones a una alerta (botones)
            alerta.addAction(UIAlertAction(
                title: "Aceptar"
                , style: .default
                , handler: { [self](_) in
                    guard let campos = alerta.textFields
                            ,campos.count == 1 else{
                                print("Debe ser 1 celdas de texto")
                                return
                            }
                    //tomar los campos de texto, son de tipo UITextField
                    let txtCantidad = campos[0]
                    
                    //obtener el valor dentro de los textbox
                    guard let nuevaCantidad = txtCantidad.text
                            ,!nuevaCantidad.isEmpty else{
                                print ("Cantidad no puede ser vacio")
                                return
                            }
                    
                    print("Cantidad: \(nuevaCantidad)")
                    GenerarNuevoArreglo(posiciones: Int(nuevaCantidad)!)
                }
            ))
            
            alerta.addAction(UIAlertAction(
                title: "Cancelar"
                , style: .cancel
                , handler: {action in print("Se presiono el boton de Cancelar")}))
            
            //una vez creada hay que mostrarla en pantalla
            present(alerta
                    , animated: animacion
                    , completion: nil)
        }
    }
    
    
    @IBAction func CapturarNombre(_ sender: UISwitch) {
        //funcion se ejecuta al activar/desactivar el switch
        if sender.isOn{
            txtNombre.isEnabled = true
        }else{
            txtNombre.isEnabled = false
            txtNombre.text = nil
        }
    }
    
    
    @IBAction func IniciarSesion(_ sender: UIButton) {
        mostarAlerta(tipoAlerta: 3, animacion: true, mensaje: "")
    }
    
    
    @IBAction func ActualizarArreglo(_ sender: UIButton) {
        mostarAlerta(tipoAlerta: 4, animacion: true, mensaje: "")
    }
    
    func GenerarNuevoArreglo( posiciones: Int){
        //limpiar arreglo actual
        numeros.removeAll()
        
        var aleatorio:Int //= Int.random(in: 0...15)
        //print(aleatorio)
        var arregloCadena: String = ""
        
        for _ in 0..<posiciones{
            aleatorio = Int.random(in: 0...15)
            numeros.append(aleatorio)
            arregloCadena += "[\(String(aleatorio))]"
        }
        
        mostarAlerta(tipoAlerta: 1, animacion: true, mensaje: arregloCadena)
        
    }
    
    
    @IBAction func click(_ sender: UIButton) {
        print("test")
    }
    
    @IBAction func prueba(_ sender: UISwitch) {
        if sender.isOn {
            print("Encendido")
        }else{
            print("Apagado")
        }
    }
}

