package com.kaishengit.util;

import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.List;

public class SearchParam {

    private String type;
    private String protertyName;
    private Object value;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getProtertyName() {
        return protertyName;
    }

    public void setProtertyName(String protertyName) {
        this.protertyName = protertyName;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }

    public static List<SearchParam> buildSearchParam(HttpServletRequest request) {

        List<SearchParam> searchParamList = Lists.newArrayList();

        //获取所有查询字符串，将发送请求页面中form表单里所有具有name属性的表单对象获取,参数名称
        // Enumeration.hasMoreElements()测试Enumeration的当前位置是否有下一个元素，如果有的话返回真，
        // 然后把内部的指针指向下一个元素
        //Enumeration.nextElement()提取Enumeration中的下一个元素
        Enumeration<String> paramList = request.getParameterNames();
        while (paramList.hasMoreElements()) {
            //由nextElement()方法获得枚举的值.此时的值是form表单中所有控件的name属性的值
            String queryString = paramList.nextElement();
            Object value = request.getParameter(queryString);

            if(queryString.startsWith("q_") && value != null && StringUtils.isNotEmpty(value.toString())) {
                //q_f_eq_bookname
                String[] array = queryString.split("_",4);//拆分的同时限制拆分个数
                if(array.length != 4) {
                    throw new RuntimeException("地址栏查询字符串格式错误:" + queryString);
                }
                
                String valueType = array[1];
                String type = array[2];
                String propertyName = array[3];

                SearchParam searchParam = new SearchParam();
                searchParam.setProtertyName(propertyName);

                //转换根据valueType，将值转换成具体的数据类型
                value=checkValueType(value,valueType);

                searchParam.setValue(value);
                searchParam.setType(type);
                searchParamList.add(searchParam);

                request.setAttribute(queryString,value);
            }
        }

        return searchParamList;
    }


    /**
     * 判断参数类型，并转换成相应的类型
     * @param value
     * @param valueType
     * @return
     */
    private static Object checkValueType(Object value, String valueType) {

        if ("s".equals(valueType)){
            return Strings.toUTF8(value.toString());
        }else if ("i".equals(valueType)){
            return Integer.valueOf(value.toString());
        }else if ("f".equals(valueType)){
            return Float.valueOf(value.toString());
        }else if ("d".equals(valueType)){
            return Double.valueOf(value.toString());
        }else if ("b".equals(valueType)){
            return Boolean.valueOf(value.toString());
        }

        return null;
    }


}
