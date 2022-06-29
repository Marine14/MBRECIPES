//
//  Api.swift
//  Demo
//
//  Created by Julie Saby on 23/02/2021.
//  Copyright © 2021 Julie Saby. All rights reserved.
//

// a modifier !!!!!!!!!!!!!

class RecipiesResult: Codable {
    var meals: [Meal]?
}

class Meal: Codable {
    var strMeal: String?
    var strMealThumb: String?
    var idMeal: String?
}

class MealDetailsResult: Codable {
    var meals: [MealDetails]?
}

class MealDetails: Codable {
    var strMeal: String?
    var strInstructions: String?
    var strMealThumb: String?
}

class CategoriesResult: Codable {
    var categories: [Categorie]?
}

class Categorie: Codable {
    var strCategory: String?
    var strCategoryThumb: String?
}

import Foundation
import MapKit

class Api {
    
    public func getCategories(completion: @escaping (CategoriesResult?) -> Void) {

        let url = URL(string:"https://www.themealdb.com/api/json/v1/1/categories.php")

        let session = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                if let dataResult = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let categoriesResult = try jsonDecoder.decode(CategoriesResult.self, from: dataResult)
                        completion(categoriesResult)
                    }
                    catch {
                        print("Error")
                    }
                }
                else {
                    print("No result")
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        session.resume()
    }
    
    public func getRecepies(category: String, completion: @escaping (RecipiesResult?) -> Void) {

        let url = URL(string:"https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)")

        let session = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                if let dataResult = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let recipesResult = try jsonDecoder.decode(RecipiesResult.self, from: dataResult)
                        completion(recipesResult)
                    }
                    catch {
                        print("Error")
                    }
                }
                else {
                    print("No result")
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        session.resume()
    }
    
    public func getDetailsRecepie(id: String, completion: @escaping (MealDetails?) -> Void) {

        let url = URL(string:"https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")

        let session = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                if let dataResult = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let mealDetailsResult = try jsonDecoder.decode(MealDetailsResult.self, from: dataResult)
                        completion(mealDetailsResult.meals?.first)
                    }
                    catch {
                        print("Error")
                    }
                }
                else {
                    print("No result")
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        session.resume()
    }
    
    public func getTag(completion: @escaping (TagContainer?) -> Void) {
        let url = URL(string: "https://data.mobilites-m.fr/api/lines/json?types=ligne&codes=SEM_C")
    
        let session = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                if let dataResult = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let stationsResult = try jsonDecoder.decode(TagContainer.self, from: dataResult)
                        completion(stationsResult)
                    }
                    catch {
                        print("Error")
                    }
                }
                else {
                    print("No result")
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        session.resume()
    }
}

public class TagContainer: Decodable {
    var features: [Feature]!
}

public class Feature: Decodable {
    var geometry: Geometry!
}

public class Geometry: Decodable {
    var coordinates: [CLLocationCoordinate2D]!
    
    enum CodingKeys: String, CodingKey {
        case coordinates
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let tmpCoordinates = try values.decode([[[Double]]].self, forKey: .coordinates)
        
        let allCoordinates = tmpCoordinates.first
        
        coordinates = [CLLocationCoordinate2D]()
        allCoordinates?.forEach({ (coord) in
            coordinates.append(CLLocationCoordinate2D(latitude: coord[0], longitude: coord[1]))
        })
    }
}
