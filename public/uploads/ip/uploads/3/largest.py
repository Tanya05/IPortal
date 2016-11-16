n=input("No. of no.s ")
x=input("Enter no. 1: ")
maxm=x
for i in range(2,n+1):
	x=input("Enter no. "+str(i)+": ")
	if(x>maxm):
		maxm=x
print maxm
