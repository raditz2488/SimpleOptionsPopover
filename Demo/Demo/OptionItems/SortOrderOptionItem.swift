//
//  SortOrderOptionItem.swift
//  SimpleOptionsPopover
//
//  Created by Rohan Bhale on 17/04/18.
//  Copyright © 2018 Rohan Bhale. All rights reserved.
//

import UIKit

enum SortOrder {
    case descending
    case ascending
}

struct SortOrderOptionItem: RBOptionItem {
    var text: String
    var font = UIFont.systemFont(ofSize: 13)
    var isSelected: Bool
    var orderType: SortOrder
}
