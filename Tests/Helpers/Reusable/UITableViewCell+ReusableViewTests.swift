import Quick
import Nimble
@testable import Compare4Me

class UITableViewReusableTests: QuickSpec {
    override func spec() {
        var sut: UITableView!

        beforeEach {
            sut = UITableView()
            sut.dataSource = self
        }

        describe("#dequeueReusableCell") {
            context("when the cell is registered") {
                it("returns non nil cell") {
                    sut.register(UITableViewCell.self)

                    let cell = sut.dequeueReusableCell(for: IndexPath(row: 0, section: 0))
                    expect(cell).toNot(beNil())
                }
            }
        }
    }
}

extension UITableViewReusableTests: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
}
