//
//  FinalViewController.swift
//  AnimalQuiz
//
//  Created by Екатерина Батеева on 10.12.2020.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране
    // 4. Избавиться от кнопки возврата на предыдущий экран
    
    var answers: [Answer]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        let maxAnimal = getMaxAnimal()
        updateUI(with: maxAnimal)
    }
    
}

extension ResultsViewController{
    private func getMaxAnimal()  -> AnimalType? {
        return Dictionary(grouping: answers, by: { $0.type }).sorted(by: { $0.value.count > $1.value.count }).first?.key
    }
    
    private func updateUI(with animal: AnimalType?) {
        mainLabel.text = "Вы - \(animal?.rawValue ?? "🐶")!"
        descriptionLabel.text = animal?.definition ?? ""
    }
}
