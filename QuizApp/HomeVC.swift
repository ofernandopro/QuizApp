//
//  HomeVC.swift
//  QuizApp
//
//  Created by Fernando on 12/10/23.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var maiorPontuacaoLabel: UILabel!
    
    @IBAction func onTapStartButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyBoard.instantiateViewController(withIdentifier: "QuizVC") as! QuizVC
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        maiorPontuacaoLabel.text = "R$0,00"
        
        let maiorPontuacaoSalva = UserDefaults.standard.integer(forKey: "maiorPontuacao")
        if maiorPontuacaoSalva > 0 {
            let result = NumberFormatter.localizedString(from: NSNumber(value: maiorPontuacaoSalva), number: .currency)
            maiorPontuacaoLabel.text = "\(result)"
        } else {
            maiorPontuacaoLabel.text = "R$ 0,00"
        }
        
        if maiorPontuacaoSalva == 1000000 {
            maiorPontuacaoLabel.textColor = .systemYellow
        } else {
            maiorPontuacaoLabel.textColor = .black
        }
    }
    
    

}
