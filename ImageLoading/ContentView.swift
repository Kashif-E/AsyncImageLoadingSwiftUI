//
//  ContentView.swift
//  ImageLoading
//
//  Created by Kashif Mehmood on 19/03/2022.
//

import SwiftUI

extension Image {
    
    func imageModifier() -> some View{
        self.resizable().scaledToFit().transition(.scale)
            
            //.transition(.move(edge: .bottom))
    }
    
    func iconModifier() -> some View{
        self.imageModifier().frame(maxWidth:128)
            .foregroundColor(.green)
            .opacity(0.5)
    }
}

struct ContentView: View {
   private var imageUrl = "https://credo.academy/credo-academy@3x.png"
    
    
    
    var body: some View {
        
        
        //Basic Loading of Image using Async Image
/*       AsyncImage(url: URL(string:imageUrl), scale:3.0)
 */
        
        
        //Adding Place holder
        
    /*    AsyncImage(url:URL(string:imageUrl) ){ image in
            image.imageModifier()

        }placeholder:{
            Image(systemName:"photo.circle.fill")
                .iconModifier()


        }.padding(40)*/
        
        //Phases
        
      /*  AsyncImage(url: URL(string: imageUrl)){phase in
            if let image = phase.image{
                image.imageModifier()
            }else if phase.error != nil{
                Image(systemName:"ant.circle.fill")
                    .iconModifier()
            }else{
                Image(systemName:"photo.circle.fill")
                    .iconModifier()
            }
            
        }.padding(40)*/
        
        
        //Animation
        AsyncImage(url: URL(string: imageUrl),
        transaction: Transaction(
            animation:.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25)
        )
        ){phase in
           
            
            switch phase{
                
            case .success(let image):
                image.imageModifier()
            case .failure(_):
                Image(systemName:"ant.circle.fill")
                    .iconModifier()
            case .empty:
                Image(systemName:"photo.circle.fill")
                    .iconModifier()
                
            @unknown default:
               ProgressView()
            }
            
            
          
           
        }.padding(10)
        
        
    }
    
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
