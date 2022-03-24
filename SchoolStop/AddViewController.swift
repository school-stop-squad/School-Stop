//
//  AddViewController.swift
//  SchoolStop
//
//  Created by Miro on 3/23/22.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textReminderField: UITextField!
    
    @IBOutlet var bodyField: UITextField!
    
    @IBOutlet var datePicker: UIDatePicker!
    
    public var completion: ((String, String, Date) -> Void)?
    
    @IBOutlet var table: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textReminderField.delegate = self
        
        bodyField.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))

    }
    
    //save reminder button
    
    @objc func didTapSaveButton() {
        
        if let titleText = textReminderField.text, !titleText.isEmpty,
           let bodyText = bodyField.text, !bodyText.isEmpty {
            
            let targetDate = datePicker.date
            
            
            
        }
        
    }
    
    //get rid of keyboard when not in text field

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }

}
