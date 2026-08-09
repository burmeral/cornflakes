import QtQuick

Item {
    id: root

    Image {
        id: wallpaper

        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop

        Binding on source {
            when: config.background !== undefined
            value: config.background
        }
    }
}
