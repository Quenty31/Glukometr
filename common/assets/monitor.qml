import QtQuick 2.0
import QtQuick.Particles 2.0

Rectangle
{
    id: screenMonitor
    color: "#000000"

    Button
    {
        id:menu
        buttonWidth: parent.width
        buttonHeight: 0.1 * parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        text: "Menu"
        onButtonClick:
        {
            glukometr.disconnectService();
            pageLoader.source="home.qml";
        }
    }

    Rectangle
    {
        id: updatei
        width: parent.width
        height: 80
        anchors.bottom: stop.top
        color: "#000000"
        border.color: "#2dc4c4"
        border.width: 2

        Text
        {
            id: logi
            text: glukometr.wiadomosc
            anchors.centerIn: updatei
            color: "#2dc4c4"
        }
    }

    Image {
        id: background
        width: 300
        height: width
        anchors.centerIn: parent
        source: "glucometr.png"
        fillMode: Image.PreserveAspectFit


        ParticleSystem {
            id: systwo
            anchors.fill: parent

            Emitter {
                //burst on click
                id: burstytwo
                system: systwo
                enabled: true
                x: 160
                y: 150
                emitRate: glukometr.hr*100
                maximumEmitted: 4000
                acceleration: AngleDirection {angleVariation: 360; magnitude: 360;
                }
                size: 4
                endSize: 8
                sizeVariation: 4
            }

        }
    }

    Button
    {
        id:stop
        buttonWidth: parent.width
        buttonHeight: 0.1*parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: "Stop"
        onButtonClick:
        {
            burstytwo.enabled = false;
            glukometr.disconnectService();
            pageLoader.source = "results.qml";
        }
    }
}