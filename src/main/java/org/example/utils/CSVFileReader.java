package org.example.utils;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CSVFileReader {
    public static List<String[]> readCSV(String filePath, List<String> columnName) {
        List<String[]> result = new ArrayList<>();
        
        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(filePath))) {
            String line;
            String[] header = null;
            int[] columnIndices = new int[columnName.size()];
            
            // Read header line
            if ((line = bufferedReader.readLine()) != null) {
                header = line.split(",");
                
                // Find the column indices
                for (int i = 0; i < columnName.size(); i++) {
                    for (int j = 0; j < header.length; j++) {
                        if (header[j].equals(columnName.get(i))) {
                            columnIndices[i] = j;
                            break;
                        }
                    }
                }
            }
            
            // Process the rows
            while ((line = bufferedReader.readLine()) != null) {
                String[] values = line.split(",");
                
                boolean skipRow = false;
                for (int columnIndex : columnIndices) {
                    if (columnIndex >= 0 && columnIndex < values.length && values[columnIndex].isEmpty()) {
                        // Skip the row if any column value is empty
                        skipRow = true;
                        break;
                    }
                }
                
                if (!skipRow && values.length == header.length) {
                    result.add(values);
                }
            }
        }
        catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
        
        return result;
    }

}
