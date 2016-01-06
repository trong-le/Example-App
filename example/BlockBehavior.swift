//
//  BlockBehavior.swift
//  example
//
//  Created by Trong Le on 1/5/16.
//  Copyright © 2016 Trong Le. All rights reserved.
//

import UIKit

class BlockBehavior: UIDynamicBehavior
{

    // Define gravity
    let gravity = UIGravityBehavior()
    
    // Create bounds to stop block
    lazy var collider: UICollisionBehavior = {
        let lazilyCreatedCollider = UICollisionBehavior()
        lazilyCreatedCollider.translatesReferenceBoundsIntoBoundary = true
        return lazilyCreatedCollider
    }()
    
    // Add behaviors to block
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
    }
    
    func addBlock(block: UIView) {
        dynamicAnimator?.referenceView?.addSubview(block)
        gravity.addItem(block)
        collider.addItem(block)
    }
}
