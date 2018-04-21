//
//  ViewController.swift
//  Demo
//
//  Created by pranav on 21/04/18.
//  Copyright © 2018 RB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sortorderButtonITem = UIBarButtonItem(title: "Sort Order", style: .plain, target: self, action: #selector(sortorderAction(_:)))
        self.navigationItem.leftBarButtonItem = sortorderButtonITem
        
        let sortbyButtonITem = UIBarButtonItem(title: "Sort By", style: .plain, target: self, action: #selector(sortbyAction(_:)))
        self.navigationItem.rightBarButtonItem = sortbyButtonITem
    }
        
    @IBAction func sortbyAction(_ sender: UIBarButtonItem) {
        let sortbyUpdatedAtOptionItem = SortByOptionItem(text: "Updated At", font: UIFont.systemFont(ofSize: 13), isSelected: true, sortyBy: .updatedAt)
        let sortbyAlphabetOptionItem = SortByOptionItem(text: "Alphabet", font: UIFont.systemFont(ofSize: 13), isSelected: false, sortyBy: .alphabet)
        presentOptionsPopover(withOptionItems: [[sortbyUpdatedAtOptionItem, sortbyAlphabetOptionItem]], fromBarButtonItem: sender)
    }
    
    
    @IBAction func sortorderAction(_ sender: UIBarButtonItem) {
        let sortOrderDescendingOptionItem = SortOrderOptionItem(text: "Descending", font: UIFont.systemFont(ofSize: 13), isSelected: true, orderType: .descending)
        let sortOrderAscendingOptionItem = SortOrderOptionItem(text: "Ascending", font: UIFont.systemFont(ofSize: 13), isSelected: false, orderType: .ascending)
        presentOptionsPopover(withOptionItems: [[sortOrderDescendingOptionItem, sortOrderAscendingOptionItem]], fromBarButtonItem: sender)
    }
    
    func presentOptionsPopover(withOptionItems items: [[RBOptionItem]], fromBarButtonItem barButtonItem: UIBarButtonItem) {
        let optionItemListVC = RBOptionItemListViewController()
        optionItemListVC.items = items
        
        guard let popoverPresentationController = optionItemListVC.popoverPresentationController else { fatalError("Set Modal presentation style") }
        popoverPresentationController.barButtonItem = barButtonItem
        popoverPresentationController.delegate = self
        self.present(optionItemListVC, animated: true, completion: nil)
    }
    
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

