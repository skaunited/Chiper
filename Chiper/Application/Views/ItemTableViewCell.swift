//
//  ItemTableViewCell.swift
//  Chiper
//
//  Created by Skander Bahri on 14/11/2022.
//

import UIKit

protocol ItemTableViewCellProtocol {
    func configure(with model: ItemTableViewCellModel)
}

struct ItemTableViewCellModel {
    var titleLabel: String
    var description: String
    var price: String
    var categoryLabel: String
    var imageUrl: String
    var creationDate: Date
    var isUrgent: Bool
    
    init(titleLabel: String,
         description: String,
         price: String,
         categoryLabel: String,
         imageUrl: String,
         creationDate: Date,
         isUrgent: Bool) {
        self.titleLabel = titleLabel
        self.description = description
        self.price = price
        self.categoryLabel = categoryLabel
        self.imageUrl = imageUrl
        self.creationDate = creationDate
        self.isUrgent = isUrgent
    }
}

class ItemTableViewCell: UITableViewCell, ItemTableViewCellProtocol {
    lazy var drawer: DrawingProtocol = Drawing.shared
    lazy var themedLabel: ThemedUILabelProtocol = ThemedUILabel.shared
    lazy var themedUIImageView: ThemedUIImageViewProtocol = ThemedUIImageView.shared
    
    var titleLabel: UILabel?
    var priceLabel: UILabel?
    var descriptionLabel: UILabel?
    var categoryLabel: UILabel?
    var urgentLabel: UILabel?
    var itemImage: UIImageView?
    let imageSize: CGFloat = 32
    
    func configure(with model: ItemTableViewCellModel) {
        // CONTENT
        titleLabel?.text = model.titleLabel
        priceLabel?.text = model.price
        categoryLabel?.text = model.categoryLabel
        urgentLabel?.text = Constants.urgently
        urgentLabel?.isHidden = !model.isUrgent
        descriptionLabel?.text = model.description
        if let url = URL(string: model.imageUrl) {
            itemImage?.load(url: url)
        }
    }
    
    // MARK: - REQUIRED INIT
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - OVERRIDES
    override func prepareForReuse() {
        super.prepareForReuse()
        cleanUI()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // SETUP GRAPHIC
        setupLabels()
        setupImgeItem()

        addSubview(itemImage.orDefault)
        let whiteUIView = UIView()
        whiteUIView.addConstraints([
            NSLayoutConstraint(item: whiteUIView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 64),
            NSLayoutConstraint(item: whiteUIView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 16)
        ])
        
        
        urgentLabel?.addConstraints([
            NSLayoutConstraint(item: urgentLabel.orDefault, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 64),
            NSLayoutConstraint(item: urgentLabel.orDefault, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 16)
        ])
        
        categoryLabel?.addConstraints([
            NSLayoutConstraint(item: categoryLabel.orDefault, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 2, constant: 64),
            NSLayoutConstraint(item: categoryLabel.orDefault, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 16)
        ])
        
        descriptionLabel?.addConstraint(NSLayoutConstraint(item: descriptionLabel.orDefault, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 64))

        
        let hzStackView = UIStackView(arrangedSubviews: [titleLabel.orDefault,
                                                        categoryLabel.orDefault])
        hzStackView.distribution = .fill
        hzStackView.axis = .horizontal
        hzStackView.spacing = 8
        
        hzStackView.updateFocusIfNeeded()
        
        let secondHzStack = UIStackView(arrangedSubviews: [descriptionLabel.orDefault,
                                                           priceLabel.orDefault])
        secondHzStack.distribution = .fill
        secondHzStack.axis = .horizontal
        secondHzStack.spacing = 8
        secondHzStack.updateFocusIfNeeded()
        
        let thirdHzStack = UIStackView(arrangedSubviews: [urgentLabel.orDefault,
                                                           whiteUIView,
                                                           whiteUIView])
        thirdHzStack.distribution = .fill
        thirdHzStack.axis = .horizontal
        thirdHzStack.spacing = 8

        let stackView = UIStackView(arrangedSubviews: [hzStackView,
                                                       secondHzStack,
                                                       thirdHzStack])
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 8
        addSubview(stackView)
        
        itemImage?.anchor(left: leftAnchor,
                          centerY: centerYAnchor,
                          paddingLeft: 16,
                          width: 64,
                          height: 64)
        
        stackView.anchor(top: topAnchor,
                         left: itemImage?.rightAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         centerY: centerYAnchor,
                         paddingTop: 16,
                         paddingLeft: 16,
                         paddingBottom: 16,
                         paddingRight: 16,
                         enableInsets: false)
    }
}

// MARK: - PRIVATE FUNCTIONS
extension ItemTableViewCell {
    func cleanUI() {
        titleLabel = themedLabel.clean(label: titleLabel.orDefault)
        categoryLabel = themedLabel.clean(label: categoryLabel.orDefault)
        priceLabel = themedLabel.clean(label: priceLabel.orDefault)
        itemImage = themedUIImageView.clean(imageView: itemImage.orDefault, size: imageSize)
    }
    
    func setupLabels() {
        titleLabel = themedLabel.renderLabel(textColor: .BC3,
                                             backgroundColor: .BC0,
                                             cornerRadius: nil,
                                             fontSize: 14,
                                             textAlignment: .left,
                                             numberOfLines: 0,
                                             autoresizing: false,
                                             isBold: true)
        
        descriptionLabel = themedLabel.renderLabel(textColor: .BC3,
                                             backgroundColor: .BC0,
                                             cornerRadius: nil,
                                             fontSize: 12,
                                             textAlignment: .left,
                                             numberOfLines: 0,
                                             autoresizing: false,
                                             isBold: false)
        
        priceLabel = themedLabel.renderLabel(textColor: .BC5,
                                             backgroundColor: .BC0,
                                             cornerRadius: nil,
                                             fontSize: 14,
                                             textAlignment: .right,
                                             numberOfLines: 0,
                                             autoresizing: false,
                                             isBold: true)
        
        categoryLabel = themedLabel.renderLabel(textColor: .BC1,
                                                backgroundColor: .BC2,
                                                cornerRadius: 4.0,
                                                fontSize: 8,
                                                textAlignment: .center,
                                                numberOfLines: 0,
                                                autoresizing: false,
                                                isBold: false)
        
        urgentLabel = themedLabel.renderLabel(textColor: .BC0,
                                              backgroundColor: .BC4,
                                              cornerRadius: 4.0,
                                              fontSize: 8,
                                              textAlignment: .center,
                                              numberOfLines: 0,
                                              autoresizing: false,
                                              isBold: true)
    }
    
    func setupImgeItem() {
        itemImage = themedUIImageView.renderUIImageView(systemName: Constants.placeHolderIcon,
                                                        contentMode: .scaleAspectFill,
                                                        size: 64,
                                                        cornerRadius: 5.0,
                                                        clipsToBounds: true,
                                                        isSFSymbol: true,
                                                        autoresizing: false)
    }
}
