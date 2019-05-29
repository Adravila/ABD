import java.sql.*;

public class SmartCity{
	
	private static Connection connect = null;
	private static Statement statement = null;
	private static ResultSet resultSet = null;
	private static PreparedStatement preparedStatement = null;

	public static void readDataBase() throws Exception{
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");

			connect = DriverManager.getConnection("jdbc:mysql://localhost/es_smartcity?user=root&password=toor&"
					+ "useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
			statement = connect.createStatement();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("No ha sido posible conectarse con la BD");
		}
	}

	private static void close(){
		try{
			if(resultSet != null) {resultSet.close();}

			if(statement != null) {statement.close();}

			if(connect != null) {connect.close();}
		} catch (Exception e) {
			System.out.println("No ha sido posible cerrar la conexion con la BD");
		}
	}

	public static void insertarProyecto(){
		try{
			preparedStatement = (PreparedStatement)connect.prepareStatement("insert into es_smartcity.proyecto (nombre, descripcion,fecha_ini, fecha_fin, universidad, presupuesto, id_ciudad, id_laboratorio) values (?, ?, ?, ?, ?, ? ,? ,?)");

			preparedStatement.setString(1, "Semaforos avenida principal.");
			preparedStatement.setString(2, "Control de semaforos en la avenida mas transitada de la ciudad.");
			preparedStatement.setString(3, "2005-04-12");
			preparedStatement.setString(4, "2010-05-20");
			preparedStatement.setString(5, "Universidad de Sevilla");
			preparedStatement.setString(6, "450250");
			preparedStatement.setString(7, "5");
			preparedStatement.setString(8, "1");
			preparedStatement.executeUpdate();

			//Comprobamos
			preparedStatement = connect.prepareStatement("Select * from es_smartcity.proyecto");
			resultSet = preparedStatement.executeQuery();
			writeResultSet(resultSet);
		} catch (Exception e){
			
			System.out.println("No ha sido posible insertar los datos.");
		} 
	}

	public static void eliminarFeedback(){
		try{
			preparedStatement = (PreparedStatement) connect.prepareStatement("delete from es_smartcity.feedback where id_feedback = ? ;");
			preparedStatement.setString(1, "3");
			preparedStatement.executeUpdate();
		} catch (Exception e){
			System.out.println("No ha sido posible eliminar los datos.");
		}
	}

	public static void salario(){
		try{
			preparedStatement = (PreparedStatement) connect.prepareStatement("select * from es_smartcity.salario");
			resultSet = preparedStatement.executeQuery();
			writeResultSet(resultSet);
		} catch (Exception e){
			System.out.println("No ha sido posible mostrar los datos");
		}
	}

	public static void writeResultSet(ResultSet resulSet) throws SQLException{
		while(resulSet.next()){
			System.out.println("Resultado consulta");
			System.out.println("-----");
			for(int i=1; i<=resulSet.getMetaData().getColumnCount();i++){
				System.out.println("Columna " + resulSet.getMetaData().getColumnName(i) + ": " + resulSet.getString(i));
			}
			System.out.println("-----------");
		}
	}

	public static void main(String args[]) throws Exception {
		readDataBase();
		insertarProyecto();
		eliminarFeedback();
		salario();
		close();
	}

}
