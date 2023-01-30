import numpy as np
import matplotlib.pyplot as plt

def one_step(v, step_lenght):
    return (v/VecLenght(v)*step_lenght)

def VecLenght(v):
    return np.sqrt(v[0]**2 + v[1]**2)

def rustle(noise):
    x = noise * (np.random.random()*2-1)
    y = noise * (np.random.random()*2-1)
    return [x,y]
  
steps_amount = 100

A = [0,1]
B = [1,1]
C = [1,0]
D = [0,0]

step_lenght1 = 0.01
step_lenght2 = 0.01
step_lenght3 = 0.01
step_lenght4 = 0.01

noise1 = 0.01
noise2 = 0
noise3 = 0
noise4 = 0

road_A = 0
road_B = 0
road_C = 0
road_D = 0

for i in range(steps_amount):
    v1 = np.array(B) - np.array(A)
    A = np.array(A + one_step(v1,step_lenght1) + rustle(noise1))
    v2 = np.array(C) - np.array(B)
    B = np.array(B + one_step(v2,step_lenght2) + rustle(noise2))
    v3 = np.array(D) - np.array(C)
    C = np.array(C + one_step(v3,step_lenght3) + rustle(noise3))
    v4 = np.array(A) - np.array(D)
    D = np.array(D + one_step(v4,step_lenght4) + rustle(noise4))
    plt.scatter(A[0],A[1],color = 'red')
    plt.scatter(B[0],B[1],color = 'blue')
    plt.scatter(C[0],C[1],color = 'green')
    plt.scatter(D[0],D[1],color = 'purple')
plt.show()    