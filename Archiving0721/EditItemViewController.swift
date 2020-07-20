//
//  EditItemViewController.swift
//  Archiving0721
//
//  Created by leslie on 7/21/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class EditItemViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    
    var index: Int!
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveItemBtn(_ sender: UIButton) {
        
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
