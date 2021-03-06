import QtQuick 2.0
import QtQuick.Controls 2.3
import glukometr 1.0
import ".."
import "../components"


DialogPage
{
    id:iDontKnow
    canAccept: unitFood.acceptableInput

    onDone:
    {
        if (result == true)
        {
            settings.phoneNumber = unitFood.text
        }
    }

    title: qsTr("PHONE_NUMBER_TITLE")

    Flickable
    {
        ScrollBar.vertical: ScrollBar { }
        anchors
        {
            top: parent.top
            topMargin: Theme.horizontalPageMargin
            fill: parent
        }
        contentWidth: parent.width
        contentHeight: column.childrenRect.height

        Column
        {
            id:column
            width: parent.width
            spacing: Theme.paddingMedium

            Label
            {
                text: qsTr("PHONE_NUMBER_HELP")
                wrapMode: Text.WordWrap
                color: "#d9d2b9"
                anchors
                {
                    left: parent.left
                    leftMargin: Theme.horizontalPageMargin
                    right: parent.right
                    rightMargin: Theme.horizontalPageMargin

                }
            }

            TextField
            {

                x: Theme.horizontalPageMargin
                text: settings.phoneNumber
                id: unitFood
                focus: true
                width: parent.width - 2*x
                inputMethodHints: Qt.ImhDialableCharactersOnly
                placeholderText: "88**8**88"
                color: "#f7f5f0"
                validator: RegExpValidator { regExp: /^\(?[0-9]{1,3}\)? ?-?[0-9]{1,3} ?-?[0-9]{3,5} ?-?[0-9]{4}( ?-?[0-9]{3})? ?(\w{1,9}\s?\d{1,6})?$/ }
                maximumLength: 9
            }
        }
    }
}
