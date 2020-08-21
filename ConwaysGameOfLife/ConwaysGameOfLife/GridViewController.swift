//
//  GridViewController.swift
//  ConwaysGameOfLife
//
//  Created by Jessie Ann Griffin on 8/18/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

import UIKit

class GridViewController: UIViewController {

    let gridController = GridController()

    @IBOutlet var cellButtons: [UIButton]! {
        didSet {
            for button in cellButtons {
                button.layer.borderWidth = 1.0
                button.layer.borderColor = UIColor.black.cgColor
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createButtons()
    }

    private func createButtons() {
        for cell in gridController.cells {
            let button = UIButton()
            button.backgroundColor = .lightGray
            cellButtons.append(button)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
