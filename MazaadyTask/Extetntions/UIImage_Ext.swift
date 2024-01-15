//
//  UIImage_Ext.swift
//  LABYFI
//
//  Created by eslam dweeb on 11/09/2023.
//

import UIKit

extension UIImage {
    func resizeImage(to newSize: CGSize, quality: CGFloat = 0.7, completion: @escaping (Result<UIImage, Error>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            autoreleasepool {
                let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
                if let data = self.jpegData(compressionQuality: quality),
                   let imageSource = CGImageSourceCreateWithData(data as CFData, imageSourceOptions) {
                    let maxDimensionInPixels = max(newSize.width, newSize.height) * UIScreen.main.scale
                    let options: [CFString: Any] = [
                        kCGImageSourceThumbnailMaxPixelSize: maxDimensionInPixels,
                        kCGImageSourceCreateThumbnailFromImageAlways: true,
                        kCGImageSourceCreateThumbnailWithTransform: true,
                    ]
                    if let resizedImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, options as CFDictionary) {
                        let uiImage = UIImage(cgImage: resizedImage)
                        let originalSize = self.size
                        let originalSizeInBytes = data.count
                        let resizedSizeInBytes = resizedImage.bytesPerRow * resizedImage.height

                        print("Original Image Size (Width x Height): \(originalSize.width) x \(originalSize.height) pixels")
                        print("Resized Image Size (Width x Height): \(uiImage.size.width) x \(uiImage.size.height) pixels")
                        print("Original Image Size in Bytes: \(originalSizeInBytes) bytes")
                        print("Resized Image Size in Bytes: \(resizedSizeInBytes) bytes")
                        
                        completion(.success(uiImage))
                    } else {
                        completion(.failure(NSError(domain: "ImageResizeErrorDomain", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to resize image."])))
                    }
                } else {
                    completion(.failure(NSError(domain: "ImageResizeErrorDomain", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to create image data."])))
                }
            }
        }
    }

}
