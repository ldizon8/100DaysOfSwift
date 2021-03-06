//
//  DetailViewController.swift
//  Project1
//
//  Created by Lawrence Dizon on 10/14/20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    var selectedPictureNumber = 0
    var totalPictures = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture \(selectedPictureNumber + 1) of \(totalPictures)"
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.hidesBarsOnTap = true
        }
    
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            navigationController?.hidesBarsOnTap = false
        }
    
    @objc func shareTapped(){
          guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
                  print("no image found")
                  return
          }

          let vc = UIActivityViewController(activityItems: [image,selectedImage], applicationActivities: [])

          vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem

          present(vc, animated:  true)
      }



   

}
