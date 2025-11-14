#ifndef PWDINPUTEDIT_H
#define PWDINPUTEDIT_H

#include <QtQuick/QQuickPaintedItem>

class PwdInputEdit : public QQuickPaintedItem
{
    Q_OBJECT
    QML_ELEMENT
    Q_DISABLE_COPY(PwdInputEdit)
public:
    explicit PwdInputEdit(QQuickItem *parent = nullptr);
    void paint(QPainter *painter) override;
    ~PwdInputEdit() override;
};

#endif // PWDINPUTEDIT_H
