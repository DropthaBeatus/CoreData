//
//  ExpenseViewController.swift
//  Expenses
//
//  Created by Liam Flaherty on 12/1/17.
//  Copyright © 2017 Liam Flaherty. All rights reserved.
//

import UIKit
import CoreData

class ExpenseViewController: UITableViewController {

    
    @IBOutlet weak var expensesTableView: UITableView!
    
    let dateFormatter = DateFormatter()
    
    var expenses = [Expense]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormatter.timeStyle = .long
        dateFormatter.dateStyle = .long
        
        // Do any additional setup after loading the view.
    }
    @IBAction func addNewExpense(_ sender: Any) {
        performSegue(withIdentifier: "showExpense", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Expense> = Expense.fetchRequest() as! NSFetchRequest<Expense>
        do{
        expenses = try managedContext.fetch(fetchRequest)
            
        expensesTableView.reloadData()
        }catch{
            print("Fetch could not be performed")
        }
    }


//extension ExpenseViewController: UITableViewDataSource {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell
    {
        let cell = expensesTableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
        
        let expense = expenses[indexPath.row]
        
        cell.textLabel?.text = expense.name
        
        
        
        return cell
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

