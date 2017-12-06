// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

internal class BarcelonaFactory {
    static func registerAll() throws {
        BarcelonaMetadata.EntityTypes.drinksByEventType.registerFactory(ObjectFactory.with(create: { DrinksByEventType(withDefaults: false) }, createWithDecoder: { d in try DrinksByEventType(from: d) }))
        BarcelonaMetadata.EntityTypes.drinksByKegType.registerFactory(ObjectFactory.with(create: { DrinksByKegType(withDefaults: false) }, createWithDecoder: { d in try DrinksByKegType(from: d) }))
        BarcelonaMetadata.EntityTypes.eventsType.registerFactory(ObjectFactory.with(create: { EventsType(withDefaults: false) }, createWithDecoder: { d in try EventsType(from: d) }))
        BarcelonaMetadata.EntityTypes.flowsumType.registerFactory(ObjectFactory.with(create: { FlowsumType(withDefaults: false) }, createWithDecoder: { d in try FlowsumType(from: d) }))
        BarcelonaMetadata.EntityTypes.kegsType.registerFactory(ObjectFactory.with(create: { KegsType(withDefaults: false) }, createWithDecoder: { d in try KegsType(from: d) }))
        BarcelonaMetadata.EntityTypes.kegsdetailsType.registerFactory(ObjectFactory.with(create: { KegsdetailsType(withDefaults: false) }, createWithDecoder: { d in try KegsdetailsType(from: d) }))
        BarcelonaMetadata.EntityTypes.kegsflowdetailsType.registerFactory(ObjectFactory.with(create: { KegsflowdetailsType(withDefaults: false) }, createWithDecoder: { d in try KegsflowdetailsType(from: d) }))
        BarcelonaMetadata.EntityTypes.leaderboardType.registerFactory(ObjectFactory.with(create: { LeaderboardType(withDefaults: false) }, createWithDecoder: { d in try LeaderboardType(from: d) }))
        BarcelonaMetadata.EntityTypes.leadersType.registerFactory(ObjectFactory.with(create: { LeadersType(withDefaults: false) }, createWithDecoder: { d in try LeadersType(from: d) }))
    }
}
