package com.zzlhr.entity;

import lombok.Data;
import javax.persistence.Id;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import java.io.Serializable;


@Data
@Entity
public class About implements Serializable{

    @Id
    @GeneratedValue
    private Integer id;

    private String aboutName;

    private String aboutSex;

    private String aboutHobby;

    private String aboutMotto;

    private String aboutOther;

}
