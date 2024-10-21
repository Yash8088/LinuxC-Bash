#include <stdio.h>
#include <stdlib.h>

int main() {
	int n1, n2;

	FILE *file1 = fopen("matrix1.bin", "rb"); // rb reading binary
	if (!file1){
		fprintf(stderr, "cannot open matrix1.bin\n");
		return 1;
	}
	
	FILE *file2 = fopen("matrix2.bin", "rb"); 
        if (!file2) { 
       		 fprintf(stderr, "Could not open matrix2.bin for reading.\n");
        	 fclose(file1); 
       		 return 1; 
    	}

	fread(&n1, sizeof(int), 1, file1);
 	fread(&n2, sizeof(int), 1, file2);

	if (n1 > 100) {
        	fprintf(stderr, "Matrix size n should not be greater than 100.\n");
        	fclose(file1);
        	fclose(file2);
        	return 1;
   	}

	
    	
	if (n1 != n2) {
        	fprintf(stderr, "Matrices are not compatible for multiplication. Different sizes.\n");		 
	   	fclose(file1);
        	fclose(file2);
        	return 1;
    	}

	int matrix1[n1][n1][n1];
	int matrix2[n2][n2][n2];
	int result_matrix[n1][n1][n1];
	
	fread(matrix1, sizeof(int), n1 * n1 * n1, file1);
	fread(matrix2, sizeof(int), n1 * n1 * n1, file2);

	fclose(file1);
	fclose(file2);
	
	for (int i = 0; i < n1; i++) {
       		for (int j = 0; j < n1; j++) {
            		for (int k = 0; k < n1; k++) {
                	result_matrix[i][j][k] = matrix1[i][j][k] * matrix2[i][j][k];
            		}
          	}
    	}

	FILE *result_file = fopen("result.bin", "wb");
    	if (!result_file) {
        	fprintf(stderr, "Could not open result.bin for writing.\n");
        	return 1;
    	}
	
   	fwrite(&n1, sizeof(int), 1, result_file);

    	fwrite(result_matrix, sizeof(int), n1 * n1 * n1, result_file);

    	fclose(result_file);

    	printf("Element-wise multiplication completed and saved to result.bin\n");
    	return 0;
}
