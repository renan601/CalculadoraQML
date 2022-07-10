#ifndef CALCULATE_H
#define CALCULATE_H

#include <QObject>

class calculate : public QObject
{
    Q_OBJECT
public:
    explicit calculate(QObject *parent = nullptr);
    QString calculate_str;

signals:

    public slots:
        void addToBuffer(QChar c);
        int get_result();
        void clean();
};

#endif // CALCULATE_H
