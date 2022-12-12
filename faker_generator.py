from faker import Faker

#tabla supervisores
super=dict()
fake = Faker()

for i in range(10):
  super[i]=fake.name()
print(super)

#tabla alumnos
student,emailStudent=dict()
fake = Faker()

for i in range(10):
  student[i]=fake.name()
  emailStudent[i]fake.
print(student)

#tabla agente
agent=dict()
fake = Faker()

for i in range(10):
  agent[i]=fake.name()
print(agent)

#tabla para indicadores de riesgo
risk=dict()
risk = {'0': 'Sin riesgo','1':'Riesgo','2':'Alto riesgo','3':'Sin materias','4':'Baja'}
print(risk)

#tabla para los indicadores del estado de inscripcion del alumno
status=dict()
status = {'0': 'Matriculado','1':'Baja temporal','2':'Baja definitiva','3':'Baja inactivo','4':'Egresado'}
print(status)

#tabla para los tickets de flokzu para el tramite de baja
flokzu=dict()
for i in range(10):
    flokzu[i]='psaja',i
print(flokzu)

#tabla de tipificaciones (asunto)
issue=dict()
issue = {'0': 'Academico','1':'Proceso de retencion','2':'Baja temporal','3':'Baja definitiva','4':'Retencion','5':'Financiero','6':'Aclaracion de dudas'}
print(issue)

