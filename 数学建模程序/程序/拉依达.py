import pandas as pd
import xlrd


def layida(str, num):
    file = pd.read_excel(r"附件三.xlsx", header=0, sheet_name=str)
    file_li = file.values.tolist()
    columns = file.shape[1]
    numlesslist = []
    nummorelist = []
    excle = xlrd.open_workbook(r"附件三2.xlsx")
    sheet = excle.sheets()[num]  # 获取第num个表
    for N in range(1, 355):
        unit = sheet.row_values(N)
        nummorelist.append(unit[2])
        numlesslist.append(unit[3])
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
        print("--------")
        index = index+1
        resultlist.append(result)
    # print(resultlist)


# layida(r"2851", 7)
layida(r"3131", 8)
print("-")
