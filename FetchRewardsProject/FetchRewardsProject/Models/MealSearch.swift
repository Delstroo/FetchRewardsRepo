//
//  MealModel.swift
//  FetchRewardsProject
//
//  Created by Delstun McCray on 2/15/22.
//

import Foundation

struct MealSearchResponse: Decodable {
    let meals: [MealSearchResult]
} // End of struct

struct MealSearchResult: Decodable {
    let name: String
    let thumbnail: String
    let id: String

    private enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case thumbnail = "strMealThumb"
        case id = "idMeal"
    } // End of enum
} // End of struct
