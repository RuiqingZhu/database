import java.sql.*;

public class MySQLAccess {
    private Connection connect = null;
    private Statement statement = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    /**
     * This method reads Data from database
     */
    public void readDataFromDB(){
        // This will load the MySQL driver, each DB has its own driver
        try {
            Class.forName("com.mysql.jdbc.Driver");

            connect = DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/session6?"
                            + "user=root&password=PO?ltr6Hl$Rista@9Ira");
            statement = connect.createStatement();

            resultSet = statement
                    .executeQuery("select * from session6.USER");
            writeResultSet(resultSet);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void writeResultSet(ResultSet resultSet) throws SQLException {
        // ResultSet is initially before the first data set
        while (resultSet.next()) {
            // It is possible to get the columns via name
            // also possible to get the columns via the column number
            // which starts at 1
            // e.g. resultSet.getSTring(2);
            String user = resultSet.getString("first_name");
//            String website = resultSet.getString("webpage");
//            String summary = resultSet.getString("summary");
//            Date date = resultSet.getDate("datum");
//            String comment = resultSet.getString("comments");
            System.out.println("first name: " + user);
//            System.out.println("Website: " + website);
//            System.out.println("summary: " + summary);
//            System.out.println("Date: " + date);
//            System.out.println("Comment: " + comment);
        }
    }
}
