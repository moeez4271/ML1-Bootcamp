#!/bin/bash

# Step 1: Replace "Software" with "IT" and save to a temporary file
sed 's/Software/IT/g' employees.txt > temp_employees.txt

# Step 2: Remove rows where Employee Age is less than 30 and save to updated_employees.txt
awk -F, '$3 >= 30' temp_employees.txt > updated_employees.txt

# Step 3: Calculate average salary by department
awk -F, '
{
    dept[$4] += $5;  # Sum salaries by department
    count[$4]++;     # Count number of employees in each department
}
END {
    for (d in dept) {
        avg = dept[d] / count[d];  # Calculate average
        printf "%s: %d\n", d, int(avg + 0.5);  # Round to nearest integer
    }
}' updated_employees.txt

# Clean up temporary file
rm temp_employees.txt
