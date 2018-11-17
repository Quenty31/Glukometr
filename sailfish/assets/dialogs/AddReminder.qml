import QtQuick 2.0
import Sailfish.Silica 1.0
import QtGraphicalEffects 1.0

Dialog
{
    id: dialog
    property alias selectedHour: label.selectedHour
    property alias selectedMinute: label.selectedMinute
    property alias reminderType: combo.currentIndex
    property alias repeating: repeat.checked

    SilicaFlickable
    {
        anchors.fill: parent
        DialogHeader { id: header }

        SectionHeader
        {
            y: header.y + header.height - Theme.paddingSmall
            id: addNotesHeader
            font.pixelSize: Theme.fontSizeLarge
            text: "Dodaj powiadomienia"
        }
        ValueButton
        {
            id: label
            property int selectedHour: 13
            property int selectedMinute: 0

            function openTimeDialog()
            {
                var dialog = pageStack.push("Sailfish.Silica.TimePickerDialog",{
                                hour: selectedHour,
                                minute: selectedMinute
                             })

                dialog.accepted.connect(function()
                {
                    value = dialog.timeText
                    selectedHour = dialog.hour
                    selectedMinute = dialog.minute
                })
            }

            anchors { top: addNotesHeader.bottom; }
            label: "Godzina: "
            value: "13:00"
            width: parent.width
            onClicked: openTimeDialog()
        }

        ComboBox
        {
            anchors
            {
                left: parent.left
                right: parent.right
                top:label.bottom
                topMargin: Theme.paddingSmall
            }
            //visible: !isEdited
            id: combo
            currentIndex: -1
            label: "Rodzaj przypomnienia: "
            value: "Wybierz"
            menu: ContextMenu
            {
                MenuItem
                {
                    text: "Zmierz cukier"
                    onClicked: combo.value=text
                }

                MenuItem
                {
                    text: "Weź leki"
                    onClicked: combo.value=text
                }

                MenuItem
                {
                    text: "Zjedz coś"
                    onClicked: combo.value=text
                }
            }
        }

        TextSwitch
        {
            id: repeat
            anchors
            {
                left: parent.left
                right: parent.right
                top: combo.bottom
                topMargin: Theme.paddingSmall
            }
            checked: true
            text: "Powtórz"
            description: "Przypomnienie będzie powtarzane codziennie"
        }
    }
}