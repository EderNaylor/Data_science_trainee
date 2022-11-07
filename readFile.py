
import pandas as pd

def asignacion():
    dataframe1 = pd.read_excel('MergeFiles.xlsx')
    print(dataframe1)

def crm():
    dataframe2 = pd.read_excel('Consejeria_llams_clas.xlsx')
    print(dataframe2)

def status():
    dataframe3 = pd.read_excel('Estatus_General.csv')
    print(dataframe3)

def flokzu():
    dataframe4 = pd.read_excel('MergeFiles.xlsx', sheet_name='Flokzu')
    print(dataframe4)

print('choose your report')
print('1. Asignacion')
print('2. crm')
print('3. estatus')
print('4. flokzu')

print('input the suitable option in the next line:')
textInput = int(input())

if (textInput == 1):
    asignacion()

elif (textInput == 2):
    crm()

elif (textInput == 3):
    status()

elif (textInput == 4):
    flokzu()
else:
    print('wrong input')
