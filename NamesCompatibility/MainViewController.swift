//
//  ViewController.swift
//  NamesCompatibility
//
//  Created by Байсаев Зубайр on 27.08.2022.
//

import UIKit

class MainViewController: UIViewController {
        
    @IBOutlet weak var yourName: UITextField!
    @IBOutlet weak var partnerName: UITextField!
    @IBAction func resultButton() {
       
        guard let firstName = yourName.text,
                let secondName = partnerName.text else { return }
        
        if firstName.isEmpty || secondName.isEmpty {
            showAlert(
                title: "Names are missing",
                message: "Please enter both names 😊"
            )
            return
        }
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
   
    @IBAction func unwindSegueForMVC(segue: UIStoryboardSegue) {
        yourName.text = " "
        partnerName.text = " "
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yourName.delegate = self
        partnerName.delegate = self

    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ResultViewController else { return }
        destinationVC.firstName = yourName.text!
        destinationVC.secondName = partnerName.text!
    }

}

extension MainViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == yourName {
            partnerName.becomeFirstResponder()
        } else {
            resultButton()
        }
        return true
    }
}
