//
//  Circunferencia.swift
//  Figuras
//
//  Created by Karla Rodriguez on 05/04/22.
//

import Foundation
class Circunferencia: Figura {
  private var radio : Double
  
  init(radio: Double){
    self.radio = radio
  }

  /*
  override init()
  {
     self.radio = 0
  }
   */
 
  var Radio: Double{
    get {return radio}
    set {radio = newValue}
  }

   override func CalcularArea() -> Double{
    return  radio * radio * 3.1416
   }
}
