//
//  PageControl.swift
//  PageViewTest
//
//  Created by Michael Salmon on 2019-08-18.
//  Copyright © 2019 mesme. All rights reserved.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    let numberOfPages: Int
    @Binding var currentPage: Int
    let tint: PageControlTint
    
    init(numberOfPages: Int, currentPage: Binding<Int>, tint: PageControlTint = .white) {
        self.numberOfPages = numberOfPages
        self._currentPage = currentPage
        self.tint = tint
    }
    
    func makeCoordinator() -> Coordinator { Coordinator(self) }

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged
        )
        control.currentPageIndicatorTintColor = tint.uicolor
        control.pageIndicatorTintColor = tint.opacity(0.05)

        return control
    }
    
    func updateUIView(_ control: UIPageControl, context:Context) {
        control.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var control: PageControl
    
        init(_ control: PageControl) { self.control = control }
    
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}

/*
#if DEBUG
struct PageControl_Previews: PreviewProvider {
    static var previews: some View {
        PageControl()
    }
}
#endif
*/
