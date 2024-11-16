/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class SaveVideoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
        // Directory to save the video
        String uploadPath = "C:/uploaded_videos"; // Change path as needed
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Get the video file from the request
        Part videoPart = request.getPart("video");
        String fileName = "quiz_video_" + System.currentTimeMillis() + ".webm";

        // Save the video file to the directory
        String filePath = uploadPath + File.separator + fileName;
        try (FileOutputStream fos = new FileOutputStream(filePath);
             InputStream inputStream = videoPart.getInputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
        }

        // (Optional) Save file path to the database
        // Database connection and insert code here

        // Respond to client
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.write("Video uploaded and saved as: " + fileName);
    }
}
