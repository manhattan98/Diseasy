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
    static let INFECTION_FACTOR_DESC = "Максимальное количество субъектов, которое может быть заражено одним инфицированным при контакте"
    
    static let INCUBATION_PERIOD = "Инкубационный период"
    static let INCUBATION_PERIOD_DESC = "Длительность инкубационного периода, когда не проявляются симптомы. Носитель является переносчиком"
    
    static let SYMPTOMS_PERIOD = "Симптомный период"
    static let SYMPTOMS_PERIOD_DESC = "Длительность активной стадии. Носитель является переносчиком"
    
    static let CONTACT_RADIUS = "Радиус контакта"
    static let CONTACT_RADIUS_DESC = "Радиус, в котором один субъект может контактировать с другими субъектами"
    
    static let QUARANTINE_RATE = "Вероятность карантина"
    static let QUARANTINE_RATE_DESC = "Шанс того, что носитель уйдет на карантин сразу после появления симптомов. Останавливает передачу вируса"
    
    
    static let UNIT_SUBJECTS = "субъектов"
    static let UNIT_SECONDS = "секунд"

    static let STATE_SUSCEPTIBLE = "Восприимчивый"
    static let STATE_SUSCEPTIBLE_DESC = "Ни разу не болел. Может заразиться"
    static let STATE_SUSCEPTIBLE_COLOR = #colorLiteral(red: 0.9332545996, green: 0.9333854318, blue: 0.9332134128, alpha: 1)
    
    static let STATE_INCUBATION = "Инкубационный период"
    static let STATE_INCUBATION_DESC = "Инфицирован, без симптомов. Переносчик"
    static let STATE_INCUBATION_COLOR = #colorLiteral(red: 0.9999850392, green: 0.8683874011, blue: 0.8852653503, alpha: 1)
    
    static let STATE_SYMPTOMS = "Активная стадия"
    static let STATE_SYMPTOMS_DESC = "Инфицирован, с симптомами. Переносчик"
    static let STATE_SYMPTOMS_COLOR = #colorLiteral(red: 0.9982948899, green: 0.2672609091, blue: 0.2661162019, alpha: 1)
    
    static let STATE_RECOVERED = "Выздоровевший"
    static let STATE_RECOVERED_DESC = "Переболел и выздоровил. Имеет иммунитет"
    static let STATE_RECOVERED_COLOR = #colorLiteral(red: 0.5999479294, green: 0.6000345349, blue: 0.5999205709, alpha: 1)
    
    static let STATE_QUARANTINED = "На карантине"
    static let STATE_QUARANTINED_DESC = "Ушел на карантин после появления симптомов. Никого не заражает"
    static let STATE_QUARANTINED_COLOR = #colorLiteral(red: 0.5028089285, green: 0.5806409717, blue: 0.9983561635, alpha: 1)
    
    static let STATS_INFECTED = "Болеющих"
    static let STATS_HEALTHY = "Здоровых"
    
    
    static let SETTING_GROUP_SIZE = "SETTING_GROUP_SIZE"
    static let SETTING_TIME_PERIOD = "SETTING_TIME_PERIOD"
    static let SETTING_INFECTION_FACTOR = "SETTING_INFECTION_FACTOR"
    static let SETTING_INCUBATION_PERIOD = "SETTING_INCUBATION_PERIOD"
    static let SETTING_SYMPTOMS_PERIOD = "SETTING_SYMPTOMS_PERIOD"
    static let SETTING_CONTACT_RADIUS = "SETTING_CONTACT_RADIUS"
    static let SETTING_QUARANTINE_RATE = "SETTING_QUARANTINE_RATE"
    
    static let GO_TO_MODELING_SEGUE = "goToModelingSegue"
    static let GO_TO_MODELLING_SEGUE = "goToModellingSegue"
}
