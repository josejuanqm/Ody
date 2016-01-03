//
//  Ody.swift
//  Ody
//
//  Created by Jose Quintero on 1/3/16.
//  Copyright © 2016 Quintero. All rights reserved.
//

import Foundation
import UIKit

public extension UIView{
    /// (Best use if UIView) Look for UIImageViews inside this view and odytize them with a custom image from a URL
    func odytizeAllWithCustomImage(url: String){
        for v in self.subviews{
            if v is UIImageView{
                let vi = v as! UIImageView
                vi.odytizeWithCustomImage(url)
                //vi.setLoaderColorForOdyView(loaderColor)
            }
        }
    }
    /// (Best use if UIView) Look for UIImageViews inside this view and odytize them with a custom image from a URL
    func odytizeAllWithCustomImage(url: String, loaderColor: UIColor){
        for v in self.subviews{
            if v is UIImageView{
                let vi = v as! UIImageView
                vi.odytizeWithCustomImage(url)
                vi.setLoaderColorForOdyView(loaderColor)
            }
        }
    }
    
    /// (Best use if UIView) Look for UIImageViews inside this view and odytize them with a custom image
    func odytizeAll(grayscale: Bool = false, category: ImageCategory = .NotSet, text: String = "", loaderColor: UIColor = UIColor.darkGrayColor()){
        for v in self.subviews{
            if v is UIImageView{
                let vi = v as! UIImageView
                vi.odytize(grayscale, category: category, text: text)
                vi.setLoaderColorForOdyView(loaderColor)
            }
        }
    }
    
    /// (Best use if UIView) Look for UIImageViews inside this view and odytize them with a custom image
    func odytizeAll(loaderColor: UIColor){
        let grayscale: Bool = false, category: ImageCategory = .NotSet, text: String = ""
        for v in self.subviews{
            if v is UIImageView{
                let vi = v as! UIImageView
                vi.odytize(grayscale, category: category, text: text)
                vi.setLoaderColorForOdyView(loaderColor)
            }
        }
    }
    
    /// (Best use if UIView) Look for UIImageViews inside this view and odytize them with a custom grayscale image
    func odytizeAllToGrayscale(category: ImageCategory = .NotSet, text: String = ""){
        for v in self.subviews{
            if v is UIImageView{
                let vi = v as! UIImageView
                vi.odytize(true, category: category, text: text)
            }
        }
    }
    
    /// (Best use if UIView) Look for UIImageViews inside this view and odytize them with a custom grayscale image
    func odytizeAllToGrayscale(loaderColor: UIColor){
        let grayscale: Bool = true, category: ImageCategory = .NotSet, text: String = ""
        for v in self.subviews{
            if v is UIImageView{
                let vi = v as! UIImageView
                vi.odytize(grayscale, category: category, text: text)
                vi.setLoaderColorForOdyView(loaderColor)
            }
        }
    }
}

public extension UIImageView{
    
    /// Set the loader color that shows when the image is loading
    func setLoaderColorForOdyView(color: UIColor) -> Bool{
        for i in 0..<self.subviews.count{
            if let sView = self.subviews[i] as? OdyView{
                sView.loaderColor = color
                return true
            }
        }
        return false
    }
    
    private func toOdyView(withUrl: String){
        for i in 0..<self.subviews.count{
            if let sView = self.subviews[i] as? OdyView{
                sView.removeFromSuperview()
            }
        }
        self.clipsToBounds = false
        let cM = self
        let odyView = OdyView(frame: CGRectMake(0, 0, cM.bounds.width, cM.bounds.height))
        odyView.backgroundColor = self.backgroundColor
        odyView.opaque = false
        odyView.fetch(withUrl, parent: cM)
        self.addSubview(odyView)
    }
    
    /// Odytize UIImageView
    func odytize(grayscale: Bool = false, category: ImageCategory = .NotSet, text: String = ""){
        let ody = Ody()
        let size = [SizeDict.Width: self.bounds.width, SizeDict.Height: self.bounds.height]
        self.toOdyView(ody.getRandomImage(size, grayscale: grayscale, category: category, text: text))
    }
    
    /// Odytize UIImageView with a grayscale image
    func odytizeGrayscale(category: ImageCategory = .NotSet, text: String = ""){
        let ody = Ody()
        let size = [SizeDict.Width: self.bounds.width, SizeDict.Height: self.bounds.height]
        self.toOdyView(ody.getRandomImage(size, grayscale: true, category: category, text: text))
    }
    
