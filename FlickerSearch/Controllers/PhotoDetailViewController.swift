//
//  PhotoDetailViewController.swift
//  FlickerSearch
//
//  Created by kamilcal on 14.12.2022.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photo: Photo?
    
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ımageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Detail"
        textView.isEditable = false
        textView.isSelectable = false
        title = photo?.title
        ownerImageView.layer.cornerRadius = 24.0
        
        
        ownerNameLabel.text = photo?.ownername
        
        NetworkManager.shared.fetchImage(with: photo?.buddyIconUrl) { data in
            self.ownerImageView.image = UIImage(data: data)
        }
        
        NetworkManager.shared.fetchImage(with: photo?.urlZ) { data in
            self.ımageView.image = UIImage(data: data)
        }
        
        textView.text = photo?.description?.content
        
    }
  

}
