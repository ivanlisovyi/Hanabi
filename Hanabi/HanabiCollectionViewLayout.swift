//
//  HanabiCollectionViewLayout.swift
//  Hanabi
//
//  Created by Ivan Lisovyi on 21/11/2015.
//  Copyright © 2015 Ivan Lisovyi. All rights reserved.
//

import UIKit

@IBDesignable public class HanabiCollectionViewLayout: UICollectionViewLayout {
    @IBInspectable public var standartHeight: CGFloat = 100.0
    @IBInspectable public var focusedHeight: CGFloat = 280.0
    @IBInspectable public var dragOffset: CGFloat = 180.0
    
    private var cachedLayoutAttributes = [UICollectionViewLayoutAttributes]()
    
    // MARK: UICollectionViewLayout methods

    override public func collectionViewContentSize() -> CGSize {
        guard let collectionView = collectionView else {
            return super.collectionViewContentSize()
        }
        
        let itemsCount = collectionView.numberOfItemsInSection(0)
        let contentHeight = CGFloat(itemsCount) * dragOffset + (collectionView.frame.height - dragOffset)
        
        return CGSize(width: collectionView.frame.width, height: contentHeight)
    }
    
    override public func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override public func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let proposedItemIndex = roundf(Float(proposedContentOffset.y / dragOffset))
        let nearestPageOffset = CGFloat(proposedItemIndex) * dragOffset
        
        return CGPoint(x: 0.0, y: nearestPageOffset)
    }
    
    override public func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cachedLayoutAttributes {
            if CGRectIntersectsRect(attributes.frame, rect) {
                layoutAttributes.append(attributes)
            }
        }
        
        return layoutAttributes
    }
    
    override public func prepareLayout() {
        guard let collectionView = collectionView else {
            return
        }
        
        var cache = [UICollectionViewLayoutAttributes]()
        
        let itemsCount = collectionView.numberOfItemsInSection(0)
        var frame = CGRectZero
        var y: CGFloat = 0.0
        
        for item in 0..<itemsCount {
            let indexPath = NSIndexPath(forItem: item, inSection: 0)
            
            var height = standartHeight
            let currentFocusedIndex = currentFocusedItemIndex()
            let nextItemOffset = nextItemPercentageOffset(forFocusedItemIndex: currentFocusedIndex)
            
            if indexPath.item == currentFocusedIndex {
                y = collectionView.contentOffset.y - standartHeight * nextItemOffset
                height = focusedHeight
            } else if indexPath.item == (currentFocusedIndex + 1) && indexPath.item != itemsCount {
                height = standartHeight + max((focusedHeight - standartHeight) * nextItemOffset, 0)
                
                let maxYOffset = y + standartHeight
                y = maxYOffset - height
            } else {
                y = frame.origin.y + frame.height
            }
            
            frame = CGRect(x: 0, y: y, width: collectionView.frame.width, height: height)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
            attributes.zIndex = item
            attributes.frame = frame
            
            cache.append(attributes)
            
            y = CGRectGetMaxY(frame)
        }
        
        cachedLayoutAttributes = cache
    }
    
    override public func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        return cachedLayoutAttributes[indexPath.item]
    }
    
    // MARK: Private methods
    
    private func currentFocusedItemIndex() -> Int {
        guard let collectionView = collectionView else {
            return 0
        }
        
        return max(0, Int(collectionView.contentOffset.y / dragOffset))
    }
    
    private func nextItemPercentageOffset(forFocusedItemIndex index: Int) -> CGFloat {
        guard let collectionView = collectionView else {
            return 0;
        }
        
        return (collectionView.contentOffset.y / dragOffset) - CGFloat(index)
    }
}
