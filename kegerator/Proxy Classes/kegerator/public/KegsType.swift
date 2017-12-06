// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

open class KegsType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var id: Property = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "ID")

    public static var tdate: Property = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "TDATE")

    public static var eventId: Property = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "EVENT_ID")

    public static var kegeratorId: Property = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "KEGERATOR_ID")

    public static var kegName: Property = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "KEG_NAME")

    public static var kegGallons: Property = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "KEG_GALLONS")

    public static var kegOz: Property = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "KEG_OZ")

    public static var kegLiters: Property = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "KEG_LITERS")

    public static var kegMl: Property = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "KEG_ML")

    public static var totalPulses: Property = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "TOTAL_PULSES")

    public static var kegsdetails: Property = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "kegsdetails")

    public static var kegsflowdetails: Property = BarcelonaMetadata.EntityTypes.kegsType.property(withName: "kegsflowdetails")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: BarcelonaMetadata.EntityTypes.kegsType)
    }

    open class func array(from: EntityValueList) -> Array<KegsType> {
        return ArrayConverter.convert(from.toArray(), Array<KegsType>())
    }

    open func copy() -> KegsType {
        return CastRequired<KegsType>.from(self.copyEntity())
    }

    open var eventId: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: KegsType.eventId))
        }
        set(value) {
            self.setOptionalValue(for: KegsType.eventId, to: IntValue.of(optional: value))
        }
    }

    open var id: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: KegsType.id))
        }
        set(value) {
            self.setOptionalValue(for: KegsType.id, to: IntValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open var kegGallons: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: KegsType.kegGallons))
        }
        set(value) {
            self.setOptionalValue(for: KegsType.kegGallons, to: DoubleValue.of(optional: value))
        }
    }

    open var kegLiters: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: KegsType.kegLiters))
        }
        set(value) {
            self.setOptionalValue(for: KegsType.kegLiters, to: DoubleValue.of(optional: value))
        }
    }

    open var kegMl: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: KegsType.kegMl))
        }
        set(value) {
            self.setOptionalValue(for: KegsType.kegMl, to: DoubleValue.of(optional: value))
        }
    }

    open var kegName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: KegsType.kegName))
        }
        set(value) {
            self.setOptionalValue(for: KegsType.kegName, to: StringValue.of(optional: value))
        }
    }

    open var kegOz: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: KegsType.kegOz))
        }
        set(value) {
            self.setOptionalValue(for: KegsType.kegOz, to: DoubleValue.of(optional: value))
        }
    }

    open var kegeratorId: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: KegsType.kegeratorId))
        }
        set(value) {
            self.setOptionalValue(for: KegsType.kegeratorId, to: IntValue.of(optional: value))
        }
    }

    open var kegsdetails: Array<KegsdetailsType> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: KegsType.kegsdetails)).toArray(), Array<KegsdetailsType>())
        }
        set(value) {
            KegsType.kegsdetails.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var kegsflowdetails: Array<KegsflowdetailsType> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: KegsType.kegsflowdetails)).toArray(), Array<KegsflowdetailsType>())
        }
        set(value) {
            KegsType.kegsflowdetails.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open class func key(id: Int?) -> EntityKey {
        return EntityKey().with(name: "ID", value: IntValue.of(optional: id))
    }

    open var old: KegsType {
        return CastRequired<KegsType>.from(self.oldEntity)
    }

    open var tdate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: KegsType.tdate))
        }
        set(value) {
            self.setOptionalValue(for: KegsType.tdate, to: value)
        }
    }

    open var totalPulses: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: KegsType.totalPulses))
        }
        set(value) {
            self.setOptionalValue(for: KegsType.totalPulses, to: IntValue.of(optional: value))
        }
    }
}
