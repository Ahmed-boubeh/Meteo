//
//  ViewController.swift
//  Meteo
//
//  Created by Boubeh Ahmed on 6/14/20.
//  Copyright © 2020 boubeh. All rights reserved.
//

import Foundation
struct Meteo :Decodable {
    var main : principale
    var weather : [general]
    var wind : vent
}
struct principale : Decodable {
    var temp : Float
    var feels_like : Float
    var temp_min : Float
    var temp_max : Float
    var pressure : Float
    var humidity : Float
}
struct general : Decodable {
    var id : Int
    var main : String
    var description : String
    var icon : String
}
struct vent : Decodable {
    var speed : Float
    var deg : Float
}
