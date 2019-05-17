/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.kalix.tools.license;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import com.verhas.licensor.License;

public class LicenseMain {

    public static final String KALIX_LICENSE_FILE_NAME = "kalix.license";

    public static void main(String[] args ){
        try {
            File licenseFile = new File(KALIX_LICENSE_FILE_NAME);

            if (!licenseFile.exists()) {
                // license 文件生成
                OutputStream os = new FileOutputStream(KALIX_LICENSE_FILE_NAME);
                os.write(new License()
                        // license 的原文
                        .setLicense(new File("license-plain.txt"))
                        // 私钥与之前生成密钥时产生的USER-ID
                        .loadKey("secring.gpg","kalix (hello kalix) <kalix@qq.com>")
                        // 生成密钥时输入的密码
                        .encodeLicense("kalix.123").getBytes("utf-8"));
                os.close();
            } else {
                // licence 文件验证
                License license = new License();

                if (license
                        .loadKeyRing("pubring.gpg", null)
                        .setLicenseEncodedFromFile(KALIX_LICENSE_FILE_NAME).isVerified()) {
                    System.out.println(license.getFeature("edition"));
                    System.out.println(license.getFeature("valid-until"));
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
