//
//  CityInformation.swift
//  AlarmPractice
//
//  Created by Greed on 2023/06/07.
//

import Foundation

struct CityData: Identifiable {
    var id: String { self.cityName }
    var cityName: String
    var time: Date
    var gmt: String
}
