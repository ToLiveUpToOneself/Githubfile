package com.wp.bean;
import java.util.Date;

/**
 * 
 * 
 * 权限模块
 * 类名:Permission
 * 创建人:hl
 * Email:279840109@qq.com
 * 时间：2017年04月05日-下午11:51:38
 */
public class Permission implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;/* 主键 */
	private String name;// 名字
	private String description;// 描述
	private Date createTime;// 创建时间
	private Date updateTime;// 更新时间
	private String url; //url地址
	private String model; //模块名
	private String method; //方法名
	private Integer parentId; //父级ID
	private Integer userId; //用户ID
	private Integer isDelete;// 0未删除1删除
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

}

