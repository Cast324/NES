//
//  SubscriptionManager.swift
//  NES
//
//  Created by Andrew Robinson on 9/19/18.
//  Copyright © 2018 XYello, Inc. All rights reserved.
//

import RealmSwift
import CloudKit
import RxRealm
import RxSwift

class SubscriptionManager {
    typealias DidGetNewDataBlock = (_ subscriptions: [Subscription]) -> ()
    static let instance = SubscriptionManager()

    private var subscriptions = [Subscription]()
    private let bag = DisposeBag()

    private let realm = try! Realm()

    func addSubscription(subscription: Subscription) {
        try! realm.write {
            realm.add(subscription)
        }
    }

    func getSubscriptionCount() -> Int {
        return subscriptions.count
    }

    func getSubscriptionAt(index: Int) -> Subscription {
        return subscriptions[index]
    }

    func bind(with block: @escaping DidGetNewDataBlock) {
        let realm = try! Realm()

        /// Results instances are live, auto-updating views into the underlying data, which means results never have to be re-fetched.
        /// https://realm.io/docs/swift/latest/#objects-with-primary-keys
        let subscriptions = realm.objects(Subscription.self)

        Observable.array(from: subscriptions).subscribe(onNext: { (subscriptions) in
            self.subscriptions = subscriptions.filter{ !$0.isDeleted }
            block(self.subscriptions)
        }).disposed(by: bag)
    }
}
