//
//  ListViewController.swift
//  A2_FA_iOS_dinamol_786954
//
//  Created by user199274 on 5/25/21.
//  Copyright © 2021 MacStudent. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var productArray:[Products] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.fetchData()
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    

    

    func numberOfSections(in tableView: UITableView) -> Int {
     return 1
     
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        let oneRecord = productArray[indexPath.row]
        cell.textLabel!.text = oneRecord.productName! + " "
        cell.textLabel!.text = oneRecord.productProvider! + " "
        cell.textLabel!.text = oneRecord.productDescription! + " "
        return  cell
    }
    func fetchData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            productArray = try context.fetch(Products.fetchRequest())
        }catch {
            print(error)
        }
    }
    
}
