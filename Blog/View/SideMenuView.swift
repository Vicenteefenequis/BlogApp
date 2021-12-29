//
//  SideMenuView.swift
//  Blog
//
//  Created by Vicente on 23/12/21.
//

import SwiftUI

struct SideMenuView: View {
    @Binding  var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Button {
                    self.showMenu.toggle()
                } label : {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
            }
            .padding()
            .padding(.leading)
            .padding(.top,35)
             ScrollView(.vertical,showsIndicators: false) {
                VStack{
                    Divider().frame(height: 1.5).background(Color.white)
                    TabButton(title: "About")
                    TabButton(title: "Portfolio")
                    TabButton(title: "Testimonials")
                }
                .padding()
                .padding(.leading)
                .padding(.top,35)
            }
            
            HStack {
                Button {
                    print("hello")
                } label : {
                    HStack {
                        Text("Contact US")
                            .font(.title3.bold())
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "arrow.right")
                            .foregroundColor(.black)
                            
                    }
                   
                }
                .frame(width: getRect().width / 1.2, height: 10,alignment: .center)
                .padding()
                .padding(.vertical,10)
                .background(.white)
                
                
            }
            .frame(width: getRect().width,alignment: .center)
            .padding(.bottom,40)
           
            
        
        }
        .frame(width: getRect().width)
        .frame(maxHeight: .infinity)
        .background(Color(hex: "#292725"))
        .frame(maxWidth: .infinity,alignment: .leading)
        .edgesIgnoringSafeArea(.bottom)
 
    }
    
    @ViewBuilder
    func TabButton(title: String) -> some View {
        
        Button {
            //Perform Action
        } label: {
            HStack(spacing: 13) {
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        Divider().frame(height: 1.5).background(Color.white)
    }
    
    

}

struct SideMenuView_Previews: PreviewProvider {
 
    
    @Binding var showMenu: Bool
    
    
    static var previews: some View {
        SideMenuView(showMenu: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}



extension View {
    func getRect()->CGRect {
        return UIScreen.main.bounds
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
