package controller;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import anno.ActionAnnotation;
import anno.RequestMapping;
import anno.RequestMapping.RequestMethod;
import dao.MybatisMemberDao;
import dao.MybatisMinwonDao;
import dao.MybatisRentDao;
import dao.MinwonDao;
import dao.RentDao;
import excep.DuplicateldException;
import excep.InvalidPasswordException;
import excep.MemberNotFoundException;
import model.User;
import util.JdbcUtil;
import excep.LoginFailException;
import model.Member;
import model.Minwon;
import model.Rent;

public class MemberController extends ActionAnnotation
{
    
    @Override
    public void initProcess(HttpServletRequest request,
            HttpServletResponse response)
    {
        // TODO Auto-generated method stub
        
    }
  
    @RequestMapping(value = "main")
    public String member_main(HttpServletRequest req, HttpServletResponse res)
            throws Exception
    {
        return "/view/main.jsp";
    }
    
    @RequestMapping(value = "contact")
	public String member_contact(HttpServletRequest req, HttpServletResponse res) throws Exception {
		return "/view/contact.jsp";
	}
    
    @RequestMapping(value = "join")
    public String member_joinForm(HttpServletRequest req,
            HttpServletResponse res) throws Exception
    {
        return "/view/member/joinForm.jsp";
    }
    
    @RequestMapping(value = "join", method = RequestMethod.POST)
    public String member_joinPro(HttpServletRequest req,
            HttpServletResponse response) throws Exception
    {
        Member newMember = new Member(req.getParameter("id"),
                req.getParameter("passwd"), req.getParameter("name"),
                req.getParameter("birth"), Integer.parseInt(req.getParameter("sex")),
                req.getParameter("phone"), req.getParameter("address"),
                req.getParameter("confirmpasswd"));
        
        Map<String, Boolean> errors = new HashMap<>();
        req.setAttribute("errors", errors);
        
        newMember.vaildate(errors);
        
        if (!errors.isEmpty()) 
            return "/view/member/joinForm.jsp";
        try
        {
            MybatisMemberDao memberDao = MybatisMemberDao.getInstance();
            Member member = memberDao.selectById(newMember.getId());
            if (member != null)
                throw new DuplicateldException();
            
            memberDao.insert(newMember);
            
            User user = new User(newMember.getId(), newMember.getName(),
                    newMember.getAdmin());
            req.getSession().setAttribute("authUser", user);
            
            req.setAttribute("message", "회원가입 완료");
            req.setAttribute("url", "main");
            return "/view/alert.jsp";
            
        }
        catch (DuplicateldException e)
        {
            errors.put("duplicateId", Boolean.TRUE);
            return "/view/member/joinForm.jsp";
        }
    }
    
    @RequestMapping(value = "login")
    public String member_loginForm(HttpServletRequest req,
            HttpServletResponse res) throws Exception
    {
        return "/view/member/loginForm.jsp";
    }
    
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String member_loginPro(HttpServletRequest req,
            HttpServletResponse res) throws Exception
    {
        
        String id = trim(req.getParameter("id"));
        String passwd = trim(req.getParameter("passwd"));
        
        Map<String, Boolean> errors = new HashMap<>();
        req.setAttribute("errors", errors);
        
        if (id == null || id.isEmpty()) errors.put("id", Boolean.TRUE);
        if (passwd == null || passwd.isEmpty())
            errors.put("password", Boolean.TRUE);
        
        if (!errors.isEmpty()) 
            return "/view/member/loginForm.jsp";
        
        try
        {
            MybatisMemberDao memberDao = MybatisMemberDao.getInstance();
            
            Member member = memberDao.selectById(id);
            if (member == null) throw new LoginFailException();
            if (!member.matchPassword(passwd)) throw new LoginFailException();
            
            User user = new User(member.getId(), member.getName(),
                    member.getAdmin());
            req.getSession().setAttribute("authUser", user);
            
        }
        catch (LoginFailException e)
        {
            errors.put("idOrPwNotMatch", Boolean.TRUE);
            return "/view/member/loginForm.jsp";
        }
        req.setAttribute("message", "로그인 성공");
        req.setAttribute("url", "member/main");
        return "/view/alert.jsp";
    }
    
    private String trim(String str)
    {
        return str == null ? null : str.trim();
    }
    
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String member_logout(HttpServletRequest req, HttpServletResponse res)
            throws Exception
    {
        HttpSession session = req.getSession(false);
        if (session != null)
        {
            session.invalidate();
        }
        return "/view/main.jsp";
    }
    
