//
//  BannerContent.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 24/01/25.
//

import Foundation

struct BannerContent: Identifiable{
    var id:Int
    var title:String
    var icon:String
    var subHeading1:String
    var subHeading2:String?
    
    static let sampleData = BannerContent(id: 0, title: "Free cookie", icon: "Deal\nof Day", subHeading1: "USE TRYNEW", subHeading2: "| ABOVE ₹169")
}
