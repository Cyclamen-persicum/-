import pandas as pd


def calc(str):
    file = pd.read_excel(r"附件三.xlsx", header=1, sheet_name=str)
    file_li = file.values.tolist()
    columns = file.shape[1]
    resultlist = []
    reultjudge = []
    for i in range(1, columns):
        result = []
        validvalue = 0
        invalidvalue = 0
        for s_li in file_li:
            result.append(s_li[i])
        resultlist.append(result)
        for value in result:
            if value != 0:
                validvalue = validvalue+1
            else:
                invalidvalue = invalidvalue+1
        if invalidvalue/(invalidvalue+validvalue) >= 0.4:
            reultjudge.append(0.4)
        elif invalidvalue/(invalidvalue+validvalue) != 0:
            reultjudge.append(0.01)
        else:
            reultjudge.append(0)
    # print(resultlist)
    # print(reultjudge)
    judge40 = []
    judge001 = []
    Num = 2
    for num in reultjudge:
        if num == 0.4:
            judge40.append(Num)
        elif num == 0.01:
            judge001.append(Num)
        Num = Num+1
    print("40%\t")
    print(judge40)
    print("有0\t")
    print(judge001)


print("285")
calc('285')
print("313")
calc('313')
