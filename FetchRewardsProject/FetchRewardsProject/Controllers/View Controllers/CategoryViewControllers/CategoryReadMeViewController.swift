//
//  CategoryReadMeViewController.swift
//  FetchRewardsProject
//
//  Created by Delstun McCray on 2/19/22.
//

import UIKit

class CategoryDescriptionViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet var descriptionLabel: UILabel!
    
    //MARK: - Landing Pads
    var category: Category?
    
    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
//        view.backgroundColor = UIColor.clear
    }//End of func
    
    //MARK: - Helper Funcs
    func updateViews() {
        guard let category = category else { return }
        descriptionLabel.text = category.description

        //MARK: - Blur Effect
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.frame
        view.insertSubview(blurEffectView, at: 0)
    }//End of func

}//End of class
