public class Smart_city{
	
	private Connection connect = null;
	private Statement statement = null;
	private ResultSet resultSet = null;

	public void readDataBase() throws Exception{
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");

			connect = DriverManager.getConnection("jdbc:myslq://localhost/es_smartcity?user=root&password=toor&"
					+ "useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&sercerTimezone=UTC");
			statement = connect.createStatement();
		}catch(Exception e){
			System.out.println("No ha sido posible conectarse con la BD");
		}
	}

	private void close(){
		try{
			if(resultSet != null) {resultSet.close();}

			if(statement != null) {statement.close();}

			if(connect != null) {connect.close();}
		} catch (Exception e) {
			System.out.println("No ha sido posible cerrar la conexion con la BD");
		}
	}

	public void insertarProyecto(){
		try{
			preparedStatement = connect.preparedStatement("insert into es_smartcity.proyecto values (?, ?, ?, ?, ?, ? ,? ,?)");

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
			preparedStatement = connect.preparedStatement("Select * from es_smartcity.proyecto");
			resultSet = preparedStatement.executeQuery();
			writeResultSet(resultSet);
		} catch (Exception e){
			System.out.println("No ha sido posible insertar los datos.");
		} 
	}

	public void eliminarFeedback(){
		try{
			preparedStatement = connect.prepareStatement("delete from es_smartcity.feedback where id_feedback = ? ;");
			prepareStatement.setString(1, "3");
			prepareStatement.executeUpdate();
		} catch (Exception e){
			System.out.println("No ha sido posible eliminar los datos.");
		}
	}

	public void salario(){
		try{
			resultSet = statement.executeQuery("select * from es_smartcity.salario");
			writeResultSet(resulSet);
		} catch (Exception e){
			System.out.println("No ha sido posible mostrar los datos");
		}
	}

	public void writeResultSet(ResultSet resulSet) throws SQLException{
		while(resulSet.next()){
			System.out.println("Resultado consulta");
			System.out.println("-----");
			for(int i=1; i<=resulSet.getMetaData().getColumnCount();i++){
				System.out.println("Columna " + resulSet.getMetaData().getColumnName(i) + ": " + resulSet.getString(i));
			}
			System.out.println("-----------");
		}
	}


}
