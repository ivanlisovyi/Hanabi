//
//  ContentViewController.swift
//  Example
//
//  Created by Ivan Lisovyi on 21/11/2015.
//  Copyright © 2015 Ivan Lisovyi. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    private func setupNavigationBar() {
        let label = UILabel(frame: CGRectMake(0, 0, 200, 21))
        label.font = UIFont.systemFontOfSize(21)
        label.textColor = UIColor.darkGrayColor()
        label.textAlignment = .Center
        label.text = "Genres"
        
        navigationItem.titleView = label
    }
}

extension ContentViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cellIdentifier = "cellIdentifier"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! ContentCollectionViewCell
        cell.imageView?.image = imageAtIndex(indexPath.row)
        
        return cell
    }
    
    func imageAtIndex(index: Int) -> UIImage? {
        return UIImage(named: String(index))
    }
}

extension ContentViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
}
