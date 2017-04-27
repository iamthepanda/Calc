//
//  CalcPageViewController.swift
//

import UIKit

class CalcPageViewController: UIPageViewController {
    
    weak var calcDelegate: CalcPageViewControllerDelegate?
    
    fileprivate(set) lazy var orderedViewControllers: [UIViewController] = {
        return [
            self.newColoredViewController("Basic"),
            self.newColoredViewController("Extra")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        if let initialViewController = orderedViewControllers.first {
            scrollToViewController(initialViewController)
        }
        
        calcDelegate?.calcPageViewController(self,
            didUpdatePageCount: orderedViewControllers.count)
    }
    
    func scrollToNextViewController() {
        if let visibleViewController = viewControllers?.first,
            let nextViewController = pageViewController(self,
                viewControllerAfter: visibleViewController) {
                    scrollToViewController(nextViewController)
        }
    }
    
    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = viewControllers?.first,
            let currentIndex = orderedViewControllers.index(of: firstViewController) {
                let direction: UIPageViewControllerNavigationDirection = newIndex >= currentIndex ? .forward : .reverse
                let nextViewController = orderedViewControllers[newIndex]
                scrollToViewController(nextViewController, direction: direction)
        }
    }
    
    fileprivate func newColoredViewController(_ color: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "\(color)ViewController")
    }
    
    fileprivate func scrollToViewController(_ viewController: UIViewController,
        direction: UIPageViewControllerNavigationDirection = .forward) {
        setViewControllers([viewController],
            direction: direction,
            animated: true,
            completion: { (finished) -> Void in
                self.notifyCalcDelegateOfNewIndex()
        })
    }
    
    fileprivate func notifyCalcDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.index(of: firstViewController) {
                calcDelegate?.calcPageViewController(self,
                    didUpdatePageIndex: index)
        }
    }
    
}

extension CalcPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
                return nil
            }
            
            let previousIndex = viewControllerIndex - 1
        
            guard previousIndex >= 0 else {
                return nil
            }
        
            guard orderedViewControllers.count > previousIndex else {
                return nil
            }
            
            return orderedViewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
                return nil
            }
            
            let nextIndex = viewControllerIndex + 1
            let orderedViewControllersCount = orderedViewControllers.count
        
            guard orderedViewControllersCount != nextIndex else {
                return nil
            }
        
            guard orderedViewControllersCount > nextIndex else {
                return nil
            }
            
            return orderedViewControllers[nextIndex]
    }
    
}

extension CalcPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool) {
        notifyCalcDelegateOfNewIndex()
    }
    
}

protocol CalcPageViewControllerDelegate: class {
    
    func calcPageViewController(_ calcPageViewController: CalcPageViewController,
        didUpdatePageCount count: Int)
    
    func calcPageViewController(_ calcPageViewController: CalcPageViewController,
        didUpdatePageIndex index: Int)
    
}
