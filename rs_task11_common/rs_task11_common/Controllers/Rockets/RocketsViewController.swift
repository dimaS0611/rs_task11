//
//  RocketsViewController.swift
//  rs_task11_common
//
//  Created by Dzmitry Semenovich on 10.09.21.
//

import Foundation
import UIKit

extension RocketsViewController {
    struct Appearance {
        var backgroundColor: UIColor = UIColor(rgb: 0x4C6085)
        
        var screenWidth: CGFloat = UIScreen.main.bounds.width
        var screenHeight: CGFloat = UIScreen.main.bounds.height
        
        var cellsOffset: CGFloat = 17.0
        var cellHeight: CGFloat = 360.0
    }
}

class RocketsViewController: UIViewController {
    
    //MARK:- Private properties
    
    private let viewModel = RocketsViewModel()
    private let appearance = Appearance()
    
    var rocketsModel: [RocketCellModel] = []
    
    private let rocketCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 30.0, left: 0.0, bottom: 30.0, right: 0.0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    //MARK: UI Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = appearance.backgroundColor
        self.rocketCollectionView.backgroundColor = appearance.backgroundColor
        
        self.rocketCollectionView.delegate = self
        self.rocketCollectionView.dataSource = self
        
        addSubview()
        
        self.rocketCollectionView.register(RocketCell.self, forCellWithReuseIdentifier: "RocketCell")
        
        viewModel.rocketsCellsData.bind { [weak self] model in
            self?.rocketsModel.append(contentsOf: model)
            DispatchQueue.main.async {
                self?.rocketCollectionView.reloadData()
            }
        }
    }
    
    //MARK:- Setup UI
    
    func addSubview() {
        view.addSubview(rocketCollectionView)
        setupLayout()
    }
    
    func setupLayout() {
        rocketCollectionView.translatesAutoresizingMaskIntoConstraints = false
        rocketCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        rocketCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        rocketCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        rocketCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

// MARK:- UICollectionViewDelegate implementation

extension RocketsViewController: UICollectionViewDelegate {
    
}

// MARK:- UICollectionViewDataSource implementation

extension RocketsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rocketsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = rocketsModel[indexPath.row]
        let cell = rocketCollectionView.dequeueReusableCell(withReuseIdentifier: "RocketCell", for: indexPath) as? RocketCell
        cell?.setupCell(model: model)
        
        cell?.layer.cornerRadius = 12.0
        cell?.layer.borderWidth = 0.0
        cell?.layer.shadowColor = UIColor.black.cgColor
        cell?.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell?.layer.shadowRadius = 3.0
        cell?.layer.shadowOpacity = 0.5
        cell?.layer.masksToBounds = false
        
        return cell ?? UICollectionViewCell()
    }
}

extension RocketsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = appearance.screenWidth - (2 * appearance.cellsOffset)
        let height = appearance.cellHeight
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 30.0, left: 0.0, bottom: 30.0, right: 0.0)
    }
}
