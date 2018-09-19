//
//  SubscriptionTableViewCell.swift
//  NES
//
//  Created by Andrew Robinson on 9/18/18.
//  Copyright © 2018 XYello, Inc. All rights reserved.
//

import UIKit

class SubscriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var detailView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        detailView.roundCorners(radius: 10.0)
        detailView.backgroundColor = .black
    }

}
