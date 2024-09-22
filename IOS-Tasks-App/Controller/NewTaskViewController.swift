//
//  NewTaskViewController.swift
//  IOS-Tasks-App
//
//  Created by Ahmed El Gndy on 21/09/2024.
//

import UIKit
import Combine
class NewTaskViewController: UIViewController {
    @IBOutlet var newTaskTextField: UITextField!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var containerViewButtonConstraint: NSLayoutConstraint!
    @IBOutlet var saveButton :UIButton!
    
    @IBOutlet var containerView: UIView!
    private var subscriber = Set<AnyCancellable>()
    @Published private var taskString : String? // to observe chenges on the taskString
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpviews()
        observeForm()
        setupGestuer()
        obserkeyboard()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        newTaskTextField.becomeFirstResponder()
        
    }
    
    private func setUpviews() {
        backgroundView.backgroundColor = UIColor.init(white: 0.3, alpha: 0.4)
        containerViewButtonConstraint.constant = -containerView.frame.height
    }
    
    private func observeForm(){
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification).map { (notifictaion) -> String? in
            return (notifictaion.object as? UITextField)?.text
        }.sink {[unowned self ] (text) in
            self.taskString = text
        }.store(in: &subscriber)
        
        $taskString.sink { (text) in
            self.saveButton.isEnabled  = text?.isEmpty == false
        }.store(in: &subscriber)
    }
    private func setupGestuer(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissViewController))
        view.addGestureRecognizer(tapGesture)
    }
    private func obserkeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShown(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    @objc private func keyboardShown(_ notification : Notification){
        let keyboardHight = getkeyBoardHeight(notification : notification)
        print(keyboardHight)
        containerViewButtonConstraint.constant = keyboardHight - (200+8)
    }
    private func getkeyBoardHeight(notification : Notification) -> CGFloat {
        guard let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height else {return 0}
        return keyboardHeight
        
    }
    @objc private func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func calenderButtonTapped(_ sender: Any) {
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
}
