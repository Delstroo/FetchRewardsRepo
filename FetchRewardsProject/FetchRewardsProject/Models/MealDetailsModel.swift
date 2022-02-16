//
//  MealDetailsModel.swift
//  FetchRewardsProject
//
//  Created by Delstun McCray on 2/15/22.
//

import Foundation

struct MealDetails: Decodable {
    
    let meal: [MealIngredients]

}// End of struct

struct MealIngredients: Decodable {
    
    var mealId: String?
    var meal: String?
    var category: String?
    var instructions: String?
    var thumbnail: String?
    var youtubeLink: String?
    var sourceLink: String?
    var ingredient1: String?
    var ingredient2: String?
    var ingredient3: String?
    var ingredient4: String?
    var ingredient5: String?
    var ingredient6: String?
    var ingredient7: String?
    var ingredient8: String?
    var ingredient9: String?
    var ingredient10: String?
    var ingredient11: String?
    var ingredient12: String?
    var ingredient13: String?
    var ingredient14: String?
    var ingredient15: String?
    var ingredient16: String?
    var ingredient17: String?
    var ingredient18: String?
    var ingredient19: String?
    var ingredient20: String?
    var measurement1: String?
    var measurement2: String?
    var measurement3: String?
    var measurement4: String?
    var measurement5: String?
    var measurement6: String?
    var measurement7: String?
    var measurement8: String?
    var measurement9: String?
    var measurement10: String?
    var measurement11: String?
    var measurement12: String?
    var measurement13: String?
    var measurement14: String?
    var measurement15: String?
    var measurement16: String?
    var measurement17: String?
    var measurement18: String?
    var measurement19: String?
    var measurement20: String?
    
    private enum CodingKeys: String, CodingKey {
        
        case mealId = "idMeal"
        case meal = "strMeal"
        case category = "strCategory"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
        case youtubeLink = "strYoutube"
        case sourceLink = "strSource"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        case measurement1 = "strMeasure1"
        case measurement2 = "strMeasure2"
        case measurement3 = "strMeasure3"
        case measurement4 = "strMeasure4"
        case measurement5 = "strMeasure5"
        case measurement6 = "strMeasure6"
        case measurement7 = "strMeasure7"
        case measurement8 = "strMeasure8"
        case measurement9 = "strMeasure9"
        case measurement10 = "strMeasure10"
        case measurement11 = "strMeasure11"
        case measurement12 = "strMeasure12"
        case measurement13 = "strMeasure13"
        case measurement14 = "strMeasure14"
        case measurement15 = "strMeasure15"
        case measurement16 = "strMeasure16"
        case measurement17 = "strMeasure17"
        case measurement18 = "strMeasure18"
        case measurement19 = "strMeasure19"
        case measurement20 = "strMeasure20"
    }//End of enum
    
}// End of struct

/*
 
 idMeal
 strMeal
 strCategory
 strInstructions
 strMealThumb
 strYoutube
 strSource
 strIngredient1
 strIngredient2
 strIngredient3
 strIngredient4
 strIngredient5
 strIngredient6
 strIngredient7
 strIngredient8
 strIngredient9
 strIngredient10
 strIngredient11
 strIngredient12
 strIngredient13
 strIngredient14
 strIngredient15
 strIngredient16
 strIngredient17
 strIngredient18
 strIngredient19
 strIngredient20
 strMeasure1
 strMeasure2
 strMeasure3
 strMeasure4
 strMeasure5
 strMeasure6
 strMeasure7
 strMeasure8
 strMeasure9
 strMeasure10
 strMeasure11
 strMeasure12
 strMeasure13
 strMeasure14
 strMeasure15
 strMeasure16
 strMeasure17
 strMeasure18
 strMeasure19
 strMeasure20
 
 */


