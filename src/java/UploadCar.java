import java.io.File;
import java.io.IOException;
import Model.*;
import java.util.*;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/UploadCar")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class UploadCar extends HttpServlet {
    private static final String SAVE_DIR = "carImages";
     
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//// Logic for Upload the File ////
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + SAVE_DIR;
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
		long unixTime = System.currentTimeMillis() / 1000L;
	
		Part part;
        part = request.getPart("car_image");
        String fileName = extractFileName(part);
        if(!fileName.equals("")) {
			fileName = unixTime+"_"+extractFileName(part);
			part.write(savePath + File.separator + fileName);
		} else {
			fileName = request.getParameter("image_name");
		}
		//// Upload File Complete///
		
		/////Save the Car Details /////
		Car carObj = new Car();
		String errorMsg = "";
		if((request.getParameter("act")).equals("Save"))
		{
			HashMap results = new HashMap();
			
			results.put("car_name",request.getParameter("car_name"));
			results.put("car_description",request.getParameter("car_description"));
			results.put("car_number",request.getParameter("car_number"));
			results.put("car_company",request.getParameter("car_company"));
			results.put("car_city",request.getParameter("car_city"));
			results.put("car_type",request.getParameter("car_type"));
			results.put("car_seats",request.getParameter("car_seats"));
			results.put("car_price_per_day",request.getParameter("car_price_per_day"));
			results.put("car_id",request.getParameter("car_id"));
			results.put("car_image",fileName);
								
			if((request.getParameter("car_id")).equals(""))
			{
				errorMsg = carObj.saveCar(results);
                request.getSession().setAttribute("errorMessage", errorMsg);
				request.setAttribute("message", "Car Saved Successfully !!!!");
				getServletContext().getRequestDispatcher("/report-car.jsp").forward(request, response);
			}
			else
			{
				results.put("car_id",request.getParameter("car_id"));
				errorMsg = carObj.updateCar(results);
				request.getSession().setAttribute("errorMessage", errorMsg);
				request.setAttribute("message", "Car Updated Successfully !!!!");
				getServletContext().getRequestDispatcher("/report-car.jsp").forward(request, response);
			}
		}
    }
    /**
     * Extracts file name from HTTP header content-disposition
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}
