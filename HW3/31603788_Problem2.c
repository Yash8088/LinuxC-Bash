#include <stdio.h>
#include <dirent.h>
#include <stdlib.h>
#include <string.h>

void countFileLines(const char *filename, int *total_lines) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Unable to open file: %s\n", filename);
        return;
    }

    int lines = 0;
    char line_buffer[4096];

    while (fgets(line_buffer, sizeof(line_buffer), file)) {
        lines++;
    }

    fclose(file);
    *total_lines += lines;
}

void exploreDirectory(const char *dir_path, int *total_lines) {
    DIR *dir = opendir(dir_path);
    if (dir == NULL) {
        printf("Cannot open directory: %s\n", dir_path);
        return;
    }

    struct dirent *entry;
    char file_path[1000];  

    while ((entry = readdir(dir)) != NULL) {
        
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0) {
            continue;
        }

        snprintf(file_path, sizeof(file_path), "%s/%s", dir_path, entry->d_name);

      
        if (entry->d_type == DT_DIR) {
            exploreDirectory(file_path, total_lines);
        } 
     
        else if (entry->d_type == DT_REG && strstr(entry->d_name, ".txt")) {
            countFileLines(file_path, total_lines);
        }
    }

    closedir(dir);
}

int main() {
    char directory[1000];  


    printf("Please enter the directory path: ");
    scanf("%s", directory);

    int total_lines = 0;

  
    exploreDirectory(directory, &total_lines);


    printf("Total number of lines in all .txt files: %d\n", total_lines);

    return 0;
}

