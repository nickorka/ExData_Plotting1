# download the file
source_file = "data/household_power_consumption.txt"
if(!file.exists(source_file)) {
    if(!file.exists("data")) {
        dir.create("data")
    }
    
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                  "data/archive.zip", method = "curl")
    
    unzip("data/archive.zip", exdir = "data")
}

# prepare data frame
dest_file <- "data/clean_data.txt"
if(!file.exists(dest_file)) {
    src <- file(source_file, "r")
    dst <- file(dest_file, "w")
    # header
    writeLines(readLines(src, n=1), dst)
    
    # create a file with only necessary data
    dates <- c("1/2/2007", "2/2/2007")
    while(TRUE) {
        line = readLines(src, n = 1)
        if(length(line) == 0) {
            break
        } else {
            fields <- strsplit(line, ";")
            if(fields[[1]][1] %in% dates) {
                writeLines(line, dst)
            }
        }
    }
    close(src)
    close(dst)
}
