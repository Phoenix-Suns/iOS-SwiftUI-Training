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
    @State private var products: [Product] = [
            .init(title: "Annual", revenue: 0.7),
            .init(title: "Monthly", revenue: 0.2),
            .init(title: "Lifetime", revenue: 0.1)
        ]
    
    var body: some View {
        if #available(iOS 17.0, *) {
            ScrollView {
                VStack {
                    
                    // ===== Chart 1 =====
                    Chart(products) { product in
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
                    Chart(products) { product in
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
                    Chart(products) { product in
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
                }
            }
        } else {
            Text("Avaiable iOS 17.0")
        }
    }
}

#Preview {
    SectorChartExample()
}
