//
// CollectionsViewController.swift
// kegerator
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 14/11/17
//

import Foundation
import SAPFiori

protocol TableUpdaterDelegate {
    func updateTable()
}

class CollectionsViewController: FUIFormTableViewController {

    private var collections = CollectionType.all

    // Variable to store the selected index path
    private var selectedIndex: IndexPath?

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var isPresentedInSplitView: Bool {
        return !(self.splitViewController?.isCollapsed ?? true)
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: 320, height: 480)

        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.makeSelection()
    }

    override func viewWillTransition(to _: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: nil, completion: { _ in
            let isNotInSplitView = !self.isPresentedInSplitView
            self.tableView.visibleCells.forEach { cell in
                // To refresh the disclosure indicator of each cell
                cell.accessoryType = isNotInSplitView ? .disclosureIndicator : .none
            }
            self.makeSelection()
        })
    }

    // MARK: - UITableViewDelegate
    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return self.collections.count
    }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 44
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> FUIObjectTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath) as! FUIObjectTableViewCell
        cell.headlineLabel.text = self.collections[indexPath.row].rawValue
        cell.accessoryType = !self.isPresentedInSplitView ? .disclosureIndicator : .none
        cell.isMomentarySelection = false
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath
        self.collectionSelected(at: indexPath)
    }

    // CollectionType selection helper

    private func collectionSelected(at: IndexPath) {
        // Load the EntityType specific ViewController from the specific storyboard
        var masterViewController: UIViewController!
        switch self.collections[at.row] {
        case .leaders:
            let leadersStoryBoard = UIStoryboard(name: "Leaders", bundle: nil)
            masterViewController = leadersStoryBoard.instantiateViewController(withIdentifier: "LeadersMaster")
            masterViewController.navigationItem.title = "Leaders"
        case .kegsdetails:
            let kegsdetailsStoryBoard = UIStoryboard(name: "Kegsdetails", bundle: nil)
            masterViewController = kegsdetailsStoryBoard.instantiateViewController(withIdentifier: "KegsdetailsMaster")
            masterViewController.navigationItem.title = "Kegsdetails"
        case .flowsum:
            let flowsumStoryBoard = UIStoryboard(name: "Flowsum", bundle: nil)
            masterViewController = flowsumStoryBoard.instantiateViewController(withIdentifier: "FlowsumMaster")
            masterViewController.navigationItem.title = "Flowsum"
        case .leaderboard:
            let leaderboardStoryBoard = UIStoryboard(name: "Leaderboard", bundle: nil)
            masterViewController = leaderboardStoryBoard.instantiateViewController(withIdentifier: "LeaderboardMaster")
            masterViewController.navigationItem.title = "Leaderboard"
        case .events:
            let eventsStoryBoard = UIStoryboard(name: "Events", bundle: nil)
            masterViewController = eventsStoryBoard.instantiateViewController(withIdentifier: "EventsMaster")
            masterViewController.navigationItem.title = "Events"
        case .kegsflowdetails:
            let kegsflowdetailsStoryBoard = UIStoryboard(name: "Kegsflowdetails", bundle: nil)
            masterViewController = kegsflowdetailsStoryBoard.instantiateViewController(withIdentifier: "KegsflowdetailsMaster")
            masterViewController.navigationItem.title = "Kegsflowdetails"
        case .drinksByEvent:
            let drinksByEventStoryBoard = UIStoryboard(name: "DrinksByEvent", bundle: nil)
            masterViewController = drinksByEventStoryBoard.instantiateViewController(withIdentifier: "DrinksByEventMaster")
            masterViewController.navigationItem.title = "DrinksByEvent"
        case .kegs:
            let kegsStoryBoard = UIStoryboard(name: "Kegs", bundle: nil)
            masterViewController = kegsStoryBoard.instantiateViewController(withIdentifier: "KegsMaster")
            masterViewController.navigationItem.title = "Kegs"
        case .drinksByKeg:
            let drinksByKegStoryBoard = UIStoryboard(name: "DrinksByKeg", bundle: nil)
            masterViewController = drinksByKegStoryBoard.instantiateViewController(withIdentifier: "DrinksByKegMaster")
            masterViewController.navigationItem.title = "DrinksByKeg"
        case .none:
            masterViewController = UIViewController()
        }

        // Load the NavigationController and present with the EntityType specific ViewController
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let rightNavigationController = mainStoryBoard.instantiateViewController(withIdentifier: "RightNavigationController") as! UINavigationController
        rightNavigationController.viewControllers = [masterViewController]
        self.splitViewController?.showDetailViewController(rightNavigationController, sender: nil)
    }

    // MARK: - Handle highlighting of selected cell
    private func makeSelection() {
        if let selectedIndex = selectedIndex {
            self.tableView.selectRow(at: selectedIndex, animated: true, scrollPosition: .none)
            self.tableView.scrollToRow(at: selectedIndex, at: .none, animated: true)
        } else {
            self.selectDefault()
        }
    }

    private func selectDefault() {
        // Automatically select first element if we have two panels (iPhone plus and iPad only)
        if self.splitViewController!.isCollapsed || self.appDelegate.barcelona == nil {
            return
        }
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
        self.collectionSelected(at: indexPath)
    }
}
