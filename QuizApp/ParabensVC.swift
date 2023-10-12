//
//  ParabensVC.swift
//  QuizApp
//
//  Created by Fernando on 12/10/23.
//

import UIKit

class ParabensVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var imageView: UIImageView!

    @IBAction func onTapVoltarButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    var valorGanho: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        if let valorGanho {
            
            subtitleLabel.text = "Você ganhou R$\(valorGanho)!"
            
            if valorGanho == 0 {
                subtitleLabel.text = "Você não ganhou nada!"
                titleLabel.text = "Tudo tem um começo!"
                imageView.image = UIImage(named: "sem-dinheiro")
                backgroundImage.image = UIImage(named: "background-sem-dinheiro")
            } else if valorGanho <= 10000 {
                titleLabel.text = "Treine mais da próxima vez!"
                imageView.image = UIImage(named: "dinheiro-nivel-1")
                backgroundImage.image = UIImage(named: "background-dinheiro")
            } else if valorGanho <= 50000 {
                titleLabel.text = "Bom resultado mas poderia ser melhor!"
                imageView.image = UIImage(named: "dinheiro-nivel-2")
                backgroundImage.image = UIImage(named: "background-dinheiro")
            } else if valorGanho <= 200000 {
                titleLabel.text = "Bom resultado mas poderia ser melhor!"
                imageView.image = UIImage(named: "dinheiro-nivel-3")
                backgroundImage.image = UIImage(named: "background-dinheiro")
            } else if valorGanho <= 500000 {
                titleLabel.text = "Bom resultado mas poderia ser melhor!"
                imageView.image = UIImage(named: "dinheiro-nivel-4")
                backgroundImage.image = UIImage(named: "background-dinheiro")
            } else if valorGanho < 1000000 {
                titleLabel.text = "Parabéns!"
                imageView.image = UIImage(named: "dinheiro-nivel-5")
                backgroundImage.image = UIImage(named: "background-dinheiro")
            } else {
                titleLabel.text = "Parabéns!!!"
                titleLabel.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
                imageView.image = UIImage(named: "dinheiro-1-milhao")
                backgroundImage.image = UIImage(named: "background-milhao")
                subtitleLabel.text = "Você ganhou 1 milhão!!!"
            }
            
        }
            
    }

}
