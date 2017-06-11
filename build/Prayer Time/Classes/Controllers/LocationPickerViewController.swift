//
//  LocationPickerViewController.swift
//  Prayer Time
//
//  Created by Omer Emre Aslan on 12/06/2017.
//  Copyright © 2017 Omer Emre Aslan. All rights reserved.
//

import UIKit

class LocationPickerViewController: UIViewController {

    var countries: [Country]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getCountries { (countries, error) in
            if error == nil {
                self.countries = countries
            }
        }
        
        setupLayout()
    }
    
    private func setupLayout() {
        self.view.backgroundColor = UIColor.lightGray
    }

}
