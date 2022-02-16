//
//  MealDetailModelController.swift
//  FetchRewardsProject
//
//  Created by Delstun McCray on 2/15/22.
//

import Foundation
import UIKit

class MealModelDetailController {
    
    static let cache = NSCache<NSString, UIImage>()
    
    static var baseURL = "https://www.themealdb.com/api/json/v1/1/lookup.php"
    
    static func fetchMealIngredients(
        mealID: String,
        completion: @escaping(Result<[MealIngredients], MealErrors>) -> Void
    ) {
        
        guard let baseURL = URL(string: baseURL) else { return completion(.failure(.invalidURL)) }
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let mealIdCategory = URLQueryItem(name: "i", value: mealID)
        components?.queryItems = [mealIdCategory]
        
        guard let finalURL = components?.url else { return
            completion(.failure(.invalidURL)) }
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
                let topLevelObject = try JSONDecoder().decode(MealDetails.self, from: data)
                
                var arrayOfIngredients: [MealIngredients] = []
                for strMeal in topLevelObject.meal {
                    arrayOfIngredients.append(strMeal)
                }
                completion(.success(arrayOfIngredients))
            } catch {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(.failure(.throwError(error)))
            }
        }.resume()
        
    }//End of func
    
    static func fetchIngredientsImages(strMeal: String, completion: @escaping (Result<UIImage, MealErrors>) -> Void) {
        
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
}
