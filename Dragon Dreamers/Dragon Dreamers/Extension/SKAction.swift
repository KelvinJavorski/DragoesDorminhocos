//
//  SKAction.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 30/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit
func lerp(a : CGFloat, b : CGFloat, fraction : CGFloat) -> CGFloat
{
    return (b-a) * fraction + a
}

struct ColorComponents {
    var red = CGFloat(0)
    var green = CGFloat(0)
    var blue = CGFloat(0)
    var alpha = CGFloat(0)
}

extension UIColor {
    func toComponents() -> ColorComponents {
        var components = ColorComponents()
        getRed(&components.red, green: &components.green, blue: &components.blue, alpha: &components.alpha)
        return components
    }
}

extension SKAction {
    static func colorTransitionAction(fromColor : UIColor, toColor : UIColor, duration : Double = 0.4) -> SKAction
    {
        return SKAction.customAction(withDuration: duration, actionBlock: { (node : SKNode!, elapsedTime : CGFloat) -> Void in
            let fraction = CGFloat(elapsedTime / CGFloat(duration))
            let startColorComponents = fromColor.toComponents()
            let endColorComponents = toColor.toComponents()
            let transColor = UIColor(red: lerp(a: startColorComponents.red, b: endColorComponents.red, fraction: fraction),
                                     green: lerp(a: startColorComponents.green, b: endColorComponents.green, fraction: fraction),
                                     blue: lerp(a: startColorComponents.blue, b: endColorComponents.blue, fraction: fraction),
                                     alpha: lerp(a: startColorComponents.alpha, b: endColorComponents.alpha, fraction: fraction))
            (node as? SKShapeNode)?.fillColor = transColor
            (node as? SKShapeNode)?.strokeColor = transColor
        }
        )
    }
}
