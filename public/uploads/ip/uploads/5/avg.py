n=input("No. of subjects: ")
sum=0
for i in range(1,n+1):
	x=input("Enter marks of subject " + str(i) + ": ")
	sum=sum+x
	i+=1
avg=float(sum)/n
print avg
