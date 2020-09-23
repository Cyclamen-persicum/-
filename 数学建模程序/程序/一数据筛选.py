import pandas as pd
import xlrd
import xlwt
from xlutils.copy import copy


def change(str):
    file = pd.read_excel(r"附件三.xlsx", header=0, sheet_name=str)
    fileindex = pd.read_excel(r"附件三.xlsx", header=0, sheet_name="285")
    file_li = file.values.tolist()
    columns = file.shape[1]
    numlesslist = []
    nummorelist = []
    excle = xlrd.open_workbook(r"附件三.xlsx")
    sheet = excle.sheets()[4]  # 获取第4个表
    unit = sheet.row_values(52)
    for i in range(1, 355):
        numlesslist.append(float(unit[i]))
    unit = sheet.row_values(55)
    for i in range(1, 355):
        nummorelist.append(float(unit[i]))
    resultlist = []
    index = 0
    for i in range(1, columns):
        result = []
        for s_li in file_li:
            result.append(s_li[i])
        for value in result:
            if value < numlesslist[index]:
                print(value)
            if value > nummorelist[index]:
                print(value)
        print("-----------------------------------")
        index = index+1
        resultlist.append(result)
    # print(resultlist)


# change(r"2851")
change(r"3131")
