//
//  MultipleAnimationPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 2/29/24.
//

import SwiftUI

struct MultipleAnimationPage: View {
    @State private var myAppearance: MyAppearance = MyAppearance()
    
    var body: some View {
        
        VStack(spacing: 10.0) {
            
            Spacer()
            
            Text("Hello, world!")
                //.animation(nil, value: UUID())  // Disable animation
            
            Spacer()
            
            Button("update scale") { myAppearance.scale *= 2.0 }
            Button("update blur") { updateBlur() }
            Button("update scale and blur") { myAppearance.scale *= 2.0; updateBlur() }
            Button("reset") { myAppearance.scale = 1.0; myAppearance.blur = 0.0 }
        }
        .padding()
        
    }
    
    private func updateBlur() {
        if (myAppearance.blur == .zero) { myAppearance.blur = 1.0 } else { myAppearance.blur *= 2.0 }
    }
}

extension View {
    
    func apply(myAppearance: MyAppearance) -> some View {
        return self
            .scaleEffect(myAppearance.scale)
            .blur(radius: myAppearance.blur)
            .scaleEffect(myAppearance.scale)
            .rotation3DEffect(myAppearance.rotation, axis: (x: myAppearance.xAngle, y: myAppearance.yAngle, z: myAppearance.zAngle))
            .blur(radius: myAppearance.blur)
            .opacity(myAppearance.opacity)
            .offset(myAppearance.offset)
            .animation(myAppearance.animation, value: myAppearance.offset)
            .animation(myAppearance.animation, value: [myAppearance.scale, myAppearance.xAngle, myAppearance.yAngle, myAppearance.zAngle, myAppearance.blur])
            .animation(myAppearance.animation, value: myAppearance.rotation)
            .animation(myAppearance.animation, value: myAppearance.opacity)
    }
}


struct MyAppearance {
    
    public var offset: CGSize
    public var scale: CGFloat
    public var rotation: Angle
    public var xAngle: CGFloat
    public var yAngle: CGFloat
    public var zAngle: CGFloat
    public var blur: CGFloat
    public var opacity: Double
    public var animation: Animation?
    
    init() {
        self.offset = .zero
        self.scale = 1.0
        self.rotation = Angle(degrees: .zero)
        self.xAngle = .zero
        self.yAngle = .zero
        self.zAngle = .zero
        self.blur = .zero
        self.opacity = 1.0
        self.animation = Animation.default
    }
    
    init(offset: CGSize, scale: CGFloat, rotation: Angle, xAngle: CGFloat, yAngle: CGFloat, zAngle: CGFloat, blur: CGFloat, opacity: Double, animation: Animation? = nil) {
        self.offset = offset
        self.scale = scale
        self.rotation = rotation
        self.xAngle = xAngle
        self.yAngle = yAngle
        self.zAngle = zAngle
        self.blur = blur
        self.opacity = opacity
        self.animation = animation
    }
}

#Preview {
    MultipleAnimationPage()
}
