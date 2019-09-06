import UIKit

let image = UIImage(named: "waifu.jpg")!




let height = Int(image.size.height)
let width = Int(image.size.width)

let bitsPerComponent = Int(8)
let bytesPerRow = 4 * width
let colorSpace = CGColorSpaceCreateDeviceRGB()

let rawData = UnsafeMutablePointer<UInt32>.allocate(capacity: (width * height))
let bitMapInfo: UInt32 = CGBitmapInfo.byteOrder32Big.rawValue | CGImageAlphaInfo.premultipliedLast.rawValue
let pointZero = CGPoint(x: 0, y: 0)
let rect = CGRect(origin: pointZero, size: image.size)


let imageContext = CGContext(data: rawData, width: width, height: height, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitMapInfo)

imageContext?.draw(image.cgImage!, in: rect)

let pixels = UnsafeMutableBufferPointer<UInt32>(start: rawData, count: width * height)

let outContext = CGContext(data: pixels.baseAddress, width: width, height: height, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitMapInfo, releaseCallback: nil, releaseInfo: nil)


let outImage = UIImage(cgImage: (imageContext?.makeImage())!)
