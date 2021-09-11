//
//  RocketCell.swift
//  rs_task11_common
//
//  Created by Dzmitry Semenovich on 11.09.21.
//

import Foundation
import UIKit

extension RocketCell {
    private struct Appearance {
        var titleFont: UIFont = UIFont(name: "Roboto-Bold", size: 24)!
        var titleInfoFont: UIFont = UIFont(name: "Roboto-Bold", size: 14)!
        
        var infoTextColor:UIColor = UIColor(rgb: 0x6b717e)
    }
}

class RocketCell: UICollectionViewCell {
    
    //MARK:- Private properties
    
    private let appearance = Appearance()
    
    private lazy var rocketImage: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var labelsContainer: UIView = {
       let view = UIView()
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = appearance.titleFont
        label.textColor = .black
        return label
    }()
    
    private lazy var titleLaunchLabel: UILabel = {
        let label = UILabel()
        label.font = appearance.titleInfoFont
        label.textColor = .black
        label.text = "First launch"
        return label
    }()
    
    private lazy var launchDateLabel: UILabel = {
        let label = UILabel()
        label.font = appearance.titleInfoFont
        label.textColor = appearance.infoTextColor
        return label
    }()
    
    private lazy var titleCostLabel: UILabel = {
        let label = UILabel()
        label.font = appearance.titleInfoFont
        label.textColor = .black
        label.text = "Launch cost"
        return label
    }()
    
    private lazy var costLabel: UILabel = {
        let label = UILabel()
        label.font = appearance.titleInfoFont
        label.textColor = appearance.infoTextColor
        return label
    }()
    
    private lazy var titleSuccessLabel: UILabel = {
        let label = UILabel()
        label.font = appearance.titleInfoFont
        label.textColor = .black
        label.text = "Success"
        return label
    }()
    
    private lazy var successLabel: UILabel = {
        let label = UILabel()
        label.font = appearance.titleInfoFont
        label.textColor = appearance.infoTextColor
        return label
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 30.0
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var dateStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 3
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var costStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 3
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var successStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 3
        stackView.alignment = .leading
        return stackView
    }()
    
    //MARK:- Setup UI
    
    /// Setting data to cell fields
    /// - Parameter model: Rocket model
    func setupCell(model: RocketCellModel) {
        rocketImage.image = model.rocketImage
        titleLabel.text = model.rocketName
        launchDateLabel.text = model.launchDate
        costLabel.text = model.cost
        successLabel.text = model.successPercent
        
        addSubview()
    }
    
    func addSubview() {
        self.addSubview(rocketImage)
        self.addSubview(labelsContainer)
        labelsContainer.addSubview(titleLabel)
        
        dateStackView.addArrangedSubview(titleLaunchLabel)
        dateStackView.addArrangedSubview(launchDateLabel)
        
        costStackView.addArrangedSubview(titleCostLabel)
        costStackView.addArrangedSubview(costLabel)
        
        successStackView.addArrangedSubview(titleSuccessLabel)
        successStackView.addArrangedSubview(successLabel)
        
        infoStackView.addArrangedSubview(dateStackView)
        infoStackView.addArrangedSubview(costStackView)
        infoStackView.addArrangedSubview(successStackView)
        
        labelsContainer.addSubview(infoStackView)
        
        setupLayout()
    }
    
    func setupLayout() {
        /// rocketImage layout
        rocketImage.translatesAutoresizingMaskIntoConstraints = false
        rocketImage.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        rocketImage.heightAnchor.constraint(equalToConstant: 240.0).isActive = true
        rocketImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        rocketImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        /// labels container layout
        labelsContainer.translatesAutoresizingMaskIntoConstraints = false
        labelsContainer.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        labelsContainer.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        labelsContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        labelsContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        /// title label layout
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: labelsContainer.topAnchor, constant: 10.0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: labelsContainer.leadingAnchor, constant: 20.0).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 28.0).isActive = true
        titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: labelsContainer.trailingAnchor, constant: 200.0).isActive = true
        
        /// launcj info stackView layout
        infoStackView.leadingAnchor.constraint(lessThanOrEqualTo: labelsContainer.leadingAnchor, constant: 20.0).isActive = true
        infoStackView.trailingAnchor.constraint(lessThanOrEqualTo: labelsContainer.trailingAnchor, constant: 20.0).isActive = true
        infoStackView.bottomAnchor.constraint(equalTo: labelsContainer.bottomAnchor, constant: 21.0).isActive = true
        infoStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25).isActive = true
    }
    
}
