import QtQuick 2.0
import Sailfish.Silica 1.0

Page
{
    Item {
        id: consts
        property int noText: 0
        property int phoneNumber: 1
    }

    ListModel
    {
        id: settingList
        ListElement
        {
            settingText: "Progi"
            secondaryText: 0
            replace: false
            source: "qrc:/assets/pages/Thresholds.qml"
            image: "qrc:/icons/icon-settings-threshold.svg"
            lightImage: "qrc:/icons/icon-settings-threshold-light.svg"
        }

        ListElement
        {
            settingText: "Przypomnienia"
            secondaryText: 0
            replace: false
            source: "qrc:/assets/pages/ReminderList.qml"
            image: "image://Theme/icon-m-alarm"
            lightImage: "image://Theme/icon-m-alarm"
        }

        ListElement
        {
            settingText: "Telefon: "
            secondaryText: 1
            replace: false
            source: "qrc:/assets/dialogs/ChangePhoneNumber.qml"
            image: "image://Theme/icon-m-answer"
            lightImage: "image://Theme/icon-m-answer"
        }

        ListElement
        {
            settingText: "Leki"
            secondaryText: 0
            replace: false
            source: "qrc:/assets/pages/DrugList.qml"
            image: "qrc:/icons/icon-annotations-drug.svg"
            lightImage: "qrc:/icons/icon-annotations-drug-light.svg"
        }
        ListElement
        {
            secondaryText: 0
            settingText: "Rozpocznij tutorial"
            source: "qrc:/assets/pages/Tutorial.qml"
            replace: true
            image: "image://Theme/icon-m-question"
            lightImage: "image://Theme/icon-m-question"
        }
    }

    id: setting
    SilicaListView
    {
        anchors.fill: parent
        model: settingList

        header: PageHeader
        {
            title: "Ustawienia"
        }

        delegate: ListItem
        {
            Image
            {
                id: icon
                anchors
                {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: Theme.horizontalPageMargin
                }
                width: Theme.iconSizeMedium
                height: Theme.iconSizeMedium
                sourceSize.width: width
                sourceSize.height: height
                smooth: true
                source: application.lightTheme ? lightImage : image
            }
            Label
            {
                id: label
                text: settingText
                anchors
                {
                    left: icon.right
                    leftMargin: Theme.paddingMedium
                    verticalCenter: parent.verticalCenter
                }
            }
            Label {
                text:
                {
                    switch (secondaryText) {
                    case consts.phoneNumber:
                        return settings.phoneNumber ? settings.phoneNumber : "Naciśnij aby ustawić";
                    default: return "";
                    }
                }
                color: Theme.highlightColor

                anchors
                {
                    left: label.right
                    leftMargin: Theme.paddingMedium
                    verticalCenter: parent.verticalCenter
                }
            }

            menu: secondaryText == consts.phoneNumber ? contextMenu : undefined

            ContextMenu {
                id: contextMenu
                MenuItem {
                    enabled: settings.phoneNumber
                    text: "Dzwoń"
                    onClicked: Qt.openUrlExternally("tel:+48" + settings.phoneNumber)
                }
            }

            onClicked: {
                if (replace)
                    pageStack.replace(Qt.resolvedUrl(source))
                else pageStack.push(Qt.resolvedUrl(source))
            }
        }
    }
}
