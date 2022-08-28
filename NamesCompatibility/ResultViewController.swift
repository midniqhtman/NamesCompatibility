//
//  ResultViewController.swift
//  NamesCompatibility
//
//  Created by Байсаев Зубайр on 27.08.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var namesLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    
    var firstName = " "
    var secondName = " "
    
    private var resultValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultValue
        
        namesLabel.text = firstName + " and " + secondName
        resultLabel.text = resultValue.formatted(.percent)

        progressView.progress = Float(resultValue) / 100
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 4)
    }
    private func findValue(for name: String) -> Int {
        
        var count = 0
        
        for character in name.lowercased() {
            switch character {
            case "a", "i", "j", "q", "y":
                count += 1
            case "b", "k", "r":
                count += 2
            case "c", "g", "l", "s":
                count += 3
            case "d", "m", "t":
                count += 4
            case "e", "h", "n", "x":
                count += 5
            case "u", "v", "w":
                count += 7
            case "o", "z":
                count += 8
            default:
                count += 0
            }
        }
        return count
    }
    
    private func findResult() -> Int {
        var result = 0
        
        let firstValue = findValue(for: firstName)
        let secondValue = findValue(for: secondName)
        let absDifferece = abs(firstValue - secondValue)
        
        switch absDifferece {
        case 0, 1, 2:
            result = 100
        case 3,4:
            result = 65
        case 5:
            result = 50
        case 6:
            result = 40
        default:
            result = 30
        }
        return result
    }

}