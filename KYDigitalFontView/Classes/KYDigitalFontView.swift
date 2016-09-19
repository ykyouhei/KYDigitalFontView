/*
The MIT License (MIT)

Copyright (c) 2015 Kyohei Yamaguchi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import UIKit

@IBDesignable
open class KYDigitalFontView: UIView {
    
    public struct DrawPositions : OptionSet {
        
        public let rawValue: UInt
        
        public init(rawValue: UInt) {
            self.rawValue = rawValue
        }
        
        public init(character: Character) {
            switch character {
            case "a", "A":              self = [._0,._1,._2,._6,._7,._8,._9,._13]
            case "b", "B":              self = [._0,._1,._4,._6,._7,._8,._11,._13,._14,._15]
            case "c", "C":              self = [._0,._1,._2,._9,._14,._15]
            case "d", "D":              self = [._0,._1,._4,._6,._11,._13,._14,._15]
            case "e", "E":              self = [._0,._1,._2,._7,._8,._9,._14,._15]
            case "f", "F":              self = [._0,._1,._2,._7,._8,._9]
            case "g", "G":              self = [._0,._1,._2,._8,._9,._13,._14,._15]
            case "h", "H":              self = [._2,._6,._7,._8,._9,._13]
            case "i", "I":              self = [._0,._1,._4,._11,._14,._15]
            case "j", "J":              self = [._6,._9,._13,._14,._15]
            case "k", "K":              self = [._2,._5,._7,._9,._12]
            case "l", "L":              self = [._2,._9,._14,._15]
            case "m", "M":              self = [._2,._3,._5,._6,._9,._13]
            case "n", "N":              self = [._2,._3,._6,._9,._12,._13]
            case "o", "O":              self = [._0,._1,._2,._6,._9,._13,._14,._15]
            case "p", "P":              self = [._0,._1,._2,._6,._7,._8,._9]
            case "q", "Q":              self = [._0,._1,._2,._6,._9,._12,._13,._14,._15]
            case "r", "R":              self = [._0,._1,._2,._6,._7,._8,._9,._12]
            case "s", "S", "5":         self = [._0,._1,._2,._7,._8,._13,._14,._15]
            case "t", "T":              self = [._0,._1,._4,._11]
            case "u", "U":              self = [._2,._6,._9,._13,._14,._15]
            case "v", "V":              self = [._2,._5,._9,._10]
            case "w", "W":              self = [._2,._6,._9,._11,._13,._14,._15]
            case "x", "X":              self = [._3,._5,._10,._12]
            case "y", "Y":              self = [._3,._5,._11]
            case "z", "Z":              self = [._0,._1,._5,._10,._14,._15]
            case "0":                   self = [._0,._1,._2,._3,._6,._9,._12,._13,._14,._15]
            case "1", "!":              self = [._4,._11]
            case "2":                   self = [._0,._1,._6,._7,._8,._9,._14,._15]
            case "3":                   self = [._0,._1,._6,._7,._8,._13,._14,._15]
            case "4":                   self = [._2,._6,._7,._8,._13]
            case "6":                   self = [._0,._1,._2,._7,._8,._9,._13,._14,._15]
            case "7":                   self = [._0,._1,._6,._13]
            case "8":                   self = [._0,._1,._2,._6,._7,._8,._9,._13,._14,._15]
            case "9":                   self = [._0,._1,._2,._6,._7,._8,._13,._14,._15]
            case "$", "＄":             self = [._0,._1,._2,._4,._7,._8,._11,._13,._14,._15]
            case "+", "＋":             self = [._4,._7,._8,._11]
            case "-", "ー":             self = [._7,._8]
            case "*", "＊":             self = [._3,._4,._5,._7,._8,._10,._11,._12]
            case "/", "／":             self = [._5,._10]
            case "=", "＝":             self = [._7,._8,._14,._15]
            case "%", "％":             self = [._0,._2,._4,._5,._7,._8,._10,._11,._13,._15]
            case "\"", "”":             self = [._4,._6]
            case "\'", "’":             self = [._4]
            case "#", "＃":             self = [._2,._4,._7,._8,._9,._11,._14,._15]
            case "@", "＠":             self = [._0,._1,._2,._6,._8,._9,._11,._13,._15]
            case "&", "＆":             self = [._0,._3,._4,._7,._9,._12,._13,._14,._15]
            case "_", "＿":             self = [._14,._15]
            case "[", "(", "［", "（":  self = [._1,._4,._11,._15]
            case "]", ")", "］", "）":  self = [._0,._4,._11,._14]
            case "?", "？":             self = [._0,._1,._6,._8,._11]
            case "\\", "＼":            self = [._3,._12]
            case "{", "｛":             self = [._1,._4,._7,._11,._15]
            case "}", "｝":             self = [._0,._4,._8,._11,._14]
            case "<", "＜":             self = [._5,._12]
            case ">", "＞":             self = [._3,._10]
            case "`", "｀":             self = [._3]
            case "^", "＾":             self = [._10,._12]
            case "~", "〜":             self = [._9,._7,._11,._15]
            default:					self = .All
            }
        }
        
        public static var None: DrawPositions { return self.init(rawValue: 0b0000000000000000) }
        public static var _0  : DrawPositions { return self.init(rawValue: 0b0000000000000001) }
        public static var _1  : DrawPositions { return self.init(rawValue: 0b0000000000000010) }
        public static var _2  : DrawPositions { return self.init(rawValue: 0b0000000000000100) }
        public static var _3  : DrawPositions { return self.init(rawValue: 0b0000000000001000) }
        public static var _4  : DrawPositions { return self.init(rawValue: 0b0000000000010000) }
        public static var _5  : DrawPositions { return self.init(rawValue: 0b0000000000100000) }
        public static var _6  : DrawPositions { return self.init(rawValue: 0b0000000001000000) }
        public static var _7  : DrawPositions { return self.init(rawValue: 0b0000000010000000) }
        public static var _8  : DrawPositions { return self.init(rawValue: 0b0000000100000000) }
        public static var _9  : DrawPositions { return self.init(rawValue: 0b0000001000000000) }
        public static var _10 : DrawPositions { return self.init(rawValue: 0b0000010000000000) }
        public static var _11 : DrawPositions { return self.init(rawValue: 0b0000100000000000) }
        public static var _12 : DrawPositions { return self.init(rawValue: 0b0001000000000000) }
        public static var _13 : DrawPositions { return self.init(rawValue: 0b0010000000000000) }
        public static var _14 : DrawPositions { return self.init(rawValue: 0b0100000000000000) }
        public static var _15 : DrawPositions { return self.init(rawValue: 0b1000000000000000) }
        public static var All : DrawPositions { return self.init(rawValue: 0b1111111111111111) }
        
    }
    
    @IBInspectable public var lineWidth: CGFloat = 20.0 {
        didSet {
            for (idx, layer) in _layers.enumerated() {
                let newPath = _paths[idx]
                layer.path = newPath.cgPath
            }
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            for layer in _layers {
                layer.lineWidth = borderWidth
            }
        }
    }
    
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            for layer in _layers {
                layer.strokeColor = borderColor.cgColor
            }
        }
    }
    
    @IBInspectable public var fillColor: UIColor   = UIColor.black {
        didSet {
            for layer in _layers {
                layer.fillColor = fillColor.cgColor
            }
        }
    }
    
    @IBInspectable var character: String = " " {
        didSet {
            drawPositions = DrawPositions(character: character.characters.first!)
        }
    }
    
    public var drawPositions: DrawPositions = DrawPositions(character:"a") {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy private var _layer0 : CAShapeLayer = self.p_layerWithPath(self._path0)
    lazy private var _layer1 : CAShapeLayer = self.p_layerWithPath(self._path1)
    lazy private var _layer2 : CAShapeLayer = self.p_layerWithPath(self._path2)
    lazy private var _layer3 : CAShapeLayer = self.p_layerWithPath(self._path3)
    lazy private var _layer4 : CAShapeLayer = self.p_layerWithPath(self._path4)
    lazy private var _layer5 : CAShapeLayer = self.p_layerWithPath(self._path5)
    lazy private var _layer6 : CAShapeLayer = self.p_layerWithPath(self._path6)
    lazy private var _layer7 : CAShapeLayer = self.p_layerWithPath(self._path7)
    lazy private var _layer8 : CAShapeLayer = self.p_layerWithPath(self._path8)
    lazy private var _layer9 : CAShapeLayer = self.p_layerWithPath(self._path9)
    lazy private var _layer10: CAShapeLayer = self.p_layerWithPath(self._path10)
    lazy private var _layer11: CAShapeLayer = self.p_layerWithPath(self._path11)
    lazy private var _layer12: CAShapeLayer = self.p_layerWithPath(self._path12)
    lazy private var _layer13: CAShapeLayer = self.p_layerWithPath(self._path13)
    lazy private var _layer14: CAShapeLayer = self.p_layerWithPath(self._path14)
    lazy private var _layer15: CAShapeLayer = self.p_layerWithPath(self._path15)
    
    private var _path0: UIBezierPath {
        let minX = self.lineWidth*0.875
        let maxX = self.bounds.width/2 - self.lineWidth*0.125
        let minY = self.lineWidth*0.25
        let midY = self.lineWidth*0.75
        let maxY = self.lineWidth*1.25
        return p_horizontalPathWitnMinX(minX, maxX: maxX, minY: minY, midY: midY, maxY: maxY)
    }
    
    private var _path1: UIBezierPath {
        let minX = self.bounds.width/2 + self.lineWidth*0.125
        let maxX = self.bounds.width - self.lineWidth*0.875
        let minY = self.lineWidth*0.25
        let midY = self.lineWidth*0.75
        let maxY = self.lineWidth*1.25
        return p_horizontalPathWitnMinX(minX, maxX: maxX, minY: minY, midY: midY, maxY: maxY)
    }
    
    private var _path2: UIBezierPath {
        let minX = self.lineWidth*0.25
        let midX = self.lineWidth*0.75
        let maxX = self.lineWidth*1.25
        let minY = self.lineWidth
        let maxY = self.bounds.height/2 - self.lineWidth*0.25
        return self.p_verticalPathWitnMinX(minX, midX: midX, maxX: maxX, minY: minY, maxY: maxY)
    }
    
    private var _path3: UIBezierPath {
        let minX = self.lineWidth*1.5
        let maxX = self.bounds.width/2 - self.lineWidth*0.75
        let minY = self.lineWidth*1.5
        let maxY = self.bounds.height/2 - self.lineWidth*0.75
        return self.p_backSlashPathWitnMinX(minX, maxX: maxX, minY: minY, maxY: maxY)
    }
    
    private var _path4: UIBezierPath {
        let minX = self.bounds.width/2 - self.lineWidth*0.5
        let midX = self.bounds.width/2
        let maxX = self.bounds.width/2 + self.lineWidth*0.5
        let minY = self.lineWidth
        let maxY = self.bounds.height/2 - self.lineWidth*0.25
        return self.p_verticalPathWitnMinX(minX, midX: midX, maxX: maxX, minY: minY, maxY: maxY)
    }
    
    private var _path5: UIBezierPath {
        let minX = self.bounds.width/2 + self.lineWidth*0.75
        let maxX = self.bounds.width - self.lineWidth*1.5
        let minY = self.lineWidth*1.5
        let maxY = self.bounds.height/2 - self.lineWidth*0.75
        return self.p_slashPathWitnMinX(minX, maxX: maxX, minY: minY, maxY: maxY)
    }
    
    private var _path6: UIBezierPath {
        let minX = self.bounds.width - self.lineWidth*1.25
        let midX = self.bounds.width - self.lineWidth*0.75
        let maxX = self.bounds.width - self.lineWidth*0.25
        let minY = self.lineWidth
        let maxY = self.bounds.height/2 - self.lineWidth*0.25
        return self.p_verticalPathWitnMinX(minX, midX: midX, maxX: maxX, minY: minY, maxY: maxY)
    }
    
    private var _path7: UIBezierPath {
        let minX = self.lineWidth*0.875
        let maxX = self.bounds.width/2 - self.lineWidth*0.125
        let minY = self.bounds.height/2 - self.lineWidth*0.5
        let midY = self.bounds.height/2
        let maxY = self.bounds.height/2 + self.lineWidth*0.5
        return self.p_horizontalPathWitnMinX(minX, maxX: maxX, minY: minY, midY: midY, maxY: maxY)
    }
    
    private var _path8: UIBezierPath {
        let minX = self.bounds.width/2 + self.lineWidth*0.125
        let maxX = self.bounds.width - self.lineWidth*0.875
        let minY = self.bounds.height/2 - self.lineWidth*0.5
        let midY = self.bounds.height/2
        let maxY = self.bounds.height/2 + self.lineWidth*0.5
        return self.p_horizontalPathWitnMinX(minX, maxX: maxX, minY: minY, midY: midY, maxY: maxY)
    }
    
    private var _path9: UIBezierPath {
        let minX = self.lineWidth*0.25
        let midX = self.lineWidth*0.75
        let maxX = self.lineWidth*1.25
        let minY = self.bounds.height/2 + self.lineWidth*0.25
        let maxY = self.bounds.height - self.lineWidth
        return self.p_verticalPathWitnMinX(minX, midX: midX, maxX: maxX, minY: minY, maxY: maxY)
    }
    
    private var _path10: UIBezierPath {
        let minX = self.lineWidth*1.5
        let maxX = self.bounds.width/2 - self.lineWidth*0.75
        let minY = self.bounds.height/2 + self.lineWidth*0.75
        let maxY = self.bounds.height - self.lineWidth*1.5
        return self.p_slashPathWitnMinX(minX, maxX: maxX, minY: minY, maxY: maxY)
    }
    
    private var _path11: UIBezierPath {
        let minX = self.bounds.width/2 - self.lineWidth*0.5
        let midX = self.bounds.width/2
        let maxX = self.bounds.width/2 + self.lineWidth*0.5
        let minY = self.bounds.height/2 + self.lineWidth*0.25
        let maxY = self.bounds.height - self.lineWidth
        return self.p_verticalPathWitnMinX(minX, midX: midX, maxX: maxX, minY: minY, maxY: maxY)
    }
    
    private var _path12: UIBezierPath {
        let minX = self.bounds.width/2 + self.lineWidth*0.75
        let maxX = self.bounds.width - self.lineWidth*1.5
        let minY = self.bounds.height/2 + self.lineWidth*0.75
        let maxY = self.bounds.height - self.lineWidth*1.5
        return self.p_backSlashPathWitnMinX(minX, maxX: maxX, minY: minY, maxY: maxY)
    }
    
    private var _path13: UIBezierPath {
        let minX = self.bounds.width - self.lineWidth*1.25
        let midX = self.bounds.width - self.lineWidth*0.75
        let maxX = self.bounds.width - self.lineWidth*0.25
        let minY = self.bounds.height/2 + self.lineWidth*0.25
        let maxY = self.bounds.height - self.lineWidth
        return self.p_verticalPathWitnMinX(minX, midX: midX, maxX: maxX, minY: minY, maxY: maxY)
    }
    
    private var _path14: UIBezierPath {
        let minX = self.lineWidth*0.875
        let maxX = self.bounds.width/2 - self.lineWidth*0.125
        let minY = self.bounds.height - self.lineWidth*1.25
        let midY = self.bounds.height - self.lineWidth*0.75
        let maxY = self.bounds.height - self.lineWidth*0.25
        return self.p_horizontalPathWitnMinX(minX, maxX: maxX, minY: minY, midY: midY, maxY: maxY)
    }
    
    private var _path15: UIBezierPath {
        let minX = self.bounds.width/2 + self.lineWidth*0.125
        let maxX = self.bounds.width - self.lineWidth*0.875
        let minY = self.bounds.height - self.lineWidth*1.25
        let midY = self.bounds.height - self.lineWidth*0.75
        let maxY = self.bounds.height - self.lineWidth*0.25
        return self.p_horizontalPathWitnMinX(minX, maxX: maxX, minY: minY, midY: midY, maxY: maxY)
    }
    
    private var _visibleLayers: [CAShapeLayer] {
        var layers = [CAShapeLayer]()
        if drawPositions.contains([._0]) {
            layers.append(_layer0)
        }
        if drawPositions.contains([._1]) {
            layers.append(_layer1)
        }
        if drawPositions.contains([._2]) {
            layers.append(_layer2)
        }
        if drawPositions.contains([._3]) {
            layers.append(_layer3)
        }
        if drawPositions.contains([._4]) {
            layers.append(_layer4)
        }
        if drawPositions.contains([._5]) {
            layers.append(_layer5)
        }
        if drawPositions.contains([._6]) {
            layers.append(_layer6)
        }
        if drawPositions.contains([._7]) {
            layers.append(_layer7)
        }
        if drawPositions.contains([._8]) {
            layers.append(_layer8)
        }
        if drawPositions.contains([._9]) {
            layers.append(_layer9)
        }
        if drawPositions.contains([._10]) {
            layers.append(_layer10)
        }
        if drawPositions.contains([._11]) {
            layers.append(_layer11)
        }
        if drawPositions.contains([._12]) {
            layers.append(_layer12)
        }
        if drawPositions.contains([._13]) {
            layers.append(_layer13)
        }
        if drawPositions.contains([._14]) {
            layers.append(_layer14)
        }
        if drawPositions.contains([._15]) {
            layers.append(_layer15)
        }
        return layers
    }
    
    private var _layers: [CAShapeLayer] {
        return [
            _layer0,
            _layer1,
            _layer2,
            _layer3,
            _layer4,
            _layer5,
            _layer6,
            _layer7,
            _layer8,
            _layer9,
            _layer10,
            _layer11,
            _layer12,
            _layer13,
            _layer14,
            _layer15
        ]
    }
    
    private var _paths: [UIBezierPath] {
        return [
            _path0,
            _path1,
            _path2,
            _path3,
            _path4,
            _path5,
            _path6,
            _path7,
            _path8,
            _path9,
            _path10,
            _path11,
            _path12,
            _path13,
            _path14,
            _path15
        ]
        
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        for (idx, subLayer) in _layers.enumerated() {
            subLayer.isHidden = true
            if subLayer.superlayer == nil {
                layer.addSublayer(subLayer)
            } else {
                let newPath = _paths[idx]
                subLayer.path = newPath.cgPath
            }
        }
        for visibleLayer in _visibleLayers {
            visibleLayer.isHidden = false
        }
    }
    
    /**************************************************************************/
    // MARK: - Method
    /**************************************************************************/
    
    private func p_horizontalPathWitnMinX(_ minX: CGFloat, maxX: CGFloat, minY: CGFloat, midY: CGFloat, maxY: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: minX, y: midY))
        path.addLine(to: CGPoint(x: minX + self.lineWidth*0.5, y: minY))
        path.addLine(to: CGPoint(x: maxX - self.lineWidth*0.5, y: minY))
        path.addLine(to: CGPoint(x: maxX, y: midY))
        path.addLine(to: CGPoint(x: maxX - self.lineWidth*0.5, y: maxY))
        path.addLine(to: CGPoint(x: minX + self.lineWidth*0.5, y: maxY))
        path.addLine(to: CGPoint(x: minX, y: midY))
        path.close()
        return path
    }
    
    private func p_verticalPathWitnMinX(_ minX: CGFloat, midX: CGFloat, maxX: CGFloat, minY: CGFloat, maxY: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: midX, y: minY))
        path.addLine(to: CGPoint(x: maxX, y: minY + self.lineWidth*0.5))
        path.addLine(to: CGPoint(x: maxX, y: maxY - self.lineWidth*0.5))
        path.addLine(to: CGPoint(x: midX, y: maxY))
        path.addLine(to: CGPoint(x: minX, y: maxY - self.lineWidth*0.5))
        path.addLine(to: CGPoint(x: minX, y: minY + self.lineWidth*0.5))
        path.addLine(to: CGPoint(x: midX, y: minY))
        path.close()
        return path
    }
    
    private func p_backSlashPathWitnMinX(_ minX: CGFloat, maxX: CGFloat, minY: CGFloat, maxY: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: minX, y: minY))
        path.addLine(to: CGPoint(x: minX + self.lineWidth*0.75, y: minY))
        path.addLine(to: CGPoint(x: maxX, y: maxY - self.lineWidth*0.75))
        path.addLine(to: CGPoint(x: maxX, y: maxY))
        path.addLine(to: CGPoint(x: maxX - self.lineWidth*0.75, y: maxY))
        path.addLine(to: CGPoint(x: minX, y: minY + self.lineWidth*0.75))
        path.addLine(to: CGPoint(x: minX, y: minY))
        path.close()
        return path
    }

    private func p_slashPathWitnMinX(_ minX: CGFloat, maxX: CGFloat, minY: CGFloat, maxY: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: minX, y: maxY))
        path.addLine(to: CGPoint(x: minX, y: maxY - self.lineWidth*0.75))
        path.addLine(to: CGPoint(x: maxX - self.lineWidth*0.75, y: minY))
        path.addLine(to: CGPoint(x: maxX, y: minY))
        path.addLine(to: CGPoint(x: maxX, y: minY + self.lineWidth*0.75))
        path.addLine(to: CGPoint(x: minX + self.lineWidth*0.75, y: maxY))
        path.addLine(to: CGPoint(x: minX, y: maxY))
        path.close()
        return path
    }
    
    private func p_layerWithPath(_ path: UIBezierPath) -> CAShapeLayer {
        let layer         = CAShapeLayer()
        layer.path        = path.cgPath
        layer.strokeColor = borderColor.cgColor
        layer.lineWidth   = borderWidth
        layer.fillColor   = fillColor.cgColor
        layer.frame       = self.bounds
        return layer
    }
}
