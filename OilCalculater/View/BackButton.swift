//
//  BackButton.swift
//  OilCalculater
//
//  Created by OmerErbalta on 10.05.2024.
//

import Foundation
import UIKit

class BackButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }

    private func setupButton() {
        let image = UIImage(systemName: "chevron.left")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 24, weight: .bold))
              setImage(image, for: .normal)
        addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        translatesAutoresizingMaskIntoConstraints = false
    }

    @objc func backButtonTapped() {
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.dismiss(animated: true, completion: nil)
        }
    }
}
