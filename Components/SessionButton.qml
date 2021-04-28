//
// This file is part of SDDM Sugar Candy.
// A theme for the Simple Display Desktop Manager.
//
// Copyright (C) 2018–2020 Marian Arlt
//
// SDDM Sugar Candy is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the
// Free Software Foundation, either version 3 of the License, or any later version.
//
// You are required to preserve this and any additional legal notices, either
// contained in this file or in other files that you received along with
// SDDM Sugar Candy that refer to the author(s) in accordance with
// sections §4, §5 and specifically §7b of the GNU General Public License.
//
// SDDM Sugar Candy is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with SDDM Sugar Candy. If not, see <https://www.gnu.org/licenses/>
//

import QtQuick 2.11
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12

Item {
    id: sessionButton
    height: root.font.pointSize
    width: parent.width / 2
    anchors.horizontalCenter: parent.horizontalCenter

    property var selectedSession: selectSession.currentIndex
    property string textConstantSession
    property int loginButtonWidth
    property Control exposeSession: selectSession

    ComboBox {
        id: selectSession
        width: parent.width / 2
        anchors.horizontalCenter: parent.horizontalCenter
        hoverEnabled: true
        anchors.left: parent.left
        model: sessionModel
        currentIndex: model.lastIndex
        textRole: "name"
        indicator: Canvas{}
        delegate: ItemDelegate {
            id: itemDelegate
            highlighted: selectSession.highlightedIndex == index
            width: parent.width
            contentItem: Text {
                color: (itemDelegate.highlighted)? root.palette.highlight : root.palette.text
                text: model.name 
            }
            background: Item {} 
        }
        contentItem: Text {
            text: (selectSession.popup.visible)? "" : selectSession.displayText
            color: (selectSession.pressed || selectSession.hovered)? root.palette.highlight : root.palette.text
            padding: 4
        }
        background: Rectangle {
            color: "transparent"
        }
        popup: Popup {
            width: selectSession.width
            implicitHeight: contentItem.implicitHeight

            contentItem: ListView {
                clip: true
                implicitHeight: contentHeight
                model: selectSession.popup.visible ? selectSession.delegateModel : null
                currentIndex: selectSession.highlightedIndex
                ScrollIndicator.vertical: ScrollIndicator { }
            }

            background: Rectangle {
                color: "transparent" 
            }
        }

    }


}
