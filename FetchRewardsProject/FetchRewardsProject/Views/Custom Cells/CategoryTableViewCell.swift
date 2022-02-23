//
//  CategoryListTableViewCell.swift
//  FetchRewardsProject
//
//  Created by Delstun McCray on 2/18/22.
//

import UIKit

protocol CategoryTableViewCellDelegate: AnyObject {
    func longerDescription(category: Category)
}

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet var categoryImageView: UIImageView!
    @IBOutlet var categoryNameLabel: UILabel!
    @IBOutlet var categoryDescriptionLabel: UILabel!

    var category: Category? {
        didSet {
            updateViews()
        }
    }

    weak var delegate: CategoryTableViewCellDelegate?

    @IBAction func longerDescriptionButtonTapped(_: Any) {
        guard let category = category else { return }

        delegate?.longerDescription(category: category)
    }//End of func

    func updateViews() {
        guard let category = category else { return }
        categoryNameLabel.text = category.name
        categoryNameLabel.underline()
        categoryDescriptionLabel.text = category.description

        CategoryController.fetchCategoryImages(strCategoryThumb: category.thumbnail) { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(category):
                    self.categoryImageView.image = category
                    self.categoryImageView.layer.cornerRadius = 15
                    self.categoryImageView.backgroundColor = UIColor.secondarySystemBackground
                case .failure:
                    self.categoryImageView.image = UIImage(systemName: "person")
                }
            }
        }
    } // End of func
} // End of class
