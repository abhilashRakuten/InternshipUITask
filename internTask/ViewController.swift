//
//  ViewController.swift
//  internTask
//
//  Created by Singh, Akash | RIEPL on 30/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var displayOutlet: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
       
    private func configureTextField() {
        textField.delegate = self
    }
    
    @IBAction func setTextButton(_ sender: UIButton) {
        let text = textField.text
        displayOutlet.text = text
    }
     
    @IBAction func sliderChanged(_ sender: Any) {
        let slider = sender as! UISlider
        let value = Int(slider.value)
        displayOutlet.text = "\(value)"
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        displayOutlet.text = String(Int(sender.value))
        slider.value = Float(sender.value)
        displayOutlet.text = Int(sender.value).description
    }
}

extension ViewController : UITextFieldDelegate {
    

//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let allowedCharacters = CharacterSet(charactersIn:"0123456789").inverted
//        let components = string.components(separatedBy: allowedCharacters)
//        let filtered = components.joined(separator: "")
//        if (string == filtered) {
//            return false
//        } else {
//            return true
//        }
//    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       let characters = "1234567890"
       let charactersSet = CharacterSet(charactersIn: characters)
       let typedCharacterSet = CharacterSet(charactersIn: string)
       return charactersSet.isSuperset(of: typedCharacterSet)
    }
    
   
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let allowedMaxCharacter = 1
//        let currentString: NSString = (textField.text ?? "") as NSString
//        let newString: NSString = currentString.replacingCharacters(in:  range, with: string) as NSString
//        return newString.length <= allowedMaxCharacter
//    }
}
