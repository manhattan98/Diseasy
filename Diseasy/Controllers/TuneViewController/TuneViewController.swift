//
//  TuneViewController.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 04.06.2021.
//

import UIKit

class TuneViewController: UITableViewController {
    
    // MARK: - Initialize settings
    
    let settings: [SettingItem] = [
        .SettingSliderItem(get: { Float(SettingsUtils.groupSize) },
                           set: { val in SettingsUtils.groupSize = Int(val) },
                           title: K.GROUP_SIZE,
                           description: K.GROUP_SIZE_DESC,
                           min: Float(Defaults.groupSize.min),
                           max: Float(Defaults.groupSize.max),
                           fractionDigits: 0,
                           showValue: true),
        .SettingStepperItem(get: { SettingsUtils.timePeriod },
                            set: { val in SettingsUtils.timePeriod = val },
                            title: K.TIME_PERIOD,
                            description: K.TIME_PERIOD_DESC,
                            min: Defaults.timePeriod.min,
                            max: Defaults.timePeriod.max,
                            step: 0.1,
                            fractionDigits: 1),
        .SettingStepperItem(get: { Double(SettingsUtils.infectionFactor) },
                            set: { val in SettingsUtils.infectionFactor = Int(val) },
                            title: K.INFECTION_FACTOR,
                            description: K.INFECTION_FACTOR_DESC,
                            min: Double(Defaults.infectionFactor.min),
                            max: Double(Defaults.infectionFactor.max),
                            step: 1,
                            fractionDigits: 0),
        .SettingStepperItem(get: { Double(SettingsUtils.contactRadius) },
                            set: { val in SettingsUtils.contactRadius = Int(val) },
                            title: K.CONTACT_RADIUS,
                            description: K.CONTACT_RADIUS_DESC,
                            min: Double(Defaults.contactRadius.min),
                            max: Double(Defaults.contactRadius.max),
                            step: 1,
                            fractionDigits: 0),
        .SettingSliderItem(get: { Float(SettingsUtils.incubationPeriod) },
                           set: { val in SettingsUtils.incubationPeriod = Int(val) },
                           title: K.INCUBATION_PERIOD,
                           description: K.INCUBATION_PERIOD_DESC,
                           min: Float(Defaults.incubationPeriod.min),
                           max: Float(Defaults.incubationPeriod.max),
                           fractionDigits: 0,
                           showValue: false),
        .SettingSliderItem(get: { Float(SettingsUtils.symptomsPeriod) },
                           set: { val in SettingsUtils.symptomsPeriod = Int(val) },
                           title: K.SYMPTOMS_PERIOD,
                           description: K.SYMPTOMS_PERIOD_DESC,
                           min: Float(Defaults.symptomsPeriod.min),
                           max: Float(Defaults.symptomsPeriod.max),
                           fractionDigits: 0,
                           showValue: false),
    ]
    
    var buttonProvider: FooterButtonProvider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // register all settings cells
        tableView.register(UINib(nibName: SettingSliderCell.nibName, bundle: nil), forCellReuseIdentifier: SettingSliderCell.reusableIdentifier)
        tableView.register(UINib(nibName: SettingStepperCell.nibName, bundle: nil), forCellReuseIdentifier: SettingStepperCell.reusableIdentifier)
        tableView.register(UINib(nibName: SettingSwitchCell.nibName, bundle: nil), forCellReuseIdentifier: SettingSwitchCell.reusableIdentifier)
        
        
        // initialize footer button
        setupModelingButton()
    }
    
    
    // MARK: - Setup modeling button
    
    func setupModelingButton() {
        buttonProvider = FooterButtonProvider(parent: self,
                                              action: #selector(buttonPressed),
                                              fontSize: 17,
                                              buttonHeight: 50,
                                              verticalIndent: 40,
                                              horizontalIndent: 16,
                                              backgroundColor: .darkGray)
    }
    
    
    // MARK: - Button callback
    
    @objc
    func buttonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.GO_TO_MODELING_SEGUE, sender: self)
    }

    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return buttonProvider.footerHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return buttonProvider.footerView
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let settingItem = settings[indexPath.row]
        
        switch settingItem {
        case is SettingItem.SettingSliderItem:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingSliderCell.reusableIdentifier, for: indexPath) as! SettingSliderCell
            cell.selectionStyle = .none
                        
            cell.settingItem = settingItem as? SettingItem.SettingSliderItem
            
            return cell
        case is SettingItem.SettingStepperItem:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingStepperCell.reusableIdentifier, for: indexPath) as! SettingStepperCell
            cell.selectionStyle = .none
            
            cell.settingItem = settingItem as? SettingItem.SettingStepperItem
            
            return cell
        case is SettingItem.SettingSwitchItem:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingSwitchCell.reusableIdentifier, for: indexPath) as! SettingSwitchCell
            cell.selectionStyle = .none
            
            cell.settingItem = settingItem as? SettingItem.SettingSwitchItem
            
            return cell
        default:
            fatalError("unknown setting type")
        }

    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case K.GO_TO_MODELING_SEGUE, K.GO_TO_MODELLING_SEGUE:
            print("performing segue...")
        default:
            fatalError("unknown segue")
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
