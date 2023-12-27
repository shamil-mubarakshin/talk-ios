//
// Copyright (c) 2023 Marcel Müller <marcel-mueller@gmx.de>
//
// Author Marcel Müller <marcel-mueller@gmx.de>
//
// GNU GPL version 3 or any later version
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

import XCTest
@testable import NextcloudTalk

final class UnitColorGeneratorTest: XCTestCase {

    func testUsernameToColor() throws {
        // See: https://github.com/nextcloud-libraries/nextcloud-vue/blob/76cc5dec7305f8e83b6380893e391d53770fb272/tests/unit/functions/usernameToColor/usernameToColor.spec.js#L10
        usernameToColorHexHelper(username: "", expectedHexColor: "#0082c9")
        usernameToColorHexHelper(username: ",", expectedHexColor: "#1e78c1")
        usernameToColorHexHelper(username: ".", expectedHexColor: "#c98879")
        usernameToColorHexHelper(username: "admin", expectedHexColor: "#d09e6d")
        usernameToColorHexHelper(username: "123e4567-e89b-12d3-a456-426614174000", expectedHexColor: "#bc5c91")
        usernameToColorHexHelper(username: "Akeel Robertson", expectedHexColor: "#9750a4")
        usernameToColorHexHelper(username: "Brayden Truong", expectedHexColor: "#d09e6d")
        usernameToColorHexHelper(username: "Daphne Roy", expectedHexColor: "#9750a4")
        usernameToColorHexHelper(username: "Ellena Wright Frederic Conway", expectedHexColor: "#c37285")
        usernameToColorHexHelper(username: "Gianluca Hills", expectedHexColor: "#d6b461")
        usernameToColorHexHelper(username: "Haseeb Stephens", expectedHexColor: "#d6b461")
        usernameToColorHexHelper(username: "Idris Mac", expectedHexColor: "#9750a4")
        usernameToColorHexHelper(username: "Kristi Fisher", expectedHexColor: "#0082c9")
        usernameToColorHexHelper(username: "Lillian Wall", expectedHexColor: "#bc5c91")
        usernameToColorHexHelper(username: "Lorelai Taylor", expectedHexColor: "#ddcb55")
        usernameToColorHexHelper(username: "Madina Knight", expectedHexColor: "#9750a4")
        usernameToColorHexHelper(username: "Meeting", expectedHexColor: "#c98879")
        usernameToColorHexHelper(username: "Private Circle", expectedHexColor: "#c37285")
        usernameToColorHexHelper(username: "Rae Hope", expectedHexColor: "#795aab")
        usernameToColorHexHelper(username: "Santiago Singleton", expectedHexColor: "#bc5c91")
        usernameToColorHexHelper(username: "Sid Combs", expectedHexColor: "#d09e6d")
        usernameToColorHexHelper(username: "TestCircle", expectedHexColor: "#499aa2")
        usernameToColorHexHelper(username: "Tom Mörtel", expectedHexColor: "#248eb5")
        usernameToColorHexHelper(username: "Vivienne Jacobs", expectedHexColor: "#1e78c1")
        usernameToColorHexHelper(username: "Zaki Cortes", expectedHexColor: "#6ea68f")
        usernameToColorHexHelper(username: "a user", expectedHexColor: "#5b64b3")
        usernameToColorHexHelper(username: "admin@cloud.example.com", expectedHexColor: "#9750a4")
        usernameToColorHexHelper(username: "another user", expectedHexColor: "#ddcb55")
        usernameToColorHexHelper(username: "asd", expectedHexColor: "#248eb5")
        usernameToColorHexHelper(username: "bar", expectedHexColor: "#0082c9")
        usernameToColorHexHelper(username: "foo", expectedHexColor: "#d09e6d")
        usernameToColorHexHelper(username: "wasd", expectedHexColor: "#b6469d")
        usernameToColorHexHelper(username: "مرحبا بالعالم", expectedHexColor: "#c98879")
        usernameToColorHexHelper(username: "🙈", expectedHexColor: "#b6469d")
    }

    private func usernameToColorHexHelper(username: String, expectedHexColor: String) {
        let userColor = ColorGenerator.shared.usernameToColor(username)
        let userHexColor = NCUtils.hexString(fromColor: userColor)

        XCTAssertEqual(userHexColor.lowercased(), expectedHexColor.lowercased())
    }
}
