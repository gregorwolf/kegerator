//
// KegsflowdetailsDetailViewController.swift
// kegerator
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 14/11/17
//

import Foundation
import SAPFoundation
import SAPOData
import SAPFiori
import SAPCommon

class KegsflowdetailsDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var barcelona: Barcelona<OnlineODataProvider> {
        return self.appDelegate.barcelona
    }

    private var validity = [String: Bool]()
    private var _entity: KegsflowdetailsType?
    var entity: KegsflowdetailsType {
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

    private let logger = Logger.shared(named: "KegsflowdetailsMasterViewControllerLogger")
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
            return self.cellForId(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: KegsflowdetailsType.id)
        case 1:
            return self.cellForTdate(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: KegsflowdetailsType.tdate)
        case 2:
            return self.cellForKegId(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: KegsflowdetailsType.kegId)
        case 3:
            return self.cellForPourTime(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: KegsflowdetailsType.pourTime)
        case 4:
            return self.cellForPulsecount(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: KegsflowdetailsType.pulsecount)
        case 5:
            return self.cellForFlowrate(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: KegsflowdetailsType.flowrate)
        case 6:
            return self.cellForFlowMl(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: KegsflowdetailsType.flowMl)
        case 7:
            return self.cellForFlowOz(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: KegsflowdetailsType.flowOz)
        case 8:
            return self.cellForTotalMl(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: KegsflowdetailsType.totalMl)
        case 9:
            return self.cellForTotalOz(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: KegsflowdetailsType.totalOz)
        default:
            return CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath)
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 10
    }

    override func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return true
    }

    // MARK: - OData property specific cell creators

    private func cellForId(tableView: UITableView, indexPath: IndexPath, currentEntity: KegsflowdetailsType, property: Property) -> UITableViewCell {
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

    private func cellForTdate(tableView: UITableView, indexPath: IndexPath, currentEntity: KegsflowdetailsType, property: Property) -> UITableViewCell {
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

    private func cellForKegId(tableView: UITableView, indexPath: IndexPath, currentEntity: KegsflowdetailsType, property: Property) -> UITableViewCell {
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

    private func cellForPourTime(tableView: UITableView, indexPath: IndexPath, currentEntity: KegsflowdetailsType, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.pourTime {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.pourTime = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.pourTime = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPulsecount(tableView: UITableView, indexPath: IndexPath, currentEntity: KegsflowdetailsType, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.pulsecount {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.pulsecount = nil
                isNewValueValid = true
            } else {
                if let validValue = Int(newValue) {
                    currentEntity.pulsecount = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForFlowrate(tableView: UITableView, indexPath: IndexPath, currentEntity: KegsflowdetailsType, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.flowrate {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.flowrate = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.flowrate = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForFlowMl(tableView: UITableView, indexPath: IndexPath, currentEntity: KegsflowdetailsType, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.flowMl {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.flowMl = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.flowMl = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForFlowOz(tableView: UITableView, indexPath: IndexPath, currentEntity: KegsflowdetailsType, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.flowOz {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.flowOz = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.flowOz = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForTotalMl(tableView: UITableView, indexPath: IndexPath, currentEntity: KegsflowdetailsType, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.totalMl {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.totalMl = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.totalMl = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForTotalOz(tableView: UITableView, indexPath: IndexPath, currentEntity: KegsflowdetailsType, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.totalOz {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.totalOz = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.totalOz = validValue
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

    func createEntityWithDefaultValues() -> KegsflowdetailsType {
        let newEntity = KegsflowdetailsType()
        // Fill the mandatory properties with default values
        newEntity.id = CellCreationHelper.defaultValueFor(KegsflowdetailsType.id)

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
