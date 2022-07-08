//
//  AspectVGrid.swift
//  Memorize
//
//  Created by fujie on 2022/7/8.
//

import SwiftUI

struct AspectVGrid<Item, ItemView>: View where ItemView: View, Item: Identifiable {
    var items: [Item]
    var aspectRatio: CGFloat
    var content:(Item)->ItemView
    
    var body: some View {
        let width:CGFloat=100
        LazyVGrid(columns: [GridItem(.adaptive(minimum: width))]){
            ForEach(items){item in
                content(item).aspectRatio(aspectRatio,contentMode: .fit)
            }
        }
    }
    
    private func widthThatFits(itemCount: Int, in size: CGSize, itemAspectRation: CGFloat)->CGFloat{
        var columnCount=1
        var rowCount=itemCount
        repeat{
            let itemWidth=size.width/CGFloat(columnCount)
            let itemHeight=itemWidth/itemAspectRation
            if CGFloat(rowCount)*itemHeight<size.height{
                break
            }
            columnCount+=1
            rowCount=(itemCount+(columnCount-1))/columnCount
        }while columnCount<itemCount
        if columnCount>itemCount{
            columnCount=itemCount
        }
        return floor(size.width/CGFloat(columnCount))
    }
}

//struct AspectVGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectVGrid()
//    }
//}
