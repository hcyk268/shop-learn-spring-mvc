package com.haipro.shop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {

    private final ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String SaveUploadFile(MultipartFile file, String targetFolder) {
        String rootPath = this.servletContext.getRealPath("/resources/images");
        String finalFile = "";
        try {
            byte[] bytes = file.getBytes();
            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists())
                dir.mkdirs();
            // Create the file on server
            finalFile = System.currentTimeMillis() + "-" + file.getOriginalFilename();

            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalFile);

            FileOutputStream fileOutputStream = new FileOutputStream(serverFile);
            BufferedOutputStream stream = new BufferedOutputStream(fileOutputStream);
            stream.write(bytes);
            stream.close();
        } catch (Exception ex) {
            System.err.println("Error: " + ex.getMessage());
        }
        return finalFile;
    }
}
