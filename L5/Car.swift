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
enum ActionsWithEngine{
    case start, stop// 1вопрос: Где лучше объявлять ИНАМЫ в работе с протоколами, расширениями - в файле с классом,где функци обращается к Инаму или лучше создать Инамы в файле main? - есть ли правило или создаем там где удобно?
}

protocol Car {
    var brand: String { get set }
    var type: TypeOfCar { get set }
    var productionYear: Int { get set }
    var trunkVolume: Int { get set }
    
    init(brand: String, type: TypeOfCar, productionYear: Int, trunkVolume: Int)// 2вопрос: инициализированить надо было в протоколе или в классе??
    //3вопрос:  здесь ли (in protocol?) надо было создать пустой метод действия общий для всех машин или в расширениях? Просто в лекции Вы сказали на 48мин40сек минуте типа, что если в протоколе объявлена функция, а в его расширении эта функция расписана, то потом в классе используется ПО УМОЛЧАНИЮ функция из расширения протокола, а функцию из протокола можно не использовать - а разве не наоборот (что из протокола - обязательна, а из расширения необязательна?)? или смысл в том, что если в расширении функция расписана (написана более подробно, а не просто объявлена как в протоколе), то по-умолчанию будет подставляться функция из расширения? - это Вы имели ввиду говоряб что берется из расширения по дефолту?
}

//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей)
extension Car {
    func engineToggle (state: ActionsWithEngine) -> String {
        var engineState = ActionsWithEngine.stop
        switch engineState {
        case .start:
            engineState = ActionsWithEngine.start
        case .stop:
            engineState = ActionsWithEngine.stop
        }
        return "engine \(engineState)"
    }
}

extension Car {
    func window (do: ActionsWithWindows) -> String {
        var windowState = ActionsWithWindows.close
        switch windowState {   //4вопрос: Свифт предупреждает, что условие переключения оценивается как константа - я же var использовал - как же константа?
        case .open:
            windowState = ActionsWithWindows.open
        case .close:
            windowState = ActionsWithWindows.close
        }
        return "\(windowState) windows"
    } //5вопрос: хотел бы с помощью этой функции совершать действия (тут - открывать и закрывать окна) - вроде как изначально установил переменной состояние "закрыты" и меняю его соответственно на "открыты" - но почему оно не срабатывает - в принт не выводится в main?
}

//нижерасположенное сочетание протокола и действия нашел в swiftbook
protocol Togglable {
    mutating func toggle()
}
enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
