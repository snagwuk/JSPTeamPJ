package controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import anno.ActionAnnotation;
import anno.RequestMapping;
import anno.RequestMapping.RequestMethod;
import dao.MybatisRentDao;
import model.Location;
import model.Rent;
import model.User;

public class RentController extends ActionAnnotation
{
    
    @Override
    public void initProcess(HttpServletRequest request, HttpServletResponse res)
    {
        
    }
    
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String Rent_listGet(HttpServletRequest request,
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
            {
                session.setAttribute("pageNum", 1);
            }
        }
        currentPage = (int) session.getAttribute("pageNum");
        
        int pageSize = 5;
        int startRow = (currentPage - 1) * pageSize + 1;
        int endRow = currentPage * pageSize;
        
        MybatisRentDao service = MybatisRentDao.getInstance();
        int count = service.getRentCount();
        
        List<Rent> rentList = service.getRentList(startRow, endRow);
        
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
        request.setAttribute("rentList", rentList);
        
        return "/view/rent/list.jsp";
    }
    
    @RequestMapping(value = "mylist", method = RequestMethod.GET)
    public String Rent_mylist(HttpServletRequest request,
            HttpServletResponse res)
    {
        User user = (User) request.getSession().getAttribute("authUser");
        MybatisRentDao service = MybatisRentDao.getInstance();
        List<Rent> rentList = service.getMyList(user.getId());
        request.setAttribute("rentList", rentList);
        return "/view/rent/myRent.jsp";
    }
    
    @RequestMapping(value = "rent", method = RequestMethod.GET)
    public String rent_rentForm(HttpServletRequest req, HttpServletResponse res)
            throws Exception
    {
        return "/view/rent/rentForm.jsp";
    }
    
    @RequestMapping(value = "rent", method = RequestMethod.POST)
    public String ReservationPro(HttpServletRequest req,
            HttpServletResponse res) throws Exception
    {
        User user = (User) req.getSession().getAttribute("authUser");
        
        Rent newRent = new Rent(user.getId(), req.getParameter("name"),
                req.getParameter("location"), req.getParameter("r_date"),
                req.getParameter("purpose"), req.getParameter("capacity"));
        
        Map<String, Boolean> errors = new HashMap<>();
        req.setAttribute("errors", errors);
        newRent.validate(errors);
        
        if (!errors.isEmpty())
        {
            req.setAttribute("message", "신청서에 빈칸이 있습니다.");
            req.setAttribute("url", "rent/rent");
            return "/view/alert.jsp";
        }
        
        MybatisRentDao dbPro = MybatisRentDao.getInstance();
        
        int check = dbPro.duplication(newRent);
        
        req.setAttribute("check", check);
        
        if (check == 0)
        {
            System.out.println("check : " + check);
            dbPro.insert(newRent);
            req.setAttribute("message", "신청 성공");
            req.setAttribute("url", "rent/locationlist");
            return "/view/alert.jsp";
        }
        else
        {
            req.setAttribute("message", "신청 실패 !! 이미 신청된 날짜와 장소입니다.");
            req.setAttribute("url", "rent/list");
            return "/view/alert.jsp";
        }
        
    }
    
    @RequestMapping(value = "content", method = RequestMethod.GET)
    public String Rent_content(HttpServletRequest request,
            HttpServletResponse res)
    {
        int no = 0;
        try
        {
            no = Integer.parseInt(request.getParameter("no"));
        }
        catch (NumberFormatException e)
        {
            return "redirect:/rent/list";
        }
        MybatisRentDao dbPro = MybatisRentDao.getInstance();
        
        Rent rent = dbPro.getRent(no);
        request.setAttribute("rent", rent);
        return "/view/rent/content.jsp";
        
    }
    
    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String board_delete(HttpServletRequest request,
            HttpServletResponse res)
    {
        int no = Integer.parseInt(request.getParameter("no"));
        User user = (User) request.getSession().getAttribute("authUser");
        MybatisRentDao dbPro = MybatisRentDao.getInstance();
        
        Rent temp = dbPro.getRent(no);
        if (user == null)
        {
            request.setAttribute("message", "삭제 실패! 비로그인 입니다.");
            request.setAttribute("url", "rent/content?no=" + no);
            return "/view/alert.jsp";
        }
        System.out.println(!user.getId().equals(temp.getId()));
        System.out.println(user.getAdmin() == 0);
        if (!user.getId().equals(temp.getId()) && user.getAdmin() == 0)
        {
            request.setAttribute("message", "삭제 실패! 본인의 신청서가 아닙니다.");
            request.setAttribute("url", "rent/content?no=" + no);
            return "/view/alert.jsp";
        }
        
        dbPro.deleteRent(no);
        
        request.setAttribute("message", "삭제 완료");
        request.setAttribute("url", "rent/list");
        return "/view/alert.jsp";
    }
    
    @RequestMapping(value = "ans", method = RequestMethod.POST)
    public String Rent_check(HttpServletRequest request,
            HttpServletResponse response) throws Exception
    {
        
        Rent rentAnswer = null;
        int no = Integer.parseInt(request.getParameter("no"));
        String reason = request.getParameter("reason");
        System.out.println(request.getParameter("status"));
        int status = Integer.parseInt(request.getParameter("status"));
        rentAnswer = new Rent(no, status, reason);
        
        if (status == 2 && (reason == null || reason.equals("")))
        {
            request.setAttribute("message", "반려 실패! 반려사유를 기재하세요");
            request.setAttribute("url", "rent/content?no=" + no);
            return "/view/alert.jsp";
        }
        
        MybatisRentDao service = MybatisRentDao.getInstance();
        service.adminAnswer(rentAnswer);
        
        Rent rent = service.getRent(no);
        request.setAttribute("rent", rent);
        return "redirect:/rent/content";
    }
    
    /// 관리자 모드
    @RequestMapping(value = "locationlist")
    public String location_list(HttpServletRequest request,
            HttpServletResponse response) throws Exception
    {
        MybatisRentDao rentDao = MybatisRentDao.getInstance();
        
        List<Location> listlocations = rentDao.selectList();
        
        request.setAttribute("listlocations", listlocations);
        
        return "/view/rent/locationList.jsp";
    }
    
    @RequestMapping(value = "locationdelete", method = RequestMethod.GET)
    public String location_delete(HttpServletRequest request,
            HttpServletResponse response)
    {
        
        String locationCode = request.getParameter("locationCode");
        
        MybatisRentDao service = MybatisRentDao.getInstance();
        service.deleteLocation(locationCode);
        
        request.setAttribute("message", "목록 삭제 완료");
        request.setAttribute("url", "rent/locationlist");
        return "/view/alert.jsp";
    }
    
    @RequestMapping(value = "locationwrite", method = RequestMethod.POST)
    public String location_writePro(HttpServletRequest request,
            HttpServletResponse res)
    {
        Location location = new Location(request.getParameter("mcategory"),
                request.getParameter("scategory"),
                request.getParameter("locationCode"),
                Integer.parseInt(request.getParameter("cost")),
                Integer.parseInt(request.getParameter("capacity")));
        try
        {
            MybatisRentDao service = MybatisRentDao.getInstance();
            service.insertLocation(location);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return "/view/rent/list.jsp";
        }
        request.setAttribute("message", "새 대관장소 작성 완료");
        request.setAttribute("url", "rent/locationlist");
        return "/view/alert.jsp";
    }
    
    
}
