#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtGui/QMainWindow>
#include <QtDeclarative/QDeclarativeContext>
#include <QtDeclarative/QDeclarativeView>

#include "wininet.h"
#include "windows.h"

class MainWindow : public QMainWindow
{
    Q_OBJECT
    
public:
    MainWindow(QWidget *parent = 0);
    ~MainWindow();
private:
    HINTERNET internet;
    HINTERNET ftp_session;
    char host[256];

public slots:
    QString connect_to_host(QString _host, QString _login, QString _password);
    QString close();
    QString cd(QString _dir);
    QString pwd();
    QString put(QString _file_path, QString _file_name);
    QString delete_file(QString _file_name);
    QString get_file(QString _file_name, QString _file_path);
    QString create_dir(QString _dir);
};

#endif // MAINWINDOW_H
