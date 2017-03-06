//
//  Ody.swift
//  Ody
//
//  Created by Jose Quintero on 1/2/16.
//  Copyright © 2016 Quintero. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController{
    func odytizeAllWithCustomImage(_ url: String){
        for v in self.view.subviews{
            if v is UIImageView{
                let vi = v as! UIImageView
                vi.odytizeWithCustomImage(url)
                //vi.setLoaderColorForOdyView(loaderColor)
            }
        }
    }
    func odytizeAllWithCustomImage(_ url: String, loaderColor: UIColor){
        for v in self.view.subviews{
            if v is UIImageView{
                let vi = v as! UIImageView
                vi.odytizeWithCustomImage(url)
                vi.setLoaderColorForOdyView(loaderColor)
            }
        }
    }
    func odytizeAll(_ grayscale: Bool = false, category: ImageCategory = .NotSet, text: String = "", loaderColor: UIColor = UIColor.darkGray){
        for v in self.view.subviews{
            if v is UIImageView{
                let vi = v as! UIImageView
                vi.odytize(grayscale, category: category, text: text)
                vi.setLoaderColorForOdyView(loaderColor)
            }
        }
    }
    func odytizeAll(_ category: ImageCategory){
        let grayscale: Bool = false, loaderColor: UIColor = UIColor.darkGray, text: String = ""
        for v in self.view.subviews{
            if v is UIImageView{
                let vi = v as! UIImageView
                vi.odytize(grayscale, category: category, text: text)
                vi.setLoaderColorForOdyView(loaderColor)
            }
        }
    }
    func odytizeAll(_ loaderColor: UIColor){
        let grayscale: Bool = false, category: ImageCategory = .NotSet, text: String = ""
        for v in self.view.subviews{
            if v is UIImageView{
                let vi = v as! UIImageView
                vi.odytize(grayscale, category: category, text: text)
                vi.setLoaderColorForOdyView(loaderColor)
            }
        }
    }
    func odytizeAllToGrayscale(){
        let grayscale: Bool = true, category: ImageCategory = .NotSet, text: String = "", loaderColor: UIColor = UIColor.darkGray
        for v in self.view.subviews{
            if v is UIImageView{
                let vi = v as! UIImageView
                vi.odytize(grayscale, category: category, text: text)
                vi.setLoaderColorForOdyView(loaderColor)
            }
        }
    }
    func odytizeAllToGrayscale(_ loaderColor: UIColor){
        let grayscale: Bool = true, category: ImageCategory = .NotSet, text: String = ""
        for v in self.view.subviews{
            if v is UIImageView{
                let vi = v as! UIImageView
                vi.odytize(grayscale, category: category, text: text)
                vi.setLoaderColorForOdyView(loaderColor)
            }
        }
    }
    func odytizeAllToGrayscale(_ category: ImageCategory){
        let grayscale: Bool = true, text: String = "", loaderColor: UIColor = UIColor.darkGray
        for v in self.view.subviews{
            if v is UIImageView{
                let vi = v as! UIImageView
                vi.odytize(grayscale, category: category, text: text)
                vi.setLoaderColorForOdyView(loaderColor)
            }
        }
    }
}

public extension UIImageView{
    
    convenience init(loaderColor: UIColor, frame: CGRect, grayscale: Bool, category: ImageCategory, text: String){
        self.init(frame: frame)
        self.odytize(grayscale, category: category, text: text)
        self.setLoaderColorForOdyView(loaderColor)
    }
    
    convenience init(loaderColor: UIColor, frame: CGRect){
        self.init(frame: frame)
        self.odytize()
        self.setLoaderColorForOdyView(loaderColor)
    }
    
    convenience init(category: ImageCategory, frame: CGRect){
        self.init(frame: frame)
        self.odytize(category: category)
    }
    
    func setLoaderColorForOdyView(_ color: UIColor) -> Bool{
        for i in 0..<self.subviews.count{
            if let sView = self.subviews[i] as? OdyView{
                sView.loaderColor = color
                return true
            }
        }
        return false
    }
    
