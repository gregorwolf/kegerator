// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

open class FlowsumType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var flowsum: Property = BarcelonaMetadata.EntityTypes.flowsumType.property(withName: "FLOWSUM")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: BarcelonaMetadata.EntityTypes.flowsumType)
    }

    open class func array(from: EntityValueList) -> Array<FlowsumType> {
        return ArrayConverter.convert(from.toArray(), Array<FlowsumType>())
    }

    open func copy() -> FlowsumType {
        return CastRequired<FlowsumType>.from(self.copyEntity())
    }

    open var flowsum: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: FlowsumType.flowsum))
        }
        set(value) {
            self.setOptionalValue(for: FlowsumType.flowsum, to: IntValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(flowsum: Int?) -> EntityKey {
        return EntityKey().with(name: "FLOWSUM", value: IntValue.of(optional: flowsum))
    }

    open var old: FlowsumType {
        return CastRequired<FlowsumType>.from(self.oldEntity)
    }
}
