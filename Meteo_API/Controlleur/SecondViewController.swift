//
//  ViewController.swift
//  Meteo
//
//  Created by Boubeh Ahmed on 6/14/20.
//  Copyright © 2020 boubeh. All rights reserved.
//


import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var ville: UILabel!
    @IBOutlet weak var tempe: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var max: UILabel!
    @IBOutlet weak var min: UILabel!
    @IBOutlet weak var vitesse: UILabel!
    @IBOutlet weak var pression: UILabel!
    
    @IBOutlet weak var BackgroundView: UIView!
    
    var ville_s : String?
    @IBAction func `return`(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "return", sender: self)
    }

        
    override func viewDidLoad() {
        ville.text = ville_s?.uppercased()
        super.viewDidLoad()
        let urls = "https://api.openweathermap.org/data/2.5/weather?q="+ville_s!+"&appid=47c0b4303bb78481a70329d1aade9e4a&units=metric"
 
                     let urlw = URL(string: urls)
                     let task = URLSession.shared.dataTask(with: urlw!) {
                         (data,reponse,err) in
                         if err != nil {
                             print(err?.localizedDescription)
                         }
                         if let d = data{
                            DispatchQueue.main.async {
                             do{
                                 let data = try JSONDecoder().decode(Meteo.self, from: d)
                                print(data.main.temp)
                                self.tempe.text = String(Int(data.main.temp))+"°C"
                                self.max.text = String(data.main.temp_max)+"°C"
                                self.min.text = String(data.main.temp_min)+"°C"
                                self.vitesse.text = String(data.wind.speed)+"m/s"
                                self.pression.text = String(data.main.pressure)+"hPa"
                                let etat = data.weather[0].main
                                if etat == "Clear" {
                                    self.icon.image = UIImage(systemName: "sun.max")
                                    self.desc.text = "Clair"
                                }
                                else if etat == "Thunderstorme" {
                                    self.icon.image = UIImage(systemName: "cloud.bolt.rain")
                                    self.desc.text = "Clair"
                                }
                                else if etat == "Thunderstorm" {
                                    self.icon.image = UIImage(systemName: "cloud.bolt.rain")
                                    self.desc.text = "Orage"
                                }
                                else if etat == "Drizzle" {
                                    self.icon.image = UIImage(systemName: "cloud.drizzle")
                                    self.desc.text = "Pluie Fine"
                                }
                                else if etat == "Rain" {
                                    self.icon.image = UIImage(systemName: "cloud.rain")
                                    self.desc.text = "Pluie"
                                }
                                else if etat == "Snow" {
                                    self.icon.image = UIImage(systemName: "snow")
                                    self.desc.text = "Neige"
                                }
                                else if etat == "Smoke" {
                                    self.icon.image = UIImage(systemName: "smoke")
                                    self.desc.text = "Fumée"
                                }
                                else if etat == "Haze" {
                                    self.icon.image = UIImage(systemName: "sun.haze")
                                    self.desc.text = "Brume"
                                }
                                else if etat == "Clouds" {
                                   print("dans clouds")
                                    self.icon.image = UIImage(systemName: "cloud.sun")
                                    self.desc.text = "Nuages"
                                }
                                else if ( etat == "Fog" || etat == "Mist" ) {
                                    self.icon.image = UIImage(systemName: "cloud")
                                    self.desc.text = "Brouillard"
                                }
                                else if etat == "Dust" {
                                    self.icon.image = UIImage(systemName: "sun.dust")
                                    self.desc.text = "Poussière"
                                }
                                else if etat == "Squall" {
                                    self.icon.image = UIImage(systemName: "cloud.sleet")
                                    self.desc.text = "Tempête de neige"
                                }
                                else if etat == "Tornado" {
                                    self.icon.image = UIImage(systemName: "tornado")
                                    self.desc.text = "Tornade"
                                }
        
                             }
                             catch{
                                 
                             }
                         }
                        }
                     }.resume()
        
        
    }
    
  
    @IBAction func Back(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
