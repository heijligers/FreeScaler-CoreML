//
//  Global Variables.swift
//  FreeScaler
//
//  Created by Hany El Imam on 29/11/22.
//

import Foundation

// current model path
var selectedModelPath = (Bundle.main.path(forResource: "realesrgan512", ofType: "mlmodelc")!)

// use ANE
var useNeuralEngine : Bool = true

// local notification center
let notificationcenter = NotificationCenter.default
// Upscaling factor
var upscalingFactor: CGFloat = 2

// Input and Output file names
var inputFileName: String = ""
var outputFileName: String = ""
// Video dimensions structure
struct VideoDimensions {
    var inputVideoSize: CGSize = .zero
    var inputBufferSize: CGSize = .zero
    var modelInputSize: CGSize = CGSize(width: 512, height: 512) // Assuming the model expects 512x512 input
    var modelOutputSize: CGSize = CGSize(width: 2048, height: 2048)
    var outputVideoSize: CGSize = .zero
}

// Global instance to hold video dimensions
var globalVideoDimensions = VideoDimensions()

func updateGlobalVideoDimensions(inputSize: CGSize) {
    let aspectRatio = inputSize.width / inputSize.height
    let maxDimension: CGFloat = 2048
    if aspectRatio > 1 { // Landscape
        globalVideoDimensions.outputVideoSize = CGSize(width: maxDimension, height: maxDimension / aspectRatio)
    } else { // Portrait
        globalVideoDimensions.outputVideoSize = CGSize(width: maxDimension * aspectRatio, height: maxDimension)
    }
    print("Global video dimensions updated: \(globalVideoDimensions)")
}
