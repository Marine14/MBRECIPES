//
//  MainPageViewController.swift
//  FoodRecipes
//
//

import UIKit

class MainPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var chickenImg: UIImageView!
    @IBOutlet weak var dessertImg: UIImageView!
    @IBOutlet weak var pastaImg: UIImageView!
    @IBOutlet weak var beefImg: UIImageView!
    
    //@IBOutlet weak var beefImg: UIImageView!
    @IBOutlet weak var porkImg: UIImageView!
    @IBOutlet weak var seafoodImg: UIImageView!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
//    @IBOutlet weak var categorieImage: UIImageView!
//    @IBOutlet weak var categorieName: UILabel!
//    @IBOutlet weak var etImg: UIImageView!
    
    var categories: [Categorie]?
    var categorieDetails: Categorie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        categoryCollectionView.collectionViewLayout = layout
        layout.scrollDirection = .vertical
        
        categoryCollectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        
        Api().getCategories() { categoriesResult in
            self.categories = categoriesResult?.categories
            
            DispatchQueue.main.async {
//                self.categorieName.text = self.categories!.first!.strCategory!
                let url = URL(string: self.categories!.first!.strCategoryThumb!)!
//                self.categorieImage.downloaded(from: url)
                
                DispatchQueue.main.async {
                    self.categoryCollectionView.reloadData()
                }
            }
        }
    }

    func pushList(category: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let recipesTableViewController = storyboard.instantiateViewController(withIdentifier: "RecipesTableViewController") as! RecipesTableViewController
        recipesTableViewController.category = category
        self.navigationController?.pushViewController(recipesTableViewController, animated: true)
    }
    
    //MARK: configure CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        let category = self.categories![indexPath.row]
        cell.configure(imageName: category.strCategoryThumb ?? "", title: category.strCategory ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width
        return CGSize(width: (width - 30) / 2, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = self.categories![indexPath.row]
        pushList(category: category.strCategory!)
    }
}
