package com.kaishengit.util;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.joda.time.DateTime;
import org.joda.time.Period;
import org.joda.time.PeriodType;
import org.junit.Assert;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

public class EditUtil{


    /**
     * @param card 身份证号 exp : 410156199512063589
     * @return map 集合
     * birthday：1995-12-06
     * sex ： 女
     * age ： 20
     */
    public static Map<String, String> getPersonInfByIdentifyCard(String card) {

        Map<String, String> map = Maps.newHashMap();
        String year = card.substring(6, 10);
        String month = card.substring(10, 12);
        String day = card.substring(12, 14);
        String sex = card.substring(16, 17);
        map.put("sex", Integer.valueOf(sex) % 2 == 0 ? "女" : "男");
        map.put("birthday", year + "-" + month + "-" + day);
        DateTime dateTime = new DateTime(
                Integer.parseInt(year),
                Integer.parseInt(month),
                Integer.parseInt(day), 0, 0);
        DateTime dateTime1 = DateTime.now();
        Integer age = new Period(dateTime, dateTime1, PeriodType.years()).getYears();
        map.put("age", String.valueOf(age));
        return map;
    }


    public static void copyProperties(Object source, Object target) {

        Assert.assertNotNull(source);
        Assert.assertNotNull(target);
        Class<?> typeSource = source.getClass();
        Class<?> typeTarget = target.getClass();
        System.out.println(typeSource);
        System.out.println(typeTarget);
        if (!typeSource.equals(typeTarget)) {
            throw new RuntimeException("对象类型不匹配");
        }
        // 获取属性集合
        List<String> propertys = Lists.newArrayList();
        Field[] fs = typeSource.getDeclaredFields();
        for (Field field : fs) {
            String name = field.getName();
            if (!"serialVersionUID".equals(name)) {
                propertys.add(name);
            }
        }
        Method[] methods = typeSource.getMethods();
        // 获取类的方法
        Map<String, Method> mapSet = Maps.newHashMap();
        Map<String, Method> mapGet = Maps.newHashMap();
        for (Method method : methods) {
            String me = method.getName();
            String name = me.substring(3);
            if (me.startsWith("get") && !me.equals("getClass")) {
                mapGet.put(name.toLowerCase(), method);
            }
            if (me.startsWith("set")) {
                mapSet.put(name.toLowerCase(), method);
            }
        }
        try {
            for (String property : propertys) {
                Object object = mapGet.get(property).invoke(source);
                if (object != null) {
                    mapSet.get(property).invoke(target, object);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("对象复制异常", e);
        }

    }
}