package com.hrjk.fin.serveperf.handler;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.reactive.function.server.ServerResponse;

import reactor.core.publisher.Mono;

@Component
public class TagMgtHandler  {
	private final Logger logger = LoggerFactory.getLogger(TagMgtHandler.class);

	private BaseDao<Tag> tagDao = null;

	
	public TagMgtHandler() {
		super();
		tagDao = new TagDaoImpl();
		logger.info("init TagMgtImpl {}", this);
	}

	public Mono<ServerResponse> hello(ServerRequest request) {
		return ServerResponse.ok().contentType(MediaType.APPLICATION_JSON)
			.body(BodyInserters.fromValue("body"));
	}

	/**
	 * 新增标签信息
	 * 
	 * @throws SQLException
	 */
	@Override
	public void addTag(Callback<Integer> callback, OnlineUser onlineUser, Tag tag) throws SQLException {
		tag.setId(PKUtils.genPK());
		tag.setCreatedBy(onlineUser.getId());
		tag.setValid(Common.VALID_YES);
		int rowCount = this.tagDao.insert(tag);

		callback.accept(rowCount);
	}

	@Override
	public void updateTag(Callback<Integer> callback, OnlineUser onlineUser, Tag tag) throws SQLException {
		logger.info("begin update templateVariables");
		Tag sourceTag = this.tagDao.querySingle(tag.getId());
		if (sourceTag == null) {
			callback.accept(0);
			return;
		}

		sourceTag.setName(tag.getName());
		sourceTag.setModifiedBy(onlineUser.getId());
		int rowCount = this.tagDao.update(sourceTag);

		logger.info("update templateVariables completed, update {} rows", rowCount);

		callback.accept(rowCount);
	}

	@Override
	public void deleteTag( String onlineUser, String id) throws Exception {
		Tag sourceTag = this.tagDao.querySingle(id);
		if (sourceTag == null) {
			callback.accept(0);
			return;
		}

		sourceTag.setModifiedBy(onlineUser.getId());
		sourceTag.setValid(Common.VALID_NO);
		int rowCount = this.tagDao.update(sourceTag);

		callback.accept(rowCount);
	}

}
