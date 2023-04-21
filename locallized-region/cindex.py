import pandas as pd
import sys


def CountFrequency( csv_file, freq_value):
    df = pd.read_csv(csv_file)
    df.dropna(inplace = True)
    a = []
    for i in df['index']:
        a += i.split(' ')
    b = [int(i) for i in a ]
    my_list= sorted(b)
    # Creating an empty dictionary
    freq = {}
    for item in my_list:
        if (item in freq):
            freq[item] += 1
        else:
            freq[item] = 1

    final = {k: v for k, v in sorted(freq.items(),reverse=True ,key=lambda item: item[1])}
    final_index = []
    for key, value in final.items():
        if value > int(freq_value):
            final_index.append(key)


    for i in final_index:
        print(i, end= ' ')
    print()

CountFrequency(sys.argv[1],sys.argv[2])

