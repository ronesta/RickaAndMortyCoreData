//
//  CharacterTableViewCell.swift
//  RickaAndMortyCoreData
//
//  Created by Ибрагим Габибли on 20.10.2024.
//

import UIKit
import SnapKit

final class CharacterTableViewCell: UITableViewCell {
    static let id = "CharacterTableViewCell"

    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()

    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 47
        return imageView
    }()

    private let characterNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23)
        return label
    }()

    private let characterGenderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    private let watchButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.backgroundColor = .systemOrange.withAlphaComponent(0.1)
        button.setTitleColor(UIColor.systemOrange, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        return button
    }()

    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black.withAlphaComponent(0.7)
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.layer.cornerRadius = 16
        label.clipsToBounds = true
        label.backgroundColor = .systemGreen.withAlphaComponent(0.1)
        label.textColor = .systemGreen
        label.textAlignment = .center
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customizeCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageView.image = nil
    }

    private func customizeCell() {
        contentView.addSubview(activityIndicator)
        contentView.addSubview(characterImageView)
        contentView.addSubview(characterNameLabel)
        contentView.addSubview(characterGenderLabel)
        contentView.addSubview(watchButton)
        contentView.addSubview(locationLabel)
        contentView.addSubview(statusLabel)

        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(characterImageView)
        }

        characterImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(135)
            make.width.equalTo(characterImageView.snp.height)
        }

        characterNameLabel.snp.makeConstraints { make in
            make.top.equalTo(characterImageView)
            make.leading.equalTo(characterImageView.snp.trailing).offset(20)
        }

        characterGenderLabel.snp.makeConstraints { make in
            make.top.equalTo(characterNameLabel.snp.bottom)
            make.leading.equalTo(characterNameLabel)
        }

        watchButton.snp.makeConstraints { make in
            make.leading.equalTo(characterNameLabel)
            make.top.equalTo(characterGenderLabel.snp.bottom).offset(20)
            make.width.equalTo(135)
            make.height.equalTo(35)
        }

        locationLabel.snp.makeConstraints { make in
            make.leading.equalTo(characterNameLabel)
            make.bottom.equalTo(characterImageView)
        }

        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(characterImageView)
            make.trailing.equalToSuperview().inset(10)
            make.width.equalTo(65)
            make.height.equalTo(30)
        }
    }

    func configure(with character: Character, image: UIImage?) {
        activityIndicator.startAnimating()
        characterImageView.image = image
        characterNameLabel.text = character.name
        characterGenderLabel.text = "\(character.species), \(character.gender)"
        watchButton.setTitle("Watch episodes", for: .normal)
        locationLabel.text = character.location.name
        statusLabel.text = character.status
    }
}
