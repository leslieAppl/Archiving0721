//
//  EditItemViewController.swift
//  Archiving0721
//
//  Created by leslie on 7/21/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

//TODO: - 3 Adding and updating the model’s values
class EditItemViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    
    var index: Int!
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if name != nil {
            nameText.text = name
        }
    }
    
    ///This view controller has to contemplate two scenarios: users can open the view by selecting a cell when they want to edit its value and also by pressing the Add Item button in the Navigation Bar when they want to add a new name. We determine the situation by checking the content of the index and name properties. If their values are not nil, it means that the user selected a cell to update its value, so we assign the value of the name property to the Text Field and call the updateItem() method in the model when the Save Item button is pressed to update the value. If, on the other hand, the values of index and name are nil, it means that the user pressed the Add Item button to add a new name to the model, so we call the addNewItem() method instead.
    @IBAction func saveItemBtn(_ sender: UIButton) {
        if index != nil && name != nil {
            let text = nameText.text!
            AppData.updateItem(index: index, name: text)
        } else {
            let text = nameText.text!
            AppData.addNewItem(name: text)
        }
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
