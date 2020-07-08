//
//  PageViewController.swift
//  Landmarks
//
//  Created by Peter Salz on 08.07.20.
//  Copyright © 2020 Peter Salz App Development. All rights reserved.
//

import SwiftUI
import UIKit

struct PageViewController: UIViewControllerRepresentable {
    
    var controllers: [UIViewController]
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController,
                                context: Context) {
        
        uiViewController.setViewControllers(
            [controllers[0]],
            direction: .forward,
            animated: true
        )
    }
}
