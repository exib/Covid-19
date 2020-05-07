//
//  ViewController.swift
//  Covid-19
//
//  Created by Andrey Goncharov on 06.05.2020.
//  Copyright © 2020 Andrey Goncharov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newConfirmedLabel: UILabel!
    @IBOutlet weak var newDeathsLabel: UILabel!
    @IBOutlet weak var newRecoveredLabel: UILabel!
    
    @IBOutlet weak var totalConfirmedLabel: UILabel!
    @IBOutlet weak var totalRecoveredLabel: UILabel!
    @IBOutlet weak var totalDeathsLabel: UILabel!
    
    
    @IBOutlet weak var selectName: UILabel!
    
    @IBAction func showGlobal(_ sender: UIButton) {
        selectName.text = "All over the Globe"
        getSummary { entity in
                    DispatchQueue.main.async {
                        self.newConfirmedLabel.text = String(entity.Global.NewConfirmed)
        //                self.countryT = entity
                        self.totalConfirmedLabel.text = String(entity.Global.TotalConfirmed)
                        self.newRecoveredLabel.text = String(entity.Global.NewRecovered)
                        self.totalRecoveredLabel.text = String(entity.Global.TotalRecovered)
                        self.newDeathsLabel.text = String(entity.Global.NewDeaths)
                        self.totalDeathsLabel.text = String(entity.Global.TotalDeaths)
                    }
                }
    }
    var countryT : SummaryEntity?
        @IBAction func selectCountryPressed(_ sender: UIButton) {
            self.presentSearchAlertController(withTitle: "Enter country name", message: nil, style: .alert) { country in
                
                let some = self.countryT?.Countries.first(where: { $0.Country == country })
                self.selectName.text = some!.Country
                self.totalConfirmedLabel.text = String(some!.TotalConfirmed)
                self.totalRecoveredLabel.text = String(some!.TotalRecovered)
                self.totalDeathsLabel.text = String(some!.TotalDeaths)
//                self.new
                self.newConfirmedLabel.text = String(some!.NewConfirmed)
                self.newRecoveredLabel.text = String(some!.NewRecovered)
                self.newDeathsLabel.text = String(some!.NewDeaths)
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        getSummary { entity in
            DispatchQueue.main.async {
                self.newConfirmedLabel.text = String(entity.Global.NewConfirmed)
                self.countryT = entity
                self.totalConfirmedLabel.text = String(entity.Global.TotalConfirmed)
                self.newRecoveredLabel.text = String(entity.Global.NewRecovered)
                self.totalRecoveredLabel.text = String(entity.Global.TotalRecovered)
                self.newDeathsLabel.text = String(entity.Global.NewDeaths)
                self.totalDeathsLabel.text = String(entity.Global.TotalDeaths)
            }
        }
        
    }
}
