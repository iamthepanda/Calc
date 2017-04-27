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
    @IBOutlet weak var expression: UILabel!
    @IBOutlet weak var evaluatedTerm: UILabel!
    @IBOutlet weak var expression2: UILabel!
    @IBOutlet weak var evaluatedTerm2: UILabel!
    @IBOutlet weak var expression3: UILabel!
    @IBOutlet weak var evaluatedTerm3: UILabel!
    
    let calc = Calc.calc
    
    var expressions: [UILabel] = []
    var evaluatedTerms: [UILabel] = []

    var curLineIndex: Int = 0
    
    var calcPageViewController: CalcPageViewController? {
        didSet {
            calcPageViewController?.CalcPageDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calc.delegate = self
        pageControl.addTarget(self, action: #selector(CalcViewController.didChangePageControlValue), for: .valueChanged)

        expressions = [expression, expression2, expression3]
        evaluatedTerms = [evaluatedTerm, evaluatedTerm2, evaluatedTerm3]

        for expression in expressions {
            expression.text = ""
        }

        for result in evaluatedTerms {
            result.text = ""
        }

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

extension CalcViewController: CalcDelegate {
    
    func updateExpression() {
        expressions[curLineIndex].text = calc.buffer
    }
    
    func updateResult() {
        evaluatedTerms[curLineIndex].text = calc.result
    }

    func next() {
        if curLineIndex < expressions.count-1 {
            curLineIndex += 1
        } else {
            for i in 0..<expressions.count-1 {
                expressions[i].text = expressions[i+1].text
            }
            for i in 0..<evaluatedTerms.count-1 {
                evaluatedTerms[i].text = evaluatedTerms[i+1].text
            }

        }

        calc.clearBuffer()
    }
    
}
