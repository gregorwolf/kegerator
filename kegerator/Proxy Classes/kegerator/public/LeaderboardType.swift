// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

open class LeaderboardType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var id: Property = BarcelonaMetadata.EntityTypes.leaderboardType.property(withName: "ID")

    public static var tdate: Property = BarcelonaMetadata.EntityTypes.leaderboardType.property(withName: "TDATE")

    public static var uid: Property = BarcelonaMetadata.EntityTypes.leaderboardType.property(withName: "UID")

    public static var eventId: Property = BarcelonaMetadata.EntityTypes.leaderboardType.property(withName: "EVENT_ID")

    public static var kegId: Property = BarcelonaMetadata.EntityTypes.leaderboardType.property(withName: "KEG_ID")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: BarcelonaMetadata.EntityTypes.leaderboardType)
    }

    open class func array(from: EntityValueList) -> Array<LeaderboardType> {
        return ArrayConverter.convert(from.toArray(), Array<LeaderboardType>())
    }

    open func copy() -> LeaderboardType {
        return CastRequired<LeaderboardType>.from(self.copyEntity())
    }

    open var eventId: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: LeaderboardType.eventId))
        }
        set(value) {
            self.setOptionalValue(for: LeaderboardType.eventId, to: IntValue.of(optional: value))
        }
    }

    open var id: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: LeaderboardType.id))
        }
        set(value) {
            self.setOptionalValue(for: LeaderboardType.id, to: IntValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open var kegId: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: LeaderboardType.kegId))
        }
        set(value) {
            self.setOptionalValue(for: LeaderboardType.kegId, to: IntValue.of(optional: value))
        }
    }

    open class func key(id: Int?) -> EntityKey {
        return EntityKey().with(name: "ID", value: IntValue.of(optional: id))
    }

    open var old: LeaderboardType {
        return CastRequired<LeaderboardType>.from(self.oldEntity)
    }

    open var tdate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: LeaderboardType.tdate))
        }
        set(value) {
            self.setOptionalValue(for: LeaderboardType.tdate, to: value)
        }
    }

    open var uid: String? {
        get {
            return StringValue.optional(self.optionalValue(for: LeaderboardType.uid))
        }
        set(value) {
            self.setOptionalValue(for: LeaderboardType.uid, to: StringValue.of(optional: value))
        }
    }
}
