package com.kaishengit.controller;

import com.kaishengit.pojo.Dept;
import com.kaishengit.pojo.Disease;
import com.kaishengit.pojo.Role;
import com.kaishengit.pojo.User;
import com.kaishengit.pojo.UserLog;
import com.kaishengit.service.DeptService;
import com.kaishengit.service.DiseaseService;
import com.kaishengit.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Inject
    private UserService userService;
    @Inject
    private DeptService deptService;
    @Inject
    private DiseaseService diseaseService;

    /**
     * 获取用户列表
     * @param model
     * @return
     */
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String list(Model model){
        List<User> userList = userService.findAllUser();
        List<UserLog> userLogList = userService.findLogByUser();
        model.addAttribute("userlist",userList);
        model.addAttribute("userLogList",userLogList);
        return "admin/userlist";
    }

    /**
     * 添加用户
     * @param model
     * @return
     */
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String addUser(Model model){
        List<Role> roleList = userService.findAllRole();
        model.addAttribute("roleList",roleList);
        return "admin/newuser";
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String addUser(User user, RedirectAttributes redirectAttributes){
        userService.save(user);
        redirectAttributes.addFlashAttribute("message","添加成功");
        return "redirect:/admin/user";
    }

    /**
     * 删除用户
     * @param id
     * @return
     */
    @RequestMapping(value = "{id:\\d+}/del",method = RequestMethod.GET)
    public String delUser(@PathVariable Integer id){
        userService.delUser(id);
        return "redirect:/admin/user";
    }

    /**
     * 修改用户信息
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "{id:\\d+}/edit",method = RequestMethod.GET)
    public String editUser(Model model,@PathVariable Integer id){
        User user = userService.findById(id);
        List<Role> roleList = userService.findAllRole();
        model.addAttribute("roleList",roleList);
        model.addAttribute("user",user);
        return "admin/edituser";
    }

    @RequestMapping(value = "{id:\\d+}/edit",method = RequestMethod.POST)
    public String editUser(User user){
        userService.save(user);
        return "redirect:/admin/user";
    }

    /**
     * 验证用户名是否存在(Ajax调用)
     * @param username
     * @return
     */
    @RequestMapping(value = "/user/checkusername",method = RequestMethod.GET)
    @ResponseBody
    public String checkUsername(String username){
        User user = userService.findByUserName(username);
        if (user == null){
            return "true";
        }else {
            return "false";
        }
    }

    /**
     * 重置密码(000000)
     * @param id
     * @return
     */
    @RequestMapping(value = "/resetpassword",method = RequestMethod.POST)
    @ResponseBody
    public String resetPassword(Integer id){
        userService.resetUserPassword(id);
        return "success";
    }

    /**
     * 获取科室列表
     * @param model
     * @return
     */
    @RequestMapping(value = "/dept", method = RequestMethod.GET)
    public String deptlist(Model model){
        List<Dept> deptList = deptService.findAllDept();
        model.addAttribute("deptList",deptList);
        return "admin/deptlist";
    }

    /**
     * 添加科室
     * @return
     */
    @RequestMapping(value = "add/dept",method = RequestMethod.GET)
    public String addDept(){
        return "admin/newdept";
    }

    @RequestMapping(value = "add/dept", method = RequestMethod.POST)
    public String addDept(Dept dept){
        deptService.save(dept);
        return "redirect:/admin/dept";
    }

    /**
     * 删除科室
     * @param id
     * @return
     */
    @RequestMapping(value = "dept/{id:\\d+}/del",method = RequestMethod.GET)
    public String delDept(@PathVariable Integer id){
        deptService.delDept(id);
        return "redirect:/admin/dept";
    }

    /**
     * 修改科室信息
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "dept/{id:\\d+}/edit",method = RequestMethod.GET)
    public String editDept(Model model,@PathVariable Integer id){
        Dept dept = deptService.editDept(id);
        model.addAttribute("dept",dept);
        return "admin/editdept";
    }

    @RequestMapping(value = "dept/{id:\\d+}/edit",method = RequestMethod.POST)
    public String editDept(Dept dept){
        deptService.save(dept);
        return "redirect:/admin/dept";
    }

    /**
     * 获取疾病列表
     * @param model
     * @return
     */
    @RequestMapping(value = "/disease",method = RequestMethod.GET)
    public String disList(Model model){
        List<Dept> deptList = deptService.findAllDept();
        model.addAttribute("deptList",deptList);
        return "admin/diseaselist";
    }

    @RequestMapping(value = "add/disease",method = RequestMethod.GET)
    public String saveDis(Model model){
        List<Dept> deptList = deptService.findAllDept();
        model.addAttribute("deptList",deptList);
        return "admin/newdise";
    }

    @RequestMapping(value = "add/disease",method = RequestMethod.POST)
    public String addDis(Disease disease){
        diseaseService.save(disease);
        return "admin/newdise";
    }

}
