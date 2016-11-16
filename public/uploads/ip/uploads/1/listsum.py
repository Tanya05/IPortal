a=[1,2,3,4,5,6]
i=0
b=[]
while(i<=5):
  sum=0
  j=0
  while(j<=i):
    sum=sum+a[j]
    j+=1
  b.append(sum)
  i+=1
a=b
print "a= " + str(a)
