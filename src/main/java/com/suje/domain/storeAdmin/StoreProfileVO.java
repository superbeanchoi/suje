package com.suje.domain.storeAdmin;

import lombok.Getter;
import lombok.Setter;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Getter
@Setter
public class StoreProfileVO {
    private String s_id, s_pass, s_name;
    private String s_text;
    private String catem_name;
    private String s_pname;
    private String s_spname;
    private String s_ppath;
    private String s_back_pname;
    private String s_back_spname;
    private String s_back_ppath;
    private int catem_code;
    private long s_psize;
    private long s_back_psize;
    private MultipartFile profileImage;
    private MultipartFile backgroundImage;
    private final String saveDir = "C:/workspaces/SujeStore/src/main/webapp/resources/img/DBServer/";

    public void setProfileImage(MultipartFile profileImage) {
        this.profileImage = profileImage;
        uploadFile(profileImage, true);
    }

    public void setBackgroundImage(MultipartFile backgroundImage) {
        this.backgroundImage = backgroundImage;
        uploadFile(backgroundImage, false);
    }

    private void uploadFile(MultipartFile file, boolean isProfile) {
        if (!file.isEmpty()) {
            String originalFilename = file.getOriginalFilename();
            long fileSize = file.getSize();
            String savedFileName = generateSavedFileName(originalFilename);

            try {
                File destFile = new File(saveDir + savedFileName);
                file.transferTo(destFile);

                if (isProfile) {
                    this.s_pname = originalFilename;
                    this.s_spname = savedFileName;
                    this.s_psize = fileSize;
                } else {
                    this.s_back_pname = originalFilename;
                    this.s_back_spname = savedFileName;
                    this.s_back_psize = fileSize;
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private String generateSavedFileName(String originalFilename) {
        UUID uuid = UUID.randomUUID();
        String ext = FilenameUtils.getExtension(originalFilename);
        return uuid.toString()+"."+ext;
    }
}
