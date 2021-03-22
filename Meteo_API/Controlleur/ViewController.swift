//
//  ViewController.swift
//  Meteo
//
//  Created by Boubeh Ahmed on 6/14/20.
//  Copyright © 2020 boubeh. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "meteo" {
            print("dans if")
            let scv = segue.destination as! SecondViewController
            scv.ville_s = ville.text
        }

    }
    @IBAction func chercher(_ sender: UIButton) {
        print(ville.text as Any)
       
        performSegue(withIdentifier: "meteo", sender: ville.text)
    }
    @IBOutlet weak var ville: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

