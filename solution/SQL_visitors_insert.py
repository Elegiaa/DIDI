# receives a string in format "DD/MM/YYYY HH:MM"
# and returns the "YYYY-MM-DD HH:MM" representation
def getDateTime(date):
    v_dt_split = date.split(" ")
    visit_time = v_dt_split[1]
    visit_aux = v_dt_split[0].split("/")
    visit_date = visit_aux[2]+"-"+visit_aux[1]+"-"+visit_aux[0]
    visit_datetime = visit_date+" "+visit_time
    return visit_datetime
    
## reads and gets the insert of the restaurants_visitors.csv dataset
## output: populate_visitors.sql
def main():
    file = open("../restaurants_visitors.csv", "r")
    insert_file = open("populate_visitors.sql", "w")
    line = file.readline()
    for line in file:
        s_split = line.split(",")
        id_val = s_split[0]
        visit_datetime = getDateTime(s_split[2])    
        reserve_datetime = getDateTime(s_split[3])
        visitors = s_split[4].strip("\n")
        insert = "insert into DidiTest.Visitor values (\""+id_val+"\", \""+visit_datetime+"\", \""+reserve_datetime +"\", "+visitors+");\n"
        insert_file.write(insert)
    file.close()
    insert_file.close()
    
if __name__ == "__main__":
    main()
