// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

open class Barcelona<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = BarcelonaMetadata.document
    }

    @available(swift, deprecated: 4.0, renamed: "fetchDrinksByEvent")
    open func drinksByEvent(query: DataQuery = DataQuery()) throws -> Array<DrinksByEventType> {
        return try self.fetchDrinksByEvent(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchDrinksByEvent")
    open func drinksByEvent(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<DrinksByEventType>?, Error?) -> Void) {
        self.fetchDrinksByEvent(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchDrinksByKeg")
    open func drinksByKeg(query: DataQuery = DataQuery()) throws -> Array<DrinksByKegType> {
        return try self.fetchDrinksByKeg(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchDrinksByKeg")
    open func drinksByKeg(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<DrinksByKegType>?, Error?) -> Void) {
        self.fetchDrinksByKeg(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchEvents")
    open func events(query: DataQuery = DataQuery()) throws -> Array<EventsType> {
        return try self.fetchEvents(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchEvents")
    open func events(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<EventsType>?, Error?) -> Void) {
        self.fetchEvents(matching: query, completionHandler: completionHandler)
    }

    open func fetchDrinksByEvent(matching query: DataQuery = DataQuery()) throws -> Array<DrinksByEventType> {
        return try DrinksByEventType.array(from: self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.drinksByEvent)).entityList())
    }

    open func fetchDrinksByEvent(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<DrinksByEventType>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<DrinksByEventType> = try self.fetchDrinksByEvent(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchDrinksByEventType(matching query: DataQuery) throws -> DrinksByEventType {
        return try CastRequired<DrinksByEventType>.from(self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.drinksByEvent)).requiredEntity())
    }

    open func fetchDrinksByEventType(matching query: DataQuery, completionHandler: @escaping (DrinksByEventType?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: DrinksByEventType = try self.fetchDrinksByEventType(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchDrinksByKeg(matching query: DataQuery = DataQuery()) throws -> Array<DrinksByKegType> {
        return try DrinksByKegType.array(from: self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.drinksByKeg)).entityList())
    }

    open func fetchDrinksByKeg(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<DrinksByKegType>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<DrinksByKegType> = try self.fetchDrinksByKeg(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchDrinksByKegType(matching query: DataQuery) throws -> DrinksByKegType {
        return try CastRequired<DrinksByKegType>.from(self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.drinksByKeg)).requiredEntity())
    }

    open func fetchDrinksByKegType(matching query: DataQuery, completionHandler: @escaping (DrinksByKegType?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: DrinksByKegType = try self.fetchDrinksByKegType(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchEvents(matching query: DataQuery = DataQuery()) throws -> Array<EventsType> {
        return try EventsType.array(from: self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.events)).entityList())
    }

    open func fetchEvents(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<EventsType>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<EventsType> = try self.fetchEvents(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchEventsType(matching query: DataQuery) throws -> EventsType {
        return try CastRequired<EventsType>.from(self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.events)).requiredEntity())
    }

    open func fetchEventsType(matching query: DataQuery, completionHandler: @escaping (EventsType?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: EventsType = try self.fetchEventsType(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchFlowsum(matching query: DataQuery = DataQuery()) throws -> Array<FlowsumType> {
        return try FlowsumType.array(from: self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.flowsum)).entityList())
    }

    open func fetchFlowsum(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<FlowsumType>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<FlowsumType> = try self.fetchFlowsum(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchFlowsumType(matching query: DataQuery) throws -> FlowsumType {
        return try CastRequired<FlowsumType>.from(self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.flowsum)).requiredEntity())
    }

    open func fetchFlowsumType(matching query: DataQuery, completionHandler: @escaping (FlowsumType?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: FlowsumType = try self.fetchFlowsumType(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchKegs(matching query: DataQuery = DataQuery()) throws -> Array<KegsType> {
        return try KegsType.array(from: self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.kegs)).entityList())
    }

    open func fetchKegs(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<KegsType>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<KegsType> = try self.fetchKegs(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchKegsType(matching query: DataQuery) throws -> KegsType {
        return try CastRequired<KegsType>.from(self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.kegs)).requiredEntity())
    }

    open func fetchKegsType(matching query: DataQuery, completionHandler: @escaping (KegsType?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: KegsType = try self.fetchKegsType(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchKegsdetails(matching query: DataQuery = DataQuery()) throws -> Array<KegsdetailsType> {
        return try KegsdetailsType.array(from: self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.kegsdetails)).entityList())
    }

    open func fetchKegsdetails(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<KegsdetailsType>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<KegsdetailsType> = try self.fetchKegsdetails(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchKegsdetailsType(matching query: DataQuery) throws -> KegsdetailsType {
        return try CastRequired<KegsdetailsType>.from(self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.kegsdetails)).requiredEntity())
    }

    open func fetchKegsdetailsType(matching query: DataQuery, completionHandler: @escaping (KegsdetailsType?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: KegsdetailsType = try self.fetchKegsdetailsType(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchKegsflowdetails(matching query: DataQuery = DataQuery()) throws -> Array<KegsflowdetailsType> {
        return try KegsflowdetailsType.array(from: self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.kegsflowdetails)).entityList())
    }

    open func fetchKegsflowdetails(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<KegsflowdetailsType>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<KegsflowdetailsType> = try self.fetchKegsflowdetails(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchKegsflowdetailsType(matching query: DataQuery) throws -> KegsflowdetailsType {
        return try CastRequired<KegsflowdetailsType>.from(self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.kegsflowdetails)).requiredEntity())
    }

    open func fetchKegsflowdetailsType(matching query: DataQuery, completionHandler: @escaping (KegsflowdetailsType?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: KegsflowdetailsType = try self.fetchKegsflowdetailsType(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchLeaderboard(matching query: DataQuery = DataQuery()) throws -> Array<LeaderboardType> {
        return try LeaderboardType.array(from: self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.leaderboard)).entityList())
    }

    open func fetchLeaderboard(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<LeaderboardType>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<LeaderboardType> = try self.fetchLeaderboard(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchLeaderboardType(matching query: DataQuery) throws -> LeaderboardType {
        return try CastRequired<LeaderboardType>.from(self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.leaderboard)).requiredEntity())
    }

    open func fetchLeaderboardType(matching query: DataQuery, completionHandler: @escaping (LeaderboardType?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: LeaderboardType = try self.fetchLeaderboardType(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchLeaders(matching query: DataQuery = DataQuery()) throws -> Array<LeadersType> {
        return try LeadersType.array(from: self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.leaders)).entityList())
    }

    open func fetchLeaders(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<LeadersType>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<LeadersType> = try self.fetchLeaders(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchLeadersType(matching query: DataQuery) throws -> LeadersType {
        return try CastRequired<LeadersType>.from(self.executeQuery(query.fromDefault(BarcelonaMetadata.EntitySets.leaders)).requiredEntity())
    }

    open func fetchLeadersType(matching query: DataQuery, completionHandler: @escaping (LeadersType?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: LeadersType = try self.fetchLeadersType(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchFlowsum")
    open func flowsum(query: DataQuery = DataQuery()) throws -> Array<FlowsumType> {
        return try self.fetchFlowsum(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchFlowsum")
    open func flowsum(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<FlowsumType>?, Error?) -> Void) {
        self.fetchFlowsum(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchKegs")
    open func kegs(query: DataQuery = DataQuery()) throws -> Array<KegsType> {
        return try self.fetchKegs(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchKegs")
    open func kegs(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<KegsType>?, Error?) -> Void) {
        self.fetchKegs(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchKegsdetails")
    open func kegsdetails(query: DataQuery = DataQuery()) throws -> Array<KegsdetailsType> {
        return try self.fetchKegsdetails(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchKegsdetails")
    open func kegsdetails(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<KegsdetailsType>?, Error?) -> Void) {
        self.fetchKegsdetails(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchKegsflowdetails")
    open func kegsflowdetails(query: DataQuery = DataQuery()) throws -> Array<KegsflowdetailsType> {
        return try self.fetchKegsflowdetails(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchKegsflowdetails")
    open func kegsflowdetails(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<KegsflowdetailsType>?, Error?) -> Void) {
        self.fetchKegsflowdetails(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchLeaderboard")
    open func leaderboard(query: DataQuery = DataQuery()) throws -> Array<LeaderboardType> {
        return try self.fetchLeaderboard(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchLeaderboard")
    open func leaderboard(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<LeaderboardType>?, Error?) -> Void) {
        self.fetchLeaderboard(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchLeaders")
    open func leaders(query: DataQuery = DataQuery()) throws -> Array<LeadersType> {
        return try self.fetchLeaders(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchLeaders")
    open func leaders(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<LeadersType>?, Error?) -> Void) {
        self.fetchLeaders(matching: query, completionHandler: completionHandler)
    }

    open override func refreshMetadata() throws {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        do {
            try ProxyInternal.refreshMetadata(service: self, fetcher: nil, options: BarcelonaMetadataParser.options)
            BarcelonaMetadataChanges.merge(metadata: self.metadata)
        }
    }
}
