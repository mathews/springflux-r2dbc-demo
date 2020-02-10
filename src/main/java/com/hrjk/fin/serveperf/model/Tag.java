package com.hrjk.fin.serveperf.model;

import java.util.Date;
import java.util.UUID;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.annotation.Version;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Data;
// import lombok.Data;
import lombok.NonNull;

/**
 * 标签
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class Tag {
	// 主键ID
	@Id
	//TODO  GeneratedValue only works with JPA 
//	 @GeneratedValue
	private Integer id;
	// 标签名称
	@NonNull
	private String name;
	// 是否有效
	private Integer valid;

	@CreatedBy
	private String createdBy;

	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX")
	@JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX", timezone = "GMT+8")
	@CreatedDate
	private Date createdAt;

	@LastModifiedBy
	private String modifiedBy;

	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX")
	@JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX", timezone = "GMT+8")
	@LastModifiedDate
	private Date modifiedAt;

	@Version
	private int version;

	public Tag withId(Integer id) {
		return new Tag(id, this.name, this.valid, this.createdBy, this.createdAt, this.modifiedBy, this.modifiedAt,
				this.version);
	}

}
