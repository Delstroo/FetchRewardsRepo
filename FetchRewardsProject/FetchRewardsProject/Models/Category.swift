//
//  CategoryModel.swift
//  FetchRewardsProject
//
//  Created by Delstun McCray on 2/15/22.
//

import Foundation

struct CategoryResults: Decodable {
    let categories: [Category]
} // End of struct

struct Category: Decodable {
    let id: String
    let name: String
    let thumbnail: String
    let description: String

    private enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case thumbnail = "strCategoryThumb"
        case description = "strCategoryDescription"
    } // End of enum
} // End of struct
