//
//  HomeViewController.swift
//  TiktokClone
//
//  Created by Engineer 144 on 28/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit
import SwiftVideoBackground
import AVKit
import AVFoundation

class HomeViewController: UIViewController {
    
    @IBOutlet weak var FilterControl: UISegmentedControl!
    
    @IBOutlet weak var HomeCollectionView: UICollectionView!
  

    private var dataSource : CollectionViewDataSource<HomeCollectionViewCell, Videos>!
    private var viewmodel :VideosModel!
let videoBackground1 = VideoBackground()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.viewmodel = VideosModel()
        initViews()
        updateDataSource()
        // Do any additional setup after loading the view.
    }
    

    private func updateDataSource() {
        
       
        
        self.dataSource = CollectionViewDataSource(cellIdentifier: Cells.homecategoryCells, items: self.viewmodel.videos, configureCell: { (cell, data) in
            
            
            
            let url = URL(string: data.videoURL)!
            
         
            
            
           VideoBackground.shared.play(view: cell.videplayer, url: url)
            
            cell.totalComment.text = "\(data.commentCount)"
            cell.totalLikes.text =  "\(data.likesCount)"
            cell.userName.text = data.userName
            cell.userVideodiscription.text = data.videoDiscription
            cell.playingSong.text = data.songTitle
            cell.userProfile.image =  LetterImageGenerator.imageWith(name: data.userName)
            cell.diskIcon.startRotating()
            
            
            
           
        })
        
        self.HomeCollectionView.dataSource = self.dataSource
        self.HomeCollectionView.reloadData()
    }

    
    func initViews(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        HomeCollectionView.isPagingEnabled = true
        HomeCollectionView.setCollectionViewLayout(layout, animated: true)
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 19),
            .foregroundColor: UIColor.lightGray
        ]
        let selectedAtributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 19),
            .foregroundColor: UIColor.white
        ]
        
        FilterControl.setTitleTextAttributes( normalAttributes, for: .normal)
        FilterControl.setTitleTextAttributes(selectedAtributes, for: .selected)
        
        FilterControl.selectedSegmentIndex = 1
        
        
    }
    
    

    

}
extension HomeViewController : UICollectionViewDelegateFlowLayout ,UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
      
        
        
          return self.HomeCollectionView.frame.size;
        
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.homecategoryCells, for: indexPath) as? HomeCollectionViewCell
        
        //VideoBackground.shared.play(view: (cell?.videplayer)!, url: URL(string: self.viewmodel.videos[indexPath.item].videoURL)!)
    }

    
   
}


extension UIView {
    func startRotating(duration: Double = 1) {
        let kAnimationKey = "rotation"
        
        if self.layer.animation(forKey: kAnimationKey) == nil {
            let animate = CABasicAnimation(keyPath: "transform.rotation")
            animate.duration = duration
            animate.repeatCount = Float.infinity
            animate.fromValue = 0.0
            animate.toValue = Float(M_PI * 2.0)
            self.layer.add(animate, forKey: kAnimationKey)
        }
    }
    func stopRotating() {
        let kAnimationKey = "rotation"
        
        if self.layer.animation(forKey: kAnimationKey) != nil {
            self.layer.removeAnimation(forKey: kAnimationKey)
        }
    }
}
