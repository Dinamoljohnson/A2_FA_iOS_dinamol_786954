//
//  ViewController.swift
//  A2_FA_iOS_dinamol_786954
//
//  Created by MacStudent on 2021-05-23.
//  Copyright © 2021 MacStudent. All rights reserved.
//

import UIKit
import CoreData
var myProducts: [products]?
class ViewController: UIViewController {
    
    let appDelegate	 = UIApplication.shared.delegate as! AppDelegate

    // 2 - create the context
    var managedContext: NSManagedObjectContext!

    
    
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
                managedContext =  appDelegate.persistentContainer.viewContext

       
                loadCoreData()
    }
    
    


        //MARK: - CoreData functions
        
        func loadCoreData() {
            myProducts = [products]()

            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductArray")

            do {
                let results = try managedContext.fetch(fetchRequest)
                if results is [NSManagedObject] {
                    for result in (results as! [NSManagedObject]) {
                        let productName = result.value(forKey: "productName") as! String
                        let productId = result.value(forKey: "productId") as! Int
                        let productProvider = result.value(forKey: "productProvider") as! String
                        let productPrice = result.value(forKey: "productPrice") as! Float
                        let productDescription = result.value(forKey: "productDescription") as! String
                        

                        myProducts?.append(products(productName: productName, productId: productId, productProvider: productProvider, productPrice: productPrice,productDescription: productDescription))
                    }
                }

            } catch {
                print(error)
            }
        }
func saveCoreData() {
            clearCoreData()
            for product in myProducts! {
                let productEntity = NSEntityDescription.insertNewObject(forEntityName: "Products", into: managedContext)
                productEntity.setValue(product.productName, forKey: "productName")
                productEntity.setValue(product.productId, forKey: "productId")
                productEntity.setValue(product.productProvider, forKey: "productProvider")
                productEntity.setValue(product.productPrice, forKey: "productPrice")
                productEntity.setValue(product.productDescription, forKey: "productDescription")
            }
            do {
                        try managedContext.save()
                    } catch {
                        print(error)
                    }
                }
func clearCoreData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductArray")
//        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try managedContext.fetch(fetchRequest)
            for result in results {
                if let managedObject = result as? NSManagedObject {
                    managedContext.delete(managedObject)
                }
            }
        } catch {
            print("Error deleting records \(error)")
        }

}
    
    @IBAction func saveBtn(_ sender: Any) {
        //to get values from textfields
        _ = self.textFields[0].text
        _ = self.textFields[1].text
        _ = self.textFields[2].text
        _ = self.textFields[3].text
        _ = self.textFields[4].text
        
        
                
            
        
}
    @IBAction func cancelBtn(_ sender: Any) {
            dismiss(animated: true, completion: nil)

}
}
