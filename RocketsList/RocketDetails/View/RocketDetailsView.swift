//
//  RocketDetailsView.swift
//  RocketsList
//
//  Created by Svetlana Matusova on 18.01.21.
//

import SwiftUI
import Kingfisher

struct ActivityIndicator: UIViewRepresentable {
    @Binding var shouldAnimate: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }

    func updateUIView(_ uiView: UIActivityIndicatorView,
                      context: Context) {
        if self.shouldAnimate {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}

struct RocketDetailsView: View {
    
    var viewModel: RocketDetailsViewModel
    
    @State private var image: UIImage? = nil
    @State private var shouldAnimate = true
    
    let placeholderImage = UIImage(systemName: "bookmark")
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                ActivityIndicator(shouldAnimate: self.$shouldAnimate)
                
                Image(uiImage: (image ?? placeholderImage)!)
                      .resizable()
                      .onAppear(perform: loadImage)
                      .transition(.opacity)
            }

            HStack {
                Circle()
                    .fill(Color(viewModel.badgeColor))
                    .frame(width: 15, height: 15)
                
                Text(viewModel.name)
                    .font(.title)
                
                Text(viewModel.activity)
                    .font(.title2)
            }
            
            Text(viewModel.country)
                .font(.title2)
                .padding(.bottom)
            
            HStack {
                Text(viewModel.costInDollars)
                    .font(.title3)
                Spacer()
                Text(viewModel.date)
                    .font(.subheadline)
            }
            .padding(.bottom)
            
            Text(viewModel.description)
                .font(.subheadline)
            
            Link("Wikipedia", destination: URL(string: viewModel.wikiUrl)!)
            .padding(.top)

        }.padding()
    }
    
    private func loadImage() {
        guard let imageURL = viewModel.imageUrl, image == nil else { return }
        KingfisherManager.shared.retrieveImage(with: imageURL) { result in
            switch result {
            case .success(let imageResult):
                self.image = imageResult.image
                self.shouldAnimate = false
            case .failure:
                break
            }
        }
    }
}

struct RocketDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RocketDetailsView(viewModel: RocketDetailsViewModel(rocket: Rocket(id: "reywiuyr98732rhe8wr7", name: "Falcon 1", active: true, country: "Republic of the Marshall Islands", description: "The Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth.", successRate: 40, firstFlight: "2006-03-24", cost: 6700000, wikipedia: "https://en.wikipedia.org/wiki/Falcon_1", images: ["https://imgur.com/DaCfMsj.jpg", "https://imgur.com/azYafd8.jpg"])))
    }
}
