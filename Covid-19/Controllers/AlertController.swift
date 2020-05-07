//
//  AlertController.swift
//  Covid-19
//
//  Created by Andrey Goncharov on 06.05.2020.
//  Copyright © 2020 Andrey Goncharov. All rights reserved.
//

import UIKit

extension ViewController {
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style,completionHandler: @escaping (String) -> Void) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            let countries = ["Russia", "Italy", "Germany", "China", "Spain"]
            tf.placeholder = countries.randomElement()
        }
        let search = UIAlertAction(title: "Сhoose country", style: .default) { action in
            let textField = ac.textFields?.first
            guard let countryName = textField?.text else { return }
            if countryName != "" {
                let country = countryName.split(separator: " ").joined(separator: "%20")
                completionHandler(country)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
}

