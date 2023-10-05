//
//  HomeView.swift
//  NghiaSwiftUI
//
//  Created by Nghia on 5/23/23.
//

import SwiftUI

struct HomePage: View {
    @State var sliderValue: Int = 0
    
    let columns = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        //GridItem(.flexible(minimum: 80)),
        //GridItem(.fixed(80))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                Group {
                    // Navigation Button
                    NavigationLink {
                        HStackPage()
                    } label: {
                        Label("Stack", systemImage: "squareshape.controlhandles.on.squareshape.controlhandles")
                    }
                    .buttonStyle(RowButtonStyle())
                    NavigationLink {
                        TabPage() // Text("Custom")
                    } label: {
                        Label("Tab", systemImage: "table.furniture.fill")
                    }
                    .buttonStyle(RowButtonStyle())
                    NavigationLink {
                        ListVerticalPage()
                    } label: {
                        Label("List Vertical", systemImage: "list.bullet.rectangle.portrait.fill")
                    }
                    .buttonStyle(RowButtonStyle())
                    NavigationLink {
                        ListHorizontalPage()
                    } label: {
                        Label("List Horizontal", systemImage: "distribute.horizontal.right.fill")
                    }
                    .buttonStyle(RowButtonStyle())
                    NavigationLink {
                        GridVerticalPage()
                    } label: {
                        Label("Grid Vertial", systemImage: "square.grid.3x3.fill")
                    }
                    .buttonStyle(RowButtonStyle())
                    NavigationLink {
                        GridHorizontalPage()
                    } label: {
                        Label("Grid Horizontal", systemImage: "square.grid.3x3.fill")
                    }
                    .buttonStyle(RowButtonStyle())
                    NavigationLink {
                        NavigationPage()
                    } label: {
                        Label("Navigation", systemImage: "point.3.filled.connected.trianglepath.dotted")
                    }
                    .buttonStyle(RowButtonStyle())
                    NavigationLink {
                        AnimationPage()
                    } label: {
                        Label("Animation", systemImage: "teddybear.fill")
                    }
                    .buttonStyle(RowButtonStyle())
                    NavigationLink {
                        ButtonPage()
                    } label: {
                        Label("Button", systemImage: "button.programmable.square.fill")
                    }
                    .buttonStyle(RowButtonStyle())
                }
                Group {
                    Text("Practice")
                        .font(.title)
                    NavigationLink {
                        LandmarkList()
                    } label: {
                        Label("Landmark List", systemImage: "list.number.rtl")
                    }
                    .buttonStyle(RowButtonStyle())
                    NavigationLink {
                        CategoryHome()
                    } label: {
                        Label("Category Home", systemImage: "music.note.house.fill")
                    }
                    .buttonStyle(RowButtonStyle())
                    NavigationLink {
                        ZoomImageView()
                    } label: {
                        Label("Zoom Image", systemImage: "photo.artframe")
                    }
                    .buttonStyle(RowButtonStyle())
                    NavigationLink {
                        ListTopGridPage()
                    } label: {
                        Label("List on Grid", systemImage: "list.bullet.below.rectangle")
                    }
                    .buttonStyle(RowButtonStyle())
                    Text("\(sliderValue)")
                    
                    IntSliderView(value: $sliderValue)
                        .padding(.horizontal, 20)
                    
                    AsyncImage(urlString: "https://picsum.photos/200")
                    
                    NavigationLink {
                        TestLoadingViewPage()
                    } label: {
                        Text("Loading View")
                    }
                    .buttonStyle(.bordered)
                    
                    NavigationLink {
                        TestPagerDotPage()
                    } label: {
                        Text("Pager View")
                    }
                    .buttonStyle(.bordered)
                }
                
                Group {
                    NavigationLink {
                        TestSwipeViewPage()
                    } label: {
                        Text("Swipe View")
                    }
                    .buttonStyle(.bordered)
                    
                    NavigationLink {
                        TestMarqueePage()
                    } label: {
                        Text("Marquee Text (running text)")
                    }
                    .buttonStyle(.bordered)
                    
                    NavigationLink {
                        TestBottomSheetPage()
                    } label: {
                        Text("Bottom Sheet")
                    }
                    .buttonStyle(.bordered)
                    
                    NavigationLink {
                        TestPullToRefreshPage()
                    } label: {
                        Text("Pull to refresh")
                    }
                    .buttonStyle(.bordered)
                    
                    NavigationLink {
                        TestDelayAction()
                    } label: {
                        Text("Delay Action")
                    }
                    .buttonStyle(.bordered)
                }
                
                Group {
                    NavigationLink {
                        TestToastPage()
                    } label: {
                        Text("Toast")
                    }
                    .buttonStyle(.bordered)
                }
            }
            // Navigation Title
            .navigationTitle("SwiftUI Training")
            // Navigation Style
            .navigationBarTitleDisplayMode(.large)
        }
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
