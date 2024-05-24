//
//  DrawingPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 3/26/24.
//

import SwiftUI

struct DrawingPage: View {
    var body: some View {
        VStack {
            Slider(value: $drawWidth, in: 1...20)
            ColorPicker("Select a color", selection: $strokeColor)
            
            GeometryReader { geometry in
                Path { linePath in
                    for stroke in self.drawingStrokes {
                        self.addDrawingStroke(stroke, toPath: &linePath)
                    }
                    self.addDrawingStroke(self.drawingStroke, toPath: &linePath)
                }
                .stroke(self.strokeColor, lineWidth: self.drawWidth)
                .background(Color(white: 0.7))
                .gesture(
                    DragGesture(minimumDistance: 0.05)
                        .onChanged({ (value) in
                            let currentPoint = value.location
                            if currentPoint.y >= 0 && currentPoint.y < geometry.size.height {
                                self.drawingStroke.points.append(currentPoint)
                            }
                        })
                        .onEnded({ (value) in
                            self.drawingStrokes.append(self.drawingStroke)
                            self.drawingStroke = DrawingStroke()
                        })
                )
            }
        }
    }
    
    @State var drawingStroke: DrawingStroke = DrawingStroke()
    @State var drawingStrokes: [DrawingStroke] = [DrawingStroke]()
    @State var strokeColor: Color = Color.blue
    @State var drawWidth: CGFloat = 4.0
}

extension DrawingPage {
    func addDrawingStroke(_ stroke: DrawingStroke, toPath linePath: inout Path) {
        let points = stroke.points
        if points.count > 1 {
            for i in 0..<points.count-1 {
                let previous = points[i]
                let next = points[i+1]
                linePath.move(to: previous)
                linePath.addLine(to: next)
            }
        }
    }
}

struct DrawingStroke {
    var points: [CGPoint] = [CGPoint]()
}

#Preview {
    DrawingPage()
}
