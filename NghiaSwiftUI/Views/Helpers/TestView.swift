import SwiftUI

struct TestView: View {
    var body: some View {
        ZStack {
            // Background content
            VStack {
                Text("Hello, World!")
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            
            // Overlay with punch out effect
            PunchOutView()
        }
    }
}

struct PunchOutView: View {
    var body: some View {
        ZStack {
            Color.blue
            
            // Transparent punch-out area
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 200, height: 200)
                //.position(x: 100, y: 100)
                .blendMode(.destinationOut)
        }
        .compositingGroup()
    }
}

#Preview {
    TestView()
}
