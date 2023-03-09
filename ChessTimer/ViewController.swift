//
//  ViewController.swift
//  ChessTimer
//
//  Created by Antonio on 2023-03-08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerOneTimer: UILabel!
    @IBOutlet weak var playerTwoTimer: UILabel!
    @IBOutlet weak var turnBtn: UIButton!
    
    var countdown = 120
    var timer = Timer()
    var isCountingDown = false
    var playerOnesTurn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerOneTimer.text = String(countdown)
        playerTwoTimer.text = String(countdown)
    }
    
    @IBAction func playerOneButtonTapped(_ sender: Any) {
        if isCountingDown {
            timer.invalidate()
            countdown = 120
            playerOneTimer.text = String(countdown)
            playerTwoTimer.text = String(countdown)
            isCountingDown = false
        } else {
            playerOnesTurn = !playerOnesTurn
            if playerOnesTurn {
                turnBtn.setTitleColor(.red, for: .normal)
            } else {
                turnBtn.setTitleColor(.gray, for: .normal)
            }
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                self?.updateTimer()
            }
            isCountingDown = true
        }
    }
    
    func updateTimer() {
        countdown -= 1
        if countdown == 0 {
            timer.invalidate()
            isCountingDown = false
        }
        if playerOnesTurn {
            playerOneTimer.text = String(countdown)
        } else {
            playerTwoTimer.text = String(countdown)
        }
    }

}

