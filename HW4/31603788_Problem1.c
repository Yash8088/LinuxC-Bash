#include <stdio.h>

void radix_sort(unsigned int A[], unsigned int n){
	unsigned int bucket0[100], bucket1[100];
	unsigned int mask, count0, count1;
	for (int d = 0; d <= 31; d++){
		mask = 1 << d;
		count0 = count1 = 0;
		for (int i = 0; i < n; i++){
			if ((A[i]&mask) == 0){
				bucket0[count0++] = A[i];
			}else {
				bucket1[count1++] = A[i];
			}
		}
		for (int i = 0; i < count0; i++){
			A[i] = bucket0[i];
		}
		for (int i = 0; i < count1; i++){
			A[count0+i]=bucket1[i];
		}
	}
}

int main(){
	int arrayX=0;
	int x=0;
	int i=0;

	printf("Enter Number Of Values: ");
	if (scanf("%d", &arrayX) != 1 || arrayX > 100 || arrayX <= 0){
		printf("Invalid, only 1-100");
		return 1;
	}
	unsigned int arr[arrayX];
	while (i < arrayX){
		printf("Enter number: ");
		if (scanf("%d", &arr[i]) != 1 || x < 0){
			printf("Invalid \n");
			return 1;
		}
		i++;
	}
	printf("OLD: \n");
	for (int z = 0; z < arrayX; z++){
		printf("%d\n", arr[z]);
	}
	printf("NEW: \n");
	radix_sort(arr, arrayX);
	for (int z = 0; z < arrayX; z++){
		printf("%d\n", arr[z]);
	}
	return 0;
}

