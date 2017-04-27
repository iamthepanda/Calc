//
//  ViewController.swift
//  Calc
//
//  Created by George Jone on 4/24/17.
//  Copyright © 2017 George Jone. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var calculationsView: UIStackView!
    
    
    let calc = Calc.calc
    
    var calcPageViewController: CalcPageViewController? {
        didSet {
            calcPageViewController?.calcDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.addTarget(self, action: #selector(CalcViewController.didChangePageControlValue), for: .valueChanged)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let calcPageViewController = segue.destination as? CalcPageViewController {
            self.calcPageViewController = calcPageViewController
        }
    }
    
    func didChangePageControlValue() {
        calcPageViewController?.scrollToViewController(index: pageControl.currentPage)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension CalcViewController: CalcPageViewControllerDelegate {
    
    func calcPageViewController(_ calcPageViewController: CalcPageViewController,
                                    didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func calcPageViewController(_ calcPageViewController: CalcPageViewController,
                                    didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

