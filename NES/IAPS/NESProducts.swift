//
//  NESProducts.swift
//  NES
//
//  Created by Michael Blades on 10/29/18.
//  Copyright © 2018 XYello, Inc. All rights reserved.
//

import Foundation

public struct NESProducts {
    
    private static let productIdentifiers: Set<ProductIdentifier> = [Constants.dataPackIAP, Constants.desginPackIAP, Constants.everythingIAP]
    
    public static let store = IAPManager(productIds: NESProducts.productIdentifiers)
}

func resourceNameForProductIdentifier(_ productIdentifier: String) -> String? {
    return productIdentifier.components(separatedBy: ".").last
}
