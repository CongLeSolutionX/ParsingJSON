//
//  GridViewController.swift
//  ParsingJSON
//
//  Created by Cong Le on 2/12/20.
//  Copyright © 2020 CongLeSolutionX. All rights reserved.
//


import UIKit

class GridViewController: UIViewController {
    
    @IBOutlet weak var gridView: UICollectionView!
    var viewModel: ViewModel! //dependency injection
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.gridViewDelegate = self
        
        
    }
    
}

extension GridViewController: UICollectionViewDataSource{
    // number of grid cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("grid count: \(viewModel.albums.count)")
        return viewModel.albums.count
        
        
    }
    // render each grid
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let grid = collectionView.dequeueReusableCell(withReuseIdentifier: GridViewCell.identifier, for: indexPath) as? GridViewCell else {
            fatalError("The dequeued cell is not an instance of GridViewCell.")
        }
        
        // fetching the data for each grid
        let album = viewModel.albums[indexPath.row]
        grid.album = album
        return grid
    }
    
}


extension GridViewController: UICollectionViewDelegateFlowLayout{
    
    // handle the size of each grid cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 148, height: 187)
    }
    // the insets among each gird cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    // handle touch event
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.currentAlbum = viewModel.albums[indexPath.row]
        present(detailVC, animated: true )
        
    }
    
}


extension GridViewController: delegate{
    func updatingViewModel() {
        DispatchQueue.main.async {
            self.gridView.reloadData()
        }
    }
}
