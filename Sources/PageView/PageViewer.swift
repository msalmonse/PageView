//
//  PageViewer.swift
//  PageViewTest
//
//  Created by Michael Salmon on 2019-08-18.
//  Copyright © 2019 mesme. All rights reserved.
//

import Foundation

#if canImport(UIKit)
import SwiftUI

@available(iOS 13.0, *)
struct PageViewer<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0
    let tint: PageControlTint
    let alignment: Alignment
    
    init(
        _ views: [Page],
        tint: PageControlTint = .white,
        alignment: Alignment = .bottomTrailing
    ) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
        self.alignment = alignment
        self.tint = tint
    }

    var body: some View {
        ZStack(alignment: alignment) {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
            PageControl(
                numberOfPages: viewControllers.count,
                currentPage: $currentPage,
                tint: tint
            )
            .padding(.trailing)
        }
        .frame(width: 250, height: 250)
    }
}

#if DEBUG
@available(iOS 13.0, *)
struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageViewer([Text("Page 1"), Text("Page 2")])
    }
}
#endif

#endif
