package database;
import java.sql.*;

public class DatabaseHelper {

	Connection connection;

	public DatabaseHelper(){
		connection = DatabaseConnector.getDatabase();
	}

	public int getPersonType(String userName, String password){
		if(connection==null)
		{
			return -1;
		}

		try {
			PreparedStatement ps =connection.prepareStatement
					("select * from person where userName=? and password=?");

			ps.setString(1, userName);
			ps.setString(2, password);
			
			ResultSet rs =ps.executeQuery();
			if(rs.next())
			{
				return rs.getInt("type");
			}else
			{
				return 0;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return -1;

	}
}
