//
//  RecipesTableViewController.swift
//  FoodRecipes
//
//

import UIKit

class RecipesTableViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    
    var recipies: [Meal]?
    
    var category: String!
    
    var chosenFoodName = ""
    var chosenFoodImage = UIImage()
    var chosenFoodId = ""
    
    // argument d'une recette
    var strMeal: [String]!
    var strMealThumb: [String]!
    var idMeal: [String]!
    
    @IBOutlet weak var worldTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Api().getRecepies(category: category) { recipies in
            self.recipies = recipies?.meals
            
            DispatchQueue.main.async {
                self.worldTable.reloadData()
            }
//            foodNames = reci
        }
        worldTable.delegate = self
        worldTable.dataSource = self
        
        navigationItem.title = category
        
//        switch category {
//        case .worldKitchen:
//            navigationItem.title = "Cuisine du monde"
//        case .viande:
//            navigationItem.title = "Viande"
//        case .some(.huileolive):
//            navigationItem.title = "Huile d'olive"
//        case .some(.patisserie):
//            navigationItem.title = "Patisserie"
//        case .some(.meze):
//            navigationItem.title = "Meze"
//        case .some(.tarte):
//            navigationItem.title = "Tarte"
//        case .some(.cuisineturque):
//            navigationItem.title = "Cuisine turque"
//
//        case .none:
//            break
//        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = recipies?[indexPath.row].strMeal
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            recipies?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let recipies = recipies {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let recipeViewController = storyboard.instantiateViewController(withIdentifier: "RecipeViewController") as! RecipeViewController
            recipeViewController.meal = recipies[indexPath.row]
            
            self.navigationController?.pushViewController(recipeViewController, animated: true)
        }
    }

}
