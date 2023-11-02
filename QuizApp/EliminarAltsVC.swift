//
//  EliminarAltsVC.swift
//  QuizApp
//
//  Created by Fernando on 01/11/23.
//

import UIKit

protocol EliminarAltsVCDelegate: AnyObject {
    func getQntAltsEliminadas(qntAltsEliminadas: Int)
}

class EliminarAltsVC: UIViewController {
    
    @IBOutlet weak var card1View: UIView!
    @IBOutlet weak var card2View: UIView!
    @IBOutlet weak var card3View: UIView!
    @IBOutlet weak var card4View: UIView!
    
    @IBOutlet weak var card1Label: UILabel!
    @IBOutlet weak var card2Label: UILabel!
    @IBOutlet weak var card3Label: UILabel!
    @IBOutlet weak var card4Label: UILabel!
    
    weak open var delegate: EliminarAltsVCDelegate?
    
    @IBAction func onTapFecharButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    var qntAltsEliminadas: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        card1Label.isHidden = true
        card2Label.isHidden = true
        card3Label.isHidden = true
        card4Label.isHidden = true
        
        card1View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapCard1View)))
        card2View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapCard2View)))
        card3View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapCard3View)))
        card4View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapCard4View)))
    }
    
    @objc func onTapCard1View() {
        card1Label.isHidden = false
        qntAltsEliminadas = Int.random(in: 0..<4)
        card1Label.text = String(qntAltsEliminadas)
        delegate?.getQntAltsEliminadas(qntAltsEliminadas: qntAltsEliminadas)
        
        card1View.isUserInteractionEnabled = false
        card2View.isUserInteractionEnabled = false
        card3View.isUserInteractionEnabled = false
        card4View.isUserInteractionEnabled = false
    }
    
    @objc func onTapCard2View() {
        card2Label.isHidden = false
        qntAltsEliminadas = Int.random(in: 0..<4)
        card2Label.text = String(qntAltsEliminadas)
        delegate?.getQntAltsEliminadas(qntAltsEliminadas: qntAltsEliminadas)
        
        card1View.isUserInteractionEnabled = false
        card2View.isUserInteractionEnabled = false
        card3View.isUserInteractionEnabled = false
        card4View.isUserInteractionEnabled = false
    }
    
    @objc func onTapCard3View() {
        card3Label.isHidden = false
        qntAltsEliminadas = Int.random(in: 0..<4)
        card3Label.text = String(qntAltsEliminadas)
        delegate?.getQntAltsEliminadas(qntAltsEliminadas: qntAltsEliminadas)
        
        card1View.isUserInteractionEnabled = false
        card2View.isUserInteractionEnabled = false
        card3View.isUserInteractionEnabled = false
        card4View.isUserInteractionEnabled = false
    }
    
    @objc func onTapCard4View() {
        card4Label.isHidden = false
        qntAltsEliminadas = Int.random(in: 0..<4)
        card4Label.text = String(qntAltsEliminadas)
        delegate?.getQntAltsEliminadas(qntAltsEliminadas: qntAltsEliminadas)
         
        card1View.isUserInteractionEnabled = false
        card2View.isUserInteractionEnabled = false
        card3View.isUserInteractionEnabled = false
        card4View.isUserInteractionEnabled = false
    }

}
