//
// CollectionType.swift
// kegerator
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 14/11/17
//

import Foundation

enum CollectionType: String {

    case leaders = "Leaders"
    case kegsdetails = "Kegsdetails"
    case flowsum = "Flowsum"
    case leaderboard = "Leaderboard"
    case events = "Events"
    case kegsflowdetails = "Kegsflowdetails"
    case drinksByEvent = "DrinksByEvent"
    case kegs = "Kegs"
    case drinksByKeg = "DrinksByKeg"
    case none = ""

    static let all = [
        leaders, kegsdetails, flowsum, leaderboard, events, kegsflowdetails, drinksByEvent, kegs, drinksByKeg,
    ]
}
