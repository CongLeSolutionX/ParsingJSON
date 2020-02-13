//
//  ViewController.swift
//  ParsingJSON
//
//  Created by Consultant on 2/11/20.
//  Copyright © 2020 Enhance IT. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var listView: UIView!
    
    @IBOutlet weak var gridView: UIView!
    
    var viewModel =  ViewModel() // dependency injection 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listView.alpha = 1
        gridView.alpha = 0
        
        
    }

    // toggle betwwen the views 
    @IBAction func segmentSwitched(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            listView.alpha = 1
            gridView.alpha = 0
        } else {
            listView.alpha = 0
             gridView.alpha = 1
        }
    }
    
    
    // pass view model to containers via segue
      override func prepare(for segue: UIStoryboardSegue, sender: Any?){
          if segue.identifier == "ListSegue"{
              let listVC = segue.destination as! ListViewController
              listVC.viewModel = viewModel
          } else if segue.identifier == "GridSegue" {
              let gridVC = segue.destination as! GridViewController
              gridVC.viewModel = viewModel
          }
          
      }
    
    
}

