#include "calculate.h"
#include <QDebug>
#include <ctype.h>
#include <QRegularExpression>

calculate::calculate(QObject *parent)
    : QObject{parent}
{

}

void calculate::addToBuffer(QChar c) {
    calculate_str = calculate_str + c;
    qDebug() << "String " << calculate_str;
}

int calculate::get_result(){
    QStringList list_str;
    double result;

    QRegularExpression static re_divmul("\\*|\\/");
    while (re_divmul.match(calculate_str).hasMatch()) {
        QRegularExpression static re("\\d+(\\.\\d+)?\\*\\d+(\\.\\d+)?|\\d+(\\.\\d+)?\\/\\d+(\\.\\d+)?");
        QRegularExpressionMatch match = re.match(calculate_str);

        if (match.hasMatch()) {
            if (match.captured().contains('*')) {
                list_str = match.captured().split('*');
                result = list_str[0].toDouble() * list_str[1].toDouble();
            }
            else {
                list_str = match.captured().split('/');
                result = list_str[0].toDouble() / list_str[1].toDouble();
            }

            calculate_str = (calculate_str.sliced(0, match.capturedStart()) +
                             QString::number(result) +
                             calculate_str.sliced(match.capturedEnd()));

            qDebug() << "Parcial Result " << calculate_str;
        }
    }

    QRegularExpression static re_summinus("\\+|\\-");
    while (re_summinus.match(calculate_str).hasMatch()) {
        QRegularExpression static re("\\d+(\\.\\d+)?\\+\\d+(\\.\\d+)?|\\d+(\\.\\d+)?\\-\\d+(\\.\\d+)?");
        QRegularExpressionMatch match = re.match(calculate_str);

        if (match.hasMatch()) {
            if (match.captured().contains('+')) {
                list_str = match.captured().split('+');
                result = list_str[0].toDouble() + list_str[1].toDouble();
            }
            else {
                list_str = match.captured().split('-');
                result = list_str[0].toDouble() - list_str[1].toDouble();
            }

            calculate_str = (calculate_str.sliced(0, match.capturedStart()) +
                             QString::number(result) +
                             calculate_str.sliced(match.capturedEnd()));

            qDebug() << "Parcial Result " << calculate_str;
        }
        else {
            break;
        }
    }

    qDebug() << "Final Result " << calculate_str;

    calculate_str.clear();
    return calculate_str.toDouble();
}

void calculate::clean() {
    calculate_str = "";
    qDebug() << "String " << calculate_str;
}

