//
//  Rectangulo.swift
//  Figuras
//
//  Created by Karla Rodriguez on 05/04/22.
//

import Foundation
class Rectangulo: Figura {
  private var largo: Double
  private var ancho: Double


  init(largo: Double, ancho: Double) {
    self.largo = largo
    self.ancho = ancho
  }
    /*
     override init()
     {
        self.largo = 0
        self.ancho = 0
     }
     */
  
  var Largo: Double{
    get{return largo}
    set {largo = newValue}
  }

  var Ancho: Double{
    get{return ancho}
    set {ancho = newValue}
  }
  
  override func CalcularArea() -> Double {
    return largo * ancho
      //railRatioLabelField.text! = String(format: "%.2f", currentRatio)
  }
}
