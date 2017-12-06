// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

open class DrinksByKegType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var eventId: Property = BarcelonaMetadata.EntityTypes.drinksByKegType.property(withName: "EVENT_ID")

    public static var totalDrinks: Property = BarcelonaMetadata.EntityTypes.drinksByKegType.property(withName: "TOTAL_DRINKS")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: BarcelonaMetadata.EntityTypes.drinksByKegType)
    }

    open class func array(from: EntityValueList) -> Array<DrinksByKegType> {
        return ArrayConverter.convert(from.toArray(), Array<DrinksByKegType>())
    }

    open func copy() -> DrinksByKegType {
        return CastRequired<DrinksByKegType>.from(self.copyEntity())
    }

    open var eventId: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: DrinksByKegType.eventId))
        }
        set(value) {
            self.setOptionalValue(for: DrinksByKegType.eventId, to: IntValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(totalDrinks: Int64?) -> EntityKey {
        return EntityKey().with(name: "TOTAL_DRINKS", value: LongValue.of(optional: totalDrinks))
    }

    open var old: DrinksByKegType {
        return CastRequired<DrinksByKegType>.from(self.oldEntity)
    }

    open var totalDrinks: Int64? {
        get {
            return LongValue.optional(self.optionalValue(for: DrinksByKegType.totalDrinks))
        }
        set(value) {
            self.setOptionalValue(for: DrinksByKegType.totalDrinks, to: LongValue.of(optional: value))
        }
    }
}
