//
//  Triangulo.swift
//  Figuras
//
//  Created by Karla Rodriguez on 05/04/22.
//

import Foundation
class Triangulo: Figura
{
  private var altura: Double
  private var ancho: Double
  
    /*
  override init()
  {
    self.altura = 10
    self.ancho = 0
  }*/


  init(altura: Double, ancho: Double)
  {
    self.altura = altura
    self.ancho = ancho
  }

  var Altura: Double{
    get{return altura}
    set {altura = newValue}
  }

  var Ancho: Double{
    get{return ancho}
    set {ancho = newValue}
  }

  override func CalcularArea() -> Double{
    let area = (altura * ancho) / 2
    return area
  }
}



