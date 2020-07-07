//
//  ViewController.swift
//  SuperSenha
//
//  Created by Marcus on 01/07/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    @IBOutlet weak var swCaptitalLetters: UISwitch!
    
    @IBOutlet weak var buttonGerarSenha: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfNumberOfCharacters.delegate = self
        tfTotalPasswords.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchAction(_ sender: Any) {
        
        if (swNumbers.isOn == false && swCaptitalLetters.isOn == false && swLetters.isOn == false && swSpecialCharacters.isOn == false){
            buttonGerarSenha.isEnabled = false
        }else{
            buttonGerarSenha.isEnabled = true
        }
        
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordViewController
        
        // forma mais segura (usar if let)
        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            // se conseguir obter o valor do campo e converter para inteiro
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        if let numberOfCharacters = Int(tfNumberOfCharacters.text!) {
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCaptitalLetters.isOn
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
        
        // forcar encerrar o modo de edicao // remove o foco e libera teclado
        view.endEditing(true)
    }
    
}
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 2
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let idField = textField.restorationIdentifier
        
        guard let texto = textField.text, let inteiro = Int(texto) else{
            print("textFieldDidEndEditing: vazio")
            return
        }
        if idField == "numberOfCharacters" {
            if(inteiro > 16){
                let alert = UIAlertController(title: "Atenção", message: "Valores não aceitáveis para a opção Total de caracteres: zero ou menor que 16",preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
                }))
                self.present(alert, animated: true, completion: nil)
            }
        } else if idField == "totalPasswords"{
            if(inteiro > 98){
                let alert = UIAlertController(title: "Atenção", message: "Valores não aceitáveis para a opção Quantidade de senhas: zero ou menor que 98",preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
}
