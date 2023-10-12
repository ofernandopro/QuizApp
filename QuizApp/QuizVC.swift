//
//  QuizVC.swift
//  QuizApp
//
//  Created by Fernando on 12/10/23.
//

import UIKit

class QuizVC: UIViewController {
    
    var perguntas = [
        Pergunta(id: "001", pergunta: "Qual foi o primeiro presidente do Brasil?", alt1: "Marechal Deodoro Da Fonseca", alt2: "Getúlio Vargas", alt3: "Juscelino Kubistchek", alt4: "Floriano Peixoto", altCorreta: 1, nivel: 5, areaConhecimento: "História"),
        Pergunta(id: "002", pergunta: "Qual é o quarto planeta mais distante do sol?", alt1: "Mercúrio", alt2: "Terra", alt3: "Vênus", alt4: "Marte", altCorreta: 4, nivel: 2, areaConhecimento: "Astronomia"),
        Pergunta(id: "003", pergunta: "Qual o maior país do mundo?", alt1: "Brasil", alt2: "Rússia", alt3: "China", alt4: "Estados Unidos", altCorreta: 2, nivel: 2, areaConhecimento: "Geografia"),
        Pergunta(id: "003", pergunta: "Quanto é 2 elevado a 6?", alt1: "16", alt2: "12", alt3: "64", alt4: "32", altCorreta: 3, nivel: 3, areaConhecimento: "Matemática"),
        Pergunta(id: "004", pergunta: "Quantos ossos tem o corpo humano?", alt1: "206", alt2: "190", alt3: "64", alt4: "220", altCorreta: 1, nivel: 4, areaConhecimento: "Biologia"),
        Pergunta(id: "004", pergunta: "Qual é o símbolo do Boro na Tabela Periódica?", alt1: "Br", alt2: "Bo", alt3: "B", alt4: "Ag", altCorreta: 3, nivel: 3, areaConhecimento: "Química"),
        Pergunta(id: "004", pergunta: "Quanto é logaritmo de 8 na base 2?", alt1: "2", alt2: "4", alt3: "8", alt4: "3", altCorreta: 4, nivel: 4, areaConhecimento: "Matemática")
    ]
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pararButton: UIButton!
    @IBOutlet weak var perguntaLabel: UILabel!
    @IBOutlet weak var alt1Label: UILabel!
    @IBOutlet weak var alt2Label: UILabel!
    @IBOutlet weak var alt3Label: UILabel!
    @IBOutlet weak var alt4Label: UILabel!
    @IBOutlet weak var pontuacaoLabel: UILabel!

    @IBOutlet weak var resultadoLabel: UILabel!
    
    @IBOutlet weak var alt1View: UIView!
    @IBOutlet weak var alt2View: UIView!
    @IBOutlet weak var alt3View: UIView!
    @IBOutlet weak var alt4View: UIView!
    
    var altSelected: Int = 0
    var pontuacaoNesteJogo = 0
    var numPergunta = 0
    
    var valoresPerguntas = [500, 1000, 2000, 5000, 10000, 20000, 50000, 100000, 200000, 300000, 400000, 500000, 1000000]
    
    var randomInt: Int?
    
    var foiRespondida: Bool = false
    
    var respostaErrada = false
    
    @IBAction func onTapSubmitButton(_ sender: Any) {
        
        if altSelected == 0 {
            return
        }
        
        let altCorreta = perguntas[randomInt ?? 0].altCorreta
        
        pintarViewCorretaEIncorretas(altCorreta: altCorreta, altSelected: altSelected)
        
        resultadoLabel.isHidden = false
        
        if !foiRespondida {
            
            if altSelected == altCorreta {
                pontuacaoNesteJogo += perguntas[altCorreta-1].nivel * 20
                resultadoLabel.text = "Resposta Correta! Você ganhou R$\(valoresPerguntas[numPergunta]) 😀"
                resultadoLabel.textColor = .systemGreen
                startButton.isHidden = false
                pararButton.isHidden = false
                pararButton.setTitle("Parar", for: .normal)
                startButton.setTitle("Próxima Pergunta", for: .normal)
            } else {
                resultadoLabel.text = "Infelizmente você perdeu 😞"
                resultadoLabel.textColor = .systemPink
                startButton.isHidden = true
                pararButton.isHidden = false
                pararButton.setTitle("Voltar", for: .normal)
                respostaErrada = true
            }
            
            foiRespondida = true
            
        } else {
            
            if valoresPerguntas[numPergunta] > UserDefaults.standard.integer(forKey: "maiorPontuacao") {
                UserDefaults.standard.setValue(valoresPerguntas[numPergunta], forKey: "maiorPontuacao")
            }
            
            altSelected = 0
            numPergunta += 1
            
            if numPergunta < 12 {
                pontuacaoLabel.text = "Valendo R$\(valoresPerguntas[numPergunta])"
                resultadoLabel.isHidden = true
                pararButton.isHidden = true
                reiniciarCores()
                sortearPergunta()
                foiRespondida = false
            } else {
                irParaParabensVC()
            }
            
        }
        
    }
    
