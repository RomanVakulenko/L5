//
//  Car.swift
//  L5
//
//  Created by Roman Vakulenko on 13.05.2022.
//

import Foundation
//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
enum TypeOfCar {
    case sportOne
    case tunkCar
}
enum Fuel{
    case gasoline
    case diezel
}
enum ActionsWithWindows{
    case open, close
}
enum ActionsWithEngine: String{
    case start = "start"
    case stop = "stop"
    // 1.инамы можно объявлять где удобно, помнить про область видимости
}

protocol Car {
    var brand: String { get set }
    var type: TypeOfCar { get set }
    var productionYear: Int { get set }
    var trunkVolume: Int { get set }
    var engineState: String { get set }
}

//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей)
extension Car {
    func engineAction (engineState: ActionsWithEngine) -> String {
        switch engineState {
        case .start: ActionsWithEngine.start
        case .stop: ActionsWithEngine.stop
        }   
        return " do \(engineState)"
    }
}

//нижерасположенное сочетание протокола и действия нашел в swiftbook
protocol Togglable {
    mutating func toggle()
}
enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off: self = .on
        case .on: self = .off
        }
    }
}
