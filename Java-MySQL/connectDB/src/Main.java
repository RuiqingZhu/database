public class Main {


    public static void main(String[] args) {
        System.out.println("Connecting to Mysql");
        MySQLAccess access = new MySQLAccess();
        access.readDataFromDB();
    }

}