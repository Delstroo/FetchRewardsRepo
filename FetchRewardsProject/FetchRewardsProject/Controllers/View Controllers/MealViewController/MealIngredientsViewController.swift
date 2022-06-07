//
//  MealIngredientsViewController.swift
//  FetchRewardsProject
//
//  Created by Delstun McCray on 2/19/22.
//

import UIKit

class MealIngredientsViewController: UIViewController {
    // MARK: - Outlets

    @IBOutlet var mealImageView: UIImageView!
    @IBOutlet var mealNameLabel: UILabel!
    @IBOutlet var ingredientsTableView: UITableView!

    // MARK: - Landing Pads

    var meal: Meal?
    var searchResult: MealSearchResult?

    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        fetchAllIngredients()
        ingredientsTableView.dataSource = self
        ingredientsTableView.delegate = self
    } // End of func

    // MARK: - Helper Funcs

    func updateViews() {
        guard let meal = meal else { return }

        mealNameLabel.text = meal.name

        MealDetailController.fetchIngredientsImage(strMeal: "\(meal.thumbnailURL)") { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(meal):
                    self.mealImageView.image = meal
                    self.mealImageView.layer.cornerRadius = 15
                case let .failure(error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
        }
    }//End of func

    func fetchAllIngredients() {
        MealDetailController.fetchMealIngredients(mealID: searchResult?.id ?? "") { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(meal):
                    self.meal = meal
                    self.updateViews()
                    self.ingredientsTableView.reloadData()
                case let .failure(error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
        }
    } // End of func

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "toInstructionVC" {
            guard let destinationVC = segue.destination as? MealInstructionsViewController,
                  let ingredient = meal,
                  let meal = meal else { return }
            destinationVC.meal = ingredient
            destinationVC.meal = meal
        }
    } // End of func
} // End of class

extension MealIngredientsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return meal?.ingredients.count ?? 0
    } // End of func

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientsCell", for: indexPath) as UITableViewCell

        if let ingredient = meal?.ingredients[indexPath.row] {
            cell.textLabel?.text = "\(ingredient.name): \(ingredient.measurement)"
        } else {
            cell.textLabel?.text = ""
        }

        return cell
    } // End of func
}//End of extension
