package model;

import java.io.Serializable;
import java.util.Map;

public class Trainer implements Serializable {

	private String train_code;
	private String name;
	private String email;
	private String license;
	private String tel;
	public Trainer(){}
	public Trainer(String train_code, String name, String email, String license, String tel) {
		this.train_code = train_code;
		this.name = name;
		this.email = email;
		this.license = license;
		this.tel = tel;
	}
	
    public String getTrain_code()
    {
        return train_code;
    }
    public void setTrain_code(String train_code)
    {
        this.train_code = train_code;
    }
    public String getName()
    {
        return name;
    }
    public void setName(String name)
    {
        this.name = name;
    }
    public String getEmail()
    {
        return email;
    }
    public void setEmail(String email)
    {
        this.email = email;
    }
    public String getLicense()
    {
        return license;
    }
    public void setLicense(String license)
    {
        this.license = license;
    }
    public String getTel()
    {
        return tel;
    }
    public void setTel(String tel)
    {
        this.tel = tel;
    }
	
	
	

	

	
	
	
	
}
