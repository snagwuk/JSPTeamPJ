package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import anno.ActionAnnotation;
import anno.RequestMapping;
import anno.RequestMapping.RequestMethod;

import dao.MybatisMinwonDao;
import model.Minwon;
import model.User;
import model.Like;

public class MinwonController extends ActionAnnotation
{ // ActionAnnotation 방법
    
    String getClientIP(HttpServletRequest request)
    {
        
        String ip = request.getHeader("X-FORWARDED-FOR");
        
        if (ip == null || ip.length() == 0)
            ip = request.getHeader("Proxy-Client-IP");
        
        if (ip == null || ip.length() == 0)
            ip = request.getHeader("WL-Proxy-Client-IP");
        
        if (ip == null || ip.length() == 0) ip = request.getRemoteAddr();
        
        return ip;
    }
    
    public void initProcess(HttpServletRequest request, HttpServletResponse res)
    {
        // boardController 해당되는 애들이 맨 처음으로 공통적으로 실행되어야 하는 부분 정의해놓기
        
        HttpSession session = request.getSession();
        
        try
        {
            request.setCharacterEncoding("utf-8");
        }
        catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }
    }
    
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String minwon_listGET(HttpServletRequest request,
            HttpServletResponse res)
    {
        
        HttpSession session = request.getSession();
        
        int currentPage = 0;
        
        try
        {
            currentPage = Integer.parseInt(request.getParameter("pageNum"));
            session.setAttribute("pageNum", currentPage);
        }
        catch (Exception e)
        {
            
            if (session.getAttribute("pageNum") == null)
                session.setAttribute("pageNum", 1);
        }
        currentPage = (int) session.getAttribute("pageNum");
        
        int pageSize = 5;
        int startRow = (currentPage - 1) * pageSize + 1;
        int endRow = currentPage * pageSize;
        
        MybatisMinwonDao service = MybatisMinwonDao.getInstance();
        int count = service.getArticleCount();
        
        List<Minwon> minwonList = service.getArticles(startRow, endRow);
       
        
        int number = count - (currentPage - 1) * pageSize;
        int bottomLine = 3;
        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
        int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
        int endPage = startPage + bottomLine - 1;
        
        if (endPage > pageCount) endPage = pageCount;
        
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("startRow", startRow);
        request.setAttribute("endRow", endRow);
        request.setAttribute("count", count);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("number", number);
        request.setAttribute("bottomLine", bottomLine);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("pageCount", pageCount);
        
        request.setAttribute("minwonList", minwonList);
        
        return "/view/minwon/list.jsp";
    }
    
    @RequestMapping(value = "mylist", method = RequestMethod.GET)
    public String minwon_mylist(HttpServletRequest request,
            HttpServletResponse res)
    {
        User user = (User) request.getSession().getAttribute("authUser");
        MybatisMinwonDao service = MybatisMinwonDao.getInstance();
        
        List<Minwon> myminwon = service.getArticles(user.getId());
        
        request.setAttribute("minwonList", myminwon);
        
        return "/view/minwon/myMinwon.jsp";
    }
    
    @RequestMapping(value = "write", method = RequestMethod.GET)
    public String minwon_writeForm(HttpServletRequest request,
            HttpServletResponse res)
    {
        return "/view/minwon/writeForm.jsp";
    }
    
    @RequestMapping(value = "write", method = RequestMethod.POST)
    public String minwon_writePro(HttpServletRequest request,
            HttpServletResponse res)
    {
        
        User user = (User) request.getSession().getAttribute("authUser");
        
        Minwon article = new Minwon(request.getParameter("subject"),
                user.getId(), request.getParameter("content"));
        try
        {
            MybatisMinwonDao service = MybatisMinwonDao.getInstance();
            service.insertMinwon(article);
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return "/view/minwon/list.jsp";
        }
        request.setAttribute("message", "민원 작성 완료");
        request.setAttribute("url", "minwon/list?pageNum=1");
        return "/view/alert.jsp";
    }
    
    @RequestMapping(value = "content", method = RequestMethod.GET)
    public String minwon_content(HttpServletRequest request,
            HttpServletResponse res)
    {
        boolean check = true;
        if(request.getParameter("check") != null && request.getParameter("check").equals("1"))
            check = false;
        User user = (User) request.getSession().getAttribute("authUser");
        String id = "";
        int num = 0;
        if (user == null)
            id = getClientIP(request);
        else
            id = user.getId();
        try
        {
            num = Integer.parseInt(request.getParameter("num"));
        }
        catch (NumberFormatException e)
        {
            return "redirect:/minwon/list";
        }
        
        MybatisMinwonDao service = MybatisMinwonDao.getInstance();
        Minwon article = service.getArticle(num,check);    
        
        Like like = new Like(num, id);
        
        int likeCount = service.getLikeCount(num);
        int result = service.checkLike(like);
        
        request.setAttribute("article", article);
        request.setAttribute("likeCount", likeCount);
        request.setAttribute("result", result);
        
        return "/view/minwon/content.jsp";
    }
    
    @RequestMapping(value = "modify", method = RequestMethod.GET)
    public String minwon_modifyForm(HttpServletRequest request,
            HttpServletResponse response)
    {
        
        int num = Integer.parseInt(request.getParameter("num"));
        
        MybatisMinwonDao service = MybatisMinwonDao.getInstance();
        Minwon article = service.getArticle(num,true);
        
        int likeCount = service
                .getLikeCount(Integer.parseInt(request.getParameter("num")));
        
        request.setAttribute("article", article);
        request.setAttribute("likeCount", likeCount);
        
        return "/view/minwon/modify.jsp";
    }
    
    @RequestMapping(value = "modify", method = RequestMethod.POST)
    public String minwon_modifyPro(HttpServletRequest request,
            HttpServletResponse response) throws Exception
    {
        int num = Integer.parseInt(request.getParameter("num"));
        Minwon newArticle = new Minwon(num,
                request.getParameter("subject"),
                request.getParameter("content"));
        
        MybatisMinwonDao service = MybatisMinwonDao.getInstance();
        service.updateContent(newArticle);
        
        return "redirect:/minwon/content?num="+num;
    }
    
    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String minwon_delete(HttpServletRequest request,
            HttpServletResponse response)
    {
        
        int num = Integer.parseInt(request.getParameter("num"));
        
        MybatisMinwonDao service = MybatisMinwonDao.getInstance();
        service.deleteArticle(num);
        
        request.setAttribute("message", "민원 삭제 완료");
        request.setAttribute("url", "minwon/list");
        return "/view/alert.jsp";
    }
    
    @RequestMapping(value = "ans", method = RequestMethod.POST)
    public String minwon_ans(HttpServletRequest request,
            HttpServletResponse response)
    {
        int num = Integer.parseInt(request.getParameter("num"));
        Minwon ans_article = new Minwon(
                num,
                request.getParameter("ans_content"));
        
        MybatisMinwonDao service = MybatisMinwonDao.getInstance();
        service.AnswerArticle(ans_article);
        
        return "redirect:/minwon/content?num="+num;
    }
    
    @RequestMapping(value = "like", method = RequestMethod.GET)
    public String minwon_like(HttpServletRequest request,
            HttpServletResponse response)
    {
        User user = (User) request.getSession().getAttribute("authUser");
        String id = "";
        if (user == null)
            id = getClientIP(request);
        else
            id = user.getId();
        
        int num = Integer.parseInt(request.getParameter("num"));
        
        Like like = new Like(num, id);
        
        MybatisMinwonDao service = MybatisMinwonDao.getInstance();
        if (service.checkLike(like) == 0)
            service.insertLike(like);
        else
            service.deleteLike(like);
   
        return "redirect:/minwon/content?num="+num +"&check=1";
        
    }
    
}
