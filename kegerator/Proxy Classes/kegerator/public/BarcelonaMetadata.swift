// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

public class BarcelonaMetadata {
    public static var document: CSDLDocument = BarcelonaMetadata.resolve()

    private static func resolve() -> CSDLDocument {
        try! BarcelonaFactory.registerAll()
        BarcelonaMetadataParser.parsed.hasGeneratedProxies = true
        return BarcelonaMetadataParser.parsed
    }

    public class EntityTypes {
        public static var drinksByEventType: EntityType = BarcelonaMetadataParser.parsed.entityType(withName: "sap.devs.apps.kegerator.services.drinks_by_eventType")

        public static var drinksByKegType: EntityType = BarcelonaMetadataParser.parsed.entityType(withName: "sap.devs.apps.kegerator.services.drinks_by_kegType")

        public static var eventsType: EntityType = BarcelonaMetadataParser.parsed.entityType(withName: "sap.devs.apps.kegerator.services.eventsType")

        public static var flowsumType: EntityType = BarcelonaMetadataParser.parsed.entityType(withName: "sap.devs.apps.kegerator.services.flowsumType")

        public static var kegsType: EntityType = BarcelonaMetadataParser.parsed.entityType(withName: "sap.devs.apps.kegerator.services.kegsType")

        public static var kegsdetailsType: EntityType = BarcelonaMetadataParser.parsed.entityType(withName: "sap.devs.apps.kegerator.services.kegsdetailsType")

        public static var kegsflowdetailsType: EntityType = BarcelonaMetadataParser.parsed.entityType(withName: "sap.devs.apps.kegerator.services.kegsflowdetailsType")

        public static var leaderboardType: EntityType = BarcelonaMetadataParser.parsed.entityType(withName: "sap.devs.apps.kegerator.services.leaderboardType")

        public static var leadersType: EntityType = BarcelonaMetadataParser.parsed.entityType(withName: "sap.devs.apps.kegerator.services.leadersType")
    }

    public class EntitySets {
        public static var drinksByEvent: EntitySet = BarcelonaMetadataParser.parsed.entitySet(withName: "drinks_by_event")

        public static var drinksByKeg: EntitySet = BarcelonaMetadataParser.parsed.entitySet(withName: "drinks_by_keg")

        public static var events: EntitySet = BarcelonaMetadataParser.parsed.entitySet(withName: "events")

        public static var flowsum: EntitySet = BarcelonaMetadataParser.parsed.entitySet(withName: "flowsum")

        public static var kegs: EntitySet = BarcelonaMetadataParser.parsed.entitySet(withName: "kegs")

        public static var kegsdetails: EntitySet = BarcelonaMetadataParser.parsed.entitySet(withName: "kegsdetails")

        public static var kegsflowdetails: EntitySet = BarcelonaMetadataParser.parsed.entitySet(withName: "kegsflowdetails")

        public static var leaderboard: EntitySet = BarcelonaMetadataParser.parsed.entitySet(withName: "leaderboard")

        public static var leaders: EntitySet = BarcelonaMetadataParser.parsed.entitySet(withName: "leaders")
    }
}