    /// Odytize UIImageView with a grayscale image
    func odytizeGrayscale(loaderColor: UIColor){
        let grayscale: Bool = true, category: ImageCategory = .NotSet, text: String = ""
        let ody = Ody()
        let size = [SizeDict.Width: self.bounds.width, SizeDict.Height: self.bounds.height]
        self.toOdyView(ody.getRandomImage(size, grayscale: grayscale, category: category, text: text))
        self.setLoaderColorForOdyView(loaderColor)
    }
    
    /// Odytize UIImageView
    func odytize(loaderColor: UIColor){
        let grayscale: Bool = false, category: ImageCategory = .NotSet, text: String = ""
        let ody = Ody()
        let size = [SizeDict.Width: self.bounds.width, SizeDict.Height: self.bounds.height]
        self.toOdyView(ody.getRandomImage(size, grayscale: grayscale, category: category, text: text))
        self.setLoaderColorForOdyView(loaderColor)
    }
    
    private func odytizeWithCustomImage(url: String){
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
}

public enum SizeDict: String{
    case Width = "width"
    case Height = "height"
}

internal class OdyView: UIView, NSURLSessionDelegate{
    //public
    var loaderColor: UIColor! = UIColor.darkGrayColor()
    ///////////////////
    
    //private
    private var progress: Float! = 0
    private var runned = true
    private var url: String!
    private var parent: UIImageView!
    //////////
    
    internal func fetch(url: String, parent: UIImageView){
        self.backgroundColor = parent.backgroundColor
        self.url = url
        self.parent = parent
        runned = false
        self.setNeedsDisplay()
    }
    
    private var downloadTask: NSURLSessionDownloadTask?
    
    override internal func drawRect(rect: CGRect) {
        let bounds = self.bounds
        drawProgressLoader(frame: bounds, shapeColor: self.loaderColor, progressFraction: CGFloat(self.progress))
        if runned == false{
            createDownloadTask(url)
            runned = true
        }
    }
    
    func createDownloadTask(url: String) {
        let downloadRequest = NSMutableURLRequest(URL: NSURL(string: url)!)
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        
        downloadTask = session.downloadTaskWithRequest(downloadRequest)
        downloadTask!.resume()
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
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
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        self.removeFromSuperview()
        let img = UIImage(data: NSData(contentsOfURL: location)!)
        print(parent)
        self.parent.image = img
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        if error != nil{
            print("fail")
        }
    }
}

extension OdyView{
    
    func drawProgressLoader(frame frame: CGRect = CGRectMake(0, 0, 200, 200), shapeColor: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000), progressFraction: CGFloat = 0.793) {
        
        //// Variable Declarations
        let expression: CGFloat = progressFraction != 0 ? progressFraction * -360 : 1
        
        
        //// Subframes
        let group: CGRect = CGRectMake(frame.minX + floor((frame.width - 22) * 0.50000 + 0.5), frame.minY + floor((frame.height - 22) * 0.50000 + 0.5), 22, 22)
        
        
        //// Group
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalInRect: CGRectMake(group.minX, group.minY, 22, 22))
        shapeColor.setStroke()
        ovalPath.lineWidth = 2.5
        ovalPath.stroke()
        
        
        //// Oval 2 Drawing
        let oval2Rect = CGRectMake(group.minX + 1, group.minY + 1, 20, 20)
        let oval2Path = UIBezierPath()
        oval2Path.addArcWithCenter(CGPointMake(oval2Rect.midX, oval2Rect.midY), radius: oval2Rect.width / 2, startAngle: -1 * CGFloat(M_PI)/180, endAngle: -expression * CGFloat(M_PI)/180, clockwise: true)
        oval2Path.addLineToPoint(CGPointMake(oval2Rect.midX, oval2Rect.midY))
        oval2Path.closePath()
        
        shapeColor.setFill()
        oval2Path.fill()
    }
    
}

internal class Ody{
    
    internal init(){
        
    }
    
    internal func getRandomImage(size: Dictionary<SizeDict, CGFloat>! = [.Width: 200, .Height: 200], grayscale: Bool = false, category: ImageCategory = .NotSet, text: String = "") -> String{
        return("http://lorempixel.com/\(grayscale ? "g/" : "")\(Int(size[SizeDict.Width]!))/\(Int(size[SizeDict.Height]!))\(category.rawValue == "" ? "" : "/" + category.rawValue + "/")\(text)")
    }
}
