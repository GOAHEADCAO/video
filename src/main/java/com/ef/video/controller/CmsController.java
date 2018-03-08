package com.ef.video.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ef.video.dto.AjaxResult;
import com.ef.video.dto.ArticleQueryDto;
import com.ef.video.dto.CurrentArticleInfoDTO;
import com.ef.video.entity.Article;
import com.ef.video.entity.Page;
import com.ef.video.service.ArticleService;
import com.ef.video.util.Constants;

@Controller
@RequestMapping("/cmsController")
public class CmsController {

	@Autowired
	private ArticleService articleService;
/*
 *获取文章内容
 */
	@RequestMapping("/article/content")
	public String queryContent(HttpServletRequest request, Model model){
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String id=request.getParameter("id");
		Article article=articleService.find(id);
		if(article!=null){
			article.setViewCount(article.getViewCount()+1);
			articleService.delete(article);
			articleService.save(article);
			model.addAttribute("article", article);
			return "web/all/cms/cmsdetail";
		}
		model.addAttribute("msg", "文章不存在");
		return "web/all/fail";
	}
	/**
	 * 普通用户获取文章列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequiresRoles("normal")
	@RequestMapping("normal/article/list")
	public String List(HttpServletRequest request, Model model){
try {
		request.setCharacterEncoding("utf-8");
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		String type = request.getParameter("type");
		String title = request.getParameter("title");
		String publisher = request.getParameter("publisher");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String createDateSortCss = request.getParameter("createDateSortCss");
		String currentPageStr = request.getParameter("currentPage");
		String pageSizeStr = request.getParameter("pageSize");
		int currentPage = 1;
		int pageSize = 10;
		if(StringUtils.isNotBlank(currentPageStr)){
			currentPage = Integer.parseInt(currentPageStr);
		}
		if(StringUtils.isNotBlank(pageSizeStr)){
			pageSize = Integer.parseInt(pageSizeStr);

		}
		ArticleQueryDto articleQueryDTO = new ArticleQueryDto();
		articleQueryDTO.setType(type);
		articleQueryDTO.setTitle(title);
		articleQueryDTO.setPublisher(publisher);
		articleQueryDTO.setStartDate(startDate);
		articleQueryDTO.setEndDate(endDate);
		articleQueryDTO.setCreateDateSortCss(createDateSortCss);
		articleQueryDTO.setCurrentPage(currentPage);
		articleQueryDTO.setPageSize(pageSize);
		
		Page<Article> page = this.articleService.queryArticlePage(articleQueryDTO);
		List<Map<String,Object>> statisMapList = this.articleService.queryStatisMapList(articleQueryDTO);
		Map<String,Object> statisMap = null;
		if(statisMapList != null && statisMapList.size() > 0){
			statisMap = statisMapList.get(0);
		}
		model.addAttribute("page", page);
		model.addAttribute("type", type);
		model.addAttribute("statisMap", statisMap);
		model.addAttribute("articleQueryDTO", articleQueryDTO);
		model.addAttribute(Constants.MENU_NAME, Constants.MENU_ARTICLE_LIST);
		return "web/normal/cms/article_default_list";
	}
	
	/**
	 * 管理员获取文章列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("admin/article/list")
	public String articleList(HttpServletRequest request,HttpServletResponse response, Model model){
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		String title = request.getParameter("title");
		String publisher = request.getParameter("publisher");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String createDateSortCss = request.getParameter("createDateSortCss");
		String currentPageStr = request.getParameter("currentPage");
		String pageSizeStr = request.getParameter("pageSize");
		response.setCharacterEncoding("utf-8");
		int currentPage = 1;
		int pageSize = 10;
		if(StringUtils.isNotBlank(currentPageStr)){
			currentPage = Integer.parseInt(currentPageStr);
			System.out.println("currentPageStr"+currentPageStr);
		}
		if(StringUtils.isNotBlank(pageSizeStr)){
			pageSize = Integer.parseInt(pageSizeStr);
			System.out.println("pageSizeStr"+pageSizeStr);

		}
		ArticleQueryDto articleQueryDTO = new ArticleQueryDto();
		articleQueryDTO.setType(type);
		articleQueryDTO.setTitle(title);
		articleQueryDTO.setPublisher(publisher);
		articleQueryDTO.setStartDate(startDate);
		articleQueryDTO.setEndDate(endDate);
		articleQueryDTO.setCreateDateSortCss(createDateSortCss);
		articleQueryDTO.setCurrentPage(currentPage);
		articleQueryDTO.setPageSize(pageSize);
		
		Page<Article> page = this.articleService.queryArticlePage(articleQueryDTO);
		List<Map<String,Object>> statisMapList = this.articleService.queryStatisMapList(articleQueryDTO);
		Map<String,Object> statisMap = null;
		if(statisMapList != null && statisMapList.size() > 0){
			statisMap = statisMapList.get(0);
		}
		model.addAttribute("page", page);
		model.addAttribute("type", type);
		model.addAttribute("statisMap", statisMap);
		model.addAttribute("articleQueryDTO", articleQueryDTO);
		System.out.println("articleList end  articleQueryDTO::"+articleQueryDTO);
		return "web/admin/cms/article_default_list";
	}
	
	/**
	 * 文章修改
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("article/edit")
	public String articleEdit(HttpServletRequest request, Model model){
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Article article = null;
		String id = request.getParameter("id");	
		if(StringUtils.isNotBlank(id)){
			article = this.articleService.find(id);
		}
		model.addAttribute("article", article);
		return "web/all/cms/article_edit";
	}
	
	/**
	 * 文章保存操作
	 * @param request
	 * @return
	 */
	@RequestMapping("/article/ajax/save")
	@ResponseBody
	public AjaxResult doArticlejaxSave(HttpServletRequest request){
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		try {
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String publisher = request.getParameter("publisher");
			String content = request.getParameter("content");
			String summary = request.getParameter("summary");
			String coverImageUrl = request.getParameter("coverImageUrl");
			String href = request.getParameter("href");
			String articleTypeStr = request.getParameter("articleType");
		   
			Article article = null;
			Integer orderNo = articleService.getNumber()+1;
			Integer articleType = null;
			if(StringUtils.isNotBlank(articleTypeStr)){
				if(articleTypeStr.equals("contentType")){
					articleType = 0;
				}else if(articleTypeStr.equals("hrefType")){
					articleType = 1;
				}else if(articleTypeStr.equals("adType")){
					articleType = 2;
				}
			}
			if(StringUtils.isNotBlank(id)){
				article = this.articleService.find(id);
				article.setTitle(title);
				article.setPublisher(publisher);
				article.setContent(content);
				article.setType(articleType);
				article.setSummary(summary);
				article.setUpdateDate(new Date());
				article.setOrderNo(orderNo);
				article.setHref(href);
				if(StringUtils.isNotBlank(coverImageUrl)){
					article.setCoverImageUrl(coverImageUrl);
				}
			}else{
				article = new Article();
				article.setTitle(title);
				article.setPublisher(publisher);
				article.setContent(content);
				article.setType(articleType);
				article.setSummary(summary);
				article.setCreateDate(new Date());
				article.setViewCount(0);
				article.setIsAudit(false);
				article.setOrderNo(orderNo);
				article.setHref(href);
				if(StringUtils.isNotBlank(coverImageUrl)){
					article.setCoverImageUrl(coverImageUrl);
				}
			}
						
			if(StringUtils.isNotBlank(id)){
				this.articleService.update(article);
			
			}else{
				this.articleService.save(article);
			}
				ajaxResult.setSuccess(true);
			    ajaxResult.setData(article);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ajaxResult;
	}
	/**
	 * 文章删除
	 * @param request
	 * @return
	 */
	@RequestMapping("admin/article/ajax/delete")
	@ResponseBody
	public AjaxResult ajaxArticleDelete(HttpServletRequest request){
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		
		try {
			String[] ids = request.getParameterValues("id");			
			if(ids != null && ids.length > 0){
				for(String id:ids){
					System.out.println(id);
					Article article = this.articleService.find(id);
					this.articleService.delete(article);
					ajaxResult.setSuccess(true);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ajaxResult;
	}
	
	/**
	 * 文章审核
	 * @param request
	 * @return
	 */
	@RequestMapping("admin/article/ajax/audit")
	@ResponseBody
	public AjaxResult ajaxArticleAudit(HttpServletRequest request){
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		try {
			Boolean isAudit = false;
			String[] ids = request.getParameterValues("id");
			String auditFlag = request.getParameter("auditFlag");
			if(StringUtils.isNotBlank(auditFlag) && auditFlag.equals("1")){
				isAudit = true;
			}
			if(ids != null && ids.length > 0){
				for(String id:ids){
					Article article = this.articleService.find(id);
					article.setIsAudit(isAudit);
					this.articleService.update(article);
					ajaxResult.setSuccess(true);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ajaxResult;
	}
	
	/**
	 * 文章置顶
	 * @param request
	 * @return
	 */
	@RequestMapping("/article/ajax/top")
	@ResponseBody
	public AjaxResult ajaxArticleTop(HttpServletRequest request){
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		try {
			Boolean isTop = false;
			String[] ids = request.getParameterValues("id");
			String topFlag = request.getParameter("topFlag");
			if(StringUtils.isNotBlank(topFlag) && topFlag.equals("1")){
				isTop = true;
			}
			if(ids != null && ids.length > 0){
				for(String id:ids){
					Article article = this.articleService.find(id);
					article.setIsTop(isTop);
					this.articleService.update(article);
				}
			}
			ajaxResult.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ajaxResult;
	}
	
	/**
	 * 获取下一篇文章详情
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/article/next")
	@ResponseBody
	public AjaxResult getNextArticle(HttpServletRequest request,HttpServletResponse response){
		response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
		AjaxResult ajaxResult = new AjaxResult();
		//当前文章ID
		String currentArticleId = request.getParameter("currentArticleId");
		String articleDateStr = request.getParameter("articleDate");
		String orderNoStr = request.getParameter("orderNo");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Article nextArticle = null;
		Date articleDate = null;
		Integer orderNo = null;
		if(StringUtils.isNotBlank(articleDateStr)){
			
				try {
					articleDate = sdf.parse(articleDateStr);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		if(StringUtils.isNotBlank(orderNoStr)){
			orderNo = Integer.parseInt(orderNoStr);
		}
		CurrentArticleInfoDTO currentArticleInfoDTO = new CurrentArticleInfoDTO();
		currentArticleInfoDTO.setArticleId(currentArticleId);
		currentArticleInfoDTO.setArticleDate(articleDate);
		currentArticleInfoDTO.setOrderNo(orderNo);
		nextArticle=this.articleService.queryNextArticle(currentArticleInfoDTO);
		ajaxResult.setSuccess(true);
		ajaxResult.setData(nextArticle);
		return ajaxResult;
	}
	
	/**
	 * 获取上一篇文章详情
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/article/pre")
	@ResponseBody
	public AjaxResult getPreArticle(HttpServletRequest request,HttpServletResponse response){
		response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
		AjaxResult ajaxResult = new AjaxResult();
		//当前文章ID
		String currentArticleId = request.getParameter("currentArticleId");
		String articleDateStr = request.getParameter("articleDate");
		String orderNoStr = request.getParameter("orderNo");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Article preArticle = null;
		Date articleDate = null;
		Integer orderNo = null;
		if(StringUtils.isNotBlank(articleDateStr)){
			try {
				articleDate = sdf.parse(articleDateStr);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(StringUtils.isNotBlank(orderNoStr)){
			orderNo = Integer.parseInt(orderNoStr);
		}
		CurrentArticleInfoDTO currentArticleInfoDTO = new CurrentArticleInfoDTO();
		currentArticleInfoDTO.setArticleId(currentArticleId);
		currentArticleInfoDTO.setArticleDate(articleDate);
		currentArticleInfoDTO.setOrderNo(orderNo);
		preArticle = this.articleService.queryPreArticle(currentArticleInfoDTO);
		ajaxResult.setSuccess(true);
		ajaxResult.setData(preArticle);
		return ajaxResult;
	}

}

