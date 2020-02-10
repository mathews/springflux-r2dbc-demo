package com.hrjk.fin.serveperf.dao;

import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.relational.core.conversion.AggregateChange;
import org.springframework.data.relational.core.mapping.event.BeforeConvertCallback;
import org.springframework.data.relational.core.mapping.event.BeforeSaveCallback;
import org.springframework.stereotype.Component;

import com.hrjk.fin.serveperf.model.Tag;

//@Component
@Deprecated
// BeforeConvertCallback and BeforeSaveCallback only apply for spring data jdbc, not r2dbc
public class TagDaoCallback implements BeforeConvertCallback<Tag>, BeforeSaveCallback<Tag> {

	private final Logger logger = LoggerFactory.getLogger(TagDaoCallback.class);

	@Override
	public Tag onBeforeConvert(Tag tag) {
		if (tag.getId() == null) {
			// String idd = UUID.randomUUID().toString();
			// logger.debug("set tag id {}", idd);
			// tag.setId(idd);
		}
		return tag;
	}

	@Override
	public Tag onBeforeSave(Tag aggregate, AggregateChange<Tag> aggregateChange) {
		// TODO Auto-generated method stub
		return aggregate;
	}

}
