package com.kaishengit.pojo;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "t_insurance")
public class Insurance implements Serializable {
    private static final long serialVersionUID = 8284861436934837092L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String insname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getInsname() {
        return insname;
    }

    public void setInsname(String insname) {
        this.insname = insname;
    }

    @Override
    public String toString() {
        return "Insurance{" +
                "id=" + id +
                ", insname='" + insname + '\'' +
                '}';
    }
}
