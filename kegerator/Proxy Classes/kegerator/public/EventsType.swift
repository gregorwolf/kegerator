// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

open class EventsType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var id: Property = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "ID")

    public static var tdate: Property = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "TDATE")

    public static var eventName: Property = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "EVENT_NAME")

    public static var attendees: Property = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "ATTENDEES")

    public static var city: Property = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "CITY")

    public static var country: Property = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "COUNTRY")

    public static var eventDate: Property = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "EVENT_DATE")

    public static var eventStart: Property = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "EVENT_START")

    public static var eventStop: Property = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "EVENT_STOP")

    public static var kegs: Property = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "kegs")

    public static var leaderboard: Property = BarcelonaMetadata.EntityTypes.eventsType.property(withName: "leaderboard")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: BarcelonaMetadata.EntityTypes.eventsType)
    }

    open class func array(from: EntityValueList) -> Array<EventsType> {
        return ArrayConverter.convert(from.toArray(), Array<EventsType>())
    }

    open var attendees: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: EventsType.attendees))
        }
        set(value) {
            self.setOptionalValue(for: EventsType.attendees, to: IntValue.of(optional: value))
        }
    }

    open var city: String? {
        get {
            return StringValue.optional(self.optionalValue(for: EventsType.city))
        }
        set(value) {
            self.setOptionalValue(for: EventsType.city, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> EventsType {
        return CastRequired<EventsType>.from(self.copyEntity())
    }

    open var country: String? {
        get {
            return StringValue.optional(self.optionalValue(for: EventsType.country))
        }
        set(value) {
            self.setOptionalValue(for: EventsType.country, to: StringValue.of(optional: value))
        }
    }

    open var eventDate: String? {
        get {
            return StringValue.optional(self.optionalValue(for: EventsType.eventDate))
        }
        set(value) {
            self.setOptionalValue(for: EventsType.eventDate, to: StringValue.of(optional: value))
        }
    }

    open var eventName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: EventsType.eventName))
        }
        set(value) {
            self.setOptionalValue(for: EventsType.eventName, to: StringValue.of(optional: value))
        }
    }

    open var eventStart: String? {
        get {
            return StringValue.optional(self.optionalValue(for: EventsType.eventStart))
        }
        set(value) {
            self.setOptionalValue(for: EventsType.eventStart, to: StringValue.of(optional: value))
        }
    }

    open var eventStop: String? {
        get {
            return StringValue.optional(self.optionalValue(for: EventsType.eventStop))
        }
        set(value) {
            self.setOptionalValue(for: EventsType.eventStop, to: StringValue.of(optional: value))
        }
    }

    open var id: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: EventsType.id))
        }
        set(value) {
            self.setOptionalValue(for: EventsType.id, to: IntValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open var kegs: Array<KegsType> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: EventsType.kegs)).toArray(), Array<KegsType>())
        }
        set(value) {
            EventsType.kegs.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open class func key(id: Int?) -> EntityKey {
        return EntityKey().with(name: "ID", value: IntValue.of(optional: id))
    }

    open var leaderboard: Array<LeaderboardType> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: EventsType.leaderboard)).toArray(), Array<LeaderboardType>())
        }
        set(value) {
            EventsType.leaderboard.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var old: EventsType {
        return CastRequired<EventsType>.from(self.oldEntity)
    }

    open var tdate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: EventsType.tdate))
        }
        set(value) {
            self.setOptionalValue(for: EventsType.tdate, to: value)
        }
    }
}
