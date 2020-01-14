-- ----------------------------------------------------
-- --初始化数据库
-- --2019.09.02 14:40
-- ----------------------------------------------------

-- ALTER DATABASE CHARACTER SET utf8;

-- SET NAMES utf8mb4;

-- ----------------------------
-- Table structure for tag
-- ----------------------------


DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  `valid` int(11) NULL DEFAULT 1 COMMENT '是否可用',
  `createdBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录创建人账号ID',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '记录创建时间',
  `modifiedBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录修改人账号ID',
  `modifiedAt` datetime(0) NULL DEFAULT NULL COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '合同标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Procedure structure for TAG_DELETE_PROCEDURE
-- ----------------------------
DROP PROCEDURE IF EXISTS `TAG_DELETE_PROCEDURE`;
DELIMITER //
CREATE PROCEDURE `TAG_DELETE_PROCEDURE`( 
    IN v_id VARCHAR(32) )
lable:BEGIN
 DELETE  FROM tag WHERE (`id`=v_id);
END
//
DELIMITER ;

-- ----------------------------
-- Procedure structure for TAG_INSERT_PROCEDURE
-- ----------------------------
DROP PROCEDURE IF EXISTS `TAG_INSERT_PROCEDURE`;
DELIMITER //
CREATE PROCEDURE `TAG_INSERT_PROCEDURE`( 
    IN v_id VARCHAR(32),
    IN v_name VARCHAR(64),
    IN v_valid INT(10),
    IN v_createdBy VARCHAR(64),
    IN v_createdAt DATETIME,
    IN v_modifiedBy VARCHAR(64),
    IN v_modifiedAt DATETIME )
lable:BEGIN
    DECLARE tmpCont int default 0;
    DECLARE cont int default 0;
INSERT INTO tag ( 
    `id`,
    `name`,
    `valid`,
    `createdBy`,
    `createdAt`,
    `modifiedBy`,
    `modifiedAt`
) VALUES ( 
    v_id,
    v_name,
    v_valid,
    v_createdBy,
    NOW(),
    v_modifiedBy,
    v_modifiedAt
);
END
//
DELIMITER ;

-- ----------------------------
-- Procedure structure for TAG_LISTALL_PROCEDURE
-- ----------------------------
DROP PROCEDURE IF EXISTS `TAG_LISTALL_PROCEDURE`;
DELIMITER //
CREATE PROCEDURE `TAG_LISTALL_PROCEDURE`(
	IN v_startrow INT,
	IN v_pagesize INT,
	IN v_id VARCHAR ( 32 ),
	IN v_name VARCHAR ( 64 ),
	IN v_valid INT ( 10 ),
	IN v_createdBy VARCHAR ( 64 ),
	IN v_createdAt DATETIME,
	IN v_modifiedBy VARCHAR ( 64 ),
	IN v_modifiedAt DATETIME 
	)
lable : BEGIN
	IF
		v_startrow =- 1 THEN
		SELECT
			COUNT( 1 ) 
		FROM
			tag 
		WHERE
			( v_id IS NULL OR `id` = v_id) 
			AND ( v_name IS NULL OR `name` LIKE CONCAT( '%', v_name, '%' ) ) 
			AND ( v_valid IS NULL OR `valid` = v_valid) 
			AND ( v_createdBy IS NULL OR `createdBy` = v_createdBy) 
			AND ( v_createdAt IS NULL OR DATE_FORMAT(`createdAt`, '%Y-%m-%d') = DATE_FORMAT(v_createdAt, '%Y-%m-%d')) 
			AND ( v_modifiedBy IS NULL OR `modifiedBy` = v_modifiedBy) 
			AND ( v_modifiedAt IS NULL OR DATE_FORMAT(`modifiedAt`, '%Y-%m-%d') = DATE_FORMAT(v_modifiedAt, '%Y-%m-%d'))
			;
		ELSE SELECT
			* 
		FROM
			tag 
		WHERE
			( v_id IS NULL OR `id` = v_id) 
			AND ( v_name IS NULL OR `name` LIKE CONCAT( '%', v_name, '%' ) ) 
			AND ( v_valid IS NULL OR `valid` = v_valid) 
			AND ( v_createdBy IS NULL OR `createdBy` = v_createdBy) 
			AND ( v_createdAt IS NULL OR DATE_FORMAT(`createdAt`, '%Y-%m-%d') = DATE_FORMAT(v_createdAt, '%Y-%m-%d')) 
			AND ( v_modifiedBy IS NULL OR `modifiedBy` = v_modifiedBy) 
			AND ( v_modifiedAt IS NULL OR DATE_FORMAT(`modifiedAt`, '%Y-%m-%d') = DATE_FORMAT(v_modifiedAt, '%Y-%m-%d'))
			
			LIMIT v_startrow, v_pagesize;
	END IF;
END
//
DELIMITER ;

-- ----------------------------
-- Procedure structure for TAG_SELECT_PROCEDURE
-- ----------------------------
DROP PROCEDURE IF EXISTS `TAG_SELECT_PROCEDURE`;
DELIMITER //
CREATE PROCEDURE `TAG_SELECT_PROCEDURE`(
	IN v_id VARCHAR ( 32 ),
	IN v_name VARCHAR ( 64 ),
	IN v_valid INT ( 10 ),
	IN v_createdBy VARCHAR ( 64 ),
	IN v_createdAt DATETIME,
	IN v_modifiedBy VARCHAR ( 64 ),
	IN v_modifiedAt DATETIME 
	)
lable : BEGIN
	SELECT
		* 
	FROM
		tag 
	WHERE
		( v_id IS NULL OR `id` = v_id ) 
		AND ( v_name IS NULL OR `name` = v_name ) 
		AND ( v_valid IS NULL OR `valid` = v_valid ) 
		AND ( v_createdBy IS NULL OR `createdBy` = v_createdBy ) 
		AND ( v_createdAt IS NULL OR `createdAt` = v_createdAt ) 
		AND ( v_modifiedBy IS NULL OR `modifiedBy` = v_modifiedBy ) 
		AND ( v_modifiedAt IS NULL OR `modifiedAt` = v_modifiedAt )
		;
END
//
DELIMITER ;

-- ----------------------------
-- Procedure structure for TAG_UPDATE_PROCEDURE
-- ----------------------------
DROP PROCEDURE IF EXISTS `TAG_UPDATE_PROCEDURE`;
delimiter ;;
CREATE PROCEDURE `TAG_UPDATE_PROCEDURE`( 
    IN v_id VARCHAR(32),
    IN v_name VARCHAR(64),
    IN v_valid INT(10),
    IN v_createdBy VARCHAR(64),
    IN v_createdAt DATETIME,
    IN v_modifiedBy VARCHAR(64),
    IN v_modifiedAt DATETIME )
lable:BEGIN
    UPDATE tag set 
    `name` =v_name,
    `valid` =v_valid,
    `modifiedBy` =v_modifiedBy,
    `modifiedAt` =NOW()
    where `id` =v_id; 

END
;;
delimiter ;
