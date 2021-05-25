//
//  ViewController.swift
//  A2_FA_iOS_dinamol_786954
//
//  Created by MacStudent on 2021-05-23.
//  Copyright © 2021 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var idText: UITextField!
    @IBOutlet weak var providerText: UITextField!
    @IBOutlet weak var priceText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func saveBtn(_ sender: Any) {
        //to get values from textfields
        let _productName = self.nameText!.text
        let _productId = self.idText!.text
        let productProvider = self.providerText!.text
        let productPrice = self.priceText!.text
        let productDescription = self.providerText!.text
        
        //validate input values
        if (_productName?.isEmpty)!{
            self.nameText.layer.borderColor = UIColor.red.cgColor
            return
        }else{
            self.nameText.layer.borderColor = UIColor.blue.cgColor
}
        if (_productId?.isEmpty)!{
    self.idText.layer.borderColor = UIColor.red.cgColor
    return
}else{
    self.idText.layer.borderColor = UIColor.blue.cgColor
}
        if (productProvider?.isEmpty)!{
    self.providerText.layer.borderColor = UIColor.red.cgColor
    return
}else{
    self.providerText.layer.borderColor = UIColor.blue.cgColor
}
        if (productPrice?.isEmpty)!{
            self.priceText.layer.borderColor = UIColor.red.cgColor
            return
        }else{
            self.priceText.layer.borderColor = UIColor.blue.cgColor
        }
        if (productDescription?.isEmpty)!{
            self.descriptionText.layer.borderColor = UIColor.red.cgColor
            return
        }else{
            self.descriptionText.layer.borderColor = UIColor.blue.cgColor
        }
        let newProduct = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context)
        newProduct.setValue(self.nameText!.text, forKey: "productName")
        newProduct.setValue(self.idText!.text, forKey: "productId")
        newProduct.setValue(self.providerText!.text, forKey: "productProvider")
        newProduct.setValue(self.priceText!.text, forKey: "productPrice")
        newProduct.setValue(self.descriptionText!.text, forKey: "productDescription")
        do {
            try context.save()
            self.nameText!.text = ""
            self.idText!.text = ""
            self.providerText!.text = ""
            self.priceText!.text = ""
            self.descriptionText!.text = ""
        }catch{
            print(error)
        }
    }
}
