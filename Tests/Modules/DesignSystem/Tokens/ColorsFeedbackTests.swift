import Quick
import Nimble
@testable import Compare4Me

class ColorsFeedbackTests: QuickSpec {

    override func spec() {
        describe("#Feedback") {
            describe("#alert") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#E74627")
                    expect(Colors.Feedback.alert?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#onAlert") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#ffffff")
                    expect(Colors.Feedback.onAlert?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#warning") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#FCC433")
                    expect(Colors.Feedback.warning?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#onWarning") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#333333")
                    expect(Colors.Feedback.onWarning?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#success") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#569A32")
                    expect(Colors.Feedback.success?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#onSuccess") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#ffffff")
                    expect(Colors.Feedback.onSuccess?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#link") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#227BBD")
                    expect(Colors.Feedback.link?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }

            describe("#onLink") {
                it("has expected color") {
                    let expectedColor = UIColor(hex: "#ffffff")
                    expect(Colors.Feedback.onLink?.cgColor).to(equal(expectedColor?.cgColor))
                }
            }
        }
    }
}
