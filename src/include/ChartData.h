#ifndef DATA_H
#define DATA_H

#include <QObject>
#include <QPointF>
#include <QTimer>

class ChartData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QPointF data READ GetData NOTIFY wDataChanged)

public:
    ChartData(QObject *parent=Q_NULLPTR);
    QPointF GetData() const{
        return m_data;
    }
    Q_INVOKABLE void startStreamData();
    Q_INVOKABLE void stopStreamData();
signals:
    void wDataChanged();

private slots:
    void wTimeout();
private:
    QTimer * m_wTimer;
    QPointF m_data;
};

#endif // DATA_H