    @IBAction func onTapPararButton(_ sender: Any) {
        irParaParabensVC()
    }
    
    func irParaParabensVC() {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ParabensVC") as! ParabensVC
        vc.modalPresentationStyle = .fullScreen
        if respostaErrada {
            if numPergunta > 0 {
                vc.valorGanho = valoresPerguntas[numPergunta-1]
            } else {
                vc.valorGanho = 0
            }
        } else {
            vc.valorGanho = valoresPerguntas[numPergunta]
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        resultadoLabel.isHidden = true
        pontuacaoLabel.text = "Valendo R$\(valoresPerguntas[numPergunta])"
        
        pararButton.isHidden = true
        
        sortearPergunta()
        addTapGestures()
    }
    
    func sortearPergunta() {
//        let antigoSorteado = self.randomInt
//        var randomInt = 0
//        repeat {
            var randomInt = Int.random(in: 0..<perguntas.count)
//        } while randomInt != antigoSorteado
        self.randomInt = randomInt
        
        perguntaLabel.text = "\(perguntas[randomInt].pergunta)"
        alt1Label.text = "\(perguntas[randomInt].alt1)"
        alt2Label.text = "\(perguntas[randomInt].alt2)"
        alt3Label.text = "\(perguntas[randomInt].alt3)"
        alt4Label.text = "\(perguntas[randomInt].alt4)"
    }
    
    func reiniciarCores() {
        alt1View.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
        alt2View.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
        alt3View.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
        alt4View.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
    }
    
    func addTapGestures() {
        alt1View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapAlt1View)))
        
        alt2View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapAlt2View)))
        
        alt3View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapAlt3View)))
        
        alt4View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapAlt4View)))
    }
    
    @objc func onTapAlt1View() {
        altSelected = 1
        
        alt1View.backgroundColor = UIColor.lightGray
        alt2View.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
        alt3View.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
        alt4View.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
    }
    
    @objc func onTapAlt2View() {
        altSelected = 2
        
        alt1View.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
        alt2View.backgroundColor = UIColor.lightGray
        alt3View.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
        alt4View.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
    }
    
    @objc func onTapAlt3View() {
        altSelected = 3
        
        alt1View.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
        alt2View.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
        alt3View.backgroundColor = UIColor.lightGray
        alt4View.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
    }
    
    @objc func onTapAlt4View() {
        altSelected = 4
        
        alt1View.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
        alt2View.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
        alt3View.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
        alt4View.backgroundColor = UIColor.lightGray
    }
    
    func pintarViewCorretaEIncorretas(altCorreta: Int, altSelected: Int) {
        
        if altCorreta == altSelected {
            if altCorreta == 1 {
                alt1View.backgroundColor = .systemGreen
            } else if altCorreta == 2 {
                alt2View.backgroundColor = .systemGreen
            } else if altCorreta == 3 {
                alt3View.backgroundColor = .systemGreen
            } else {
                alt4View.backgroundColor = .systemGreen
            }
        } else {
            if altSelected == 1 {
                alt1View.backgroundColor = .systemRed
                if altCorreta == 2 {
                    alt2View.backgroundColor = .systemGreen
                } else if altCorreta == 3 {
                    alt3View.backgroundColor = .systemGreen
                } else if altCorreta == 4 {
                    alt4View.backgroundColor = .systemGreen
                }
            } else if altSelected == 2 {
                alt2View.backgroundColor = .systemRed
                if altCorreta == 1 {
                    alt1View.backgroundColor = .systemGreen
                } else if altCorreta == 3 {
                    alt3View.backgroundColor = .systemGreen
                } else if altCorreta == 4 {
                    alt4View.backgroundColor = .systemGreen
                }
            } else if altSelected == 3 {
                alt3View.backgroundColor = .systemRed
                if altCorreta == 1 {
                    alt1View.backgroundColor = .systemGreen
                } else if altCorreta == 2 {
                    alt2View.backgroundColor = .systemGreen
                } else if altCorreta == 4 {
                    alt4View.backgroundColor = .systemGreen
                }
            } else {
                alt4View.backgroundColor = .systemRed
                if altCorreta == 1 {
                    alt1View.backgroundColor = .systemGreen
                } else if altCorreta == 2 {
                    alt2View.backgroundColor = .systemGreen
                } else if altCorreta == 3 {
                    alt3View.backgroundColor = .systemGreen
                }
            }
        }
//        
    }

}
