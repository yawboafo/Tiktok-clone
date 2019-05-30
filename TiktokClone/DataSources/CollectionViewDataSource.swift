//
//  CollectionViewDataSource.swift
//  TiktokClone
//
//  Created by Engineer 144 on 28/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation
import UIKit
class CollectionViewDataSource<Cell :UICollectionViewCell,model> : NSObject, UICollectionViewDataSource {
    
    
    
    private var cellIdentifier :String!
    private var items :[model]!
    var configureCell :(Cell,model) -> ()
    
    init(cellIdentifier :String, items :[model], configureCell: @escaping (Cell,model) -> ()) {
        
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
        
        
       
       

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! Cell
       
      
        
        
       
        let item = self.items[indexPath.row]
        self.configureCell(cell,item)
        return cell
    }
    
  /**
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
       
        return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height + 300)

        
    }
    **/
 
    
   
    
    
    
}
