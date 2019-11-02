from os import listdir

dirs = listdir('./_gtfobins')
for item in dirs:
    print ('"'+item.replace('.md','')+'"'),

