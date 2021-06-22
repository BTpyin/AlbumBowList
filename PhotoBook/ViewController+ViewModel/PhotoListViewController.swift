//
//  PhotoListViewController.swift
//  PhotoBook
//
//  Created by Bowie Tso on 22/6/2021.
//
import Foundation
import UIKit

class PhotoListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    
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
        self.navigationItem.title = "PhotoBook"
        self.navigationItem.hidesBackButton = true
    }
    
    func setBinding(){
        viewModel.output.photosRelay.subscribe(onNext:{ _ in
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.output.photosRelay.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "PhotoListTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PhotoListTableViewCell else {
          fatalError("The dequeued cell is not an instance of PhotoListTableViewCell.")
        }
        let photo = viewModel.output.photosRelay.value[indexPath.row]
        cell.viewModel.input.photoRelay.accept(photo)
        return cell
    }

}
