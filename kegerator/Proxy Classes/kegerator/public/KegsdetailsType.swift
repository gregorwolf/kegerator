// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

open class KegsdetailsType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var id: Property = BarcelonaMetadata.EntityTypes.kegsdetailsType.property(withName: "ID")

    public static var tdate: Property = BarcelonaMetadata.EntityTypes.kegsdetailsType.property(withName: "TDATE")

    public static var kegId: Property = BarcelonaMetadata.EntityTypes.kegsdetailsType.property(withName: "KEG_ID")

    public static var temperatureKeg: Property = BarcelonaMetadata.EntityTypes.kegsdetailsType.property(withName: "TEMPERATURE_KEG")

    public static var temperatureKegf: Property = BarcelonaMetadata.EntityTypes.kegsdetailsType.property(withName: "TEMPERATURE_KEGF")

    public static var temperatureRoom: Property = BarcelonaMetadata.EntityTypes.kegsdetailsType.property(withName: "TEMPERATURE_ROOM")

    public static var temperatureRoomf: Property = BarcelonaMetadata.EntityTypes.kegsdetailsType.property(withName: "TEMPERATURE_ROOMF")

    public static var doorstate: Property = BarcelonaMetadata.EntityTypes.kegsdetailsType.property(withName: "DOORSTATE")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: BarcelonaMetadata.EntityTypes.kegsdetailsType)
    }

    open class func array(from: EntityValueList) -> Array<KegsdetailsType> {
        return ArrayConverter.convert(from.toArray(), Array<KegsdetailsType>())
    }

    open func copy() -> KegsdetailsType {
        return CastRequired<KegsdetailsType>.from(self.copyEntity())
    }

    open var doorstate: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: KegsdetailsType.doorstate))
        }
        set(value) {
            self.setOptionalValue(for: KegsdetailsType.doorstate, to: IntValue.of(optional: value))
        }
    }

    open var id: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: KegsdetailsType.id))
        }
        set(value) {
            self.setOptionalValue(for: KegsdetailsType.id, to: IntValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open var kegId: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: KegsdetailsType.kegId))
        }
        set(value) {
            self.setOptionalValue(for: KegsdetailsType.kegId, to: IntValue.of(optional: value))
        }
    }

    open class func key(id: Int?) -> EntityKey {
        return EntityKey().with(name: "ID", value: IntValue.of(optional: id))
    }

    open var old: KegsdetailsType {
        return CastRequired<KegsdetailsType>.from(self.oldEntity)
    }

    open var tdate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: KegsdetailsType.tdate))
        }
        set(value) {
            self.setOptionalValue(for: KegsdetailsType.tdate, to: value)
        }
    }

    open var temperatureKeg: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: KegsdetailsType.temperatureKeg))
        }
        set(value) {
            self.setOptionalValue(for: KegsdetailsType.temperatureKeg, to: DecimalValue.of(optional: value))
        }
    }

    open var temperatureKegf: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: KegsdetailsType.temperatureKegf))
        }
        set(value) {
            self.setOptionalValue(for: KegsdetailsType.temperatureKegf, to: DecimalValue.of(optional: value))
        }
    }

    open var temperatureRoom: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: KegsdetailsType.temperatureRoom))
        }
        set(value) {
            self.setOptionalValue(for: KegsdetailsType.temperatureRoom, to: DecimalValue.of(optional: value))
        }
    }

    open var temperatureRoomf: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: KegsdetailsType.temperatureRoomf))
        }
        set(value) {
            self.setOptionalValue(for: KegsdetailsType.temperatureRoomf, to: DecimalValue.of(optional: value))
        }
    }
}
