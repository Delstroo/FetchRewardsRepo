//
//  MealError.swift
//  FetchRewardsProject
//
//  Created by Delstun McCray on 2/15/22.
//

import Foundation

enum MealErrors: LocalizedError {
    
    case invalidURL
    case throwError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "There was a failure with the server."
        case .throwError:
            return "there was an error with our network call."
        case .noData:
            return "There was no data found."
        case .unableToDecode:
            return "there was no data found."
        }
    }
}//end of enum
