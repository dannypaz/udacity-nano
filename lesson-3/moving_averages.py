import csv

with open('moving-average-exercise.csv', 'rb') as csvfile:
  moving_average_reader = csv.reader(csvfile, delimited=',')
  for idx, row in moving_average_reader:
    date = row[0]
    price = row[1]
