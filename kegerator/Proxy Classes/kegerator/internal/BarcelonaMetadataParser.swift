// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

internal class BarcelonaMetadataParser {
    internal static let options: Int = (CSDLOption.processMixedVersions | CSDLOption.retainOriginalText | CSDLOption.ignoreUndefinedTerms)

    internal static let parsed: CSDLDocument = BarcelonaMetadataParser.parse()

    static func parse() -> CSDLDocument {
        let parser: CSDLParser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = BarcelonaMetadataParser.options
        let metadata: CSDLDocument = parser.parseInProxy(BarcelonaMetadataText.xml, url: "sap.devs.apps.kegerator.services")
        metadata.proxyVersion = "17.9.2-2b890a-20171018"
        return metadata
    }
}
