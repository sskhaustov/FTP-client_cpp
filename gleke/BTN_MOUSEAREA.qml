// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

MouseArea
{
    anchors.fill: parent
    hoverEnabled: true
    onEntered: parent.border.color = "green"
    onExited: parent.border.color = "#090606"
}
