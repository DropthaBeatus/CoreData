//
//  ViewController.swift
//  Expenses
//
//  Created by Liam Flaherty on 12/1/17.
//  Copyright © 2017 Liam Flaherty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   nameTextField.delegate = self
      //  amountTextField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        amountTextField.resignFirstResponder()
        nameTextField.resignFirstResponder()
    }
    
    @IBAction func saveExpense(_ sender: Any) {
        let name = nameTextField.text
        let amountText = amountTextField.text ?? ""
        let amount = Double(amountText) ?? 0.0
        let date = datePicker.date
        
        if let expense = Expense(name: name, amount: amount, date: date){
            do {
                let managedContext = expense.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            }catch{
                print("Context could not be saved")
            }
        }
    }
}
    
   