    fileprivate func toOdyView(_ withUrl: String){
        for i in 0..<self.subviews.count{
            if let sView = self.subviews[i] as? OdyView{
                if sView.url == withUrl{
                    return
                }
                sView.removeFromSuperview()
            }
        }
        self.clipsToBounds = false
        let cM = self
        let odyView = OdyView(frame: CGRect(x: 0, y: 0, width: cM.bounds.width, height: cM.bounds.height))
        odyView.backgroundColor = self.backgroundColor
        odyView.isOpaque = false
        odyView.fetch(withUrl, parent: cM)
        self.addSubview(odyView)
    }
    
    func odytizeGrayscale(){
        let category : ImageCategory = .NotSet
        let grayscale: Bool = false, text: String = ""
        let ody = Ody()
        let size = [SizeDict.Width: self.bounds.width, SizeDict.Height: self.bounds.height]
        self.toOdyView(ody.getRandomImage(size, grayscale: grayscale, category: category, text: text))
    }
    
    func odytizeGrayscale(_ loaderColor: UIColor){
        let category: ImageCategory = .NotSet
        let grayscale: Bool = true, text: String = ""
        let ody = Ody()
        let size = [SizeDict.Width: self.bounds.width, SizeDict.Height: self.bounds.height]
        self.toOdyView(ody.getRandomImage(size, grayscale: grayscale, category: category, text: text))
        self.setLoaderColorForOdyView(loaderColor)
    }
    
    func odytizeGrayscale(_ category: ImageCategory){
        let grayscale: Bool = true, text: String = ""
        let ody = Ody()
        let size = [SizeDict.Width: self.bounds.width, SizeDict.Height: self.bounds.height]
        self.toOdyView(ody.getRandomImage(size, grayscale: grayscale, category: category, text: text))
    }
    
    func odytize(_ loaderColor: UIColor){
        let category: ImageCategory = .NotSet
        let grayscale: Bool = false, text: String = ""
        let ody = Ody()
        let size = [SizeDict.Width: self.bounds.width, SizeDict.Height: self.bounds.height]
        self.toOdyView(ody.getRandomImage(size, grayscale: grayscale, category: category, text: text))
        self.setLoaderColorForOdyView(loaderColor)
    }
    
    func odytize(_ category: ImageCategory){
        let grayscale: Bool = false, text: String = ""
        let ody = Ody()
        let size = [SizeDict.Width: self.bounds.width, SizeDict.Height: self.bounds.height]
        self.toOdyView(ody.getRandomImage(size, grayscale: grayscale, category: category, text: text))
    }
    
    func odytize(_ grayscale: Bool = false, category: ImageCategory = .NotSet, text: String = ""){
        let ody = Ody()
        let size = [SizeDict.Width: self.bounds.width, SizeDict.Height: self.bounds.height]
        self.toOdyView(ody.getRandomImage(size, grayscale: grayscale, category: category, text: text))
    }
    
    fileprivate func odytizeWithCustomImage(_ url: String){
        self.toOdyView(url)
    }
}

public enum ImageCategory: String {
    case NotSet = ""
    case Abstarct = "abstract"
    case Animals = "animals"
    case Business = "business"
    case Cats = "cats"
    case City = "city"
    case Food = "food"
    case Nightlife = "nightlife"
    case Fashion = "fashion"
    case People = "people"
    case Nature = "nature"
    case Sports = "sports"
    case Technics = "technics"
    case Transport = "transport"
    case FillDunphy = "filldunphy"
}

public enum SizeDict: String{
    case Width = "width"
    case Height = "height"
}

internal class OdyView: UIView, URLSessionDelegate{
    //public
    var loaderColor: UIColor! = UIColor.darkGray
    ///////////////////
    
    //private
    fileprivate var progress: Float! = 0
    fileprivate var runned = true
    fileprivate var url: String!
    fileprivate var parent: UIImageView!
    //////////
    
