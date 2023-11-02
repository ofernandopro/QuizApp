//
//  PerguntaViewModel.swift
//  QuizApp
//
//  Created by Fernando on 01/11/23.
//

import Foundation

class QuizViewModel {
    
    var perguntas = [
        Pergunta(id: "001", pergunta: "Qual foi o primeiro presidente do Brasil?", alt1: "Marechal Deodoro Da Fonseca", alt2: "Getúlio Vargas", alt3: "Juscelino Kubistchek", alt4: "Floriano Peixoto", altCorreta: 1, nivel: 5, areaConhecimento: "História"),
        Pergunta(id: "002", pergunta: "Qual é o quarto planeta mais distante do sol?", alt1: "Mercúrio", alt2: "Terra", alt3: "Vênus", alt4: "Marte", altCorreta: 4, nivel: 2, areaConhecimento: "Astronomia"),
        Pergunta(id: "003", pergunta: "Qual o maior país do mundo?", alt1: "Brasil", alt2: "Rússia", alt3: "China", alt4: "Estados Unidos", altCorreta: 2, nivel: 2, areaConhecimento: "Geografia"),
        Pergunta(id: "003", pergunta: "Quanto é 2 elevado a 6?", alt1: "16", alt2: "12", alt3: "64", alt4: "32", altCorreta: 3, nivel: 3, areaConhecimento: "Matemática"),
        Pergunta(id: "004", pergunta: "Quantos ossos tem o corpo humano?", alt1: "206", alt2: "190", alt3: "64", alt4: "220", altCorreta: 1, nivel: 4, areaConhecimento: "Biologia"),
        Pergunta(id: "005", pergunta: "Qual é o símbolo do Boro na Tabela Periódica?", alt1: "Br", alt2: "Bo", alt3: "B", alt4: "Ag", altCorreta: 3, nivel: 3, areaConhecimento: "Química"),
        Pergunta(id: "006", pergunta: "Quanto é logaritmo de 8 na base 2?", alt1: "2", alt2: "4", alt3: "8", alt4: "3", altCorreta: 4, nivel: 5, areaConhecimento: "Matemática"),
        Pergunta(id: "007", pergunta: "Quem foi a primeira pessoa a viajar no Espaço?", alt1: "Yuri Gagarin", alt2: "Neil Armstrong", alt3: "Marcos Pontes", alt4: "Buzz Aldrin", altCorreta: 1, nivel: 4, areaConhecimento: "Astronomia"),
        Pergunta(id: "008", pergunta: "Qual a montanha mais alta do mundo?", alt1: "Mauna Kea", alt2: "Dhaulagiri", alt3: "Monte Chimborazo", alt4: "Monte Everest", altCorreta: 4, nivel: 1, areaConhecimento: "Geografia"),
        Pergunta(id: "009", pergunta: "Onde se localiza Machu Picchu?", alt1: "Colômbia", alt2: "Peru", alt3: "China", alt4: "Bolívia", altCorreta: 2, nivel: 3, areaConhecimento: "Geografia"),
        Pergunta(id: "010", pergunta: "Quem inventou a lâmpada?", alt1: "Graham Bell", alt2: "Steve Jobs", alt3: "Thomas Edison", alt4: "Henry Ford", altCorreta: 3, nivel: 3, areaConhecimento: "História"),
        Pergunta(id: "011", pergunta: "A que temperatura a água ferve?", alt1: "-10 ºC", alt2: "180 ºC", alt3: "0 ºC", alt4: "100 ºC", altCorreta: 4, nivel: 2, areaConhecimento: "Física"),
        Pergunta(id: "012", pergunta: "Que grande evento histórico aconteceu em 1822 no Brasil?", alt1: "Descobrimento do Brasil", alt2: "Ditadura Militar", alt3: "Construção de Brasília", alt4: "Independência do Brasil", altCorreta: 4, nivel: 3, areaConhecimento: "História"),
        Pergunta(id: "013", pergunta: "Quantos continentes existem?", alt1: "2", alt2: "8", alt3: "4", alt4: "6", altCorreta: 4, nivel: 3, areaConhecimento: "Geografia"),
        Pergunta(id: "014", pergunta: "Quais as duas línguas mais faladas no mundo?", alt1: "Inglês e espanhol", alt2: "Inglês e mandarim chinês", alt3: "Mandarim chinês e francês", alt4: "Inglês e português", altCorreta: 2, nivel: 5, areaConhecimento: "Linguagens"),
        Pergunta(id: "015", pergunta: "Qual o monumento famoso pela sua inclinação?", alt1: "Torre Eiffel", alt2: "Esfinge", alt3: "Cristo Redentor", alt4: "Torre de Pisa", altCorreta: 4, nivel: 1, areaConhecimento: "Geografia"),
        Pergunta(id: "016", pergunta: "Kryptonita é a fraqueza de qual super-herói?", alt1: "Batman", alt2: "Hulk", alt3: "Super-Homem", alt4: "Capitão América", altCorreta: 3, nivel: 3, areaConhecimento: "Entretenimento"),
        Pergunta(id: "017", pergunta: "Quem pintou Mona Lisa?", alt1: "Leonardo da Vinci", alt2: "Salvador Dalí", alt3: "Van Gogh", alt4: "Pablo Picasso", altCorreta: 1, nivel: 2, areaConhecimento: "Artes"),
        Pergunta(id: "018", pergunta: "Qual a personagem mais famosa de Maurício de Sousa?", alt1: "Mafalda", alt2: "Mônica", alt3: "Smurfette", alt4: "Magali", altCorreta: 2, nivel: 2, areaConhecimento: "Entretenimeto"),
        Pergunta(id: "019", pergunta: "Quantos bits tem 1 byte?", alt1: "10", alt2: "1", alt3: "8", alt4: "16", altCorreta: 3, nivel: 5, areaConhecimento: "Informática"),
        Pergunta(id: "020", pergunta: "Qual o nome popular do cloreto de sódio?", alt1: "Vinagre", alt2: "Água", alt3: "Papel", alt4: "Sal de cozinha", altCorreta: 4, nivel: 3, areaConhecimento: "Ciência"),
        Pergunta(id: "021", pergunta: "Qual cidade nasceu Jesus?", alt1: "Nazaré", alt2: "Belém", alt3: "Galileia", alt4: "Jerusalém", altCorreta: 2, nivel: 4, areaConhecimento: "História"),
        Pergunta(id: "022", pergunta: "Depois do futebol, qual o esporte mais popular no Brasil?", alt1: "Vôlei", alt2: "Esqui", alt3: "Basquete", alt4: "Golfe", altCorreta: 1, nivel: 3, areaConhecimento: "Esportes"),
        Pergunta(id: "023", pergunta: "Qual o plural de chapéu?", alt1: "Chapéis", alt2: "Chapéus", alt3: "Chapéuzes", alt4: "Chapéu", altCorreta: 2, nivel: 2, areaConhecimento: "Linguagens"),
        Pergunta(id: "024", pergunta: "Quem escreveu Os Lusíadas?", alt1: "Carlos Drummond de Andrade", alt2: "Fernando Pessoa", alt3: "Luís Vaz de Camões", alt4: "Jorge Amado", altCorreta: 3, nivel: 5, areaConhecimento: "Linguagens"),
        Pergunta(id: "025", pergunta: "Qual time foi o campeão brasileiro de futebol de 2021?", alt1: "Fluminense", alt2: "Flamengo", alt3: "Palmeiras", alt4: "Atlético-MG", altCorreta: 4, nivel: 3, areaConhecimento: "Esportes"),
    ]
    
}
