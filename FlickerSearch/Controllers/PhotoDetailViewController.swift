//
//  PhotoDetailViewController.swift
//  FlickerSearch
//
//  Created by kamilcal on 14.12.2022.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ımageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Detail"
        textView.isEditable = false
        textView.isSelectable = false
    }
    

   

}
