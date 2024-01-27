import numpy as np
import matplotlib.pyplot as plt
import sys



K_value = np.array([1.05, 1.10, 1.15, 1.20, 1.25, 1.30, 1.35, 1.40, 1.45, 1.50, 1.55, 1.60, 1.65, 1.70, 1.75, 1.80, 1.85, 1.90, 1.95, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 30, 40, 50])
Cov_noCode = np.array([14.87, 15.11, 15.65, 16.44, 17.02, 17.46, 16.66, 17.00, 17.30, 17.42, 17.46, 17.60, 17.73, 17.79, 17.80, 17.85, 17.92, 18.16, 18.24, 18.26, 18.69, 18.86, 18.98, 19.10, 19.50, 19.54, 19.61, 19.74, 20.26, 20.69, 20.78, 20.78])
Cov_long_div = np.array([27.05, 29.27, 30.12, 31.39, 34.40, 36.21, 33.68, 34.74, 36.06, 38.60, 40.20, 40.61, 41.08, 41.39, 41.88, 42.47, 43.78, 44.24, 43.14, 44.44, 46.25, 47.05, 47.67, 48.34, 49.19, 49.78, 50.13, 51.61, 55.14, 55.50, 55.90, 56.11])
Cov_long_div_mult = np.array([29.92, 37.22, 38.34, 38.68, 40.68, 41.67, 40.30, 40.86, 41.58, 42.97, 43.83, 44.04, 44.30, 44.47, 44.73, 45.04, 45.75, 46.02, 45.46, 46.15, 46.94, 47.26, 47.74, 48.20, 48.76, 49.08, 49.16, 49.46, 51.81, 52.17, 52.37, 52.88])
Cov_long_mult = np.array([41.45, 47.77, 46.54, 47.94, 47.96, 47.97, 47.99, 48.03, 48.03, 48.03, 48.03, 48.03, 48.03, 48.03, 48.03, 48.03, 48.03, 48.03, 48.03, 48.03, 48.03, 48.03, 48.03, 48.03, 48.03, 48.03, 48.03, 48.03, 49.00, 49.00, 49.00, 49.00])
Cov_short_div = np.array([27.56, 29.69, 30.55, 32.06, 34.85, 36.67, 33.61, 34.52, 35.64, 37.99, 39.88, 40.32, 40.38, 40.73, 41.29, 41.90, 43.15, 43.74, 42.65, 43.95, 46.47, 47.80, 48.84, 49.76, 50.86, 51.66, 51.94, 52.97, 56.70, 57.18, 57.51, 57.94])
Cov_short_div_mult = np.array([23.49, 28.70, 30.00, 30.76, 32.47, 33.44, 31.83, 32.30, 32.89, 34.15, 35.17, 35.41, 35.44, 35.63, 35.93, 36.25, 36.92, 37.22, 36.53, 37.19, 38.19, 38.78, 39.49, 40.09, 40.78, 41.23, 41.35, 41.82, 43.71, 44.16, 44.37, 44.95])
Cov_short_mult = np.array([24.36, 29.00, 27.96, 29.52, 29.59, 29.59, 29.61, 29.65, 29.65, 29.65, 29.65, 29.65, 29.65, 29.65, 29.65, 29.65, 29.65, 29.65, 29.65, 29.65, 29.65, 29.65, 29.65, 29.65, 29.65, 29.65, 29.65, 29.65, 30.89, 30.89, 30.89, 30.89])
Cov_short_div_noAlu = np.array([22.02, 25.52, 28.80, 28.80, 33.64, 36.99, 32.62, 33.91, 35.55, 41.73, 47.37, 48.36, 48.33, 49.20, 50.82, 52.44, 56.04, 56.15, 52.38, 56.28, 57.15, 60.38, 62.17, 64.53, 67.00, 68.59, 69.07, 71.12, 74.41, 75.57, 76.14, 76.81])
Cov_short_div_mult_noAlu = np.array([19.30, 27.10, 29.07, 29.07, 30.70, 31.63, 30.43, 30.78, 31.23, 32.94, 34.52, 34.79, 34.78, 35.02, 35.47, 35.91, 36.91, 36.92, 35.90, 36.97, 37.18, 38.09, 38.59, 39.23, 39.92, 40.35, 40.49, 41.05, 41.79, 42.24, 42.43, 43.26])



#plot the graph using a log scale for k of no code, long div, long div mult, long mult, all with respect to K, all in the same graph 
plt.figure()

#plt.plot(K_value, Cov_noCode, 'r', label='No Code')
plt.plot(K_value, Cov_long_div, 'b', label='Div')
plt.plot(K_value, Cov_long_div_mult, 'g', label='Div and Mult')
plt.plot(K_value, Cov_long_mult, 'y', label='Mult')

plt.xlabel('K')
plt.ylabel('Coverage')
plt.title('Coverage vs K for Long Test Vector')
plt.legend()
plt.xscale('log')
# plt.show()

#save the graph
plt.savefig('figures/long.png')

#plot another graph in the same way, showing just no code and long div
plt.figure()

plt.plot(K_value, Cov_noCode, 'r', label='No Code')
plt.plot(K_value, Cov_long_div, 'b', label='Div')

plt.xlabel('K')
plt.ylabel('Coverage')
plt.title('Coverage vs K for Long Test Vector or No Code')
plt.legend()
plt.xscale('log')

#save the graph
plt.savefig('figures/no_code.png')

#plot another graph in the same way, showing short div, short siv mult and short mult
plt.figure()

plt.plot(K_value, Cov_short_div, 'b', label='Div')
plt.plot(K_value, Cov_short_div_mult, 'g', label='Div and Mult')
plt.plot(K_value, Cov_short_mult, 'y', label='Mult')

plt.xlabel('K')
plt.ylabel('Coverage')
plt.title('Coverage vs K for Short Test Vector')
plt.legend()
plt.xscale('log')

#save the graph
plt.savefig('figures/short.png')

#plot another graph in the same way, showing short div, and short div no alu

plt.figure()

plt.plot(K_value, Cov_short_div, 'b', label='Div')
plt.plot(K_value, Cov_short_div_noAlu, 'g', label='Div No Alu')

plt.xlabel('K')
plt.ylabel('Coverage')
plt.title('Comparison of Division with and without Alu')
plt.legend()
plt.xscale('log')

#save the graph
plt.savefig('figures/div_noAlu.png')

#plot another graph in the same way, showing short div mult, and short div mult no alu

plt.figure()

plt.plot(K_value, Cov_short_div_mult, 'b', label='Div and Mult')
plt.plot(K_value, Cov_short_div_mult_noAlu, 'g', label='Div and Mult No Alu')

plt.xlabel('K')
plt.ylabel('Coverage')
plt.title('Comparison of Division and Multiplication with and without Alu')
plt.legend()
plt.xscale('log')

#save the graph
plt.savefig('figures/div_mult_noAlu.png')







    


