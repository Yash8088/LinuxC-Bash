#include <stdio.h>
#include <stdlib.h>

int main() {
    int n;

    // Open the binary file for reading
    FILE *result_file = fopen("result.bin", "rb");
    if (!result_file) {
        fprintf(stderr, "Could not open result.bin for reading.\n");
        return 1;
    }

    // Read the matrix dimension from the file
    fread(&n, sizeof(int), 1, result_file);
    if (n > 100) {
        fprintf(stderr, "Matrix size n should not be greater than 100.\n");
        fclose(result_file);
        return 1;
    }

    // Allocate memory for the 3D matrix
    int result_matrix[n][n][n];

    // Read the matrix elements from the file
    fread(result_matrix, sizeof(int), n * n * n, result_file);

    // Close the binary file
    fclose(result_file);

    // Print the matrix in a readable format
    printf("Matrix dimension: %d\n", n);
    for (int i = 0; i < n; i++) {
        printf("Layer %d:\n", i + 1);
        for (int j = 0; j < n; j++) {
            for (int k = 0; k < n; k++) {
                printf("%d ", result_matrix[i][j][k]);
            }
            printf("\n"); // New line after each row
        }
        printf("\n"); // New line after each layer
    }

    return 0;
}

