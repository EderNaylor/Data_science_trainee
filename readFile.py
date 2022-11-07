import pandas as pd

def reporte(name, sheetname=""):
    dataframe1 = pd.read_excel(f"{name}", sheet_name=sheetname)
    print(dataframe1)

print("""choose your report \ 1. Asignacion \ 2. crm\
      3. estatus \ 4. flokzu \
      input the suitable option in the next line: """)
text_input = int(input())

if (text_input == 1):
    reporte("MergeFiles.xlsx")
elif (text_input == 2):
    reporte("Consejeria_llams_clas.xlsx")
elif (text_input == 3):
    reporte("Estatus_General.csv")
elif (text_input == 4):
    reporte("MergeFiles.xlsx") 
else:
    print('wrong input')