    internal func fetch(_ url: String, parent: UIImageView){
        self.backgroundColor = parent.backgroundColor
        self.url = url
        self.parent = parent
        runned = false
        self.setNeedsDisplay()
    }
    
    fileprivate var downloadTask: URLSessionDownloadTask?
    
    override internal func draw(_ rect: CGRect) {
        let bounds = self.bounds
        drawProgressLoader(frame: bounds, shapeColor: self.loaderColor, progressFraction: CGFloat(self.progress))
        if runned == false{
            self.alpha = 1
            createDownloadTask(url)
            runned = true
        }
    }
    
    func createDownloadTask(_ url: String) {
        let urls = url.replacingOccurrences(of: " ", with: "-", options: NSString.CompareOptions.literal, range: nil)
        let downloadRequest = URLRequest(url: URL(string: urls)!)
        let session = Foundation.URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main)
        
        downloadTask = session.downloadTask(with: downloadRequest)
        downloadTask!.resume()
    }
    
    func URLSession(_ session: Foundation.URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        var progressInternal = Float(0)
        if (totalBytesExpectedToWrite != -1){
            progressInternal = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        }else {
            progressInternal = self.progress + 0.1
            if progressInternal > 1{
                progressInternal = 0
            }
        }
        self.progress = progressInternal
        self.setNeedsDisplay()
    }
    
    func URLSession(_ session: Foundation.URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingToURL location: URL) {
        self.alpha = 0
        let img = UIImage(data: try! Data(contentsOf: location))
        print(parent)
        self.parent.image = img
    }
    
    func URLSession(_ session: Foundation.URLSession, task: URLSessionTask, didCompleteWithError error: NSError?) {
        if error != nil{
            print("fail")
        }
    }
}

extension OdyView{
    
    func drawProgressLoader(frame: CGRect = CGRect(x: 0, y: 0, width: 200, height: 200), shapeColor: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000), progressFraction: CGFloat = 0.793) {
        
        //// Variable Declarations
        let expression: CGFloat = progressFraction != 0 ? progressFraction * -360 : 1
        
        
        //// Subframes
        let group: CGRect = CGRect(x: frame.minX + floor((frame.width - 22) * 0.50000 + 0.5), y: frame.minY + floor((frame.height - 22) * 0.50000 + 0.5), width: 22, height: 22)
        
        
        //// Group
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: group.minX, y: group.minY, width: 22, height: 22))
        shapeColor.setStroke()
        ovalPath.lineWidth = 2.5
        ovalPath.stroke()
        
        
        //// Oval 2 Drawing
        let oval2Rect = CGRect(x: group.minX + 1, y: group.minY + 1, width: 20, height: 20)
        let oval2Path = UIBezierPath()
        oval2Path.addArc(withCenter: CGPoint(x: oval2Rect.midX, y: oval2Rect.midY), radius: oval2Rect.width / 2, startAngle: -1 * CGFloat(M_PI)/180, endAngle: -expression * CGFloat(M_PI)/180, clockwise: true)
        oval2Path.addLine(to: CGPoint(x: oval2Rect.midX, y: oval2Rect.midY))
        oval2Path.close()
        
        shapeColor.setFill()
        oval2Path.fill()
    }
    
}

internal class Ody{
    
    internal init(){
        
    }
    
    internal func getRandomImage(_ size: Dictionary<SizeDict, CGFloat>! = [.Width: 200, .Height: 200], grayscale: Bool = false, category: ImageCategory = .NotSet, text: String = "") -> String{
        if category != .FillDunphy{
            return("http://lorempixel.com/\(grayscale ? "g/" : "")\(Int(size[SizeDict.Width]!))/\(Int(size[SizeDict.Height]!))\(category.rawValue == "" ? "" : "/" + category.rawValue + "/")\(text)")
        }else{
            return("http://filldunphy.com/\(Int(size[SizeDict.Width]!))/\(Int(size[SizeDict.Height]!))")
        }
    }
}
