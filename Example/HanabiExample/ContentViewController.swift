//
//  ContentViewController.swift
//  Example
//
//  Created by Ivan Lisovyi on 21/11/2015.
//  Copyright © 2015 Ivan Lisovyi. All rights reserved.
//

import UIKit

class ContentViewController: UICollectionViewController {
    fileprivate let cellIdentifier = "cellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ContentViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath as IndexPath) as! ContentCollectionViewCell
        cell.imageView?.image = imageAtIndex(index: indexPath.row)
        
        return cell
    }
    
    private func imageAtIndex(index: Int) -> UIImage? {
        return UIImage(named: String(index))
    }
}
