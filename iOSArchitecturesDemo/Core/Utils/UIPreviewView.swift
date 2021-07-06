//
//  UIPreviewView.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 7/6/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import SwiftUI

struct UIPreviewView<V: UIView>: UIViewRepresentable {
    
    private let view: V
    
    init(_ view: V) {
        self.view = view
    }
    
    func makeUIView(context: Context) -> V {
        return view
    }
    
    func updateUIView(_ uiView: V, context: Context) { }
}
