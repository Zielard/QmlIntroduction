#include "../include/chartData.h"

void ChartData::wTimeout(){
    int HIGH = 14;
    int LOW = 12;
    int val = rand() % (HIGH - LOW + 1) + LOW;
    m_data.setX(m_data.x()+1);
    m_data.setY(val);
    emit wDataChanged();
}

void ChartData::startStreamData(){
    m_wTimer->start();
}

void ChartData::stopStreamData(){
    m_wTimer->stop();
}


ChartData::ChartData(QObject *parent):QObject(parent){
    m_wTimer = new QTimer(this);
    m_wTimer->setInterval((1000 / 5));
    connect(m_wTimer, &QTimer::timeout, this, &ChartData::wTimeout);
    m_wTimer->start();
}
