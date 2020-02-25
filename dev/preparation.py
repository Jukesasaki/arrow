from dev.custom_type import customer_type_create
from dev.customer_dao_export import customer_export
from dev.data_logic import data_input
from dev.user_input import user_input_pre

'''
[MODULE:preparation、及びにPACKAGE:devについて]
DB内のテーブル(CUSTOMER,DATA,USER）が用意されていない段階で使用します。
既に準備がある場合や不要な場合は実行しないでください。
'''


def start_preparation():
    # CUSTOMERテーブルへランダムなデータを生成
    # customer_export()
    #
    # CUSTOMERテーブルデータを基にDATAテーブルデータ生成
    data_input()

    # DATAテーブルデータを基に同テーブルのc_typeフィールドデータ生成
    customer_type_create()

    # USERテーブルへ管理者レベルのユーザを生成
    user_input_pre()
