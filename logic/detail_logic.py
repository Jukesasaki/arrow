import os
import sys
from sklearn.neighbors import KNeighborsClassifier
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from arrowApp.models import Data
from util import type_keyword as tk
from util import log_util


# -------------------------------------------------------------------
# クラス（c_type）内で最も近しい座標を取得し、座標のデータの持つキーワード（word）を取得
# （今回は距離の比較なので、三角関数などは用いずにx,yそれぞれの距離の和で比較）
def word_logic(data, pred):
    log_util.log_util(sys._getframe().f_code.co_name)
    xy = Data.objects.all().values('id', 'x', 'y')
    xy = pd.DataFrame(xy, columns=['id', 'x', 'y'])
    xy_data = Data.objects.all().filter(c_type=pred).values('id', 'x', 'y', 'c_type')
    df = pd.DataFrame(xy_data, columns=['id', 'x', 'y', 'c_type'])
    idx = 0
    val = 30
    for i in df['id'].values.astype(int):
        if abs(data[0] - xy['x'].values[i - 1]) + abs(data[1] - xy['y'].values[i - 1]) < val:
            val = abs(data[0] - xy['x'].values[i - 1]) + abs(data[1] - xy['y'].values[i - 1])
            idx = i
    word = Data.objects.all().values('word').get(id=idx)
    return word


# --------------------------------------------------------------------
# 判別対象の顧客データとＤＢのカスタマーデータをｋ（＝５）最近傍法を用いてクラス（c_type）を検出
# ＤＢデータを教師データの要領を利用し、判断材料としてｋ最近傍法アルゴリズムへ挿入
# 判別顧客データをテストデータの要領を用いてクラス判別（c_type）
# 同クラス（c_type）で最も近しい座標を取得し、座標のデータの持つキーワード（word）を取得
# （今回は距離の比較なので、三角関数などは用いずにx,yそれぞれの距離の和で比較）
def knn_logic(data):
    log_util.log_util(sys._getframe().f_code.co_name)
    xy_data = Data.objects.all().values('x', 'y')
    xy_data_pat = Data.objects.all().values('c_type')
    df = pd.DataFrame(xy_data, columns=['x', 'y'])
    df_pat = pd.DataFrame(data=xy_data_pat, columns=['c_type'])
    knn = KNeighborsClassifier(n_neighbors=5)
    knn.fit(df, df_pat)
    prediction = knn.predict(np.array([data]))
    prediction = prediction[0]

    word = word_logic(data, prediction)
    word = '効果のあるキーワードは『{}』でしょう'.format(word['word'])

    predict_str = type_judge(prediction)

    customer_plt(data)

    return [predict_str, word]


# -------------------------------------------------------------------
# 判別された顧客情報のカスタマータイプ（c_type）によってタイプの内容を文字列で返す
def type_judge(string):
    log_util.log_util(sys._getframe().f_code.co_name)
    if string == 'e':
        return tk.E
    elif string == 'am':
        return tk.AM
    elif string == 'd':
        return tk.D
    elif string == 'a':
        return tk.A
    else:
        return tk.EX


# ------------------------------------------------------------------
# 散布図として画像ファイルに変換し保存
def customer_plt(data):
    log_util.log_util(sys._getframe().f_code.co_name)
    xy_data = Data.objects.all().values('x', 'y')
    xy = pd.DataFrame(data=xy_data, columns=['x', 'y'])
    df = [data['c_type'] for data in Data.objects.values('c_type')]
    for i, d in enumerate(df):
        if d == 'e':
            plt.scatter(xy['x'].values[i], xy['y'].values[i], c='red')
        elif d == 'am':
            plt.scatter(xy['x'].values[i], xy['y'].values[i], c='blue')
        elif d == 'd':
            plt.scatter(xy['x'].values[i], xy['y'].values[i], c='green')
        elif d == 'a':
            plt.scatter(xy['x'].values[i], xy['y'].values[i], c='yellow')
        else:
            pass
    plt.scatter(data[0], data[1], s=100, marker='*', c='m')

    plt.savefig("static/img.png")
    plt.close()
