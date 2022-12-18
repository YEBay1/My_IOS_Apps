//
//  DetailViewController.swift
//  BLOGGER.EXE
//
//  Created by Yunus Emre Bayezit on 18.12.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textView: UITextView!
    var selectedImage: String?
    var selectedText: String?
    var selectedRow: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = self.selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        switch selectedRow {
        case "1":
            textView.text = selectedText
        case "2":
            textView.text = selectedText
        case "3":
            textView.text = selectedText
        case "4":
            textView.text = selectedText
            
        default:
            print("no!")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
