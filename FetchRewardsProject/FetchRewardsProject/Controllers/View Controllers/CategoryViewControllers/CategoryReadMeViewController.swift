//
//  CategoryReadMeViewController.swift
//  FetchRewardsProject
//
//  Created by Delstun McCray on 2/19/22.
//

import UIKit

class CategoryDescriptionViewController: UIViewController {
    // MARK: - Outlets

    @IBOutlet var categoryDescriptionLabel: UILabel!
    @IBOutlet var categoryNameLabel: UILabel!
    
    // MARK: - Landing Pads

    var category: Category?

    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    } // End of func

    // MARK: - Helper Funcs

    func updateViews() {
        guard let category = category else { return }
        categoryDescriptionLabel.text = category.description
        categoryNameLabel.text = category.name
        categoryNameLabel.underline()
        view.backgroundColor = UIColor.clear

        // Blur Effect

        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.frame
        view.insertSubview(blurEffectView, at: 0)
    } // End of func
} // End of class
