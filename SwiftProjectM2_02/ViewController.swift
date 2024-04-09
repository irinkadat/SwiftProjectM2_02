//
//  ViewController.swift
//  SwiftProjectM2_02
//
//  Created by Irinka Datoshvili on 05.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var coffeeTitle: UILabel!
    @IBOutlet weak var coffeeAdditive: UILabel!
    @IBOutlet weak var favoriteIcon: UIImageView!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var numOfReviews: UILabel!
    @IBOutlet weak var smallButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var largeButton: UIButton!
    @IBOutlet weak var price: UILabel!
    
    var isFavorite = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        favoriteIcon.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(heartTapped))
        favoriteIcon.addGestureRecognizer(tapGesture)
        
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        
        coffeeTitle.text = coffee.productName
        coffeeAdditive.text = coffee.coffeeAdditive
        price.text = "₾" + String(format: "%.2f", coffee.price)
        
        rating.text = String(format: "%.1f", coffee.rating)
        numOfReviews.text = "(" + String(coffee.numOfReviews) + ")"

        defaultButtonsStyle()
    }
    
    
    var coffee = Coffee(productName: "კაპუჩინო", coffeeAdditive: "შოკოლადით", price: 4.53, rating: 4.8, numOfReviews: 230)
    
    
    func setButtonAppearance(_ button: UIButton, isSelected: Bool) {
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = isSelected ? UIColor(red: 198/255, green: 124/255, blue: 78/255, alpha: 1).cgColor : UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor
        button.backgroundColor = isSelected ? UIColor(red: 255/255, green: 245/255, blue: 238/255, alpha: 1) : UIColor.white

    }

    func changeButtonStyle(selectedButton: UIButton) {
        let allButtons = [smallButton, mediumButton, largeButton]
        for button in allButtons {
            setButtonAppearance(button!, isSelected: button == selectedButton)
            
        }
    }
    
    func defaultButtonsStyle() {
        setButtonAppearance(smallButton, isSelected: false)
        setButtonAppearance(mediumButton, isSelected: true)
        setButtonAppearance(largeButton, isSelected: false)
    }
    
    
    func changePrice() {

        if smallButton.isSelected {
            coffee.price = 2.40
        }
        if mediumButton.isSelected {
            coffee.price = 4.53
        }
        if largeButton.isSelected {
            coffee.price = 5.30
        }
        
        price.text = "₾" + String(format: "%.2f", coffee.price)
    }
    
    
    @objc func heartTapped() {
        isFavorite = !isFavorite
        
        if isFavorite {
            favoriteIcon.image = UIImage(systemName: "heart.fill")
            coffee.numOfReviews += 1
            
        } else {
            favoriteIcon.image = UIImage(systemName: "heart")
            coffee.numOfReviews -= 1
        }
        
        numOfReviews.text = String(coffee.numOfReviews)
    }
    
    
    @IBAction func smallSizeTapped(_ sender: Any) {
        smallButton.isSelected = true
        mediumButton.isSelected = false
        largeButton.isSelected = false
        changeButtonStyle(selectedButton: smallButton)
        changePrice()
    }
    
    @IBAction func mediumSizeTapped(_ sender: Any) {
        mediumButton.isSelected = true
        smallButton.isSelected = false
        largeButton.isSelected = false
        changeButtonStyle(selectedButton: mediumButton)
        changePrice()
    }
    
    @IBAction func largeSizeTapped(_ sender: Any) {
        largeButton.isSelected = true
        smallButton.isSelected = false
        mediumButton.isSelected = false
        changeButtonStyle(selectedButton: largeButton)
        changePrice()
    }
}




