//
//  ContentView.swift
//  SDKDemo_SwiftUI
//
//  Created by Hoang Do on 1/9/23.
//

import SwiftUI
import RxSwift
import NADomain
import NetAloFull
import NATheme
import Resolver

struct ContentView: View {
    var delegate: AppDelegate

    var body: some View {
        VStack {
            Button("Show Listgroup") {
                self.delegate.netAloSDK.showListGroup { error in
                    let err = error as? NAError
                    print("showVNDemoVC with err: \(err?.description ?? "")")
                }
            }
            Spacer()
            Button("show group chat") {
                self.delegate.netAloSDK.showGroupChat(with: "2915961526638025", completion: { error in
                    let err = error as? NAError
                    print("showGroupChat with err: \(err?.description ?? "")")
                })
            }
            Spacer()
            Button("Personal call") {
                let testContact = NAContact(id: 4785074606744072, phone: "rooney", fullName: "rooney", profileUrl: "")
                self.delegate.netAloSDK.showCall(with: testContact, isVideoCall: false, completion: { error in
                    let err = error as? NAError
                    print("showCall with err: \(err?.description ?? "")")
                })
            }
            Spacer()
            Button("DidReceive message with json") {
                // Conveter data "payload" in noti to json.
                self.delegate.netAloSDK.didReceive(
                    messageJson: "{\"messageId\":\"637844810459254798\",\"groupId\":\"4794535825664490\",\"message\":\"1234a98\",\"senderUin\":\"4785074617643083\",\"createdAt\":\"1686906959572377\",\"recipientUins\":[\"4785074617681017\",\"4785074617709101\"],\"type\":\"text\",\"attachments\":\"\",\"groupType\":\"GROUP_TYPE_PUBLIC\",\"nonce\":\"n637844810459254798\"}",
                    completion: { error in
                        let err = error as? NAError
                        print("didReceive with err: \(err?.description ?? "")")
                    }
                )
            }
            Spacer()
            Button("get numberBadge") {
                self.delegate.netAloSDK.getNumberOfBadge({ numberOfBadge in
                    print("numberOfBadge: \(numberOfBadge)")
                })
            }
        }
        .padding()
    }
}
