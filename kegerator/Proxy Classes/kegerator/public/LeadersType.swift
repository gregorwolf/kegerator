// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

open class LeadersType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var eventId: Property = BarcelonaMetadata.EntityTypes.leadersType.property(withName: "EVENT_ID")

    public static var uid: Property = BarcelonaMetadata.EntityTypes.leadersType.property(withName: "UID")

    public static var drinks: Property = BarcelonaMetadata.EntityTypes.leadersType.property(withName: "DRINKS")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: BarcelonaMetadata.EntityTypes.leadersType)
    }

    open class func array(from: EntityValueList) -> Array<LeadersType> {
        return ArrayConverter.convert(from.toArray(), Array<LeadersType>())
    }

    open func copy() -> LeadersType {
        return CastRequired<LeadersType>.from(self.copyEntity())
    }

    open var drinks: Int64? {
        get {
            return LongValue.optional(self.optionalValue(for: LeadersType.drinks))
        }
        set(value) {
            self.setOptionalValue(for: LeadersType.drinks, to: LongValue.of(optional: value))
        }
    }

    open var eventId: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: LeadersType.eventId))
        }
        set(value) {
            self.setOptionalValue(for: LeadersType.eventId, to: IntValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(drinks: Int64?) -> EntityKey {
        return EntityKey().with(name: "DRINKS", value: LongValue.of(optional: drinks))
    }

    open var old: LeadersType {
        return CastRequired<LeadersType>.from(self.oldEntity)
    }

    open var uid: String? {
        get {
            return StringValue.optional(self.optionalValue(for: LeadersType.uid))
        }
        set(value) {
            self.setOptionalValue(for: LeadersType.uid, to: StringValue.of(optional: value))
        }
    }
}
