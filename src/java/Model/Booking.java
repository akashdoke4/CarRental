package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Booking extends Connect
{
    /////Function for connect to the MySQL Server Database////////////
	public Booking()
    {
		Connect.connect_mysql();
    }
	//////////Save User Details /////
	public String saveBooking(HashMap bookingData)
	{
		String SQL = "INSERT INTO `booking` (`booking_user_id`, `booking_name`, `booking_mobile`, `booking_email`, `booking_pickup`, `booking_drop`, `booking_from_date`, `booking_to_date`, `booking_car_id`, `booking_no_passengar`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		int record=0,last_inserted_id=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1,(String) bookingData.get("booking_user_id"));
			pstmt.setString(2,(String) bookingData.get("booking_name"));
			pstmt.setString(3,(String) bookingData.get("booking_mobile"));
			pstmt.setString(4,(String) bookingData.get("booking_email"));
			pstmt.setString(5,(String) bookingData.get("booking_pickup"));
			pstmt.setString(6,(String) bookingData.get("booking_drop"));
			pstmt.setString(7,(String) bookingData.get("booking_from_date"));
			pstmt.setString(8,(String) bookingData.get("booking_to_date"));
			pstmt.setString(9,(String) bookingData.get("booking_car_id"));
			pstmt.setString(10,(String) bookingData.get("booking_no_passengar"));
			
			record = pstmt.executeUpdate();
			//// Get the Booking ID ////
			rs = pstmt.getGeneratedKeys();
			if(rs.next())
			{
				last_inserted_id = rs.getInt(1);
			}
			///// Save the booking_id in seats ////
			
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
		return Integer.toString(last_inserted_id);
	}
	//////////////////Function for getting Users Details//////////	
    public HashMap getBookingDetails(int booking_id)
	{
        HashMap results = new HashMap();
        int count=0;
		try
		{
            String SQL =  "SELECT * FROM `booking` WHERE booking_id = "+booking_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{			
				results.put("booking_user_id",rs.getString("booking_user_id"));
				results.put("booking_name",rs.getString("booking_name"));
				results.put("booking_mobile",rs.getString("booking_mobile"));
				results.put("booking_email",rs.getString("booking_email"));
				results.put("booking_pickup",rs.getString("booking_pickup"));
				results.put("booking_drop",rs.getString("booking_drop"));	
				results.put("booking_from_date",rs.getString("booking_from_date"));	
				results.put("booking_to_date",rs.getString("booking_to_date"));	
				results.put("booking_car_id",rs.getString("booking_car_id"));
				results.put("booking_no_passengar",rs.getString("booking_no_passengar"));	
				results.put("booking_id",rs.getString("booking_id"));
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
				count++;
            }
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return results;
    }
	
	////////////////Function for getting all the Airport Details////////////////////  
    public ArrayList getAllBooking(String userID)
	{
		String SQL;
		if(userID.equals("0"))
			SQL = "SELECT * FROM `booking`,`car` WHERE booking_car_id = car_id ORDER BY booking_id DESC";
		else
			SQL = "SELECT * FROM `booking`,`car` WHERE booking_car_id = car_id AND booking_user_id = "+userID+" ORDER BY booking_id DESC";
		int count=0;
        ArrayList resultArray = new ArrayList();
        try
		{			
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("booking_user_id",rs.getString("booking_user_id"));
				results.put("booking_name",rs.getString("booking_name"));
				results.put("booking_mobile",rs.getString("booking_mobile"));
				results.put("booking_email",rs.getString("booking_email"));
				results.put("booking_pickup",rs.getString("booking_pickup"));
				results.put("booking_drop",rs.getString("booking_drop"));	
				results.put("booking_from_date",rs.getString("booking_from_date"));	
				results.put("booking_to_date",rs.getString("booking_to_date"));	
				results.put("booking_car_id",rs.getString("booking_car_id"));
				results.put("booking_no_passengar",rs.getString("booking_no_passengar"));	
				results.put("booking_id",rs.getString("booking_id"));
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
}
	