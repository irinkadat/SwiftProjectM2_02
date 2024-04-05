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
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
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
    
    struct Coffee {
        var productName: String
        var coffeeAdditive: String
        var price: Double
        var rating: Double
        var numOfReviews: Int
    }
    
    var coffee = Coffee(productName: "კაპუჩინო", coffeeAdditive: "შოკოლადით", price: 4.53, rating: 4.8, numOfReviews: 230)
    
    
    func setButtonAppearance(_ button: UIButton, isSelected: Bool) {
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = isSelected ? UIColor(red: 198/255, green: 124/255, blue: 78/255, alpha: 1).cgColor : UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor
        button.backgroundColor = isSelected ? UIColor(red: 255/255, green: 245/255, blue: 238/255, alpha: 1) : UIColor.white

    }

    func changeButtonStyle(selectedButton: UIButton) {
        let allButtons = [firstButton, secButton, thirdButton]
        for button in allButtons {
            setButtonAppearance(button!, isSelected: button == selectedButton)
            
        }
    }
    
    func defaultButtonsStyle() {
        setButtonAppearance(firstButton, isSelected: false)
        setButtonAppearance(secButton, isSelected: true)
        setButtonAppearance(thirdButton, isSelected: false)
    }
    
    
    func changePrice() {

        if firstButton.isSelected {
            coffee.price = 2.40
        }
        if secButton.isSelected {
            coffee.price = 4.53
        }
        if thirdButton.isSelected {
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
        firstButton.isSelected = true
        secButton.isSelected = false
        thirdButton.isSelected = false
        changeButtonStyle(selectedButton: firstButton)
        changePrice()
    }
    
    @IBAction func mediumSizeTapped(_ sender: Any) {
        secButton.isSelected = true
        firstButton.isSelected = false
        thirdButton.isSelected = false
        changeButtonStyle(selectedButton: secButton)
        changePrice()
    }
    
    @IBAction func largeSizeTapped(_ sender: Any) {
        thirdButton.isSelected = true
        firstButton.isSelected = false
        secButton.isSelected = false
        changeButtonStyle(selectedButton: thirdButton)
        changePrice()
    }
}




