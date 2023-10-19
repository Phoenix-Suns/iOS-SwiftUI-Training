//
//  HomeView.swift
//  NghiaSwiftUI
//
//  Created by Nghia on 5/23/23.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, content: {
                    ForEach(0..<homeItems.count, id: \.self) { index in
                        
                        let item = homeItems[index]
                        if item.view != nil {
                            let item = homeItems[index]
                            NavigationLink {
                                AnyView(item.view!())
                            } label: {
                                Label(item.name, systemImage: item.icon ?? "")
                            }
                            .buttonStyle(RowButtonStyle())
                        } else {
                            // TITLE
                            Text("Practice")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color.random)
                        }
                        
                        Divider()
                    }
                })
//                Group {
//                    // Navigation Button
//                    NavigationLink {
//                        HStackPage()
//                    } label: {
//                        Label("Stack", systemImage: "squareshape.controlhandles.on.squareshape.controlhandles")
//                    }
//                    .buttonStyle(RowButtonStyle())
//                    NavigationLink {
//                        TabPage() // Text("Custom")
//                    } label: {
//                        Label("Tab", systemImage: "table.furniture.fill")
//                    }
//                    .buttonStyle(RowButtonStyle())
//                    NavigationLink {
//                        ListVerticalPage()
//                    } label: {
//                        Label("List Vertical", systemImage: "list.bullet.rectangle.portrait.fill")
//                    }
//                    .buttonStyle(RowButtonStyle())
//                    NavigationLink {
//                        ListHorizontalPage()
//                    } label: {
//                        Label("List Horizontal", systemImage: "distribute.horizontal.right.fill")
//                    }
//                    .buttonStyle(RowButtonStyle())
//                    NavigationLink {
//                        GridVerticalPage()
//                    } label: {
//                        Label("Grid Vertial", systemImage: "square.grid.3x3.fill")
//                    }
//                    .buttonStyle(RowButtonStyle())
//                    NavigationLink {
//                        GridHorizontalPage()
//                    } label: {
//                        Label("Grid Horizontal", systemImage: "square.grid.3x3.fill")
//                    }
//                    .buttonStyle(RowButtonStyle())
//                    NavigationLink {
//                        NavigationPage()
//                    } label: {
//                        Label("Navigation", systemImage: "point.3.filled.connected.trianglepath.dotted")
//                    }
//                    .buttonStyle(RowButtonStyle())
//                    NavigationLink {
//                        AnimationPage()
//                    } label: {
//                        Label("Animation", systemImage: "teddybear.fill")
//                    }
//                    .buttonStyle(RowButtonStyle())
//                    NavigationLink {
//                        ButtonPage()
//                    } label: {
//                        Label("Button", systemImage: "button.programmable.square.fill")
//                    }
//                    .buttonStyle(RowButtonStyle())
//                }
//                Group {
//                    Text("Practice")
//                        .font(.title)
//                    NavigationLink {
//                        LandmarkList()
//                    } label: {
//                        Label("Landmark List", systemImage: "list.number.rtl")
//                    }
//                    .buttonStyle(RowButtonStyle())
//                    NavigationLink {
//                        CategoryHome()
//                    } label: {
//                        Label("Category Home", systemImage: "music.note.house.fill")
//                    }
//                    .buttonStyle(RowButtonStyle())
//                    NavigationLink {
//                        ZoomImageView()
//                    } label: {
//                        Label("Zoom Image", systemImage: "photo.artframe")
//                    }
//                    .buttonStyle(RowButtonStyle())
//                    NavigationLink {
//                        ListTopGridPage()
//                    } label: {
//                        Label("List on Grid", systemImage: "list.bullet.below.rectangle")
//                    }
//                    .buttonStyle(RowButtonStyle())
//                    Text("\(sliderValue)")
//                    
//                    IntSliderView(value: $sliderValue)
//                        .padding(.horizontal, 20)
//                    
//                    AsyncImage(urlString: "https://picsum.photos/200")
//                    
//                    NavigationLink {
//                        TestLoadingViewPage()
//                    } label: {
//                        Text("Loading View")
//                    }
//                    .buttonStyle(.bordered)
//                    
//                    NavigationLink {
//                        TestPagerDotPage()
//                    } label: {
//                        Text("Pager View")
//                    }
//                    .buttonStyle(.bordered)
//                }
//                
//                Group {
//                    NavigationLink {
//                        TestSwipeViewPage()
//                    } label: {
//                        Text("Swipe View")
//                    }
//                    .buttonStyle(.bordered)
//                    
//                    NavigationLink {
//                        TestMarqueePage()
//                    } label: {
//                        Text("Marquee Text (running text)")
//                    }
//                    .buttonStyle(.bordered)
//                    
//                    NavigationLink {
//                        TestBottomSheetPage()
//                    } label: {
//                        Text("Bottom Sheet")
//                    }
//                    .buttonStyle(.bordered)
//                    
//                    NavigationLink {
//                        TestPullToRefreshPage()
//                    } label: {
//                        Text("Pull to refresh")
//                    }
//                    .buttonStyle(.bordered)
//                    
//                    NavigationLink {
//                        TestDelayAction()
//                    } label: {
//                        Text("Delay Action")
//                    }
//                    .buttonStyle(.bordered)
//                }
//                
//                Group {
//                    NavigationLink {
//                        TestToastPage()
//                    } label: {
//                        Text("Toast")
//                    }
//                    .buttonStyle(.bordered)
//                    
//                    NavigationLink {
//                        TestImageScalePage()
//                    } label: {
//                        Text("Image Scale")
//                    }
//                    .buttonStyle(.bordered)
//                }
            }
            // Navigation Title
            .navigationTitle("SwiftUI Training")
            // Navigation Style
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    private var homeItems: [HomeRow] = [
        HomeRow(name:"Stack", view: { HStackPage() }, icon: "squareshape.controlhandles.on.squareshape.controlhandles"),
        HomeRow(name:"Tab", view: { TabPage() }, icon: "table.furniture.fill"),
        HomeRow(name:"List Vertical", view: { ListVerticalPage() }, icon: "list.bullet.rectangle.portrait.fill"),
        HomeRow(name:"List Horizontal", view: { ListHorizontalPage() }, icon: "distribute.horizontal.right.fill"),
        HomeRow(name:"Grid Vertial", view: { GridVerticalPage() }, icon: "square.grid.3x3.fill"),
        HomeRow(name:"Grid Horizontal", view: { GridHorizontalPage() }, icon: "square.grid.3x3.fill"),
        HomeRow(name:"Navigation", view: { NavigationPage() }, icon: "point.3.filled.connected.trianglepath.dotted"),
        HomeRow(name:"Animation", view: { AnimationPage() }, icon: "teddybear.fill"),
        HomeRow(name:"Button", view: { ButtonPage() }, icon: "button.programmable.square.fill"),
        
        HomeRow(name:"Practice", view: nil, icon: nil),
        HomeRow(name:"Landmark List", view: { LandmarkList() }, icon: "list.number.rtl"),
        HomeRow(name:"Category Home", view: { CategoryHome() }, icon: "music.note.house.fill"),
        HomeRow(name:"Zoom Image", view: { ZoomImageView() }, icon: "photo.artframe"),
        HomeRow(name:"List on Grid", view: { ListTopGridPage() }, icon: "list.bullet.below.rectangle"),
        HomeRow(name: "Slider", view: { TestSliderPage() }, icon: nil),
        HomeRow(name: "URL Image", view: { AsyncImage(urlString: "https://picsum.photos/200") }, icon: nil),
        HomeRow(name:"Loading View", view: { TestLoadingViewPage() }, icon: nil),
        HomeRow(name:"Pager View", view: { TestPagerDotPage() }, icon: nil),
        HomeRow(name:"Swipe View", view: { TestSwipeViewPage() }, icon: nil),
        HomeRow(name:"Marquee Text (running text)", view: { TestMarqueePage() }, icon: nil),
        HomeRow(name:"Bottom Sheet", view: { TestBottomSheetPage() }, icon: nil),
        HomeRow(name:"Pull to refresh", view: { TestPullToRefreshPage() }, icon: nil),
        HomeRow(name:"Delay Action", view: { TestDelayAction() }, icon: nil),
        HomeRow(name:"Toast", view: { TestToastPage() }, icon: nil),
        HomeRow(name:"Image Scale", view: { TestImageScalePage() }, icon: nil),
    ]
}

private extension HomePage {
    struct HomeRow {
        let name: String
        var view: (() -> any View)?
        let icon: String?
    }
}

struct RowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.black)
            .background(.white)
            .font(.body)
        // Scale when click
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(Animation.easeOut(duration: 0.2), value: UUID())
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
