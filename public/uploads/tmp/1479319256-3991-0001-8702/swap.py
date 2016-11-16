n=input("Enter no. of elements: ")
a=[]
for i in range(n):
	x=input("Enter element "+str(i+1)+": ")
	a.append(x)
print a
n1=input("Enter index of first element to be swapped: ")
n2=input("Enter index of second element to be swapped: ")
a[n1],a[n2]=a[n2],a[n1]
print a

