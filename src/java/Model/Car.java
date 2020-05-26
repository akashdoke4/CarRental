package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Car extends Connect
{
    /////Function for connect to the MySQL Server Database////////////
	public Car()
    {
		Connect.connect_mysql();
    }
	//////////Save User Details /////
	public String saveCar(HashMap carData)
	{
		String SQL = "INSERT INTO `car` (`car_name`, `car_description`, `car_number`, `car_company`, `car_city`, `car_type`, `car_seats`, `car_price_per_day`, `car_image`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
		int record=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) carData.get("car_name"));
			pstmt.setString(2,(String) carData.get("car_description"));
			pstmt.setString(3,(String) carData.get("car_number"));
			pstmt.setString(4,(String) carData.get("car_company"));
			pstmt.setString(5,(String) carData.get("car_city"));
			pstmt.setString(6,(String) carData.get("car_type"));
			pstmt.setString(7,(String) carData.get("car_seats"));
			pstmt.setString(8,(String) carData.get("car_price_per_day"));
			pstmt.setString(9,(String) carData.get("car_image"));
			
			record = pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			error+="Error : "+stackTrace;
			System.out.println(" Error : "+ e.toString());
		}
		return error;
	}
	//////////////////Function for getting Users Details//////////	
    public HashMap getCarDetails(int car_id)
	{
        HashMap results = new HashMap();
        int count=0;
		try
		{
			String SQL = "SELECT * FROM `car`,`type`,`company`,`city` WHERE car_company = company_id AND car_type = type_id AND car_city = city_id AND car_id = "+car_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				results.put("car_name",rs.getString("car_name"));
				results.put("car_description",rs.getString("car_description"));
				results.put("car_number",rs.getString("car_number"));
				results.put("car_company",Integer.parseInt(rs.getString("car_company")));
				results.put("car_city",Integer.parseInt(rs.getString("car_city")));
				results.put("car_type",Integer.parseInt(rs.getString("car_type")));
				results.put("car_seats",rs.getString("car_seats"));
				results.put("car_price_per_day",rs.getString("car_price_per_day"));
				results.put("car_id",rs.getString("car_id"));
				results.put("car_image",rs.getString("car_image"));
				results.put("type_name",rs.getString("type_name"));
				results.put("city_name",rs.getString("city_name"));
				results.put("company_name",rs.getString("company_name"));
				
				count++;
            }
			if(count==0)
			{
				results.put("car_name","");
				results.put("car_description","");
				results.put("car_number","");
				results.put("car_company",0);
				results.put("car_city",0);
				results.put("car_type",0);
				results.put("car_seats","");
				results.put("car_price_per_day","");
				results.put("car_id","");
				results.put("car_image","");
			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return results;
    }
    /// Update the Car ////
	public String updateCar(HashMap carData)
	{
		String SQL = "UPDATE `car` SET `car_name` = ?, `car_description` = ?, `car_number` = ?, `car_company` = ?, `car_city` = ?, `car_type` = ?, `car_seats` = ?, `car_price_per_day` = ?, `car_image` = ? WHERE `car_id` = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) carData.get("car_name"));
			pstmt.setString(2,(String) carData.get("car_description"));
			pstmt.setString(3,(String) carData.get("car_number"));
			pstmt.setString(4,(String) carData.get("car_company"));
			pstmt.setString(5,(String) carData.get("car_city"));
			pstmt.setString(6,(String) carData.get("car_type"));
			pstmt.setString(7,(String) carData.get("car_seats"));
			pstmt.setString(8,(String) carData.get("car_price_per_day"));
			pstmt.setString(9,(String) carData.get("car_image"));
			pstmt.setString(10,(String) carData.get("car_id"));
			record = pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			error+="Error : "+stackTrace;
			System.out.println(" Error : "+ e.toString());
		}
		return error;
	}
	
	////////////////Function for getting all the Airport Details////////////////////  
    public ArrayList getAllCar(int typeID)
	{
		int count=0;
		String SQL = "";
		SQL = "SELECT * FROM `car`,`type`,`company`,`city` WHERE car_company = company_id AND car_type = type_id AND car_city = city_id";
        ArrayList resultArray = new ArrayList();
        try
		{
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("car_name",rs.getString("car_name"));
				results.put("car_description",rs.getString("car_description"));
				results.put("car_number",rs.getString("car_number"));
				results.put("car_company",rs.getString("car_company"));
				results.put("car_city",rs.getString("car_city"));
				results.put("car_type",rs.getString("car_type"));
				results.put("car_seats",rs.getString("car_seats"));
				results.put("car_price_per_day",rs.getString("car_price_per_day"));
				results.put("car_id",rs.getString("car_id"));
				results.put("car_image",rs.getString("car_image"));
				results.put("type_name",rs.getString("type_name"));
				results.put("city_name",rs.getString("city_name"));
				results.put("company_name",rs.getString("company_name"));
				count++;
                resultArray.add(results);
            }
         }
		catch(Exception e)
		{
            System.out.println("Error is: "+ e);
        }
        return resultArray;
    }
	
	/////Function for Getting the List////////////
	public String getCompanyOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("company","company_id","company_name","company_id,company_name",selectedID,"1");
    }
	/////Function for Getting the List////////////
	public String getCityOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("city","city_id","city_name","city_id,city_name",selectedID,"1");
    }
    /////Function for Getting the List////////////
	public String getTypeOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("type","type_id","type_name","type_id,type_name",selectedID,"1");
    }
}
