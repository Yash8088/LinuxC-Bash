#include <stdio.h>

void radix_sort(unsigned int A[], unsigned int n) {
    unsigned int bucket0[100], bucket1[100];
    unsigned int mask, count, count2;
    for (int d = 0; d < 32; d++) {
        mask = 1 << d;
        count = count2 = 0;
        for (int i = 0; i < n; i++) {
            if ((A[i] & mask) == 0) {
                bucket0[count++] = A[i];
            } else {
                bucket1[count2++] = A[i];
            }
        }
        for (int i = 0; i < count; i++) {
            A[i] = bucket0[i];
        }
        for (int i = 0; i < count2; i++) {
            A[count + i] = bucket1[i];
        }
    }
}

void real_radix_sort(float A[], unsigned int n) {
    unsigned int positive[100], negative[100];
    unsigned int aCount = 0, bCount = 0;
    for (unsigned int i = 0; i < n; i++) {
        unsigned int *p = (unsigned int *)&A[i];
        if (A[i] >= 0) {
            positive[aCount++] = *p;
        } else {
            unsigned int neg = *p ^ 0xFFFFFFFF;
            negative[bCount++] = neg;
        }
    }
    radix_sort(positive, aCount);
    radix_sort(negative, bCount);

    for (int i = 0; i < bCount; i++) {
        unsigned int neg = negative[i] ^ 0xFFFFFFFF;
        float *f = (float *)&neg;
        A[i] = *f;
    }
    for (unsigned int i = 0; i < aCount; i++) {
        float *f = (float *)&positive[i];
        A[bCount + i] = *f;
    }
}

int main() {
    unsigned int arrayX, x, i = 0;
    printf("Enter amount of Values: ");
    if (scanf("%u", &arrayX) != 1 || arrayX > 100 || arrayX <= 0) {
        printf("Invalid, must be 1-100 \n");
        return 1;
    }
    float arr[arrayX];
    while (i < arrayX){
    	printf("Enter your number: ");
        if (scanf("%f", &arr[i]) != 1) {
            printf("Invalid \n");
            return 1;
        }
        i++;
    }

    printf("OLD:\n");
    for (unsigned int i = 0; i < arrayX; i++) {
        printf("%f\n", arr[i]);
    }

    printf("NEW:\n");
    real_radix_sort(arr, arrayX);
    for (unsigned int i = 0; i < arrayX; i++) {
        printf("%f\n", arr[i]);
    }
    
    return 0;
}

