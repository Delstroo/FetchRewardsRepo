//
//  CategoryTableViewController.swift
//  FetchRewardsProject
//
//  Created by Delstun McCray on 2/18/22.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    
    //MARK: - Landing Pads
    var categories: [Category] = []
    var filteredCategories: [Category] = []
    
    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        fetchCategories()
    }
    
    //MARK: - Helper Functions
    
    func updateViews() {
        tableView.reloadData()
    }//End of func
    
    func fetchCategories() {
        
        CategoryController.fetchCategoryList { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let category):
                    self.categories = category
                    self.filteredCategories = category
                    self.updateViews()
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
        }
    }//End of func
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }//End of func
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryListsCell", for: indexPath) as? CategoryListTableViewCell else { return UITableViewCell() }
        
        let category = self.categories[indexPath.row]
        cell.category = category
        cell.delegate = self
        
        return cell
        
    }//End of func
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMealVC" {
            
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? MealResultCollectionViewController else { return }
            
            let selectedCategory = categories[indexPath.row]
            destination.category = selectedCategory
        }
    }//End of func
    
}//End of class

extension CategoryTableViewController: CategoryListTableViewCellDelegate {
    
    func longerDescription(category: Category) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "categoryDescriptionVC") as? CategoryDescriptionViewController else { return }
        
        viewController.category = category
        
        if let presentationController = viewController.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium(), .large()]
        }
        self.present(viewController, animated: true)
    }
}
