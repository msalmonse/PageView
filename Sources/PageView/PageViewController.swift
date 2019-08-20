//
//  PageViewController.swift
//  PageViewTest
//
//  Created by Michael Salmon on 2019-08-18.
//  Copyright © 2019 mesme. All rights reserved.
//

import Foundation

#if canImport(UIKit)
import SwiftUI

@available(iOS 13.0, *)
struct PageViewController: UIViewControllerRepresentable {
    var controllers: [UIViewController]
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator { Coordinator(self) }

    func makeUIViewController(context: Context) -> UIPageViewController
    {
        let controller = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        controller.dataSource = context.coordinator
        controller.delegate = context.coordinator
        
        return controller
    }
    
    func updateUIViewController(_ controller: UIPageViewController, context: Context) {
        controller.setViewControllers(
            [controllers[currentPage]],
            direction: .forward, animated: true
        )
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        
        init(_ controller: PageViewController) {
            self.parent = controller
        }

        func pageViewController(
            _ controller: UIPageViewController,
            viewControllerBefore view: UIViewController
        ) -> UIViewController?
        {
            guard let index = parent.controllers.firstIndex(of: view) else {
                return nil
            }
            if index == 0 { return parent.controllers.last }
            return parent.controllers[index - 1]
        }

        func pageViewController(
            _ controller: UIPageViewController,
            viewControllerAfter view: UIViewController
        ) -> UIViewController?
        {
            guard let index = parent.controllers.firstIndex(of: view) else {
                return nil
            }
            if index == parent.controllers.count - 1 { return parent.controllers.first }
            return parent.controllers[index + 1]
        }
        
        func pageViewController(
            _ controller: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool
        ) {
            if completed,
                let view = controller.viewControllers?.first,
                let index = parent.controllers.firstIndex(of: view)
            {
                parent.currentPage = index
            }
        }
    }

}

#endif
