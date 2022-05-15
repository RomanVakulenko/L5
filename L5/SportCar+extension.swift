//
//  SportCar+extension.swift
//  L5
//
//  Created by Roman Vakulenko on 13.05.2022.
//

import Foundation
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
class SportCar: Car, Togglable {
    func toggle() {
        //don't use
    }
    
    var brand: String = ""
    var type: TypeOfCar
    var productionYear: Int
    var trunkVolume: Int
    var amountOfSeats: Int
    var speed: Int
    required init(brand: String, type: TypeOfCar, productionYear: Int, trunkVolume: Int) { //
        self.brand = brand
        self.type = type
        self.productionYear = productionYear
        self.trunkVolume = trunkVolume
        self.amountOfSeats = 2 //6ой вопрос - так я инициализировал дополнительные свойства, верно?
        self.speed = 320 //6ой вопрос: так я инициализировал дополнительные свойства, верно?
    }
}
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension SportCar: CustomStringConvertible {
    var description: String {
        return "Additional protocol was implemented - it prints from class anything you like and write about it in print, e.g.:\n brand = \(brand)\n type = \(type)"
    }
}
