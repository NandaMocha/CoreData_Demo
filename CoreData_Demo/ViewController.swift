//
//  ViewController.swift
//  CoreData_Demo
//
//  Created by Nanda Mochammad on 04/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var namaTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var namaLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var data : [Contact]?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))

        
        loadItems()

    }

    @IBAction func addButtonTapped(_ sender: Any) {
        
        let contactData = Contact(context: self.context)
        contactData.nama = namaTF.text
        contactData.noHP = phoneTF.text
        
        data?.append(contactData)
        saveData()
    }
    
    func saveData() {
        
        do {
            try context.save()
        } catch  {
            print("Error nih guys, ", error)
        }
        
        updateLayout()
    }
    
    func loadItems(){
        let request : NSFetchRequest = Contact.fetchRequest()
        
        do {
            data = try context.fetch(request)
        } catch  {
            print("Error cuy, benerin dong!, ", error)
        }
        
        updateLayout()
    }
    
    func updateLayout(){
        namaLabel.text = data?.last?.nama
        phoneLabel.text = data?.last?.noHP
    }
    
    
    
}

