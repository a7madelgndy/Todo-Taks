//
//  ViewController.swift
//  IOS-Tasks-App
//
//  Created by Ahmed El Gndy on 16/09/2024.
//

import UIKit

class TasksViewController: UIViewController {

    @IBOutlet weak var menuSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var TasksContainerView : UIView!
    @IBOutlet weak var DoneTasksContainerView : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSegmentedControl()
    }
     
    private func setUpSegmentedControl(){
        menuSegmentedControl.removeAllSegments()
        MenuSection.allCases.enumerated().forEach{(index , section) in
            menuSegmentedControl.insertSegment(withTitle: section.rawValue, at: index, animated: true)
        }
        menuSegmentedControl.selectedSegmentIndex = 0
        showTheContainerView(for: .tasks)
    }
 
    @IBAction func segmentedControlChanges(_ sender : UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0 :
            showTheContainerView(for: .tasks)
        case 1 :
            showTheContainerView(for: .done)
        default:
            break
        }
        
    }
   
    private func showTheContainerView(for section : MenuSection){
        switch section {
        case .tasks:
            TasksContainerView.isHidden = false
            DoneTasksContainerView.isHidden = true
        case .done:
            TasksContainerView.isHidden = true
            DoneTasksContainerView.isHidden = false
        }
    }
    @IBAction func addTaskButtonTapped(_ sender : UIButton) {
        performSegue(withIdentifier: "showNewTask", sender: nil)
    }
}

