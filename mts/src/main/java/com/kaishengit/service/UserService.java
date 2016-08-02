package com.kaishengit.service;

import com.google.common.collect.Maps;
import com.kaishengit.dao.DeptDao;
import com.kaishengit.dao.RoleDao;
import com.kaishengit.dao.UserDao;
import com.kaishengit.dao.UserLogDao;
import com.kaishengit.pojo.Dept;
import com.kaishengit.pojo.Role;
import com.kaishengit.pojo.User;
import com.kaishengit.pojo.UserLog;
import com.kaishengit.util.EditUtil;
import com.kaishengit.util.ShiroUtil;
import org.joda.time.DateTime;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
@Transactional
public class UserService {

    @Inject
    private UserDao userDao;
    @Inject
    private UserLogDao userLogDao;
    @Inject
    private RoleDao roleDao;
    @Inject
    private DeptDao deptDao;

    /**
     * 创建用户登录日志
     * @param ip
     */
    public void saveUserLogin(String ip) {
        UserLog userLog = new UserLog();
        userLog.setLoginip(ip);
        userLog.setLogintime(DateTime.now().toString("yyyy-MM-dd HH:mm"));
        User user = ShiroUtil.getCurrentUser();
        userLog.setUser(user);

        userLogDao.save(userLog);
    }

    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }


//    public Long findCurrentUserLogCount() {
//        Map<String,Object> param = Maps.newHashMap();
//        param.put("userId",ShiroUtil.getCurrentUserID());
//        return userLogDao.countByParam(param);
//    }

    public List<User> findAllUser() {
        return userDao.findAll();
    }

    public List<Role> findAllRole() {
        return roleDao.findAll();
    }

    public void save(User user) {
        userDao.save(user);

    }

    public List<UserLog> findLogByUser() {
        return userLogDao.findUserLog();
    }

    public void edit(User user) {
        User queryUser = findById(user.getId());
        EditUtil.copyProperties(user,queryUser);
        save(queryUser);
    }

    public User findById(Integer id) {
        return userDao.findById(id);
    }


    public void delUser(Integer id) {
        User user = new User();
        if (user != null){
            //删除日志
            List<UserLog> userLogList = userLogDao.findById(id);
            if (!userLogList.isEmpty()){
                userLogDao.delLog(userLogList);
            }
        }
        userDao.delete(id);
    }

    /**
     * 根据用户名查找
     * @param username
     * @return
     */
    public User findByUserName(String username) {
        return userDao.findByUsername(username);
    }

    /**
     * 修改密码
     * @param password
     */
    public void changePassword(String password) {
        User user = ShiroUtil.getCurrentUser();
        user.setPassword(password);
        userDao.save(user);
    }

    /**
     * 重置密码
     * @param id
     */
    public void resetUserPassword(Integer id) {
        User user = userDao.findById(id);
        if (user != null){
            user.setPassword("000000");
            userDao.save(user);
        }
    }

    public List<Dept> findAllDept() {
        return deptDao.findAll();
    }


}
