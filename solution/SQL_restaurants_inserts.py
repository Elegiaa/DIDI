# reads and creates the insert values of the
# store_info.csv dataset
# output: populate_restaurants.sql
def main():
    file = open("../store_info.csv", "r")
    insert_file = open("populate_restaurants.sql", "w")
    line = file.readline()
    for line in file:
        s_split = line.split(",")
        id_val = s_split[0]	
        genre = s_split[1]
        area = s_split[2]
        latitude = s_split[3]
        longitude = s_split[4]	
        insert = "insert into DidiTest.Restaurant values (\""+id_val+"\", \""+genre+"\", \""+area +"\", \""+latitude+"\", \""+ longitude.strip("\n")+"\");\n"
        insert_file.write(insert)
    file.close()
    insert_file.close()
    
if __name__ == "__main__":
    main()
