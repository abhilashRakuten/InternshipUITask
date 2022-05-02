//
//  ViewController.swift
//  FirstApp
//
//  Created by Reddy, P on 01/05/22.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var textFeild: UITextField!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFeild.delegate=self
        // Do any additional setup after loading the view.
    }

    @IBAction func submit(_ sender: UIButton) {
        let utext = textFeild.text
        output.text = utext
    }
    
    @IBAction func slide(_ sender: Any) {
        let slider = sender as!UISlider
        let val = (Int(slider.value))
        output.text = "\(val)"
    }
    @IBAction func step(_ sender: UIStepper) {
        output.text = String(Int(sender.value))
        slider.value = Float(sender.value)
        output.text = Int(sender.value).description
    }
    
}
extension ViewController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let characters = "0123456789"
        let characterSet = CharacterSet(charactersIn: characters )
        let typedCharacterset = CharacterSet(charactersIn: string)
        return characterSet.isSuperset(of: typedCharacterset)
    }
}
