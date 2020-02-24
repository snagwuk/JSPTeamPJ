package model;

public class User 
{
    private String id;
    
    private String name;
    
    private int admin;
    
    public User(String id, String name)
    {
        this.id = id;
        this.name = name;
    }
    
    public User(String id, String name, int admin)
    {
        this.id = id;
        this.name = name;
        this.admin = admin;
    }

    public int getAdmin()
    {
        return admin;
    }
    
    public String getId()
    {
        return id;
    }
    
    public String getName()
    {
        return name;
    }
    
}
