import math

def read():
	f = open('duom.in')
	lines = f.readlines()
	f.close()
	coordinates = []
	for x in range(0, len(lines)):
		print lines[x]
		singleCoordinate = {}
		words = lines[x].split()
		singleCoordinate = {'x1': int(float(words[0])), 'y1': int(float(words[1])), 'x2': int(float(words[2])), 'y2': int(float(words[3]))}
		coordinates.append(singleCoordinate)
	return [dict(tupleized) for tupleized in set(tuple(item.items()) for item in coordinates)]

def check(cd):
	count = 0
	for i in range(0, len(cd) - 1):
		for j in range(i+1, len(cd)):
			if (cd[i]['x1'] ==  cd[j]['x1'] and cd[i]['y1'] == cd[j]['y1']) \
			 or (cd[i]['x1'] == cd[j]['x2'] and cd[i]['y1'] == cd[j]['y2']) \
			 or (cd[i]['x2'] == cd[j]['x1'] and cd[i]['y2'] == cd[j]['y1']) \
			 or (cd[i]['x2'] == cd[j]['x2'] and cd[i]['y2'] == cd[j]['y2']):
				ilength = math.sqrt(pow(cd[i]['x2'] - cd[i]['x1'], 2) + pow(cd[i]['y2'] - cd[i]['y1'], 2)) 
				jlength = math.sqrt(pow(cd[j]['x2'] - cd[j]['x1'], 2) + pow(cd[j]['y2'] - cd[j]['y1'], 2))
				if ilength == jlength:
					if (((cd[i]['y2'] - cd[i]['y1']) / ilength) != ((cd[j]['y2'] - cd[j]['y1']) / jlength)):
						count+= 1
	return count

def main():
	coordinates = read()
	count = check(coordinates)
	print count
	f = open('duom.out', 'w');
	f.write(str(count))
	f.close()