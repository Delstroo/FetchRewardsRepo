//
//  MealModelController.swift
//  FetchRewardsProject
//
//  Created by Delstun McCray on 2/15/22.
//

import Foundation
import UIKit

class MealModelController {
    
    static let cache = NSCache<NSString, UIImage>()
    
    static var baseURL = "https://www.themealdb.com/api/json/v1/1/filter.php"
    
    static func fetchMealList(idMeal: String, completion: @escaping (Result<[Meals], MealErrors>) -> Void) {
        guard let baseURL = URL(string: baseURL) else { return completion(.failure(.invalidURL)) }
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let mealIdCategory = URLQueryItem(name: "c", value: idMeal)
        components?.queryItems = [mealIdCategory]
        
        guard let finalURL = components?.url else { return completion(.failure(.invalidURL)) }
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let error = error {
                return completion(.failure(.throwError(error)))
                
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    print("STATUS CODE: \(response.statusCode)")
                    
                }
            }
            
            guard let data = data else { return completion(.failure(.noData))}
            
            do {
                let topLevelObject = try JSONDecoder().decode(MealResults.self, from: data)
                
                var arrayOfMeals: [Meals] = []
                for strMeal in topLevelObject.meals {
                    arrayOfMeals.append(strMeal)
                }
                completion(.success(arrayOfMeals))
            } catch {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(.failure(.throwError(error)))
            }
        }.resume()
        
    }//End of func
    
    static func fetchMealImages(strMeal: String, completion: @escaping (Result<UIImage, MealErrors>) -> Void) {
        
        guard let baseURL = URL(string: "\(strMeal)") else { return completion(.failure(.invalidURL)) }
        print(baseURL)
        
        URLSession.shared.dataTask(with: baseURL) { data, _, error in
            
            if let error = error {
                return completion(.failure(.throwError(error)))
                
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
            
            guard let imageView = UIImage(data: data) else { return completion(.failure(.unableToDecode)) }
            self.cache.setObject(imageView, forKey: NSString(string: strMeal))
            completion(.success(imageView))
            
        }.resume()
        
    }//End of func
    
}//End of func
