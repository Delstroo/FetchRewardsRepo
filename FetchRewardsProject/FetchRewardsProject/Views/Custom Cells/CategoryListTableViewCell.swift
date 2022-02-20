//
//  CategoryListTableViewCell.swift
//  FetchRewardsProject
//
//  Created by Delstun McCray on 2/18/22.
//

import UIKit

protocol CategoryListTableViewCellDelegate: AnyObject {
    func longerDescription(category: Category)
}

class CategoryListTableViewCell: UITableViewCell {
    
    @IBOutlet var mealImageView: UIImageView!
    @IBOutlet var mealNameLabel: UILabel!
    @IBOutlet var mealDescriptionLabel: UILabel!
    
    var category: Category? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: CategoryListTableViewCellDelegate?
    
    @IBAction func longerDescriptionButtonTapped(_ sender: Any) {
        
        guard let category = category else { return }
        
        self.delegate?.longerDescription(category: category)
    }
    
    func updateViews() {
        guard let category = category else { return }
        mealNameLabel.text = category.name
        mealDescriptionLabel.text = category.description
        
        CategoryController.fetchCategoryImages(strCategoryThumb: category.thumbnail) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let category):
                    self.mealImageView.image = category
                    self.mealImageView.backgroundColor = UIColor.secondarySystemBackground
                case .failure(_):
                    self.mealImageView.image = UIImage(systemName: "person")
                }
            }
        }
        
    }//End of func

}//End of class
