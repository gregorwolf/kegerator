//
// LeaderboardDetailViewController.swift
// kegerator
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 14/11/17
//

import Foundation
import SAPFoundation
import SAPOData
import SAPFiori
import SAPCommon

class LeaderboardDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var barcelona: Barcelona<OnlineODataProvider> {
        return self.appDelegate.barcelona
    }

    private var validity = [String: Bool]()
    private var _entity: LeaderboardType?
    var entity: LeaderboardType {
        get {
            if self._entity == nil {
                self._entity = self.createEntityWithDefaultValues()
            }
            return self._entity!
        }
        set {
            self._entity = newValue
        }
    }

    private let logger = Logger.shared(named: "LeaderboardMasterViewControllerLogger")
    var loadingIndicator: FUILoadingIndicatorView?
    var tableUpdater: TableUpdaterDelegate?
    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return self.cellForId(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: LeaderboardType.id)
        case 1:
            return self.cellForTdate(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: LeaderboardType.tdate)
        case 2:
            return self.cellForUid(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: LeaderboardType.uid)
        case 3:
            return self.cellForEventId(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: LeaderboardType.eventId)
        case 4:
            return self.cellForKegId(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: LeaderboardType.kegId)
        default:
            return CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath)
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 5
    }

    override func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return true
    }

    // MARK: - OData property specific cell creators

    private func cellForId(tableView: UITableView, indexPath: IndexPath, currentEntity: LeaderboardType, property: Property) -> UITableViewCell {
        var value = ""
        value = currentEntity.id != nil ? "\(currentEntity.id!)" : ""
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if let validValue = Int(newValue) {
                currentEntity.id = validValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForTdate(tableView: UITableView, indexPath: IndexPath, currentEntity: LeaderboardType, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.tdate {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.tdate = nil
                isNewValueValid = true
            } else {
                if let validValue = LocalDateTime.parse(newValue) { // This is just a simple solution to handle UTC only
                    currentEntity.tdate = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForUid(tableView: UITableView, indexPath: IndexPath, currentEntity: LeaderboardType, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.uid {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.uid = nil
                isNewValueValid = true
            } else {
                if LeaderboardType.uid.isOptional || newValue != "" {
                    currentEntity.uid = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForEventId(tableView: UITableView, indexPath: IndexPath, currentEntity: LeaderboardType, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.eventId {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.eventId = nil
                isNewValueValid = true
            } else {
                if let validValue = Int(newValue) {
                    currentEntity.eventId = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForKegId(tableView: UITableView, indexPath: IndexPath, currentEntity: LeaderboardType, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.kegId {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.kegId = nil
                isNewValueValid = true
            } else {
                if let validValue = Int(newValue) {
                    currentEntity.kegId = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    // MARK: - OData functionalities

    @IBAction func updateEntity(_: AnyObject) {
        self.showFioriLoadingIndicator()
        self.view.endEditing(true)
        self.logger.info("Updating entity in backend.")
        self.barcelona.updateEntity(self.entity) { error in
            self.hideFioriLoadingIndicator()
            if let error = error {
                self.logger.error("Update entry failed. Error: \(error)", error: error)
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorEntityUpdateTitle", value: "Update entry failed", comment: "XTIT: Title of alert message about entity update failure."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
                return
            }
            self.logger.info("Update entry finished successfully.")
            FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Updated", comment: "XTIT: Title of alert message about successful entity update."))
            self.tableUpdater?.updateTable()
        }
    }

    @objc func createEntity() {
        self.showFioriLoadingIndicator()
        self.view.endEditing(true)
        self.logger.info("Creating entity in backend.")
        self.barcelona.createEntity(self.entity) { error in
            self.hideFioriLoadingIndicator()
            if let error = error {
                self.logger.error("Create entry failed. Error: \(error)", error: error)
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorEntityCreationTitle", value: "Create entry failed", comment: "XTIT: Title of alert message about entity creation error."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
                return
            }
            self.logger.info("Create entry finished successfully.")
            OperationQueue.main.addOperation({
                self.dismiss(animated: true) {
                    FUIToastMessage.show(message: NSLocalizedString("keyEntityCreationBody", value: "Created", comment: "XMSG: Title of alert message about successful entity creation."))
                    self.tableUpdater?.updateTable()
                }
            })
        }
    }

    func createEntityWithDefaultValues() -> LeaderboardType {
        let newEntity = LeaderboardType()
        // Fill the mandatory properties with default values
        newEntity.id = CellCreationHelper.defaultValueFor(LeaderboardType.id)

        // Key properties without default value should be invalid by default for Create scenario
        if newEntity.id == nil {
            self.validity["ID"] = false
        }
        self.barButtonShouldBeEnabled()
        return newEntity
    }

    // MARK: - other logic, helper

    @objc func cancel() {
        OperationQueue.main.addOperation({
            self.dismiss(animated: true)
        })
    }

    // Check if all text fields are valid
    private func barButtonShouldBeEnabled() {
        let anyFieldInvalid = self.validity.values.first { field in
            return field == false
        }
        self.navigationItem.rightBarButtonItem?.isEnabled = anyFieldInvalid == nil
    }
}
