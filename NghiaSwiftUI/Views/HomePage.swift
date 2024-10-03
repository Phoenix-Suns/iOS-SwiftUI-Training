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
            }
            // Navigation Title
            .navigationTitle("SwiftUI Training")
            // Navigation Style
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    private var homeItems: [HomeRow] = [
        HomeRow(name: "Stack", view: { HStackPage() }, icon: "squareshape.controlhandles.on.squareshape.controlhandles"),
        HomeRow(name: "Tab", view: { TabPage() }, icon: "table.furniture.fill"),
        HomeRow(name: "List Vertical", view: { ListVerticalPage() }, icon: "list.bullet.rectangle.portrait.fill"),
        HomeRow(name: "List Horizontal", view: { ListHorizontalPage() }, icon: "distribute.horizontal.right.fill"),
        HomeRow(name: "Grid Vertial", view: { GridVerticalPage() }, icon: "square.grid.3x3.fill"),
        HomeRow(name: "Grid Horizontal", view: { GridHorizontalPage() }, icon: "square.grid.3x3.fill"),
        HomeRow(name: "Navigation", view: { NavigationPage() }, icon: "point.3.filled.connected.trianglepath.dotted"),
        HomeRow(name: "Animation", view: { AnimationPage() }, icon: "teddybear.fill"),
        HomeRow(name: "Button", view: { ButtonPage() }, icon: "button.programmable.square.fill"),
        HomeRow(name: "Swift Chart", view: {
            SectorChartExample()
        }, icon: "chart.pie.fill"),
        HomeRow(name: "Any View Parameter", view: {
            ViewParamPage {
                Text("nghia")
            }
        }, icon: "circle.hexagonpath.fill"),
        HomeRow(name: "UI Tips - Tricks", view: { UITipsTricksPage() }, icon: "list.number.rtl"),
        
        HomeRow(name: "Practice", view: nil, icon: nil),
        
        HomeRow(name: "Landmark List", view: { LandmarkList() }, icon: "list.number.rtl"),
        HomeRow(name: "Category Home", view: { CategoryHome() }, icon: "music.note.house.fill"),
        HomeRow(name: "Zoom Image", view: { ZoomImageView() }, icon: "photo.artframe"),
        HomeRow(name: "List on Grid", view: { ListTopGridPage() }, icon: "list.bullet.below.rectangle"),
        HomeRow(name: "Slider", view: { TestSliderPage() }, icon: nil),
        HomeRow(name: "URL Image", view: { AsyncImage(urlString: "https://picsum.photos/200") }, icon: nil),
        HomeRow(name: "Loading View", view: { TestLoadingViewPage() }, icon: nil),
        HomeRow(name: "Pager View", view: { TestPagerDotPage() }, icon: nil),
        HomeRow(name: "Pager with Animation", view: { PagerWithAnimationPage() }, icon: nil),
        HomeRow(name: "Swipe View", view: { TestSwipeViewPage() }, icon: nil),
        HomeRow(name: "Marquee Text (running text)", view: { TestMarqueePage() }, icon: nil),
        HomeRow(name: "Bottom Sheet", view: { TestBottomSheetPage() }, icon: nil),
        HomeRow(name: "Pull to refresh", view: { TestPullToRefreshPage() }, icon: nil),
        HomeRow(name: "Delay Action", view: { TestDelayAction() }, icon: nil),
        HomeRow(name: "Toast", view: { TestToastPage() }, icon: nil),
        HomeRow(name: "Image Scale", view: { TestImageScalePage() }, icon: nil),
        HomeRow(name: "Drag Multiple Views", view: { DragMultiViewsPage() }, icon: "hand.draw.fill"),
        HomeRow(name: "Pick Video", view: { PickVideoView() }, icon: "video.bubble.fill.rtl"),
        HomeRow(name: "Popover dialog", view: { PopoverPage() }, icon: "contextualmenu.and.cursorarrow"),
        HomeRow(name: "Text Edit", view: { TestTextEditView() }, icon: "text.cursor"),
        HomeRow(name: "Text Edit", view: { TestTextEditView() }, icon: "text.cursor"),
        HomeRow(name: "Color Picker", view: { TestColorPickerPage() }, icon: "scope"),
        HomeRow(name: "Move Item to Other List", view: { MoveItemToOtherListPage() }, icon: "list.bullet.below.rectangle"),
        HomeRow(name: "Drawing", view: { DrawingPage() }, icon: "hand.draw.fill"),
        HomeRow(name: "Header Scroll", view: { TestHeaderScrollView() }, icon: "list.dash.header.rectangle"),
        HomeRow(name: "Custom Clip Sharp (half heart)", view: { TestHalfHeartShape() }, icon: "heart.fill"),
        HomeRow(name: "Keyboard Popup", view: { KeyboardPage() }, icon: "keyboard"),
        HomeRow(name: "Async Task", view: { AsyncTaskPage() }, icon: "clock.arrow.2.circlepath"),
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
