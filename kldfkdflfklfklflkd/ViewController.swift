//
//  ViewController.swift
//  kldfkdflfklfklflkd
//
//  Created by Mac on 23/09/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit


class SetupViewController: UIPageViewController {
    
    private(set) lazy var pages : [UIViewController] = {
        return [self.newPage(1), self.newPage(2), self.newPage(3), self.newPage(4)]
    }()
    
    private func newPage(_ page: Int) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Page\(page)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let firstPage = pages.first {
            print(#function, "if let firstPage", firstPage, pages)  //viewDidLoad() if let firstPage page1name [page1, page2, page3, page4]
            setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
            
        }
    }
}

extension SetupViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        print(#function)           //It doesn't print
        guard let pageIndex = pages.firstIndex(of: viewController) else { return nil }
        let nextIndex = pageIndex + 1
        let pageCount = pages.count
        guard nextIndex != pageCount else { return nil }
        guard pageCount > nextIndex else { return nil }
        return pages[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        print(#function)            //It doesn't print
        guard let pageIndex = pages.firstIndex(of: viewController) else { return nil }
        let previousIndex = pageIndex - 1
        guard previousIndex >= 0 else { return nil }
        guard pages.count > previousIndex else { return nil }
        return pages[previousIndex]
    }
    
}
