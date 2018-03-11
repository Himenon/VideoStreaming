//
//  VideoViewController.swift
//  VideoStreaming
//
//  Created by Himeno Kosei on 2018/03/11.
//  Copyright © 2018年 Kosei Himeno. All rights reserved.
//

import Cocoa
import Foundation
import AVFoundation

class VideoViewController: NSViewController  {
    
    @IBOutlet weak var videoView: NSView!
    private let session = AVCaptureSession()
    
    override func viewWillAppear() {
        super.viewDidLoad()
        super.viewWillAppear()
        self.initCaptureSession()
        self.setupPreviewLayer()
    }
    
    override func viewDidLoad() {
        
    }
    
    func initCaptureSession() {
      // メインディスプレイのIDを取得
      // let displayID = CGDirectDisplayID(CGMainDisplayID())
      // let device_input: AVCaptureScreenInput = AVCaptureScreenInput(displayID: displayID)

      // カメラの場合
      let device: AVCaptureDevice
      device = AVCaptureDevice.devices(for: .video)[0]
      let device_input: AVCaptureDeviceInput = try! AVCaptureDeviceInput.init(device: device)
      
      // sessionにdevice inputを追加
      session.addInput(device_input)
    }
    
    func setupPreviewLayer() {
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        previewLayer.frame = videoView.bounds
        self.view.layer?.addSublayer(previewLayer)
    }
    
    @IBAction func startPreview_click(_ sender: NSButton) {
        if (!session.isRunning) {
            session.startRunning()
        }
    }

    @IBAction func stopPreview_click(_ sender: NSButton) {
        if (session.isRunning) {
            session.stopRunning()
        }
    }
}





