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

    @IBOutlet weak var itemsView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func newListPressed(_ sender: UIButton) {
    }
    
    @IBAction func newItemPressed(_ sender: UIButton) {
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
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
}

