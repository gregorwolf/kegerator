// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

internal class BarcelonaMetadataChanges: ObjectBase {
    override init() {
    }

    class func merge(metadata: CSDLDocument) {
        metadata.hasGeneratedProxies = true
        BarcelonaMetadata.document = metadata
        BarcelonaMetadataChanges.merge1(metadata: metadata)
        try! BarcelonaFactory.registerAll()
    }

    private class func merge1(metadata: CSDLDocument) {
        Ignore.valueOf_any(metadata)
        if !BarcelonaMetadata.EntityTypes.drinksByEventType.isRemoved {
            BarcelonaMetadata.EntityTypes.drinksByEventType = metadata.entityType(withName: "sap.devs.apps.kegerator.services.drinks_by_eventType")
        }
        if !BarcelonaMetadata.EntityTypes.drinksByKegType.isRemoved {
            BarcelonaMetadata.EntityTypes.drinksByKegType = metadata.entityType(withName: "sap.devs.apps.kegerator.services.drinks_by_kegType")
        }
        if !BarcelonaMetadata.EntityTypes.eventsType.isRemoved {
            BarcelonaMetadata.EntityTypes.eventsType = metadata.entityType(withName: "sap.devs.apps.kegerator.services.eventsType")
        }
        if !BarcelonaMetadata.EntityTypes.flowsumType.isRemoved {
            BarcelonaMetadata.EntityTypes.flowsumType = metadata.entityType(withName: "sap.devs.apps.kegerator.services.flowsumType")
        }
        if !BarcelonaMetadata.EntityTypes.kegsType.isRemoved {
            BarcelonaMetadata.EntityTypes.kegsType = metadata.entityType(withName: "sap.devs.apps.kegerator.services.kegsType")
        }
        if !BarcelonaMetadata.EntityTypes.kegsdetailsType.isRemoved {
            BarcelonaMetadata.EntityTypes.kegsdetailsType = metadata.entityType(withName: "sap.devs.apps.kegerator.services.kegsdetailsType")
        }
        if !BarcelonaMetadata.EntityTypes.kegsflowdetailsType.isRemoved {
            BarcelonaMetadata.EntityTypes.kegsflowdetailsType = metadata.entityType(withName: "sap.devs.apps.kegerator.services.kegsflowdetailsType")
        }
        if !BarcelonaMetadata.EntityTypes.leaderboardType.isRemoved {
            BarcelonaMetadata.EntityTypes.leaderboardType = metadata.entityType(withName: "sap.devs.apps.kegerator.services.leaderboardType")
        }
        if !BarcelonaMetadata.EntityTypes.leadersType.isRemoved {
            BarcelonaMetadata.EntityTypes.leadersType = metadata.entityType(withName: "sap.devs.apps.kegerator.services.leadersType")
        }
        if !BarcelonaMetadata.EntitySets.drinksByEvent.isRemoved {
            BarcelonaMetadata.EntitySets.drinksByEvent = metadata.entitySet(withName: "drinks_by_event")
        }
        if !BarcelonaMetadata.EntitySets.drinksByKeg.isRemoved {
            BarcelonaMetadata.EntitySets.drinksByKeg = metadata.entitySet(withName: "drinks_by_keg")
        }
        if !BarcelonaMetadata.EntitySets.events.isRemoved {
            BarcelonaMetadata.EntitySets.events = metadata.entitySet(withName: "events")
        }
        if !BarcelonaMetadata.EntitySets.flowsum.isRemoved {
            BarcelonaMetadata.EntitySets.flowsum = metadata.entitySet(withName: "flowsum")
        }
        if !BarcelonaMetadata.EntitySets.kegs.isRemoved {
            BarcelonaMetadata.EntitySets.kegs = metadata.entitySet(withName: "kegs")
        }
        if !BarcelonaMetadata.EntitySets.kegsdetails.isRemoved {
            BarcelonaMetadata.EntitySets.kegsdetails = metadata.entitySet(withName: "kegsdetails")
        }
        if !BarcelonaMetadata.EntitySets.kegsflowdetails.isRemoved {
            BarcelonaMetadata.EntitySets.kegsflowdetails = metadata.entitySet(withName: "kegsflowdetails")
        }
        if !BarcelonaMetadata.EntitySets.leaderboard.isRemoved {
            BarcelonaMetadata.EntitySets.leaderboard = metadata.entitySet(withName: "leaderboard")
        }
        if !BarcelonaMetadata.EntitySets.leaders.isRemoved {
            BarcelonaMetadata.EntitySets.leaders = metadata.entitySet(withName: "leaders")
        }
        if !DrinksByEventType.kegId.isRemoved {
            DrinksByEventType.kegId = BarcelonaMetadata.EntityTypes.drinksByEventType.property(withName: "KEG_ID")
        }
        if !DrinksByEventType.totalDrinks.isRemoved {
            DrinksByEventType.totalDrinks = BarcelonaMetadata.EntityTypes.drinksByEventType.property(withName: "TOTAL_DRINKS")
        }
        if !DrinksByKegType.eventId.isRemoved {
            DrinksByKegType.eventId = BarcelonaMetadata.EntityTypes.drinksByKegType.property(withName: "EVENT_ID")
        }
        if !DrinksByKegType.totalDrinks.isRemoved {
            DrinksByKegType.totalDrinks = BarcelonaMetadata.EntityTypes.drinksByKegType.property(withName: "TOTAL_DRINKS")
        }
        if !EventsType.id.isRemoved {
            EventsType.id = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "ID")
        }
        if !EventsType.tdate.isRemoved {
            EventsType.tdate = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "TDATE")
        }
        if !EventsType.eventName.isRemoved {
            EventsType.eventName = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "EVENT_NAME")
        }
        if !EventsType.attendees.isRemoved {
            EventsType.attendees = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "ATTENDEES")
        }
        if !EventsType.city.isRemoved {
            EventsType.city = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "CITY")
        }
        if !EventsType.country.isRemoved {
            EventsType.country = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "COUNTRY")
        }
        if !EventsType.eventDate.isRemoved {
            EventsType.eventDate = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "EVENT_DATE")
        }
        if !EventsType.eventStart.isRemoved {
            EventsType.eventStart = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "EVENT_START")
        }
        if !EventsType.eventStop.isRemoved {
            EventsType.eventStop = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "EVENT_STOP")
        }
        if !EventsType.kegs.isRemoved {
            EventsType.kegs = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "kegs")
        }
        if !EventsType.leaderboard.isRemoved {
            EventsType.leaderboard = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "leaderboard")
        }
        if !FlowsumType.flowsum.isRemoved {
            FlowsumType.flowsum = BarcelonaMetadata.EntityTypes.flowsumType.property(withName: "FLOWSUM")
        }
        if !KegsType.id.isRemoved {
            KegsType.id = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "ID")
        }
        if !KegsType.tdate.isRemoved {
            KegsType.tdate = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "TDATE")
        }
        if !KegsType.eventId.isRemoved {
            KegsType.eventId = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "EVENT_ID")
        }
        if !KegsType.kegeratorId.isRemoved {
            KegsType.kegeratorId = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "KEGERATOR_ID")
        }
        if !KegsType.kegName.isRemoved {
            KegsType.kegName = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "KEG_NAME")
        }
        if !KegsType.kegGallons.isRemoved {
            KegsType.kegGallons = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "KEG_GALLONS")
        }
        if !KegsType.kegOz.isRemoved {
            KegsType.kegOz = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "KEG_OZ")
        }
        if !KegsType.kegLiters.isRemoved {
            KegsType.kegLiters = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "KEG_LITERS")
        }
        if !KegsType.kegMl.isRemoved {
            KegsType.kegMl = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "KEG_ML")
        }
        if !KegsType.totalPulses.isRemoved {
            KegsType.totalPulses = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "TOTAL_PULSES")
        }
        if !KegsType.kegsdetails.isRemoved {
            KegsType.kegsdetails = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "kegsdetails")
        }
        if !KegsType.kegsflowdetails.isRemoved {
            KegsType.kegsflowdetails = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "kegsflowdetails")
        }
        if !KegsdetailsType.id.isRemoved {
            KegsdetailsType.id = BarcelonaMetadata.EntityTypes.kegsdetailsType.property(withName: "ID")
        }
        if !KegsdetailsType.tdate.isRemoved {
            KegsdetailsType.tdate = BarcelonaMetadata.EntityTypes.kegsdetailsType.property(withName: "TDATE")
        }
        if !KegsdetailsType.kegId.isRemoved {
            KegsdetailsType.kegId = BarcelonaMetadata.EntityTypes.kegsdetailsType.property(withName: "KEG_ID")
        }
        if !KegsdetailsType.temperatureKeg.isRemoved {
            KegsdetailsType.temperatureKeg = BarcelonaMetadata.EntityTypes.kegsdetailsType.property(withName: "TEMPERATURE_KEG")
        }
        if !KegsdetailsType.temperatureKegf.isRemoved {
            KegsdetailsType.temperatureKegf = BarcelonaMetadata.EntityTypes.kegsdetailsType.property(withName: "TEMPERATURE_KEGF")
        }
        if !KegsdetailsType.temperatureRoom.isRemoved {
            KegsdetailsType.temperatureRoom = BarcelonaMetadata.EntityTypes.kegsdetailsType.property(withName: "TEMPERATURE_ROOM")
        }
        if !KegsdetailsType.temperatureRoomf.isRemoved {
            KegsdetailsType.temperatureRoomf = BarcelonaMetadata.EntityTypes.kegsdetailsType.property(withName: "TEMPERATURE_ROOMF")
        }
        if !KegsdetailsType.doorstate.isRemoved {
            KegsdetailsType.doorstate = BarcelonaMetadata.EntityTypes.kegsdetailsType.property(withName: "DOORSTATE")
        }
        if !KegsflowdetailsType.id.isRemoved {
            KegsflowdetailsType.id = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "ID")
        }
        if !KegsflowdetailsType.tdate.isRemoved {
            KegsflowdetailsType.tdate = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "TDATE")
        }
        if !KegsflowdetailsType.kegId.isRemoved {
            KegsflowdetailsType.kegId = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "KEG_ID")
        }
        if !KegsflowdetailsType.pourTime.isRemoved {
            KegsflowdetailsType.pourTime = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "POUR_TIME")
        }
        if !KegsflowdetailsType.pulsecount.isRemoved {
            KegsflowdetailsType.pulsecount = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "PULSECOUNT")
        }
        if !KegsflowdetailsType.flowrate.isRemoved {
            KegsflowdetailsType.flowrate = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "FLOWRATE")
        }
        if !KegsflowdetailsType.flowMl.isRemoved {
            KegsflowdetailsType.flowMl = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "FLOW_ML")
        }
        if !KegsflowdetailsType.flowOz.isRemoved {
            KegsflowdetailsType.flowOz = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "FLOW_OZ")
        }
        if !KegsflowdetailsType.totalMl.isRemoved {
            KegsflowdetailsType.totalMl = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "TOTAL_ML")
        }
        if !KegsflowdetailsType.totalOz.isRemoved {
            KegsflowdetailsType.totalOz = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "TOTAL_OZ")
        }
        if !LeaderboardType.id.isRemoved {
            LeaderboardType.id = BarcelonaMetadata.EntityTypes.leaderboardType.property(withName: "ID")
        }
        if !LeaderboardType.tdate.isRemoved {
            LeaderboardType.tdate = BarcelonaMetadata.EntityTypes.leaderboardType.property(withName: "TDATE")
        }
        if !LeaderboardType.uid.isRemoved {
            LeaderboardType.uid = BarcelonaMetadata.EntityTypes.leaderboardType.property(withName: "UID")
        }
        if !LeaderboardType.eventId.isRemoved {
            LeaderboardType.eventId = BarcelonaMetadata.EntityTypes.leaderboardType.property(withName: "EVENT_ID")
        }
        if !LeaderboardType.kegId.isRemoved {
            LeaderboardType.kegId = BarcelonaMetadata.EntityTypes.leaderboardType.property(withName: "KEG_ID")
        }
        if !LeadersType.eventId.isRemoved {
            LeadersType.eventId = BarcelonaMetadata.EntityTypes.leadersType.property(withName: "EVENT_ID")
        }
        if !LeadersType.uid.isRemoved {
            LeadersType.uid = BarcelonaMetadata.EntityTypes.leadersType.property(withName: "UID")
        }
        if !LeadersType.drinks.isRemoved {
            LeadersType.drinks = BarcelonaMetadata.EntityTypes.leadersType.property(withName: "DRINKS")
        }
    }
}
