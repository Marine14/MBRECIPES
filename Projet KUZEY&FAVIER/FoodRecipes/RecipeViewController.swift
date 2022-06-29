//
//  WorldRecipesViewController.swift
//  FoodRecipes
//
//

import UIKit

class RecipeViewController: UIViewController {

    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeText: UITextView!
    @IBOutlet weak var recipeIngredient: UITextView!
    @IBOutlet weak var minuteur: UIButton!
    
    var meal: Meal?
    var mealDetails: MealDetails?
    
    var selectedImage = UIImage()
    var selectedFoodId = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        recipeImage.layer.cornerRadius = 8

        Api().getDetailsRecepie(id: meal!.idMeal!) { mealDetailsResult in
            self.mealDetails = mealDetailsResult
            
            DispatchQueue.main.async {
                self.recipeName.text = self.mealDetails?.strMeal
                self.recipeText.text = self.mealDetails?.strInstructions
                
                let url = URL(string: self.mealDetails!.strMealThumb!)!
                self.recipeImage.downloaded(from: url)
                
                self.recipeText.setContentOffset(.zero, animated: true)
            }
        }
    }
}
