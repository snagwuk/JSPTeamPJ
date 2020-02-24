package model;

import java.io.Serializable;
import java.util.Map;

public class Member implements Serializable
{
   

    private String id;
    
    private String passwd;
    
    private String name;
    private String birth;
    private int sex;
    private String phone;
    
    private String address;
    
    private int admin;
  
    private String confirmpasswd;
    public Member(){}
    
    //일반회원 Dao에서 insert문에 쓰이는 생성자
    public Member(String id, String passwd, String name,String birth, int sex, String phone,
            String address)
    {
        this.id = id;
        this.passwd = passwd;
        this.name = name;
        this.birth= birth;
        this.sex = sex;
        this.phone = phone;
        this.address = address;
        this.admin = 0;
    }
    //컨트롤러에서 join할때 쓰이는 생성자
    public Member(String id, String passwd, String name,String birth, int sex, String phone,
            String address,String confirmpasswd)
    {
        this.id = id;
        this.passwd = passwd;
        this.name = name;
        this.birth= birth;
        this.sex = sex;
        this.phone = phone;
        this.address = address;
        this.admin = 0;
        this.confirmpasswd = confirmpasswd;
    }
    
    //
   public Member(String id, String passwd, String name,String birth, int sex, String phone,
            String address,int admin)
    {
        this.id = id;
        this.passwd = passwd;
        this.name = name;
        this.birth= birth;
        this.sex = sex;
        this.phone = phone;
        this.address = address;
        this.admin = admin;
    }
  
   
    public String getId()
    {
        return id;
    }
     

    public String getPasswd()
    {
        return passwd;
    }
    
    public String getName()
    {
        return name;
    }
    
    public int getAdmin()
    {
        return admin;
    }

    public String getPhone()
    {
        return phone;
    }
    
    public String getAddress()
    {
        return address;
    }
    
    public String getConfirmpasswd()
    {
        return confirmpasswd;
    }
    
    public void changePassword(String newPwd)
    {
        this.passwd = newPwd;
    }
    public boolean matchPassword(String pwd)
    {
            return passwd.equals(pwd);
    }
    
    public boolean isPasswordEqualToConfrim()
    {
        return passwd != null && passwd.equals(confirmpasswd);
    }
    
    public void setId(String id)
    {
        this.id = id;
    }
    public void setPasswd(String passwd)
    {
        this.passwd = passwd;
    }
    public void setConfirmpasswd(String confirmpasswd)
    {
        this.confirmpasswd = confirmpasswd;
    }
    public void setName(String name)
    {
        this.name = name;
    }
    public void setPhone(String phone)
    {
        this.phone = phone;
    }
    public void setAddress(String address)
    {
        this.address = address;
    }
    public void setAdmin(int admin)
    {
        this.admin = admin;
    }
    
    
    public String getBirth()
    {
        return birth;
    }
    public void setBirth(String birth)
    {
        this.birth = birth;
    }
    public int getSex()
    {
        return sex;
    }
    public void setSex(int sex)
    {
        this.sex = sex;
    }
    public void vaildate(Map<String, Boolean> errors)
    {
        checkEmpty(errors, id, "id");
        checkEmpty(errors, name, "name");
        checkEmpty(errors, phone, "phone");
        checkEmpty(errors, birth, "birth");
        checkEmpty(errors, sex+"", "sex");
        checkEmpty(errors, passwd, "passwd");
        checkEmpty(errors, confirmpasswd, "confirmpasswd");
        if (!errors.containsKey("confirmpasswd"))
        {
            if (!isPasswordEqualToConfrim())
            {
                errors.put("notMatch", Boolean.TRUE);
            }
        }
    }
    
    private void checkEmpty(Map<String, Boolean> erros, String value,
            String filedName)
    {
        if (value == null || value.isEmpty())
            erros.put(filedName, Boolean.TRUE);
    }
  
   
    
}
