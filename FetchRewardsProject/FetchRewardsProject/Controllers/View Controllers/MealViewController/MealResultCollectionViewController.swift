//
//  MealResultCollectionViewController.swift
//  FetchRewardsProject
//
//  Created by Delstun McCray on 2/19/22.
//

import UIKit

private let reuseIdentifier = "mealSearchCell"

class MealResultCollectionViewController: UICollectionViewController {
    // MARK: - Outlets

    @IBOutlet var navigationLabel: UINavigationItem!

    // MARK: - LandingPads

    var mealSearchResult: MealSearchResult?
    var mealsArray: [MealSearchResult] = []
    var category: Category?

    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        fetchAllResults()
    }//End of func

    // MARK: - Helper Funcs

    func updateViews() {
        collectionView.reloadData()
        navigationLabel.title = category?.name
    } // End of func

    func fetchAllResults() {
        guard let mealID = category?.name else { return }

        MealController.fetchMealList(idMeal: mealID) { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(meals):
                    self.mealsArray = meals
                    self.updateViews()
                case let .failure(error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
        }
    } // End of func

    // MARK: UICollectionViewDataSource

    override func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return mealsArray.count
    } // End of func

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MealsCollectionViewCell else { return UICollectionViewCell() }

        let meal = mealsArray[indexPath.row]
        cell.meal = meal

        return cell
    } // End of func

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toIngredientsVC" {
            guard let cell = sender as? MealsCollectionViewCell,
                  let indexPath = collectionView.indexPath(for: cell),
                  let destination = segue.destination as? MealIngredientsViewController else { return }

            let selectedMeal = mealsArray[indexPath.row]
            destination.searchResult = selectedMeal
        }
    }
} // End of class

// MARK: - Extensions

extension MealResultCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let width = view.frame.width * 0.90

        return CGSize(width: width, height: width * 3 / 5)
    }//End of func

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        let oneCellWidth = view.frame.width * 0.90

        let cellsTotalWidth = oneCellWidth * 1

        let leftOverWidth = view.frame.width - cellsTotalWidth

        let inset = leftOverWidth / 3

        return UIEdgeInsets(top: inset, left: inset, bottom: 0, right: inset)
    }//End of func
}//End of extension
