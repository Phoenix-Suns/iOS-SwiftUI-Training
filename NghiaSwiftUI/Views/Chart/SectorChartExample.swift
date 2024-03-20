//
//  SectorChartExample.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 10/31/23.
//

import SwiftUI
import Charts

struct Product: Identifiable {
    let id = UUID()
    let title: String
    let revenue: Double
}

struct SectorChartExample: View {
    @State private var circleData: [Product] = [
            .init(title: "Annual", revenue: 0.7),
            .init(title: "Monthly", revenue: 0.2),
            .init(title: "Lifetime", revenue: 0.1)
        ]
    
    var body: some View {
        if #available(iOS 17.0, *) {
            ScrollView {
                VStack {
                    
                    // ===== Chart 1 =====
                    Chart(circleData) { product in
                                SectorMark(
                                    angle: .value(
                                        Text(verbatim: product.title),
                                        product.revenue
                                    )
                                )
                                .foregroundStyle(
                                    by: .value(
                                        Text(verbatim: product.title),
                                        product.title
                                    )
                                )
                            }
                    
                    // ===== Chart 2 =====
                    Chart(circleData) { product in
                                SectorMark(
                                    angle: .value(
                                        Text(verbatim: product.title),
                                        product.revenue
                                    ),
                                    innerRadius: .ratio(0.6)
                                )
                                .foregroundStyle(
                                    by: .value(
                                        Text(verbatim: product.title),
                                        product.title
                                    )
                                )
                            }
                    
                    // ===== Chart 3 =====
                    Chart(circleData) { product in
                                SectorMark(
                                    angle: .value(
                                        Text(verbatim: product.title),
                                        product.revenue
                                    ),
                                    innerRadius: .ratio(0.6),
                                    angularInset: 8
                                )
                                .foregroundStyle(
                                    by: .value(
                                        Text(verbatim: product.title),
                                        product.title
                                    )
                                )
                            }
                    
                    // ====== Chart 4 =====
                    Chart {
                        ForEach(self.circleData) { product in
                            BarMark(
                                x: .value("Title", product.revenue),
                                y: .value("Revenue", product.title)
                            )
                        }
                    }
                    
                    // ====== Chart 5 =====
                    Chart {
                        ForEach(self.circleData) { product in
                            BarMark(
                                x: .value("Title", product.title),
                                y: .value("Revenue", product.revenue)
                            )
                        }
                    }
                    
                    // =====
                    BlockColorChartExample()
                }
            }
        } else {
            Text("Avaiable iOS 17.0")
        }
    }
}


struct ToyShape: Identifiable {
    var color: String
    var type: String
    var count: Double
    var id = UUID()
}

struct BlockColorChartExample: View {
    var stackedBarData: [ToyShape] = [
        .init(color: "Green", type: "Cube", count: 2),
        .init(color: "Green", type: "Sphere", count: 0),
        .init(color: "Green", type: "Pyramid", count: 1),
        .init(color: "Purple", type: "Cube", count: 1),
        .init(color: "Purple", type: "Sphere", count: 1),
        .init(color: "Purple", type: "Pyramid", count: 1),
        .init(color: "Pink", type: "Cube", count: 1),
        .init(color: "Pink", type: "Sphere", count: 2),
        .init(color: "Pink", type: "Pyramid", count: 0),
        .init(color: "Yellow", type: "Cube", count: 1),
        .init(color: "Yellow", type: "Sphere", count: 1),
        .init(color: "Yellow", type: "Pyramid", count: 2)
    ]
    
    var body: some View {
        if #available(iOS 17.0, *) {
            VStack {
                Chart {
                    ForEach(stackedBarData) { shape in
                        BarMark(
                            x: .value("Shape Type", shape.type),
                            y: .value("Total Count", shape.count)
                        )
                        .foregroundStyle(by: .value("Shape Color", shape.color))
                    }
                }
                
                // ========= Custom Color =========
                Chart {
                    ForEach(stackedBarData) { shape in
                        BarMark(
                            x: .value("Shape Type", shape.type),
                            y: .value("Total Count", shape.count)
                        )
                        .foregroundStyle(by: .value("Shape Color", shape.count))
                    }
                }
                .chartForegroundStyleScale([
                    "Green": .green, "Purple": .purple, "Pink": .pink, "Yellow": .yellow
                ])
            }
        } else {
            Text("Avaiable iOS 17.0")
        }
    }
}

#Preview {
    SectorChartExample()
}
