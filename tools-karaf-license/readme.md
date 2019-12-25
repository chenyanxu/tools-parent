# tools-karaf-license
* 本模块用于license的生成和验证，主要使用了license3j开源类库

参考：http://greycode.github.io/2014/10/use_license3j/
License3j 的Github地址：https://github.com/verhas/License3j

```
package org.greycode.demo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import com.verhas.licensor.License;

public class LicenseDemo {

	public static void main(String[] args) {
		try {
			File licenseFile = new File("demo.license");
			
			if (!licenseFile.exists()) {
			// license 文件生成
				OutputStream os = new FileOutputStream("demo.license");
				os.write(new License()
				    // license 的原文,这里增加一些自定义的key和value
				    .setLicense(new File("license-plain.txt"))
				    // 私钥与之前生成密钥时产生的USER-ID，keyUserId替换为的USER-ID，例子里面为sunlf
				    .loadKey("secring.gpg","keyUserId")
				    // 生成密钥时输入的密码，keyPassword替换为生成密钥时候录入的密码
				    .encodeLicense("keyPassword").getBytes("utf-8"));
				os.close();
			} else {
			// licence 文件验证
			    License license = new License();

			    if (license
				    .loadKeyRing("pubring.gpg", null)
				    .setLicenseEncodedFromFile("demo.license").isVerified()) {
			    	System.out.println(license.getFeature("edition"));
				System.out.println(license.getFeature("valid-until"));
			    }
			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
```

> 公钥文件pubring.gpg，私钥文件secring.gpg，要和java的执行类放在一个文件目录下。
  生成kalix.license文件的时候，使用私钥，验证的时候使用公钥。

