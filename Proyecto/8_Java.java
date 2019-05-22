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
			throw e;
		}finally{
			close();
		}
	}

	private void close(){
		try{
			if(resultSet != null) {resultSet.close();}

			if(statement != null) {statement.close();}

			if(connect != null) {connect.close();}
		} catch (Exception e) {
			e.printStackTrace();
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
			throw e;
		} finally {
			close();
		}
	}

	public void eliminarFeedback(){
		try{
			preparedStatement = connect.prepareStatement("delete from es_smartcity.feedback where id_feedback = ? ;");
			prepareStatement.setString(1, "3");
			prepareStatement.executeUpdate();
		} catch (Exception e){
			throw e;
		} finally {
			close();
		}
	}

	public void salario(){
		try{
			resultSet = statement.executeQuery("select * from es_smartcity.salario");
			writeMetaData(resulSet);
			writeResultSet(resulSet);
		} catch (Exception e){
			throw e;
		} finally {
			close();
		}
	}


}