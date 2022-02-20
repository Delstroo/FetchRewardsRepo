//
//  MealInstructionsViewController.swift
//  FetchRewardsProject
//
//  Created by Delstun McCray on 2/19/22.
//

import UIKit

class MealInstructionsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet var mealImageView: UIImageView!
    @IBOutlet var mealNameLabel: UILabel!
    @IBOutlet var instructionsLabel: UILabel!
    @IBOutlet var sourceLinkLabel: UILabel!
    @IBOutlet var youtubeLinkLabel: UILabel!
    
    //MARK: -  Landing Pad
    var meals: [Meal] = []
    var meal: Meal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        mealNameLabel.layer.backgroundColor = UIColor.systemBackground.cgColor
        mealNameLabel.layer.cornerRadius = mealNameLabel.frame.height / 2
        let attributedString = NSMutableAttributedString(string: meal?.instructions ?? "")
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = 7.5
        
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        // *** Set Attributed String to your label ***
        instructionsLabel.attributedText = attributedString
        
        let tapYoutube = UITapGestureRecognizer(target: self, action: #selector(self.onYoutubeClicLabel(sender:)))
        youtubeLinkLabel.isUserInteractionEnabled = true
        youtubeLinkLabel.addGestureRecognizer(tapYoutube)
        
        let tapSourceWebsite = UITapGestureRecognizer(target: self, action: #selector(self.onSourceClicLabel(sender:)))
        sourceLinkLabel.isUserInteractionEnabled = true
        sourceLinkLabel.addGestureRecognizer(tapSourceWebsite)
    }
    
    //MARK: - Helper Funcs
    func updateViews() {
        
        guard let meal = meal else { return }
        if let youtubeURL = meal.youtubeURL {
            youtubeLinkLabel.text = "A great tutorial \n\(youtubeURL)"
            
        } else {
            youtubeLinkLabel.text = ""
        }
        
        if let sourceURL = meal.sourceURL {
            sourceLinkLabel.text = "Our recepie source\n \(sourceURL)"
        } else {
            sourceLinkLabel.text = ""
        }
        
        mealNameLabel.text = meal.name
        instructionsLabel.text = meal.instructions
        
        MealDetailController.fetchIngredientsImages(strMeal: "\(meal.thumbnailURL)" ) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let meal):
                    self.mealImageView.image = meal
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
        }
    }//End of func
    
    @objc func onSourceClicLabel(sender: UITapGestureRecognizer) {
        if let open = meal?.sourceURL {
            openUrl(urlString: "\(open)")
        }
    }//End of func
    
    @objc func onYoutubeClicLabel(sender: UITapGestureRecognizer) {
        if let open = meal!.youtubeURL {
            openUrl(urlString: "\(open)")
        }
    }//End of func
    
    func openUrl(urlString: String!) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }//End of func
    
}

