//
//  MealsCollectionViewCell.swift
//  FetchRewardsProject
//
//  Created by Delstun McCray on 2/19/22.
//

import UIKit

class MealsCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets

    @IBOutlet var mealImageView: UIImageView!
    @IBOutlet var mealNameLabel: UILabel!

    var meal: MealSearchResult? {
        didSet {
            updateViews()
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        mealImageView.image = UIImage(systemName: "square")
    }

    // MARK: - Helper Funcs

    func updateViews() {
        guard let meal = meal else { return }
        mealNameLabel.text = meal.name

        MealController.fetchMealImages(strMeal: meal.thumbnail) { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(thumbnail):
                    self.mealImageView.image = thumbnail
                    self.mealImageView.layer.cornerRadius = 15
                case .failure:
                    self.mealImageView.image = UIImage(named: "person")
                }
            }
        }
    } // End of func
} // End of class
