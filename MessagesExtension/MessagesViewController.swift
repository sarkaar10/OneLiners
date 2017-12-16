//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by Ajit Sarkaar on 27/10/17.
//  Copyright © 2017 Ajit Sarkaar. All rights reserved.
//

import UIKit
import Messages
import AVFoundation

class MessagesViewController: MSMessagesAppViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {
    
    
    var audioPlayer = AVAudioPlayer();
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentCell = basicArray[indexPath.item];
        let currentSnippetURL = currentCell.audioClipURL;
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: currentSnippetURL!);
            audioPlayer.prepareToPlay();
        } catch let err {
            print(err);
        }
        
        if audioPlayer.isPlaying {
            audioPlayer.stop();
            audioPlayer.play();
        } else {
            audioPlayer.play();
            if audioPlayer.isPlaying {
                print("playing...............");
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return basicArray.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCV.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AudioCell;
        let currentCell = basicArray[indexPath.item];
        cell.snippet = currentCell;
        //cell.backgroundColor = .blue;
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let quarterScreenWidth = view.frame.width / 4;
        return CGSize(width: quarterScreenWidth, height: quarterScreenWidth);
    }
    
    //let screenWidth = UIScreen.main.bounds.width;
    //let halfScreenWidth = UIScreen.main.bounds.width / 2;
    
    let cellId = "cellId";
    
    
    
    var basicArray = [Snippet]();
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0);
        
        view.addSubview(mainCV);
        mainCV.dataSource = self;
        mainCV.delegate = self;
        
        
        
        mainCV.register(AudioCell.self, forCellWithReuseIdentifier: cellId);
        
        if let flowLayout = mainCV.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumInteritemSpacing = 0;
            flowLayout.minimumLineSpacing = 0;
        }
        
        mainCV.translatesAutoresizingMaskIntoConstraints = false;
        mainCV.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true;
        mainCV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true;
        mainCV.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true;
        mainCV.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true;
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(longPress));
        lpgr.minimumPressDuration = 0.5
        lpgr.delaysTouchesBegan = true
        lpgr.delegate = self
        self.mainCV.addGestureRecognizer(lpgr);
    
    
        basicArray.append(Snippet(name: "WTF", icon: #imageLiteral(resourceName: "WTF"), soundURL: URL(fileURLWithPath: Bundle.main.path(forResource: "WTF", ofType: "wav")!)));
        //basicArray.append(Snippet(name: "Bad Joke", icon: #imageLiteral(resourceName: "joker"), soundURL: URL(fileURLWithPath: Bundle.main.path(forResource: "jokes", ofType: "wav")!)));
        basicArray.append(Snippet(name: "Speak English", icon: #imageLiteral(resourceName: "samuel"), soundURL: URL(fileURLWithPath: Bundle.main.path(forResource: "EnglishDoYouSpeakIt", ofType: "wav")!)));
        basicArray.append(Snippet(name: "I'll be back", icon: #imageLiteral(resourceName: "arnold"), soundURL: URL(fileURLWithPath: Bundle.main.path(forResource: "IllBeBack", ofType: "wav")!)));
        basicArray.append(Snippet(name: "Bankruptcy", icon: #imageLiteral(resourceName: "bankruptcy"), soundURL: URL(fileURLWithPath: Bundle.main.path(forResource: "Bankruptcy", ofType: "wav")!)));
        basicArray.append(Snippet(name: "Escalated Quickly", icon: #imageLiteral(resourceName: "boyThat"), soundURL: URL(fileURLWithPath: Bundle.main.path(forResource: "BoyEscalated", ofType: "wav")!)));
        basicArray.append(Snippet(name: "Cash me outside", icon: #imageLiteral(resourceName: "cashMe"), soundURL: URL(fileURLWithPath: Bundle.main.path(forResource: "CashMeOutside", ofType: "wav")!)));
        basicArray.append(Snippet(name: "Damn", icon: #imageLiteral(resourceName: "damn"), soundURL: URL(fileURLWithPath: Bundle.main.path(forResource: "Damn", ofType: "wav")!)));
        basicArray.append(Snippet(name: "Fool me once", icon: #imageLiteral(resourceName: "foolMeOnce"), soundURL: URL(fileURLWithPath: Bundle.main.path(forResource: "FoolMeOnce", ofType: "wav")!)));
        basicArray.append(Snippet(name: "Hasta la vista", icon: #imageLiteral(resourceName: "hastaLa"), soundURL: URL(fileURLWithPath: Bundle.main.path(forResource: "HastaLaVista", ofType: "wav")!)));
        basicArray.append(Snippet(name: "Problem", icon: #imageLiteral(resourceName: "houston"), soundURL: URL(fileURLWithPath: Bundle.main.path(forResource: "Houston", ofType: "wav")!)));
        basicArray.append(Snippet(name: "I will find you", icon: #imageLiteral(resourceName: "iWillFindYou"), soundURL: URL(fileURLWithPath: Bundle.main.path(forResource: "IWillFindYou", ofType: "wav")!)));
        basicArray.append(Snippet(name: "Live dangerously", icon: #imageLiteral(resourceName: "liveDangerously"), soundURL: URL(fileURLWithPath: Bundle.main.path(forResource: "LiveDangerously", ofType: "wav")!)));
        basicArray.append(Snippet(name: "No God!", icon: #imageLiteral(resourceName: "noGodPleaseNo"), soundURL: URL(fileURLWithPath: Bundle.main.path(forResource: "NoGodPleaseNo", ofType: "wav")!)));
        basicArray.append(Snippet(name: "Don't want to Live", icon: #imageLiteral(resourceName: "planetAnymore"), soundURL: URL(fileURLWithPath: Bundle.main.path(forResource: "ThisPlanetAnymore", ofType: "wav")!)));
        basicArray.append(Snippet(name: "What up", icon: #imageLiteral(resourceName: "whatupbiatch"), soundURL: URL(fileURLWithPath: Bundle.main.path(forResource: "WhatUpBitch", ofType: "wav")!)));
        
        
        // Do any additional setup after loading the view.
    }
    
    func longPress(_ gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizerState.ended {
            return
        }
        
        let p = gestureReconizer.location(in: mainCV);
        let indexPath = mainCV.indexPathForItem(at: p)
        
        if let index = indexPath {
            let cell = mainCV.cellForItem(at: index) as! AudioCell;
            // do stuff with your cell, for example print the indexPath
            activeConversation?.insertAttachment((cell.snippet?.audioClipURL)!, withAlternateFilename: "Audio", completionHandler: { (err) in
                print("ERROR ATTACHING : ", err ?? " ");
            });
            
            print(index.row)
        } else {
            print("Could not find index path")
        }
    }
    
    let mainCV : UICollectionView = {
        let layout = UICollectionViewFlowLayout();
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout);
        cv.backgroundColor = .white;
        return cv;
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dissmises the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }

}