    @RequestMapping(value = "changeinfo")
    public String member_changeinfoForm(HttpServletRequest req,
            HttpServletResponse res) throws Exception
    {
        User user = (User) req.getSession().getAttribute("authUser");
        
        try
        {
            MybatisMemberDao memberDao = MybatisMemberDao.getInstance();
            Member myInfo = memberDao.selectById(user.getId());
            
            req.setAttribute("myInfo", myInfo);
            return "/view/member/changeInfoForm.jsp";
            
        }
        catch (MemberNotFoundException e)
        {
            req.getServletContext().log("not login", e);
            res.sendError(HttpServletResponse.SC_NOT_FOUND);
            return null;
        }
       
        
    }
    
    @RequestMapping(value = "changeinfo", method = RequestMethod.POST)
    public String member_changeinfoPro(HttpServletRequest req,
            HttpServletResponse res) throws Exception
    {
        User user = (User) req.getSession().getAttribute("authUser");
        
        Map<String, Boolean> errors = new HashMap<>();
        req.setAttribute("errors", errors);
        
        String curPwd = req.getParameter("curPwd");
        String newPwd = req.getParameter("newPwd");
        
        if (curPwd == null || curPwd.isEmpty())
            errors.put("curPwd", Boolean.TRUE);
        if (newPwd == null || newPwd.isEmpty())
            errors.put("newPwd", Boolean.TRUE);
        
        if (!errors.isEmpty()) return "/view/member/changeInfoForm.jsp";
        
        try
        {
            MybatisMemberDao memberDao = MybatisMemberDao.getInstance();
            Member member = memberDao.selectById(user.getId());
            if (member == null) { throw new MemberNotFoundException(); }
            if (!member.matchPassword(member
                    .getPasswd())) { throw new InvalidPasswordException(); }
            member.changePassword(newPwd);
            member.setPhone(req.getParameter("phone"));
            member.setAddress(req.getParameter("address"));
            memberDao.update(member);
            
            req.setAttribute("message", "회원 정보 수정 완료");
            req.setAttribute("url", "member/myinfo");
            return "/view/alert.jsp";
        }
        catch (InvalidPasswordException e)
        {
            errors.put("badCurPwd", Boolean.TRUE);
            return "/view/member/changeInfoForm.jsp";
        }
        catch (MemberNotFoundException e)
        {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return "/main.jsp";
        }
       
    }
    

    @RequestMapping(value = "myinfo")
    public String member_myInfo(HttpServletRequest req, HttpServletResponse res)
            throws Exception
    {
        
        User user = (User) req.getSession().getAttribute("authUser");
        
        try
        {
            MybatisMemberDao memberDao = MybatisMemberDao.getInstance();
            Member myInfo = memberDao.selectById(user.getId());
            
            req.setAttribute("myInfo", myInfo);
            return "/view/member/myInfo.jsp";
            
        }
       
        catch (MemberNotFoundException e)
        {
            req.getServletContext().log("not login", e);
            res.sendError(HttpServletResponse.SC_NOT_FOUND);
            return "redirect:/member/mypage";
        }
    }
    
    @RequestMapping(value = "mypage")
    public String member_mypage(HttpServletRequest req, HttpServletResponse res)
            throws Exception
    {
        return "/view/member/mypage.jsp";
    }
    
    
    // 관리자 권한 기능 
    @RequestMapping(value = "list")
    public String member_lists(HttpServletRequest req, HttpServletResponse res)
            throws Exception
    {
        MybatisMemberDao memberDao = MybatisMemberDao.getInstance();
        List<Member> memberlist = memberDao.memberList();
        req.setAttribute("memberlist", memberlist);
        return "/view/member/list.jsp";
    }
    
    @RequestMapping(value = "adminpage")
    public String  admin_page(HttpServletRequest req, HttpServletResponse res)
            throws Exception
    {
        User user = (User) req.getSession().getAttribute("authUser");
        if(user.getAdmin() == 0)
        {
            req.setAttribute("message", "관리자가 아닙니다.");
            req.setAttribute("url", "member/main");
            return "/view/alert.jsp";
        }
        

        MybatisMinwonDao service = MybatisMinwonDao.getInstance();
        List<Minwon> adminminwon = service.getAdminArticles();
        //req.setAttribute("minwonsize",adminminwon.size() );
        req.setAttribute("adminminwon", adminminwon);
        
        MybatisRentDao rentservice = MybatisRentDao.getInstance();
        List<Rent> adminrent = rentservice.getAdminList();
        //req.setAttribute("rentsize",adminrent.size() );
        req.setAttribute("adminrent", adminrent);
        
        return "/view/member/adminpage.jsp";
    }
    
    
    
    
}