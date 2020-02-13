//
//  ListViewController.swift
//  ParsingJSON
//
//  Created by Consultant on 2/12/20.
//  Copyright © 2020 Enhance IT. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
     var viewModel: ViewModel! //dependency injection
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.listViewDelegate = self
    

    }
   

}

extension ListViewController: UITableViewDataSource{
    
    // number of row
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("List count: \(viewModel.albums.count)")
        return viewModel.albums.count
    }
     // configure a cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListViewCell.identifier, for: indexPath) as? ListViewCell else{
            fatalError("The dequeued cell is not an instance of ListViewCell.")
        }
        
        // fetching the Album adta
        let album = viewModel.albums[indexPath.row]
        cell.album = album 
        return cell
    }
}


extension ListViewController: UITableViewDelegate{
    // handle the touch event on each cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
//        let currentAlbum = viewModel.albums[indexPath.row]
//        viewModel.albums = [currentAlbum]
//       // goToDetail(with: viewModel)
//        print("hello from list")
//
        
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.currentAlbum = viewModel.albums[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    // set the height for each row 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

extension ListViewController: delegate{
    func updatingViewModel(){
        DispatchQueue.main.async {
            self.listTableView.reloadData()
        }
    }
}
