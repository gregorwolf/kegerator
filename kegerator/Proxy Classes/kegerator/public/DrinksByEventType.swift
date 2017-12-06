// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

open class DrinksByEventType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var kegId: Property = BarcelonaMetadata.EntityTypes.drinksByEventType.property(withName: "KEG_ID")

    public static var totalDrinks: Property = BarcelonaMetadata.EntityTypes.drinksByEventType.property(withName: "TOTAL_DRINKS")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: BarcelonaMetadata.EntityTypes.drinksByEventType)
    }

    open class func array(from: EntityValueList) -> Array<DrinksByEventType> {
        return ArrayConverter.convert(from.toArray(), Array<DrinksByEventType>())
    }

    open func copy() -> DrinksByEventType {
        return CastRequired<DrinksByEventType>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open var kegId: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: DrinksByEventType.kegId))
        }
        set(value) {
            self.setOptionalValue(for: DrinksByEventType.kegId, to: IntValue.of(optional: value))
        }
    }

    open class func key(totalDrinks: Int64?) -> EntityKey {
        return EntityKey().with(name: "TOTAL_DRINKS", value: LongValue.of(optional: totalDrinks))
    }

    open var old: DrinksByEventType {
        return CastRequired<DrinksByEventType>.from(self.oldEntity)
    }

    open var totalDrinks: Int64? {
        get {
            return LongValue.optional(self.optionalValue(for: DrinksByEventType.totalDrinks))
        }
        set(value) {
            self.setOptionalValue(for: DrinksByEventType.totalDrinks, to: LongValue.of(optional: value))
        }
    }
}
