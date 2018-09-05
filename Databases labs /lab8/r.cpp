#include <iostream>
#include <cmath>
using namespace std;
int main()
{
	int a[100];
	int b[100];
	for(int i=0;i<3;i++)
	{
		cin>>a[i];
	}
	for(int i=0;i<3;i++)
	{
		cin>>b[i];
	}
	for(int i=0;i<3;i++)
	{
		for(int j=0;j<3;j++)
		{
			if(a[j+1]>a[j])
			{
				int x=a[j+1];
				a[j+1]=a[j];
				a[j]=x;
			}
		}
	}
	for(int i=0;i<3;i++)
	{
		for(int j=0;j<3;j++)
		{
			if(b[j+1]>b[j])
			{
				int x=b[j+1];
				b[j+1]=b[j];
				b[j]=x;
			}
		}
	}
	for(int i=0;i<3;i++)
	{
		cout<<a[0]*b[0]+a[1]*b[1]+a[2]*b[2];
	}
	return 0;
}