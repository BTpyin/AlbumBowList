//
//  PhotoListViewController.swift
//  AlbumBowList
//
//  Created by Bowie Tso on 22/6/2021.
//
import Foundation
import UIKit

class AlbumListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    
    var viewModel = PhotoListViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        initUI()
        setBinding()
        // Do any additional setup after loading the view.
    }
    
    func initUI(){
        self.navigationItem.title = "AlbumList"
        self.navigationItem.hidesBackButton = true
        tableView.backgroundColor = .white
        tableView.allowsMultipleSelection = false
        tableView.clipsToBounds = false
    }
    
    func setBinding(){
        viewModel.output.albumsRelay.subscribe(onNext:{ _ in
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let album = viewModel.output.albumsRelay.value[indexPath.row]
        if let albumDetailViewController = storyboard?.instantiateViewController(withIdentifier: "AlbumDetailViewController") as? AlbumDetailViewController{
            albumDetailViewController.viewModel.input.albumRelay.accept(album)
            self.navigationController?.pushViewController(albumDetailViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.output.albumsRelay.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "AlbumListTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AlbumListTableViewCell else {
          fatalError("The dequeued cell is not an instance of PhotoListTableViewCell.")
        }
        let album = viewModel.output.albumsRelay.value[indexPath.row]
        cell.viewModel.input.albumRelay.accept(album)
        return cell
    }

}
