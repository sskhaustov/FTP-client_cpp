#include "mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
{
    QDeclarativeView* dv = new QDeclarativeView();
    dv->setSource(QUrl("qrc:/main.qml"));
    QDeclarativeContext* cntx = dv->rootContext();
    cntx->setContextProperty("window",this);
    dv->setResizeMode(QDeclarativeView::SizeRootObjectToView);
    setCentralWidget(dv);
}

MainWindow::~MainWindow()
{
}

QString MainWindow::connect_to_host(QString _host, QString _login, QString _password)
{
    internet = InternetOpenA("gleke", INTERNET_OPEN_TYPE_DIRECT, NULL, NULL, 0);
    ftp_session = InternetConnectA(internet, _host.toAscii().data(), INTERNET_DEFAULT_FTP_PORT, _login.toAscii().data(), _password.toAscii().data(), INTERNET_SERVICE_FTP, 0, 0);
    if (ftp_session != NULL)
        return "Connection successful!";
    return "Connection failed!";
}

QString MainWindow::close()
{
    InternetCloseHandle(ftp_session);
    InternetCloseHandle(internet);
    return "Session closed!";
}

QString MainWindow::cd(QString _dir)
{
    if (!FtpSetCurrentDirectoryA(ftp_session, _dir.toAscii().data()))
        return "Cannot change directiory!";
    return "Directory changed!";
}

QString MainWindow::pwd()
{
    char *_path;
    DWORD l = 0;
    FtpGetCurrentDirectoryA(ftp_session, _path, &l);
    _path = new char[l];
    if (!FtpGetCurrentDirectoryA(ftp_session, _path, &l))
        return "Cannot define current directory!";
    return _path;
}

QString MainWindow::put(QString _file_path, QString _file_name)
{
    if (!FtpPutFileA(ftp_session, _file_path.toAscii().data(), _file_name.toAscii().data(), FTP_TRANSFER_TYPE_BINARY, 0))
        return "Cannot load file!";
    return "1 file loaded!";
}

QString MainWindow::delete_file(QString _file_name)
{
    if (!FtpDeleteFileA(ftp_session, _file_name.toAscii().data()))
        return "Cannot delete file!";
    return "1 file deleted!";
}

QString MainWindow::get_file(QString _file_name, QString _file_path)
{
    if (!FtpGetFileA(ftp_session, _file_name.toAscii().data(), _file_path.toAscii().data(), true, FILE_ATTRIBUTE_NORMAL, FTP_TRANSFER_TYPE_UNKNOWN, 0))
        return "Cannot download file!";
    return "1 file downloaded!";
}

QString MainWindow::create_dir(QString _dir)
{
    if (!FtpCreateDirectoryA(ftp_session, _dir.toAscii().data()))
        return "Cannot create directory!";
    return "Directory has been created!";
}
