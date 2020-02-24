package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import anno.ActionAnnotation;
import anno.RequestMapping;
import anno.RequestMapping.RequestMethod;

public class MainController extends ActionAnnotation
{
    
    @Override
    public void initProcess(HttpServletRequest request,
            HttpServletResponse response)
    {
        
    }
    
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String main_index(HttpServletRequest req,
            HttpServletResponse res) throws Exception
    {
        return "/view/main.jsp";
    }
    @RequestMapping(value = "chart", method = RequestMethod.GET)
    public String main_chart(HttpServletRequest req,
            HttpServletResponse res) throws Exception
    {
        return "/view/chart/chart.jsp";
    }
}

