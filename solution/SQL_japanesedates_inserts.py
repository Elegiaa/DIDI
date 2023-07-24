# gets the insert from the date_info.csv dataset
# output: populate_dates.sql
def main():
    file = open("../date_info.csv", "r")
    insert_file = open("populate_dates.sql", "w")
    line = file.readline()
    for line in file:
        s_split = line.split(",")
        date = s_split[0]
        day  = s_split[1]
        flag = s_split[2].strip("\n")
        insert = "insert into DidiTest.JapaneseDate values (\""+date+"\", \""+day+"\", "+flag +");\n"
        insert_file.write(insert)
    file.close()
    insert_file.close()
    
if __name__ == "__main__":
    main()
