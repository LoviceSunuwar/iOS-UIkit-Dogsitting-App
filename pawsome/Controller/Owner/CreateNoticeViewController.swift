//
//  CreateNoticeViewController.swift
//  Pawsome
//
//  Created by Roch on 4/5/22.
//

import UIKit
import SwiftSpinner

class CreateNoticeViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var descriptionTxt: UITextField!
    @IBOutlet weak var streetAddressTxt: UITextField!
    @IBOutlet weak var cityTxt: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    @IBOutlet weak var animalPicker: UIPickerView!
    @IBOutlet weak var animalPickerBtn: UIButton!
    @IBOutlet weak var zipLbl: UILabel!
    @IBOutlet weak var zipTxt: UITextField!
    
    let states = ["Alberta","British Columbia","Manitoba","New Brunswick","Newfoundland and Labrador","Nova Scotia", "Ontario", "Prince Edward Island" , "Quebec", "Saskatchewan"]
    
    
    var animals: [Animal] = []
    
    let animalService = AnimalService()
    let noticeService = NoticeService()
    
    var selectedAnimal: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        animalPicker.dataSource = self
        animalPicker.delegate = self
        getAnimals()
    }
    
    private func getAnimals() {
        animalService.getAnimal { success, message, animal in
            if success {
                self.animals = animal
                self.animalPicker.reloadAllComponents()
            } else {
                self.alert(message: message, title: nil, okAction: nil)
            }
        }
    }
    
    @IBAction func stateBtnPressed(_ sender: Any) {
        statePicker.isHidden = false
        animalPicker.isHidden = true
    }
    
    @IBAction func animalBtnPressed(_ sender: Any) {
        if animals.isEmpty {
            self.alert(message: "No pets found", title: nil, okAction: nil)
        } else {
            animalPicker.isHidden = false
            statePicker.isHidden = true
        }
        
    }
    
    @IBAction func postButtonTapped(_ sender: Any) {
        self.view.endEditing(true)
        //check garney for empty textfields
        
        SwiftSpinner.show("Posting Notice... ")
        noticeService.createNotice(animalId: selectedAnimal?.id ?? 0, title: titleTxt.text ?? "" , desc: descriptionTxt.text ?? "", dateTime: "\(datePicker.date)", addressLine1: streetAddressTxt.text ?? "", addressLine2: streetAddressTxt.text ?? "", city: cityTxt.text ?? "" , state: statePickerBtn.titleLabel?.text ?? "", country: "Canada") { success, message, animal in
            SwiftSpinner.hide()
            if success {
                self.alert(message: message, title: nil) {
                    self.navigationController?.popViewController(animated: true)
                }
            } else {
                self.alert(message: message, title: nil, okAction: nil)
            }
        }
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case statePicker:
            return states.count
        case animalPicker:
            return animals.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case statePicker:
            return states[row]
        case animalPicker:
            return animals[row].animal_name ?? ""
        default:
            return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView {
        case statePicker:
            statePickerBtn.setTitle(states[row], for: UIControl.State())
            statePicker.isHidden = true
            break
        case animalPicker:
            animalPickerBtn.setTitle(animals[row].animal_name, for: UIControl.State())
            selectedAnimal = animals[row]
            animalPicker.isHidden = true
            break
        default:
            break
        }
    }
    
}
