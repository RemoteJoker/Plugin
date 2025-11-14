#ifndef IDINPUTITEM_H
#define IDINPUTITEM_H

#include <QtQuick/QQuickPaintedItem>

class IdInputItem : public QQuickPaintedItem
{
    Q_OBJECT
    QML_ELEMENT
    Q_DISABLE_COPY(IdInputItem)
public:
    explicit IdInputItem(QQuickItem *parent = nullptr);
    void paint(QPainter *painter) override;
    ~IdInputItem() override;
};

#endif // IDINPUTITEM_H
