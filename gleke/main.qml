// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle
{
    width: 800
    height: 450
    gradient: Gradient
    {
    GradientStop
    {
        position: 0
        color: "#696363"
    }

    GradientStop
    {
        position: 1
        color: "#000000"
    }
}

//<----------------------------------SESSION!!!------------------------------------->
LABEL_TEXT
{
    id: text1
    x: 40
    y: 20
    text: "IP"
}
LABEL_TEXT
{
    id: text2
    x: 40
    y: 60
    text: "Логин"
}
LABEL_TEXT
{
    id: text3
    x: 40
    y: 100
    text: "Пароль"
}
LABEL_TEXT
{
    id: status_text
    x: 40
    y: 430
    text: "Статус:"
}
RECT_TEXT_INPUT
{
    x: 120
    y: 15
    TEXT_INPUT
    {
        id: text_input1
    }
}
RECT_TEXT_INPUT
{
    x: 120
    y: 55
    TEXT_INPUT
    {
        id: text_input2
    }
}
RECT_TEXT_INPUT
{
    x: 120
    y: 95
    TEXT_INPUT
    {
        id: text_input3
    }
}
BTN
{
    id: bConnect
    x: 290
    y: 15
    BTN_TEXT
    {
        id: label1
        text: "Connect"
    }
    BTN_MOUSEAREA
    {
        id: mouseArea1
        onClicked: status_text.text = "Статус: " + window.connect_to_host(text_input1.text, text_input2.text, text_input3.text);
    }
}
BTN
{
    id: bDisconnect
    x: 290
    y: 75
    BTN_TEXT
    {
        id: label2
        text: "Disconnect"
    }
    BTN_MOUSEAREA
    {
        id: mouseArea2
        onClicked: status_text.text = "Статус: " + window.close();
    }
}

//<----------------------------------DIRECTORY!!!------------------------------------->
LABEL_TEXT
{
    id: text_path
    x: 420
    y: 20
    text: "Путь"
}
RECT_TEXT_INPUT
{
    x: 470
    y: 15
    TEXT_INPUT
    {
        id: path_input
    }
}
BTN
{
    id: bCD
    x: 630
    y: 15
    BTN_TEXT
    {
        id: bCD_text
        text: "CD"
    }
    BTN_MOUSEAREA
    {
        id: bCD_mousearea
        onClicked: status_text.text = "Статус: " + window.cd(path_input.text);
    }
}
BTN
{
    id: bPWD
    x: 630
    y: 75
    BTN_TEXT
    {
        id: bPWD_text
        text: "PWD"
    }
    BTN_MOUSEAREA
    {
        id: bPWD_mousearea
        onClicked: status_text.text = "Статус: Текущая директория " + window.pwd();
    }
}

//<----------------------------------FILE WORKING------------------------------------->
LABEL_TEXT
{
    id: file_path
    x: 40
    y: 170
    text: "Путь к файлу"
}
RECT_TEXT_INPUT
{
    x: 120
    y: 165
    TEXT_INPUT
    {
        id: file_path_input
    }
}
LABEL_TEXT
{
    id: file_name
    x: 40
    y: 210
    text: "Имя файла"
}
RECT_TEXT_INPUT
{
    x: 120
    y: 205
    TEXT_INPUT
    {
        id: file_name_input
    }
}
BTN
{
    id: bPut
    x: 290
    y: 165
    BTN_TEXT
    {
        id: bPut_text
        text: "Put"
    }
    BTN_MOUSEAREA
    {
        id: bPut_mousearea
        onClicked: status_text.text = "Статус: " + window.put(file_path_input.text, file_name_input.text);
    }
}
BTN
{
    id: bGet
    x: 290
    y: 225
    BTN_TEXT
    {
        id: bGet_text
        text: "Get"
    }
    BTN_MOUSEAREA
    {
        id: bGet_mousearea
        onClicked: status_text.text = "Статус: " + window.get_file(file_name_input.text, file_path_input.text);
    }
}
BTN
{
    id: bDel
    x: 290
    y: 285
    BTN_TEXT
    {
        id: bDel_text
        text: "Delete"
    }
    BTN_MOUSEAREA
    {
        id: bDel_mousearea
        onClicked: status_text.text = "Статус: " + window.delete_file(file_name_input.text);
    }
}

//<----------------------------------DIRECTORY!!!------------------------------------->
LABEL_TEXT
{
    id: directory_name
    x: 420
    y: 170
    text: "Папка"
}
RECT_TEXT_INPUT
{
    x: 470
    y: 165
    TEXT_INPUT
    {
        id: directory_name_input
    }
}
BTN
{
    id: bCreate
    x: 630
    y: 165
    BTN_TEXT
    {
        id: bCreate_text
        text: "Create"
    }
    BTN_MOUSEAREA
    {
        id: bCreate_mousearea
        onClicked: status_text.text = "Статус: " + window.create_dir(directory_name_input.text);
    }
}
}
