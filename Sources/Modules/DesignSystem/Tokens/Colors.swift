import UIKit

public struct Colors {
    public struct Primary {
        static let primary = UIColor(named: "primary")
        static let onPrimary = UIColor(named: "onPrimary")

        static let primaryLight = UIColor(named: "primaryLight")
        static let onPrimaryLight = UIColor(named: "onPrimaryLight")

        static let primaryDark = UIColor(named: "primaryDark")
        static let onPrimaryDark = UIColor(named: "onPrimaryDark")
    }

    public struct Secondary {
    }

    public struct Content {
        static let highlight = UIColor(named: "highlight")
        static let lowEmphasis = UIColor(named: "lowEmphasis")
        static let mediumEmphasis = UIColor(named: "mediumEmphasis")
        static let highEmphasis = UIColor(named: "highEmphasis")
    }

    public struct Surface {
        static let background = UIColor(named: "background")
        static let onBackground = UIColor(named: "onBackground")

        static let surface = UIColor(named: "surface")
        static let onSurface = UIColor(named: "onSurface")
    }

    public struct Feedback {
        static let alert = UIColor(named: "alert")
        static let onAlert = UIColor(named: "onAlert")

        static let warning = UIColor(named: "warning")
        static let onWarning = UIColor(named: "onWarning")

        static let success = UIColor(named: "success")
        static let onSuccess = UIColor(named: "onSuccess")

        static let link = UIColor(named: "link")
        static let onLink = UIColor(named: "onLink")
    }

}
