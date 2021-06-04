//
//  Constants.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 03.06.2021.
//

import UIKit

struct K {
    static let START_MODEL = "Смоделировать"
    
    static let GROUP_SIZE = "Численность группы"
    static let GROUP_SIZE_DESC = "Количество субъектов в моделируемой группе"
    
    static let TIME_PERIOD = "Обновлять через"
    static let TIME_PERIOD_DESC = "Период пересчета количества зараженных субъектов в секундах"
    
    static let INFECTION_FACTOR = "Заражаемость"
    static let INFECTION_FACTOR_DESC = "Количество субъектов, которое может быть заражено одним инфицированным при контакте"
    
    static let INCUBATION_PERIOD = "Инкубационный период"
    static let INCUBATION_PERIOD_DESC = "Длительность инкубационного периода, когда не проявляются симптомы. Носитель является переносчиком"
    
    static let SYMPTOMS_PERIOD = "Симптомный период"
    static let SYMPTOMS_PERIOD_DESC = "Длительность активной стадии. Носитель является переносчиком"
    
    static let QUARANTINE_RATE = "Вероятность карантина"
    static let QUARANTINE_RATE_DESC = "Шанс того, что носитель уйдет на карантин сразу после появления симптомов. Останавливает передачу вируса"
    
    
    static let UNIT_SUBJECTS = "субъектов"
    static let UNIT_SECONDS = "секунд"

    static let STATE_SUSCEPTIBLE = "Восприимчивый"
    static let STATE_SUSCEPTIBLE_DESC = "Ни разу не болел. Может заразиться"
    static let STATE_SUSCEPTIBLE_COLOR = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    static let STATE_INCUBATION = "Инкубационный период"
    static let STATE_INCUBATION_DESC = "Инфицирован, без симптомов. Переносчик"
    static let STATE_INCUBATION_COLOR = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
    
    static let STATE_SYMPTOMS = "Активная стадия"
    static let STATE_SYMPTOMS_DESC = "Инфицирован, с симптомами. Переносчик"
    static let STATE_SYMPTOMS_COLOR = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    
    static let STATE_RECOVERED = "Выздоровевший"
    static let STATE_RECOVERED_DESC = "Переболел и выздоровил. Имеет иммунитет"
    static let STATE_RECOVERED_COLOR = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    
    static let STATE_QUARANTINED = "На карантине"
    static let STATE_QUARANTINED_DESC = "Ушел на карантин после появления симптомов. Никого не заражает"
    static let STATE_QUARANTINED_COLOR = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    
    
    static let SETTING_GROUP_SIZE = "SETTING_GROUP_SIZE"
    static let SETTING_TIME_PERIOD = "SETTING_TIME_PERIOD"
    static let SETTING_INFECTION_FACTOR = "SETTING_INFECTION_FACTOR"
    static let SETTING_INCUBATION_PERIOD = "SETTING_INCUBATION_PERIOD"
    static let SETTING_SYMPTOMS_PERIOD = "SETTING_SYMPTOMS_PERIOD"
    static let SETTING_QUARANTINE_RATE = "SETTING_QUARANTINE_RATE"
    
    
}
