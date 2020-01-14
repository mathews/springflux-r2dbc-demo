package com.hrjk.fin.serveperf.dao;

import org.springframework.data.r2dbc.repository.Query;
import org.springframework.data.repository.reactive.ReactiveCrudRepository;
import org.springframework.stereotype.Repository;

import com.hrjk.fin.serveperf.model.Tag;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@Repository
public interface TagRepository extends ReactiveCrudRepository<Tag, String> {
	
    @Query("SELECT * FROM tag LIMIT :start , :pageSize")
    Flux<Tag> findInPage(int start, int pageSize);
	
    @Query("UPDATE tag set valid = false, modified_by = :userId, modified_at = NOW() WHERE id = :id")
    Mono<Void> deleteLogic(String id, String userId);
   
}
