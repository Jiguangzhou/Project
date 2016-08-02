package com.kaishengit.pojo;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Set;

@Entity
@Table(name = "t_patient")
public class Patient implements Serializable {
    private static final long serialVersionUID = 3598363486821220510L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private String pinyin;
    private String sex;
    private String age;
    private String idnum;
    private String tel;
    private String address;
    private Timestamp createtime;
    private String status;
    private String remark;
    private String allergicHistory;

    @OneToOne
    @JoinColumn(name = "insuranceid")
    private Insurance insurance;

    @ManyToMany
    @JoinTable(name = "t_patient_has_t_disease",
            joinColumns = @JoinColumn(name = "patientid"),
            inverseJoinColumns = @JoinColumn(name = "diseaseid"))//关系表.自己在关联表中名字、对方在关系表中名字。数组中只有一个值时，大括号可以省略
    private Set<Disease> diseaseSet;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPinyin() {
        return pinyin;
    }

    public void setPinyin(String pinyin) {
        this.pinyin = pinyin;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getIdnum() {
        return idnum;
    }

    public void setIdnum(String idnum) {
        this.idnum = idnum;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Insurance getInsurance() {
        return insurance;
    }

    public void setInsurance(Insurance insurance) {
        this.insurance = insurance;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getAllergicHistory() {
        return allergicHistory;
    }

    public void setAllergicHistory(String allergicHistory) {
        this.allergicHistory = allergicHistory;
    }

    public Set<Disease> getDiseaseSet() {
        return diseaseSet;
    }

    public void setDiseaseSet(Set<Disease> diseaseSet) {
        this.diseaseSet = diseaseSet;
    }

    @Override
    public String toString() {
        return "Patient{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pinyin='" + pinyin + '\'' +
                ", sex='" + sex + '\'' +
                ", age='" + age + '\'' +
                ", idnum='" + idnum + '\'' +
                ", tel='" + tel + '\'' +
                ", address='" + address + '\'' +
                ", createtime=" + createtime +
                ", status='" + status + '\'' +
                ", remark='" + remark + '\'' +
                ", allergicHistory='" + allergicHistory + '\'' +
                ", insurance=" + insurance +
                '}';
    }
}
