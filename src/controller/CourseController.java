package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import anno.ActionAnnotation;
import anno.RequestMapping;
import anno.RequestMapping.RequestMethod;
import dao.MybatisCourseDao;
import model.Apply;
import model.Course;
import model.Trainer;
import model.User;

public class CourseController extends ActionAnnotation
{
    
    @Override
    public void initProcess(HttpServletRequest request,
            HttpServletResponse response)
    {
        
    }
    
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String course_coureList(HttpServletRequest req,
            HttpServletResponse res) throws Exception
    {
        MybatisCourseDao gprogramDao = MybatisCourseDao.getInstance();
        
        List<Course> listprograms = gprogramDao.select();
        
        req.setAttribute("listprograms", listprograms);
        
        Date day = new Date();
        SimpleDateFormat date = new SimpleDateFormat("YYYY-MM-dd");
        String toDay = date.format(day);
        req.setAttribute("toDay", toDay);
        
        return "/view/course/coureList.jsp";
    }
    
    /* 나의 수강목록 */
    @RequestMapping(value = "mylist", method = RequestMethod.GET)
    public String course_myListCourseForm(HttpServletRequest req,
            HttpServletResponse res) throws Exception
    {
    

    	User user = (User) req.getSession().getAttribute("authUser");
    	        String id = user.getId();
    	        if(req.getParameter("id") != null)
    	            id = req.getParameter("id");
            
       
        List<Course> myprogramlist = null;
        List<Apply> myprogramcodes = null;
        
        Date day = new Date();
        SimpleDateFormat date = new SimpleDateFormat("YYYY-MM-dd");
        String toDay = date.format(day);
        req.setAttribute("toDay", toDay);
        
        try
        {
            MybatisCourseDao gprogramDao = MybatisCourseDao.getInstance();
            myprogramcodes = gprogramDao.myprogramcodes(id);
            myprogramlist = gprogramDao.selectProgramsByCode(myprogramcodes);
            
        }
        catch (Exception e)
        {   
        }
        
        req.setAttribute("myprogramlist", myprogramlist);
        req.setAttribute("myprogramcodes", myprogramcodes);
        return "/view/course/myListCourse.jsp";
    }
    
    @RequestMapping(value = "grade", method = RequestMethod.POST)
    public String course_myListSurvey(HttpServletRequest req,
            HttpServletResponse res) throws Exception
    {
        
        String code = req.getParameter("code");
        int grade = Integer.parseInt(req.getParameter("grade"));
        User user = (User) req.getSession().getAttribute("authUser");
        Apply apply = new Apply(user.getId(), user.getName(), code, grade);
        
        List<Course> myprogramlist = null;
        List<Apply> myprogramcodes = null;
        
        Date day = new Date();
        SimpleDateFormat date = new SimpleDateFormat("YYYY-MM-dd");
        String toDay = date.format(day);
        req.setAttribute("toDay", toDay);
        
        MybatisCourseDao gprogramDao = MybatisCourseDao.getInstance();
        
        try
        {
            gprogramDao.insertGrade(apply);
            
        }
        catch (Exception e)
        {
            
        }
        
        try
        {
            myprogramcodes = gprogramDao.myprogramcodes(user.getId());
            myprogramlist = gprogramDao.selectProgramsByCode(myprogramcodes);
            
        }
        catch (Exception e)
        {
            
        }
        
        req.setAttribute("myprogramlist", myprogramlist);
        req.setAttribute("myprogramcodes", myprogramcodes);
        
        return "/view/course/myListCourse.jsp";
    }
    
    @RequestMapping(value = "apply", method = RequestMethod.GET)
    public String course_apply(HttpServletRequest req,
            HttpServletResponse res) throws Exception
    {
        String code = req.getParameter("code");
        System.out.println(code);
        Course selectCourse = null;
        Trainer selectTrainer = null;
        MybatisCourseDao gprogramDao = MybatisCourseDao.getInstance();
        try
        {
            selectCourse = gprogramDao.selectCourseByCode(code);
            selectTrainer = gprogramDao.selectTainerByCode(code);
            
        }
        catch (Exception e)
        {
            return "";
        }
        req.setAttribute("selectCourse", selectCourse);
        req.setAttribute("selectTrainer", selectTrainer);
        return "/view/course/applyForm.jsp";
    }
    
    @RequestMapping(value = "apply", method = RequestMethod.POST)
    public String course_programPro(HttpServletRequest req,
            HttpServletResponse res) throws Exception
    {
     
        User user = (User) req.getSession().getAttribute("authUser");
        
        Apply applyInfo = new Apply(user.getId(), user.getName(),
                req.getParameter("code"));
       
        MybatisCourseDao gprogramDao = MybatisCourseDao.getInstance();
        try
        {
            
            int check = gprogramDao.applyDuplicate(applyInfo);
            System.out.println("check : "+ check);
            if (check == 1)
            {
                req.setAttribute("ff", check);
                return "/view/course/applyForm.jsp";
            }
            
            gprogramDao.insert(applyInfo);
            req.setAttribute("message", "수강 신청 완료");
            req.setAttribute("url", req.getContextPath() +"/course/mylist");
            return "/view/alert.jsp";
        }
        catch (Exception e)
        {
            
            return "/view/course/coureList.jsp";
        }
        
    }
    
    //admin 강사 관리 부분
    @RequestMapping(value = "trainerlist", method = RequestMethod.GET)
    public String trainer_list(HttpServletRequest req,
            HttpServletResponse res) throws Exception
    {
        MybatisCourseDao gprogramDao = MybatisCourseDao.getInstance();
        List<Trainer> trainerlist = gprogramDao.getTrainerList();
        req.setAttribute("trainerlist", trainerlist);
        return "/view/course/adminTrainerList.jsp";
        
    }
  
    @RequestMapping(value = "trainernew", method = RequestMethod.POST)
    public String trainer_newpost(HttpServletRequest req,
            HttpServletResponse res) throws Exception
    {
        Trainer trainer = new Trainer(req.getParameter("train_code"), 
                                      req.getParameter("name"),
                                      req.getParameter("email"),
                                      req.getParameter("license"),
                                      req.getParameter("tel") );
      
        MybatisCourseDao gprogramDao = MybatisCourseDao.getInstance();
        gprogramDao.trainernew(trainer);
        req.setAttribute("message", "강사 추가 완료");
        req.setAttribute("url", "course/trainerlist");
        return "/view/alert.jsp";
    }
   
    @RequestMapping(value = "trainerdelete", method = RequestMethod.GET)
    public String trainer_delete(HttpServletRequest req,
            HttpServletResponse res) throws Exception
    {
        MybatisCourseDao gprogramDao = MybatisCourseDao.getInstance();
        gprogramDao.trainerdelete(req.getParameter("train_code"));
        
        req.setAttribute("message", "강사 삭제 완료");
        req.setAttribute("url", "course/trainerlist");
        return "/view/alert.jsp";
    }
    
    //apply 목로
    

    
}
