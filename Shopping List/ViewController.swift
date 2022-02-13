//
//  ViewController.swift
//  Shopping List
//
//  Created by Olivia Chisman on 2/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    var itemDescription: String = ""
    var itemQuantity: String = ""

    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var quantityField: UITextField!
    @IBOutlet weak var itemsView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func newListPressed(_ sender: UIButton) {
        clearItemFields()
        itemsView.text = "No items"
    }
    
    @IBAction func newItemPressed(_ sender: UIButton) {
        clearItemFields()
    }
    
    func clearItemFields() {
        descriptionField.text = ""
        quantityField.text = ""
        itemDescription = ""
        itemQuantity = ""
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        if (itemDescription.isEmpty) {
            displayInvalidEntryPopup(
                title: "Missing Item Description",
                message: "Please enter a description for your item")
            return
        }
        
        if let quantity = Int(itemQuantity) {
            if (quantity != 0) {
                addNewItemToList(quantity)
                return
            }
        }
        
        displayInvalidEntryPopup(
            title: "Missing Item Quantity",
            message: "Please enter a valid quantity for your item")
    }
    
    func addNewItemToList(_ quantity: Int) {
        let newLine: String = "\(quantity) \(itemDescription)\n"
        if (itemsView.text == nil || itemsView.text == "No items") {
            itemsView.text = newLine
        } else {
            itemsView.text!.append(newLine)
        }
        clearItemFields()
    }
    
    @IBAction func descriptionEntered(_ sender: UITextField) {
        if let text = sender.text {
            itemDescription = text
        }
    }
    
    @IBAction func quantityEntered(_ sender: UITextField) {
        if let text = sender.text {
            itemQuantity = text
        }
    }
    
    @IBAction func editEnded(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func numericalEditEnded(_ sender: UIControl) {
        quantityField.resignFirstResponder()
    }
    
    func displayInvalidEntryPopup(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

