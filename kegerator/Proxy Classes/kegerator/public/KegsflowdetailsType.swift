// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

open class KegsflowdetailsType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var id: Property = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "ID")

    public static var tdate: Property = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "TDATE")

    public static var kegId: Property = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "KEG_ID")

    public static var pourTime: Property = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "POUR_TIME")

    public static var pulsecount: Property = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "PULSECOUNT")

    public static var flowrate: Property = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "FLOWRATE")

    public static var flowMl: Property = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "FLOW_ML")

    public static var flowOz: Property = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "FLOW_OZ")

    public static var totalMl: Property = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "TOTAL_ML")

    public static var totalOz: Property = BarcelonaMetadata.EntityTypes.kegsflowdetailsType.property(withName: "TOTAL_OZ")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: BarcelonaMetadata.EntityTypes.kegsflowdetailsType)
    }

    open class func array(from: EntityValueList) -> Array<KegsflowdetailsType> {
        return ArrayConverter.convert(from.toArray(), Array<KegsflowdetailsType>())
    }

    open func copy() -> KegsflowdetailsType {
        return CastRequired<KegsflowdetailsType>.from(self.copyEntity())
    }

    open var flowMl: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: KegsflowdetailsType.flowMl))
        }
        set(value) {
            self.setOptionalValue(for: KegsflowdetailsType.flowMl, to: DoubleValue.of(optional: value))
        }
    }

    open var flowOz: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: KegsflowdetailsType.flowOz))
        }
        set(value) {
            self.setOptionalValue(for: KegsflowdetailsType.flowOz, to: DoubleValue.of(optional: value))
        }
    }

    open var flowrate: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: KegsflowdetailsType.flowrate))
        }
        set(value) {
            self.setOptionalValue(for: KegsflowdetailsType.flowrate, to: DoubleValue.of(optional: value))
        }
    }

    open var id: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: KegsflowdetailsType.id))
        }
        set(value) {
            self.setOptionalValue(for: KegsflowdetailsType.id, to: IntValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open var kegId: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: KegsflowdetailsType.kegId))
        }
        set(value) {
            self.setOptionalValue(for: KegsflowdetailsType.kegId, to: IntValue.of(optional: value))
        }
    }

    open class func key(id: Int?) -> EntityKey {
        return EntityKey().with(name: "ID", value: IntValue.of(optional: id))
    }

    open var old: KegsflowdetailsType {
        return CastRequired<KegsflowdetailsType>.from(self.oldEntity)
    }

    open var pourTime: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: KegsflowdetailsType.pourTime))
        }
        set(value) {
            self.setOptionalValue(for: KegsflowdetailsType.pourTime, to: DoubleValue.of(optional: value))
        }
    }

    open var pulsecount: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: KegsflowdetailsType.pulsecount))
        }
        set(value) {
            self.setOptionalValue(for: KegsflowdetailsType.pulsecount, to: IntValue.of(optional: value))
        }
    }

    open var tdate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: KegsflowdetailsType.tdate))
        }
        set(value) {
            self.setOptionalValue(for: KegsflowdetailsType.tdate, to: value)
        }
    }

    open var totalMl: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: KegsflowdetailsType.totalMl))
        }
        set(value) {
            self.setOptionalValue(for: KegsflowdetailsType.totalMl, to: DoubleValue.of(optional: value))
        }
    }

    open var totalOz: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: KegsflowdetailsType.totalOz))
        }
        set(value) {
            self.setOptionalValue(for: KegsflowdetailsType.totalOz, to: DoubleValue.of(optional: value))
        }
    }
}
