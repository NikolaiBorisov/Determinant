//
//  TextViewController.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 08.04.2021.
//

import UIKit
import SnapKit

final class PageViewController: UIViewController, UITextViewDelegate {
  
  private var myText: String?
  private lazy var viewMaker = PageViewMaker(container: self)
  
  init(with text: String) {
    super.init(nibName: nil, bundle: nil)
    myText = text
    viewMaker.pageTextView.text = myText
  }
  
  required init?(coder: NSCoder) {
    fatalError(Constants.NSCoder.fatalError)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewMaker.dismissButton.addTarget(self, action: #selector(onDismissButtonTapped), for: .touchUpInside)
    viewMaker.pageTextView.delegate = self
    viewMaker.setupLayouts()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewMaker.pageTextView.centerVertically()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    viewMaker.pageTextView.frame = view.bounds
    viewMaker.pageTextView.centerVertically()
  }
  
  @objc private func onDismissButtonTapped() {
    dismiss(animated: true)
  }
    
  func textViewDidChange(_ textView: UITextView) {
    textView.centerVertically()
  }
  
}

