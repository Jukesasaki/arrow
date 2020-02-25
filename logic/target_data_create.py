import sys

from util import log_util


# 引数で受け取ったＰＯＳＴリクスト内情報を数値化
# 数値化の基準はテスト仕様として開発者の便宜で定義
def form_data_logic(data):
    x = 0
    y = 0
    x += 40 - int(data['age'])
    y += (40 - int(data['age'])) * 1.75
    if data['sex'] == "1":
        x -= 10
        y -= 10
    else:
        x += 10
        y += 10
    if data['emo'] == "1":
        x += 3
        y -= 7
    else:
        x -= 3
        y += 7
    if data['od'] == "1":
        x -= 11
        y += 7
    else:
        x += 11
        y -= 7
    if data['intention'] == "1":
        x -= 7
        y -= 4
    else:
        x += 7
        y += 4
    if data['personality'] == "1":
        x += 6
        y += 1
    else:
        x -= 6
        y -= 1
    if data['act'] == "1":
        x -= 8
        y += 1
    else:
        x += 8
        y -= 1
    log_util.log_util(sys._getframe().f_code.co_name + "データ化完了（{},{}）".format(x, y))

    datalist = [x, y]
    return datalist
