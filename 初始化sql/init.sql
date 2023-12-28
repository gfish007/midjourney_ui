/*
 Navicat Premium Data Transfer

 Source Server         : AWS
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : gfish.crrqpogediag.ap-east-1.rds.amazonaws.com:3906
 Source Schema         : mj

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 19/12/2023 16:34:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for df_account_auth
-- ----------------------------
DROP TABLE IF EXISTS `df_account_auth`;
CREATE TABLE `df_account_auth`  (
                                    `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                    `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                    `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `account_id` bigint NOT NULL DEFAULT 0 COMMENT '账户id',
                                    `auth_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '授权码',
                                    `use_flag` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT 'N' COMMENT '是否使用Y是N否',
                                    `gmt_active` datetime NULL DEFAULT NULL COMMENT '激活时间',
                                    `active_account_id` bigint NULL DEFAULT NULL COMMENT '激活账户id',
                                    `active_user_id` bigint NULL DEFAULT NULL COMMENT '激活用户id',
                                    `auth_way` enum('DAY','TIME') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '授权方式DAY 按天 TIME 指定时间',
                                    `auth_days` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '授权天数(为空则不限制）',
                                    `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '备注',
                                    `use_way` enum('OWNER','GOODS') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'OWNER' COMMENT '用途\'OWNER\',\'GOODS\'',
                                    `other_info` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '其他信息',
                                    `source` enum('CHATGPT','MJ') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'MJ' COMMENT '来源CHATGPT  MJ',
                                    `user_id` bigint NULL DEFAULT NULL COMMENT '创建的用户id',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    INDEX `account_id`(`account_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1736578954858594307 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '账号授权表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_account_chatgpt
-- ----------------------------
DROP TABLE IF EXISTS `df_account_chatgpt`;
CREATE TABLE `df_account_chatgpt`  (
                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                       `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                       `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL,
                                       `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                       `account_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '账号名',
                                       `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '密码',
                                       `mfa_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '二次验证',
                                       `access_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT 'access token',
                                       `session_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT 'session token',
                                       `refresh_access_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT 'refresh_access_token',
                                       `refresh_session_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT 'refresh_session_token',
                                       `gmt_access_expire` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '过期时间',
                                       `gmt_session_expire` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '过期时间',
                                       `gmt_refresh_access_expire` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '过期时间',
                                       `gmt_refresh_session_expire` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '过期时间',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1727156149138935810 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'chatgpt账户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_account_chatgpt_share
-- ----------------------------
DROP TABLE IF EXISTS `df_account_chatgpt_share`;
CREATE TABLE `df_account_chatgpt_share`  (
                                             `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                             `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                             `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                             `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                             `chatgpt_id` bigint NULL DEFAULT NULL COMMENT 'chatgpt id',
                                             `share_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '分享token',
                                             `gmt_expired` datetime NULL DEFAULT NULL COMMENT '账号过期时间',
                                             `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '响应信息',
                                             `sort` int NULL DEFAULT 1 COMMENT '排序',
                                             `auth_type` enum('O','A') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'O' COMMENT '权限类型 O 主账号 A授权',
                                             PRIMARY KEY (`id`) USING BTREE,
                                             INDEX `idx_userid_chatgptid`(`user_id` ASC, `chatgpt_id` ASC) USING BTREE,
                                             INDEX `idx_chatgptid`(`chatgpt_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1726538562755547138 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'chatgpt账户分享token' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_account_discord
-- ----------------------------
DROP TABLE IF EXISTS `df_account_discord`;
CREATE TABLE `df_account_discord`  (
                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                       `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                       `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                       `account_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '自定义名称',
                                       `discord_user_id` bigint NULL DEFAULT NULL COMMENT 'discord用户Id',
                                       `owner_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '自有标识Y是N否',
                                       `guild_id` bigint NULL DEFAULT NULL COMMENT '服务器ID',
                                       `guild_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '服务器title',
                                       `channel_id` bigint NULL DEFAULT NULL COMMENT '频道ID',
                                       `state` enum('invalid','normal','error','end','stop') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'normal' COMMENT '账号状态 待验证：invalid，正常：normal，异常：error，已结束：end',
                                       `acc_mode` enum('GROUP','SINGLE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'GROUP' COMMENT '模式 GROUP | SINGLE',
                                       `default_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '默认账号',
                                       `num_execute` int NULL DEFAULT 50 COMMENT '可同时提交的任务数',
                                       `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1736579694696071170 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'discord账户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_account_discord_info
-- ----------------------------
DROP TABLE IF EXISTS `df_account_discord_info`;
CREATE TABLE `df_account_discord_info`  (
                                            `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                            `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                            `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                            `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                            `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                            `total_fast_times` int NULL DEFAULT NULL COMMENT '总快速次数',
                                            `total_turbo_times` int NULL DEFAULT NULL COMMENT '总turbo次数',
                                            `total_relax_times` int NULL DEFAULT NULL COMMENT '总relax次数',
                                            `fast_times` int NULL DEFAULT NULL COMMENT '快速次数',
                                            `turbo_times` int NULL DEFAULT NULL COMMENT 'turbo次数',
                                            `relax_times` int NULL DEFAULT NULL COMMENT 'relax次数',
                                            `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
                                            `num_execute` int NULL DEFAULT NULL COMMENT '执行数',
                                            `num_success` int NULL DEFAULT NULL COMMENT '成功数',
                                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1736579694696071170 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'discord账户使用记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_account_discord_ref
-- ----------------------------
DROP TABLE IF EXISTS `df_account_discord_ref`;
CREATE TABLE `df_account_discord_ref`  (
                                           `id` bigint NOT NULL COMMENT 'Id',
                                           `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                           `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                           `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                           `discord_user_id` bigint NULL DEFAULT NULL COMMENT 'discord用户id',
                                           `account_id` bigint NULL DEFAULT NULL COMMENT '账号id',
                                           PRIMARY KEY (`id`) USING BTREE,
                                           INDEX `idx_groupId_discordUserId`(`discord_user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'discord账户组关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_dict
-- ----------------------------
DROP TABLE IF EXISTS `df_dict`;
CREATE TABLE `df_dict`  (
                            `id` bigint NOT NULL COMMENT 'Id',
                            `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                            `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识 0 正常 1删除',
                            `group_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT 'groupKey',
                            `group_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT 'groupName',
                            `cons_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT 'cons_key',
                            `cons_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT 'cons_name',
                            `cons_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT 'cons_value',
                            `sort` int NULL DEFAULT 0 COMMENT '排序',
                            PRIMARY KEY (`id`) USING BTREE,
                            UNIQUE INDEX `idx_group_key_cons_key`(`group_key` ASC, `cons_key` ASC) USING BTREE,
                            INDEX `idx_cons_key`(`cons_key` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '字典配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_discord
-- ----------------------------
DROP TABLE IF EXISTS `df_discord`;
CREATE TABLE `df_discord`  (
                               `id` bigint NOT NULL COMMENT 'Id',
                               `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                               `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                               `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                               `mj_user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT 'mj userId',
                               `global_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '名称',
                               `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '邮箱',
                               `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT 'discord用户名',
                               `user_token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '用户token',
                               `session_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT 'session id',
                               `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '调用discord接口、连接wss时的user-agent',
                               `use_concurrent` int NULL DEFAULT 0 COMMENT '已使用并发任务数',
                               `max_concurrent` int NULL DEFAULT 0 COMMENT '可并发任务数',
                               `mj_subscribe` int NULL DEFAULT 0 COMMENT 'mj订阅0 10 30 60 120',
                               `fast_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT 'N' COMMENT 'fast可用标识y是n否',
                               `state` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT 'Y' COMMENT '账号状态 Y可用 N禁用',
                               `discord_state` enum('NORMAL','VERIFY_HUMAN','EXPIRED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'NORMAL' COMMENT 'DISCORD状态',
                               `mj_state` enum('VERIFY_HUMAN','STOP','NORMAL','BAN') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'STOP' COMMENT 'MJ状态',
                               `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '备注',
                               `info_str` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT 'info信息',
                               `error_msg` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '异常原因',
                               `owner_user_id` bigint NULL DEFAULT NULL COMMENT '账号持有用户id',
                               `private_channel_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '[]' COMMENT '机器人的私人频道',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'discord账户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_discord_channel
-- ----------------------------
DROP TABLE IF EXISTS `df_discord_channel`;
CREATE TABLE `df_discord_channel`  (
                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                       `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                       `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '0' COMMENT '标题',
                                       `guild_id` bigint NOT NULL COMMENT '服务器ID',
                                       `enable_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT 'Y' COMMENT '启用标识 Y是N否',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1715001594698797105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'DISCORD频道表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_discord_group
-- ----------------------------
DROP TABLE IF EXISTS `df_discord_group`;
CREATE TABLE `df_discord_group`  (
                                     `id` bigint NOT NULL COMMENT 'Id',
                                     `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                     `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                     `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                     `user_id` bigint NULL DEFAULT NULL COMMENT '持有者用户id',
                                     `group_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '账户组名称',
                                     `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '备注',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'discord账户组' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_discord_guild
-- ----------------------------
DROP TABLE IF EXISTS `df_discord_guild`;
CREATE TABLE `df_discord_guild`  (
                                     `id` bigint NOT NULL COMMENT 'Id',
                                     `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                     `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                     `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                     `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '服务器名称',
                                     `boot_niji` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT 'niji机器人',
                                     `boot_midjourney` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT 'midjourney 机器人',
                                     `boot_Insight_face_swap` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '换脸机器人',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'discord服务器配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_discord_guild_member
-- ----------------------------
DROP TABLE IF EXISTS `df_discord_guild_member`;
CREATE TABLE `df_discord_guild_member`  (
                                            `id` bigint NOT NULL COMMENT 'Id',
                                            `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                            `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                            `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                            `discord_user_id` bigint NOT NULL COMMENT 'discord账户id',
                                            `guild_id` bigint NOT NULL COMMENT 'discord服务器id',
                                            PRIMARY KEY (`id`) USING BTREE,
                                            UNIQUE INDEX `unix_dui_gi`(`discord_user_id` ASC, `guild_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'discord服务器用户关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_discord_integration_config
-- ----------------------------
DROP TABLE IF EXISTS `df_discord_integration_config`;
CREATE TABLE `df_discord_integration_config`  (
                                                  `id` bigint NOT NULL COMMENT 'Id',
                                                  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                  `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                                  `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识 0 正常 1删除',
                                                  `command_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '命令名',
                                                  `version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '版本ID',
                                                  `command_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '命令对应ID',
                                                  `application_command` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '命令合计内容',
                                                  `boot_id` bigint NULL DEFAULT NULL COMMENT '机器人ID',
                                                  PRIMARY KEY (`id`) USING BTREE,
                                                  UNIQUE INDEX `unix_ci_cn`(`boot_id` ASC, `command_name` ASC) USING BTREE,
                                                  INDEX `idx_command_name`(`command_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'discord版本配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_discord_server_zone
-- ----------------------------
DROP TABLE IF EXISTS `df_discord_server_zone`;
CREATE TABLE `df_discord_server_zone`  (
                                           `id` bigint NOT NULL COMMENT 'Id',
                                           `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                           `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                           `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                           `discord_id` bigint NULL DEFAULT NULL COMMENT '注册用户id',
                                           `zone_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '可用区code',
                                           PRIMARY KEY (`id`) USING BTREE,
                                           UNIQUE INDEX `unix_id_code`(`zone_code` ASC, `discord_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'Discord账号区域配置关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_collect
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_collect`;
CREATE TABLE `df_draw_collect`  (
                                    `id` bigint NOT NULL COMMENT 'Id',
                                    `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识 0 正常 1删除',
                                    `user_id` bigint NOT NULL DEFAULT 0 COMMENT '用户id',
                                    `draw_task_id` bigint NOT NULL DEFAULT 0 COMMENT '绘画任务ID',
                                    `collect_category_id` bigint NOT NULL DEFAULT 0 COMMENT '分类ID',
                                    `sort` int NULL DEFAULT 0 COMMENT '排序',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    INDEX `idx_uid_dtid_ccid`(`user_id` ASC, `collect_category_id` ASC, `draw_task_id` ASC) USING BTREE,
                                    INDEX `idx_task_id`(`draw_task_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '绘画任务收藏夹' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_collect_category
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_collect_category`;
CREATE TABLE `df_draw_collect_category`  (
                                             `id` bigint NOT NULL COMMENT 'Id',
                                             `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                             `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识 0 正常 1删除',
                                             `user_id` bigint NOT NULL DEFAULT 0 COMMENT '用户id',
                                             `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '类目标题',
                                             `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '父类目ID',
                                             `sort` int NULL DEFAULT 0 COMMENT '排序',
                                             PRIMARY KEY (`id`) USING BTREE,
                                             INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
                                             INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '绘画收藏夹分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task`;
CREATE TABLE `df_draw_task`  (
                                 `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                 `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                 `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                 `space_id` bigint NULL DEFAULT NULL COMMENT '空间id',
                                 `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                 `ref_account_id` bigint NULL DEFAULT NULL COMMENT '账号ID',
                                 `privacy_mode` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '隐私模式Y是 N否',
                                 `channel` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '绘图通道 MJ：midjourney SD：stable dissfusion',
                                 `task_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '任务id(可能消息的MD5）',
                                 `prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '关键词内容JSON',
                                 `prompt_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '关键词翻译',
                                 `gmt_start` datetime NULL DEFAULT NULL COMMENT '任务开始时间',
                                 `gmt_finished` datetime NULL DEFAULT NULL COMMENT '完成时间',
                                 `use_seconds` int NULL DEFAULT 0 COMMENT '使用时间（秒）',
                                 `state` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '状态 PENDING:排队中 EXECUTING:执行中 FINISHED:已完成 FAIL:失败 取消:CANCEL 中断：DOWN',
                                 `sec_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'NOT_START' COMMENT '二级业务状态 未启动：NOT_START,已提交：SUBMITTED,执行中：IN_PROGRESS,失败： FAILURE,成功：SUCCESS',
                                 `response` json NULL COMMENT '返回内容JSON',
                                 `fail_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '失败消息',
                                 `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '返回结果',
                                 `priority` tinyint NULL DEFAULT 0 COMMENT '任务优先级',
                                 PRIMARY KEY (`id`) USING BTREE,
                                 INDEX `idx_userid_spaceid_state`(`user_id` ASC, `space_id` ASC, `state` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1737004152040718338 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '绘画任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task_hot
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task_hot`;
CREATE TABLE `df_draw_task_hot`  (
                                     `id` bigint NOT NULL COMMENT 'Id',
                                     `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                     `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                     `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                     `task_id` bigint NULL DEFAULT NULL COMMENT '任务ID',
                                     `count_collect` bigint NULL DEFAULT NULL COMMENT '收藏统计',
                                     `count_love` bigint NULL DEFAULT NULL COMMENT '喜欢统计',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '任务统计' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task_hot_rel
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task_hot_rel`;
CREATE TABLE `df_draw_task_hot_rel`  (
                                         `id` bigint NOT NULL COMMENT 'Id',
                                         `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                         `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         `task_id` bigint NULL DEFAULT NULL COMMENT '任务ID',
                                         `user_id` bigint NULL DEFAULT NULL COMMENT '收藏统计',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '任务统计明细' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task_mj
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task_mj`;
CREATE TABLE `df_draw_task_mj`  (
                                    `id` bigint NOT NULL COMMENT 'Id',
                                    `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                    `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `user_id` bigint NULL DEFAULT NULL COMMENT '用户id(冗余)',
                                    `task_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '任务状态(冗余)',
                                    `space_id` bigint NULL DEFAULT NULL COMMENT '空间id',
                                    `account_id` bigint NULL DEFAULT NULL COMMENT '执行账户id',
                                    `account_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '执行账号名（冗余）',
                                    `ref_task_id` bigint NULL DEFAULT NULL COMMENT '关联上个任务ID',
                                    `boot_id` bigint NULL DEFAULT NULL COMMENT '机器人ID',
                                    `guild_id` bigint NULL DEFAULT NULL COMMENT 'guild ID',
                                    `guild_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '服务器名称（冗余）',
                                    `channel_id` bigint NULL DEFAULT NULL COMMENT 'channel ID',
                                    `channel_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '频道名称（冗余）',
                                    `discord_group_id` bigint NULL DEFAULT NULL COMMENT '账号组id',
                                    `discord_user_id` bigint NULL DEFAULT NULL COMMENT '对应账号id',
                                    `discord_user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '执行账号名（冗余）',
                                    `flags_raw` bigint NULL DEFAULT NULL COMMENT 'gpt说是标识用户是否是 Discord 员工，用户是否是 Discord 的合作伙伴，用户是否有 Nitro 订阅等。 待验证',
                                    `message_hash` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '图片hash',
                                    `ori_prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '原始prompt',
                                    `content_stripped` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '最终执行的prompt',
                                    `gmt_finished` datetime NULL DEFAULT NULL COMMENT '完成时间',
                                    `mode` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '模式RELAX、FAST',
                                    `command_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '操作类型imagine、blend...',
                                    `command_id` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '命令标识ID',
                                    `gmt_start` datetime NULL DEFAULT NULL COMMENT '任务开始时间',
                                    `message_id` bigint NULL DEFAULT NULL COMMENT '消息ID',
                                    `action_row` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '操作按钮',
                                    `gmt_choose` datetime NULL DEFAULT NULL COMMENT '任务选择时间',
                                    `mj_execute` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT 'mj已运行 Y是N否',
                                    `privacy_mode` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '隐私模式Y是 N否',
                                    `origin` enum('SYS','DISCORD') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'SYS' COMMENT '来源 SYS 系统 DISCORD discord同步',
                                    `seed` bigint NULL DEFAULT NULL COMMENT 'seedId',
                                    `main_attachment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '主图',
                                    `ref_message_id` bigint NULL DEFAULT NULL COMMENT '关联消息id',
                                    `remark` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '备注扩展',
                                    `sec_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'NOT_START' COMMENT '二级业务状态 未启动：NOT_START,已提交：SUBMITTED,执行中：IN_PROGRESS,失败： FAILURE,成功：SUCCESS',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    INDEX `idx_messge_id`(`message_id` ASC) USING BTREE,
                                    INDEX `idx_messageHash_discordUserId`(`message_hash` ASC, `discord_user_id` ASC) USING BTREE,
                                    INDEX `idx_disId_state`(`discord_user_id` ASC, `task_state` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '绘画任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task_mj_import
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task_mj_import`;
CREATE TABLE `df_draw_task_mj_import`  (
                                           `id` bigint NOT NULL COMMENT 'Id',
                                           `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                           `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                           `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                           `user_id` bigint NULL DEFAULT NULL COMMENT '用户id(冗余)',
                                           `task_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '任务状态(冗余)',
                                           `space_id` bigint NULL DEFAULT NULL COMMENT '空间id',
                                           `task_id` bigint NULL DEFAULT NULL COMMENT '任务ID',
                                           `account_id` bigint NULL DEFAULT NULL COMMENT '执行账户id',
                                           `account_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '执行账号名（冗余）',
                                           `ref_task_id` bigint NULL DEFAULT NULL COMMENT '关联上个任务ID',
                                           `boot_id` bigint NULL DEFAULT NULL COMMENT '机器人ID',
                                           `guild_id` bigint NULL DEFAULT NULL COMMENT 'guild ID',
                                           `guild_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '服务器名称（冗余）',
                                           `channel_id` bigint NULL DEFAULT NULL COMMENT 'channel ID',
                                           `channel_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '频道名称（冗余）',
                                           `discord_group_id` bigint NULL DEFAULT NULL COMMENT '账号组id',
                                           `discord_user_id` bigint NULL DEFAULT NULL COMMENT '对应账号id',
                                           `discord_user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '执行账号名（冗余）',
                                           `flags_raw` bigint NULL DEFAULT NULL COMMENT 'gpt说是标识用户是否是 Discord 员工，用户是否是 Discord 的合作伙伴，用户是否有 Nitro 订阅等。 待验证',
                                           `message_hash` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '图片hash',
                                           `ori_prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '原始prompt',
                                           `content_stripped` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '最终执行的prompt',
                                           `gmt_finished` datetime NULL DEFAULT NULL COMMENT '完成时间',
                                           `mode` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '模式RELAX、FAST',
                                           `command_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '操作类型imagine、blend...',
                                           `command_id` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '命令标识ID',
                                           `gmt_start` datetime NULL DEFAULT NULL COMMENT '任务开始时间',
                                           `message_id` bigint NULL DEFAULT NULL COMMENT '消息ID',
                                           `action_row` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '操作按钮',
                                           `gmt_choose` datetime NULL DEFAULT NULL COMMENT '任务选择时间',
                                           `mj_execute` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT 'mj已运行 Y是N否',
                                           `privacy_mode` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '隐私模式Y是 N否',
                                           `origin` enum('SYS','DISCORD') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'SYS' COMMENT '来源 SYS 系统 DISCORD discord同步',
                                           `seed` bigint NULL DEFAULT NULL COMMENT 'seedId',
                                           `main_attachment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '主图',
                                           `custom_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '特殊标记',
                                           `batch_no` bigint NULL DEFAULT NULL COMMENT '批次号',
                                           PRIMARY KEY (`id`) USING BTREE,
                                           INDEX `idx_batch_no`(`batch_no` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '绘画任务导入备份表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task_mj_temp
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task_mj_temp`;
CREATE TABLE `df_draw_task_mj_temp`  (
                                         `id` bigint NOT NULL COMMENT 'Id',
                                         `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                         `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         `data` json NULL COMMENT '扩展字段',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'MJ绘画任务扩展临时表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task_reamrk
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task_reamrk`;
CREATE TABLE `df_draw_task_reamrk`  (
                                        `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                        `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                        `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                        `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                        `ref_task_id` bigint NULL DEFAULT NULL COMMENT '绘画任务ID',
                                        `label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '标签',
                                        `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '备注',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1691264153135915010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '绘画任务标记表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task_tag
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task_tag`;
CREATE TABLE `df_draw_task_tag`  (
                                     `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                     `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                     `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                     `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                     `task_id` bigint NULL DEFAULT NULL COMMENT '任务id',
                                     `tag_id` bigint NULL DEFAULT NULL COMMENT '标签id',
                                     `tag_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '标签名',
                                     `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                     PRIMARY KEY (`id`) USING BTREE,
                                     INDEX `idx_taskId_labelName`(`task_id` ASC, `tag_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1736376804656549890 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '绘画任务标签' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_draw_task_upscale
-- ----------------------------
DROP TABLE IF EXISTS `df_draw_task_upscale`;
CREATE TABLE `df_draw_task_upscale`  (
                                         `id` bigint NOT NULL COMMENT 'Id',
                                         `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                         `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         `upscale_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片连接，这里是media缩略图高清连接',
                                         `media_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片连接，这里是media缩略图连接',
                                         `prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '关键词',
                                         `public_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT 'N' COMMENT '公开标识 Y是N否',
                                         `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                         `count_hot` int NULL DEFAULT NULL COMMENT '火热数',
                                         `count_collect` int NULL DEFAULT NULL COMMENT '收藏数',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '大图提取' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_drawing_example
-- ----------------------------
DROP TABLE IF EXISTS `df_drawing_example`;
CREATE TABLE `df_drawing_example`  (
                                       `id` bigint NOT NULL,
                                       `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                       `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片连接',
                                       `rewrite_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重写url',
                                       `prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '关键词',
                                       `sort` int NOT NULL DEFAULT 0,
                                       `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                       `show_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT 'Y是N否',
                                       `md5_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一标识',
                                       `source` enum('MJ','SYS') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'SYS' COMMENT '来源',
                                       PRIMARY KEY (`id`) USING BTREE,
                                       UNIQUE INDEX `idx_md5Key`(`md5_key` ASC) USING BTREE,
                                       INDEX `idx_sort_id`(`sort` ASC, `id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_drawing_example_category
-- ----------------------------
DROP TABLE IF EXISTS `df_drawing_example_category`;
CREATE TABLE `df_drawing_example_category`  (
                                                `id` bigint NOT NULL,
                                                `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类目名称',
                                                `sort` int NOT NULL DEFAULT 0,
                                                `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                                `category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类目编码',
                                                PRIMARY KEY (`id`) USING BTREE,
                                                INDEX `idx_category_code`(`category_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_drawing_example_rel
-- ----------------------------
DROP TABLE IF EXISTS `df_drawing_example_rel`;
CREATE TABLE `df_drawing_example_rel`  (
                                           `id` bigint NOT NULL,
                                           `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                           `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                           `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                           `sample_id` bigint NULL DEFAULT NULL COMMENT '样例id',
                                           `category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类目编码',
                                           PRIMARY KEY (`id`) USING BTREE,
                                           UNIQUE INDEX `unix_categoryCode_sampleId`(`sample_id` ASC, `category_code` ASC) USING BTREE,
                                           INDEX `idx_category_code`(`category_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_goods
-- ----------------------------
DROP TABLE IF EXISTS `df_goods`;
CREATE TABLE `df_goods`  (
                             `id` bigint NOT NULL,
                             `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                             `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                             `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
                             `goods_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品标题',
                             `stock` int NULL DEFAULT NULL COMMENT '商品库存',
                             `detail_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '商品描述',
                             `image_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品url连接',
                             `proxy_image_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '代理图片连接',
                             `goods_type` enum('GROUP','GOODS','AUTH_CODE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品类型 GROUP,GOODS',
                             `ref_id` bigint NULL DEFAULT NULL COMMENT '关联id',
                             `special_label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '特殊标签',
                             `goods_price` decimal(16, 2) NULL DEFAULT NULL COMMENT '商品价格',
                             `min_group_members` int NULL DEFAULT NULL COMMENT '最低成团人数',
                             `max_group_members` int NULL DEFAULT NULL COMMENT '最多成团人数',
                             `category_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品类目',
                             `goods_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品状态 UP、DOWN',
                             `skip_type` enum('THIRD','PLATFORM') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'PLATFORM' COMMENT '商品跳转类型 THIRD,PLATFORM',
                             `skip_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '跳转连接',
                             `info_body` json NULL COMMENT '更多详情',
                             PRIMARY KEY (`id`) USING BTREE,
                             INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
                             INDEX `idx_goods_title`(`goods_title` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_goods_stock
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_stock`;
CREATE TABLE `df_goods_stock`  (
                                   `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                   `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                   `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                   `goods_id` bigint NOT NULL DEFAULT 0 COMMENT '商品id',
                                   `info_body` json NULL COMMENT '更多详情 比如授权码，比如账号密码',
                                   `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '备注',
                                   `state` enum('NONE','OUT_BOUND') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'NONE' COMMENT '状态\'NONE\',\'OUT_BOUND\' ',
                                   PRIMARY KEY (`id`) USING BTREE,
                                   INDEX `goods_id`(`goods_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1707787398890823682 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '商品库存表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_group_activity
-- ----------------------------
DROP TABLE IF EXISTS `df_group_activity`;
CREATE TABLE `df_group_activity`  (
                                      `id` bigint NOT NULL,
                                      `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                      `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                      `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                      `goods_id` bigint NULL DEFAULT NULL COMMENT '商品ID',
                                      `leader_user_id` bigint NULL DEFAULT NULL COMMENT '拼团领队ID',
                                      `goods_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品标题',
                                      `detail_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '商品描述',
                                      `image_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品url连接',
                                      `type` int NULL DEFAULT NULL COMMENT '商品类型',
                                      `special_lable` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '特殊标签',
                                      `goods_price` decimal(16, 2) NULL DEFAULT NULL COMMENT '商品价格',
                                      `min_group_memebers` int NULL DEFAULT NULL COMMENT '最低成团人数',
                                      `max_group_memebers` int NULL DEFAULT NULL COMMENT '最多成团人数',
                                      `category_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品类目',
                                      `status` enum('PENDING','SUCCESS','FAILED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'PENDING' COMMENT '拼团状态',
                                      PRIMARY KEY (`id`) USING BTREE,
                                      INDEX `idx_leader_user_id`(`leader_user_id` ASC) USING BTREE,
                                      INDEX `idx_goods_id`(`goods_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '拼团表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_group_activity_member
-- ----------------------------
DROP TABLE IF EXISTS `df_group_activity_member`;
CREATE TABLE `df_group_activity_member`  (
                                             `id` bigint NOT NULL,
                                             `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                             `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                             `group_activity_id` bigint NULL DEFAULT NULL COMMENT '拼团成员ID',
                                             `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
                                             PRIMARY KEY (`id`) USING BTREE,
                                             INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
                                             INDEX `idx_goods_id`(`group_activity_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_message_consumer
-- ----------------------------
DROP TABLE IF EXISTS `df_message_consumer`;
CREATE TABLE `df_message_consumer`  (
                                        `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                        `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                        `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                        `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                        `md5_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '消息md5',
                                        `consumer_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '消费标识Y是N否',
                                        `topic` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT 'topic名称',
                                        `consumer_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '消费组名称',
                                        PRIMARY KEY (`id`) USING BTREE,
                                        INDEX `idx_md5Key_consumerFlag`(`md5_key` ASC, `consumer_flag` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1713540973226926082 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '消息消费管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_notice
-- ----------------------------
DROP TABLE IF EXISTS `df_notice`;
CREATE TABLE `df_notice`  (
                              `id` bigint NOT NULL COMMENT 'Id',
                              `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                              `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识 0 正常 1删除',
                              `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
                              `enable_state` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '启用状态Y是N否',
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_robot_prompt
-- ----------------------------
DROP TABLE IF EXISTS `df_robot_prompt`;
CREATE TABLE `df_robot_prompt`  (
                                    `id` bigint NOT NULL,
                                    `question` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '翻译名称',
                                    `prompt` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'prompt',
                                    `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片连接',
                                    `type` int NULL DEFAULT NULL COMMENT '类型',
                                    `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                    `category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类目',
                                    `rewrite_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重写url',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    INDEX `idx_category_code`(`category_code` ASC) USING BTREE,
                                    INDEX `idx_question`(`question` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_robot_prompt_like
-- ----------------------------
DROP TABLE IF EXISTS `df_robot_prompt_like`;
CREATE TABLE `df_robot_prompt_like`  (
                                         `id` bigint NOT NULL,
                                         `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                         `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
                                         `prompt_id` bigint NULL DEFAULT NULL COMMENT 'promptId',
                                         PRIMARY KEY (`id`) USING BTREE,
                                         UNIQUE INDEX `unix_ui_pi`(`user_id` ASC, `prompt_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_server_zone
-- ----------------------------
DROP TABLE IF EXISTS `df_server_zone`;
CREATE TABLE `df_server_zone`  (
                                   `id` bigint NOT NULL COMMENT 'Id',
                                   `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                   `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                   `use_level` int NULL DEFAULT 0 COMMENT '使用等级',
                                   `zone_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '名称',
                                   `public_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '公开标识Y是N否',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = 'Discord区域服务配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_trade
-- ----------------------------
DROP TABLE IF EXISTS `df_trade`;
CREATE TABLE `df_trade`  (
                             `id` bigint NOT NULL COMMENT 'Id',
                             `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                             `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                             `order_type` enum('GROUP','GOODS','AUTH_CODE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'GOODS' COMMENT '订单类型',
                             `out_trade_no` bigint NULL DEFAULT NULL COMMENT '订单号',
                             `trade_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '交易流水号',
                             `buyer_id` bigint NULL DEFAULT NULL COMMENT '买家id',
                             `state` enum('WAIT_PAY','WAIT_SEND','FINISHED','CANCEL','CLOSED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'WAIT_PAY' COMMENT '订单状态 \'CREATE\',\'WAIT_PAY\',\'WAIT_SEND\',\'FINISHED\',\'CNACEL\'',
                             `pay_state` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '支付状态 Y是N否',
                             `gmt_pay` datetime NULL DEFAULT NULL COMMENT '支付时间',
                             `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '备注',
                             `goods_id` bigint NULL DEFAULT NULL COMMENT '商品id',
                             `goods_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商品标题',
                             `goods_price` decimal(16, 2) NULL DEFAULT NULL COMMENT '价格',
                             `deliver_obj` json NULL COMMENT '发货内容',
                             `qr_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '支付二维码',
                             `seller_id` bigint NULL DEFAULT NULL COMMENT '卖家ID',
                             `gmt_deliver` datetime NULL DEFAULT NULL COMMENT '发货时间',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_trade_result
-- ----------------------------
DROP TABLE IF EXISTS `df_trade_result`;
CREATE TABLE `df_trade_result`  (
                                    `id` bigint NOT NULL COMMENT 'Id',
                                    `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                    `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `notify_time` datetime NULL DEFAULT NULL COMMENT '通知时间。通知的发送时间。格式为 yyyy-MM-dd HH:mm:ss。',
                                    `notify_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通知类型。枚举值：trade_status_sync。',
                                    `notify_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通知校验 ID。',
                                    `sign_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签名类型。商家生成签名字符串所使用的签名算法类型，目前支持 RSA2 和 RSA，推荐使用 RSA2（如果开发者手动验签，不使用 SDK 验签，可以不传此参数）。',
                                    `sign` varchar(344) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签名。可查看异步返回结果的验签（如果开发者手动验签，不使用 SDK 验签，可以不传此参数）。',
                                    `trade_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝交易号。支付宝交易凭证号。',
                                    `app_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开发者的 app_id。支付宝分配给开发者的应用 APPID。',
                                    `auth_app_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开发者的 app_id，在服务商调用的场景下为授权方的 app_id。',
                                    `out_trade_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户订单号。',
                                    `out_biz_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家业务号。商家业务 ID，主要是退款通知中返回退款申请的流水号。',
                                    `buyer_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家支付宝用户号。买家支付宝账号对应的支付宝唯一用户号。',
                                    `buyer_logon_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家支付宝账号。',
                                    `seller_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家支付宝用户号。',
                                    `seller_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家支付宝账号。',
                                    `trade_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易状态。咨询目前所处的状态。',
                                    `total_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '订单金额。本次交易支付的订单金额，单位为人民币（元）。支持小数点后两位。',
                                    `receipt_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '实收金额。商家在交易中实际收到的款项，单位为人民币（元）。支持小数点后两位。',
                                    `invoice_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '开票金额。用户在交易中支付的可开发票的金额。支持小数点后两位。',
                                    `buyer_pay_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '付款金额。用户在咨询中支付的金额。支持小数点后两位。',
                                    `point_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '集分宝金额。使用集分宝支付的金额。支持小数点后两位。',
                                    `refund_fee` decimal(11, 2) NULL DEFAULT NULL COMMENT '总退款金额。退款通知中，返回总退款金额，单位为元，支持小数点后两位。',
                                    `send_back_fee` decimal(11, 2) NULL DEFAULT NULL COMMENT '实际退款金额。商家实际退款给用户的金额，单位为元，支持小数点后两位。',
                                    `subject` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单标题。商品的标题/交易标题/订单标题/订单关键字等，是请求时对应的参数，原样通知回来。',
                                    `body` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品描述。该订单的备注、描述、明细等。对应请求时的 body 参数，原样通知回来。',
                                    `gmt_create` datetime NULL DEFAULT NULL COMMENT '交易创建时间。该笔交易创建的时间。格式为 yyyy-MM-dd HH:mm:ss。',
                                    `gmt_payment` datetime NULL DEFAULT NULL COMMENT '交易 付款时间。该笔交易的买家付款时间。格式为 yyyy-MM-dd HH:mm:ss。',
                                    `gmt_refund` datetime NULL DEFAULT NULL COMMENT '交易退款时间。该笔交易的退款时间。格式 为 yyyy-MM-dd HH:mm:ss.SS。',
                                    `gmt_close` datetime NULL DEFAULT NULL COMMENT '交易结束时间。该笔交易结束时间。格式为 yyyy-MM-dd HH:mm:ss。',
                                    `fund_bill_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '支付金额信息。支付成功的各个渠道金额信息，详请可查看下表资金明细信息说明。',
                                    `voucher_detail_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '优惠券信息。本交易支付时所使用的所有优惠券信息，详请可查看下表优惠券信息说明。',
                                    `biz_settle_mode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账期结算标识，指已完成支付的订单会进行账期管控，不会实时结算。该参数目前会在使用小程序交易组件场景下返回。'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_user
-- ----------------------------
DROP TABLE IF EXISTS `df_user`;
CREATE TABLE `df_user`  (
                            `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                            `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                            `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                            `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '手机号',
                            `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '邮箱',
                            `nick_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '昵称',
                            `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '密码',
                            `user_icon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '头像',
                            `gmt_login` datetime NULL DEFAULT NULL COMMENT '登录时间',
                            `user_level` int NULL DEFAULT NULL COMMENT '用户等级',
                            `account_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '账号编码',
                            `state` enum('unvaild','normal','forbidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'unvaild' COMMENT '账号状态unvaild，normal，forbidden',
                            `ref_user_id` bigint NULL DEFAULT NULL COMMENT '关联用户id',
                            `role` enum('ADMIN','USER','SUPPLIER') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'USER' COMMENT '身份角色 ADMIN USER SUPPLIER ',
                            PRIMARY KEY (`id`) USING BTREE,
                            UNIQUE INDEX `unix_email`(`email` ASC) USING BTREE,
                            INDEX `idx_gmt_create`(`gmt_create` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1736579403154194435 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_user_reamrk
-- ----------------------------
DROP TABLE IF EXISTS `df_user_reamrk`;
CREATE TABLE `df_user_reamrk`  (
                                   `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                   `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                   `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                   `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
                                   `label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '标签',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1691264153135915010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '用户标记表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_user_setting
-- ----------------------------
DROP TABLE IF EXISTS `df_user_setting`;
CREATE TABLE `df_user_setting`  (
                                    `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                    `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                    `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `num_discord_import` int NULL DEFAULT NULL COMMENT 'discord 导入限制数量',
                                    `enable_acc_group` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '创建账号组权限',
                                    `enable_pub_goods` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '发布商品权限',
                                    `face_pay` json NULL COMMENT '当面付配置',
                                    `system_setting` json NULL COMMENT '系统个性化设置',
                                    `oss_setting` json NULL COMMENT '默认oss',
                                    `enable_oss` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '启用OSS Y是N否',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1736579403154194435 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '用户个性化配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_user_shop
-- ----------------------------
DROP TABLE IF EXISTS `df_user_shop`;
CREATE TABLE `df_user_shop`  (
                                 `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                 `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                 `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                 `shop_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '店铺编号',
                                 `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                 `shop_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '店铺图标',
                                 `shop_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '店铺名',
                                 `shop_type` enum('THIRD','SYS') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT 'THIRD' COMMENT '店铺类型',
                                 `link_url` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '跳转连接',
                                 `describe_info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺描述',
                                 `business_scope` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '[]' COMMENT '经营范围',
                                 `shop_label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '号商',
                                 `apply_status` enum('APPLY','REJECT','SUCCESS') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT 'APPLY' COMMENT '启用标识 Y是N否',
                                 `status` enum('ENABLE','CLOSED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'CLOSED' COMMENT '启用 & 关闭',
                                 `credit_level` tinyint NULL DEFAULT 1 COMMENT '信用等级',
                                 `apply_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '申请原因',
                                 `reject_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '驳回原因',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1730071445432201218 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '用户店铺表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_user_space
-- ----------------------------
DROP TABLE IF EXISTS `df_user_space`;
CREATE TABLE `df_user_space`  (
                                  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '空间标题',
                                  `default_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'N' COMMENT '默认工作区Y是N否',
                                  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '备注',
                                  `sort` int NULL DEFAULT 99 COMMENT '排序',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1736579404848693250 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '用户工作空间' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_user_space_task
-- ----------------------------
DROP TABLE IF EXISTS `df_user_space_task`;
CREATE TABLE `df_user_space_task`  (
                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                       `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                       `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                       `space_id` bigint NULL DEFAULT NULL COMMENT '空间id',
                                       `task_id` bigint NULL DEFAULT NULL COMMENT '任务id',
                                       PRIMARY KEY (`id`) USING BTREE,
                                       UNIQUE INDEX `unix_taskId_spaceId`(`space_id` ASC, `task_id` ASC) USING BTREE,
                                       INDEX `idx_taskId_spaceId_modified`(`space_id` ASC, `task_id` ASC, `gmt_modified` DESC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1737004152971853826 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '用户工作空间关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_user_suggest
-- ----------------------------
DROP TABLE IF EXISTS `df_user_suggest`;
CREATE TABLE `df_user_suggest`  (
                                    `id` bigint NOT NULL COMMENT 'Id',
                                    `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                    `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                    `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '标题',
                                    `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '内容',
                                    `image_urls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '相关图片',
                                    `category_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '反馈类目',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '用户反馈表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for df_user_tag
-- ----------------------------
DROP TABLE IF EXISTS `df_user_tag`;
CREATE TABLE `df_user_tag`  (
                                `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                                `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                                `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                `tag_name` bigint NULL DEFAULT NULL COMMENT '标签名',
                                PRIMARY KEY (`id`) USING BTREE,
                                INDEX `idx_user_id_tag_name`(`user_id` ASC, `tag_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci  COMMENT = '用户标签管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
                             `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Id',
                             `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
                             `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `gmt_modified` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                             `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
                             `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
                             `component` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '控件路径',
                             `redirect` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '重定向',
                             `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父级菜单',
                             `meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '数据',
                             `roles` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '[\"ADMIN\",\"USER\",\"SUPPLIER\"]' COMMENT '允许的角色列表',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统菜单' ROW_FORMAT = Dynamic;



INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (1, 0, '2023-11-19 11:54:36', '2023-11-19 14:44:31', '/mj', 'mj', 'LAYOUT', '/mj/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"pepicons-pencil:paint-pallet\", \"title\": \"routes.app.mj.pageTitle\", \"orderNo\": 10}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (2, 0, '2023-11-19 11:54:37', '2023-11-19 14:44:48', '/mj/index', 'mjPage', '/df/mj/index.vue', NULL, '1', '{\"title\": \"routes.app.mj.pageTitle\", \"icon\": \"pepicons-pencil:paint-pallet\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (3, 0, '2023-11-19 11:55:14', '2023-11-19 14:44:16', '/accDiscord', 'AccDiscord', 'LAYOUT', '/accDiscord/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"mdi:table-account\", \"title\": \"routes.app.account.pageTitle\", \"orderNo\": 40}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (4, 0, '2023-11-19 11:55:14', '2023-11-19 14:44:48', '/accDiscord/index', 'AccDiscordPage', '/df/discord/index.vue', NULL, '3', '{\"icon\": \"mdi:table-account\", \"title\": \"routes.app.account.pageTitle\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (5, 0, '2023-11-19 11:55:50', '2023-11-19 14:44:13', '/collect', 'Collect', 'LAYOUT', '/collect/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"icon-park-twotone:collect-picture\", \"title\": \"routes.app.collect.pageTitle\", \"orderNo\": 21, \"ignoreKeepAlive\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (6, 0, '2023-11-19 11:55:50', '2023-11-19 14:44:48', '/collect/index', 'collectPage', '/df/collect/index.vue', NULL, '5', '{\"title\": \"routes.app.collect.pageTitle\", \"icon\": \"icon-park-twotone:collect-picture\", \"hideMenu\": true, \"ignoreKeepAlive\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (7, 0, '2023-11-19 11:56:14', '2023-11-19 14:44:09', '/example', 'Example', 'LAYOUT', '/example/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"streamline:ecology-science-alien-extraterristerial-life-form-space-universe-head\", \"title\": \"routes.app.example.pageTitle\", \"orderNo\": 21}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (8, 0, '2023-11-19 11:56:14', '2023-12-14 23:33:11', '/example/index', 'examplePage', '/df/example/index.vue', NULL, '7', '{\"title\": \"routes.app.example.pageTitle\", \"auth\":false, \"icon\": \"streamline:ecology-science-alien-extraterristerial-life-form-space-universe-head\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (9, 0, '2023-11-19 11:56:23', '2023-11-19 14:44:05', '/goods', 'Goods', 'LAYOUT', '/goods/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"ph:shopping-cart-bold\", \"title\": \"routes.app.goods.pageTitle\", \"orderNo\": 40, \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (10, 0, '2023-11-19 11:56:23', '2023-11-19 14:44:48', '/goods/index', 'GoodsPage', '/df/goods/index.vue', NULL, '9', '{\"icon\": \"ph:shopping-cart-bold\", \"title\": \"routes.app.goods.pageTitle\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (11, 0, '2023-11-19 12:00:53', '2023-11-24 16:57:18', '/chatgpt', 'Chatgpt', 'LAYOUT', '/chatgpt/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"logos:openai-icon\", \"title\": \"routes.app.gpt.pageTitle\", \"orderNo\": 25}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (13, 0, '2023-11-19 12:02:06', '2023-11-19 14:43:56', '/jobList', 'JobList', 'LAYOUT', '/jobList/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"ant-design:comment-outlined\", \"title\": \"routes.app.jobList.pageTitle\", \"orderNo\": 40, \"hideMenu\": true, \"ignoreKeepAlive\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (14, 0, '2023-11-19 12:02:07', '2023-11-19 14:44:48', '/jobList/index/:spaceId/:spaceTitle', 'JobListPage', '/df/mj/mobile/jobList.vue', NULL, '13', '{\"icon\": \"ant-design:comment-outlined\", \"title\": \"routes.app.jobList.pageTitle\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (15, 0, '2023-11-19 12:02:16', '2023-11-19 14:50:34', '/tools-link', 'ToolsLink', 'LAYOUT', '/tools-link/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"ant-design:idcard-outlined\", \"title\": \"routes.app.xhongs.pageTitle\", \"orderNo\": 40, \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (16, 0, '2023-11-19 12:02:16', '2023-11-19 14:36:19', '/tools-link/index', 'ToolsLinkPage', '/df/tools/link/index.vue', NULL, '15', '{\"icon\": \"ant-design:idcard-outlined\", \"title\": \"routes.app.xhongs.pageTitle\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (17, 0, '2023-11-19 12:02:50', '2023-11-22 10:41:38', '/public', 'Public', 'LAYOUT', '/public/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"gis:earth-north\", \"title\": \"routes.app.public.pageTitle\", \"orderNo\": 21, \"ignoreKeepAlive\": true,\"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (18, 0, '2023-11-19 12:02:50', '2023-11-19 14:44:48', '/public/index', 'publicPage', '/df/public/index.vue', NULL, '17', '{\"title\": \"routes.app.public.pageTitle\", \"icon\": \"gis:earth-north\", \"hideMenu\": true, \"ignoreKeepAlive\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (19, 0, '2023-11-19 12:02:59', '2023-11-19 14:43:36', '/setting', 'Setting', 'LAYOUT', '/setting/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"icon-park-twotone:people-safe\", \"title\": \"routes.app.setting.pageTitle\", \"orderNo\": 100, \"ignoreKeepAlive\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (20, 0, '2023-11-19 12:02:59', '2023-11-19 14:44:48', '/setting/index', 'SettingPage', '/df/setting/index.vue', NULL, '19', '{\"title\": \"routes.app.setting.pageTitle\", \"icon\": \"icon-park-twotone:people-safe\", \"hideMenu\": true, \"ignoreKeepAlive\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (21, 0, '2023-11-19 12:03:26', '2023-11-19 14:43:32', '/shop', 'Shop', 'LAYOUT', '/shop/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"ph:shopping-cart-bold\", \"title\": \"routes.app.shop.pageTitle\", \"orderNo\": 42}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (22, 0, '2023-11-19 12:03:26', '2023-11-19 14:44:48', '/shop/index', 'ShopPage', '/df/shop/shop_pc.vue', NULL, '21', '{\"icon\": \"ph:shopping-cart-bold\", \"title\": \"routes.app.shop.pageTitle\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (23, 0, '2023-11-19 12:03:33', '2023-11-19 14:43:15', '/prompt', 'Prompt', 'LAYOUT', '/prompt/index', NULL, '{\"orderNo\": 20, \"icon\": \"ant-design:coffee-outlined\", \"title\": \"routes.mj.tools\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (24, 0, '2023-11-19 12:03:34', '2023-11-19 14:44:48', '/prompt/index', 'PromptIndex', 'IFrame', NULL, '23', '{\"frameSrc\": \"https://ai.sppinfo.cn/\", \"icon\": \"ant-design:coffee-outlined\", \"title\": \"routes.mj.tools\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (25, 0, '2023-11-19 12:04:13', '2023-11-19 14:43:10', '/trade', 'Trade', 'LAYOUT', '/trade/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"icon-park-outline:order\", \"title\": \"routes.app.trade.pageTitle\", \"orderNo\": 42, \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (26, 0, '2023-11-19 12:04:13', '2023-11-19 14:44:48', '/trade/index', 'tradePage', '/df/trade/index.vue', NULL, '25', '{\"title\": \"routes.app.trade.pageTitle\", \"icon\": \"icon-park-outline:order\", \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (111, 0, '2023-11-19 12:00:53', '2023-11-24 17:02:04', '/chatgpt/index', 'ChatgptPage', '/df/chatgpt/index.vue', NULL, '11', '{\"icon\": \"logos:openai-icon\", \"title\": \"GPT对话\", \"hideMenu\": false}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (112, 0, '2023-11-19 12:00:53', '2023-11-24 17:02:15', 'https://chat-shared3.zhile.io/shared.html?v=2', 'pandora-public', '', NULL, '11', '{\"icon\": \"gis:earth-north\", \"title\": \"公开PLUS\",\"hideMenu\": false}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (113, 0, '2023-11-19 12:00:53', '2023-11-24 17:03:42', '/pandora-private', 'pandora-private', '', NULL, '11', '{\"icon\": \"fluent:person-key-20-filled\", \"title\": \"拼团PLUS\",\"frameSrc\": \"https://gpt.gfish.top\", \"hideMenu\": false}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (130, 0, '2023-11-19 11:54:36', '2023-12-07 23:51:53', '/jobList', 'jobList', 'LAYOUT', '/jobList/index', NULL, '{\"hideChildrenInMenu\": true, \"icon\": \"pepicons-pencil:paint-pallet\", \"title\": \"routes.app.jobList.pageTitle\", \"orderNo\": 120, \"hideMenu\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');
INSERT INTO `sys_menu` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `path`, `name`, `component`, `redirect`, `parent_id`, `meta`, `roles`) VALUES (131, 0, '2023-11-19 11:54:37', '2023-12-08 00:02:38', '/jobList/index', 'jobListPage', '/df/mj/mobile/JobList.vue', NULL, '130', '{\"title\": \"routes.app.jobList.pageTitle\", \"icon\": \"icon-park-twotone:collect-picture\", \"hideMenu\": true, \"ignoreKeepAlive\": true}', '[\"ADMIN\",\"USER\",\"SUPPLIER\"]');


INSERT INTO `df_user` (`id`, `delete_flag`, `gmt_create`, `gmt_modified`, `phone`, `email`, `nick_name`, `password`, `user_icon`, `gmt_login`, `user_level`, `account_code`, `state`, `ref_user_id`, `role`) VALUES (1687012973309075458, 0, '2023-08-03 16:10:10', '2023-12-19 11:53:07', '153XXXXXXXX', 'admin@admin.com', 'admin', '57331081823331c4', 'https://q1.qlogo.cn/g?b=qq&nk=190848757&s=640', '2023-12-19 03:53:07', 66, '666', 'normal', NULL, 'ADMIN');

INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (1, '2023-08-15 13:19:49', '2023-08-15 13:19:49', 0, 'PROXY', 'DISCORD图片代理地址', 'DISCORD_IMAGE_PROXY', '', '[\"https://cdn.gfish.top\"]', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (3, '2023-09-13 10:48:26', '2023-09-13 10:48:26', 0, 'COOKIE_XHS', '小红书COOKIE', 'COOKIE_XHS', '', '', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (11, '2023-08-15 13:19:49', '2023-08-15 13:19:49', 0, 'PROXY', 'GPT代理', 'GPT_PROXY', '', '[\"https://mtf-cdn.gfish.top\"]', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (13, '2023-11-08 09:32:54', '2023-11-08 09:32:54', 0, 'BAIDU_TRANS_CONFIG', '百度翻译', 'BAIDU_TRANS_CONFIG', '', '{\r\n			\"appid\":\"\",\r\n			\"appSecret\":\"\"\r\n		}', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (15, '2023-11-12 10:07:43', '2023-11-12 10:07:43', 0, 'PROXY', 'CF图片代理', 'CF_PROXY', '', '[]', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (40, '2023-09-13 14:07:02', '2023-09-13 14:07:02', 0, 'WCHAT_GROUP', 'QQ交流配置', 'WCHAT_GROUP', '', '{\r\n\"wchatImage\":\"\",\r\n\"qqGroupList\":[]\r\n}', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (41, '2023-12-12 14:26:08', '2023-12-12 14:26:08', 0, 'TUTORIAL_INFO', '教程连接', 'TUTORIAL_INFO', '', 'https://x1grt4bhomu.feishu.cn/docx/TFB4dMBr9oEi0HxzrgmcqVV3njg', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (101, '2023-08-15 13:19:49', '2023-08-15 13:19:49', 0, 'MJ_PROMPT', 'niji敏感词', 'NIJI_BAN', '', '[\"blood\", \"twerk\", \"making love\", \"voluptuous\", \"naughty\", \"wincest\", \"orgy\", \"no clothes\", \"au naturel\", \"no shirt\", \"decapitate\", \"bare\", \"nude\", \"barely dressed\", \"nude\", \"bra\", \"risque\", \"scantily clad\", \"cleavage\", \"stripped\", \"infested\", \"full frontal\", \"unclothed\", \"invisible clothes\", \"wearing nothing\", \"lingerie\", \"with no shirt\", \"naked\", \"without clothes on\", \"negligee\", \"zero clothes\", \"gruesome\", \"fascist\", \"nazi\", \"prophet mohammed\", \"slave\", \"coon\", \"honkey\", \"cocaine\", \"heroin\", \"meth\", \"crack\", \"kill\", \"belle delphine\", \"hitler\", \"jinping\", \"lolita\", \"president xi\", \"torture\", \"disturbing\", \"farts\", \"fart\", \"poop\", \"infected\", \"warts\", \"shit\", \"brown pudding\", \"bunghole\", \"vomit\", \"voluptuous\", \"seductive\", \"sperm\", \"sexy\", \"sadist\", \"sensored\", \"censored\", \"silenced\", \"deepfake\", \"inappropriate\", \"waifu\", \"succubus\", \"slaughter\", \"surgery\", \"reproduce\", \"crucified\", \"seductively\", \"explicit\", \"inappropriate\", \"large bust\", \"explicit\", \"wang\", \"inappropriate\", \"teratoma\", \"intimate\", \"see through\", \"tryphophobia\", \"bloodbath\", \"wound\", \"cronenberg\", \"khorne\", \"cannibal\", \"cannibalism\", \"visceral\", \"guts\", \"bloodshot\", \"gory\", \"killing\", \"crucifixion\", \"surgery\", \"vivisection\", \"massacre\", \"hemoglobin\", \"suicide\", \"arse\", \"labia\", \"ass\", \"mammaries\", \"badonkers\", \"bloody\", \"minge\", \"big ass\", \"mommy milker\", \"booba\", \"nipple\", \"oppai\", \"booty\", \"organs\", \"bosom\", \"ovaries\", \"flesh\", \"breasts\", \"penis\", \"busty\", \"phallus\", \"clunge\", \"sexy female\", \"crotch\", \"skimpy\", \"dick\", \"thick\", \"bruises\", \"girth\", \"titty\", \"honkers\", \"vagina\", \"hooters\", \"veiny\", \"knob\", \"ahegao\", \"pinup\", \"ballgag\", \"car crash\", \"playboy\", \"bimbo\", \"pleasure\", \"bodily fluids\", \"pleasures\", \"boudoir\", \"rule34\", \"brothel\", \"seducing\", \"dominatrix\", \"corpse\", \"seductive\", \"erotic\", \"seductive\", \"fuck\", \"sensual\", \"hardcore\", \"sexy\", \"hentai\", \"shag\", \"horny\", \"crucified\", \"shibari\", \"incest\", \"smut\", \"jav\", \"succubus\", \"jerk off king at pic\", \"thot\", \"kinbaku\", \"legs spread\", \"sensuality\", \"belly button\", \"porn\", \"patriotic\", \"bleed\", \"excrement\", \"petite\", \"seduction\", \"mccurry\", \"provocative\", \"sultry\", \"erected\", \"camisole\", \"tight white\", \"arrest\", \"see-through\", \"feces\", \"anus\", \"revealing clothing\", \"vein\", \"loli\", \"-edge\", \"boobs\", \"-backed\", \"tied up\", \"zedong\", \"bathing\", \"jail\", \"reticulum\", \"rear end\", \"sakimichan\", \"behind bars\", \"shirtless\", \"sakimichan\", \"seductive\", \"sexi\", \"sexualiz\", \"sexual\"]', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (102, '2023-08-15 13:19:49', '2023-08-15 13:19:49', 0, 'MJ_PROMPT', '敏感词', 'BAN', '', '[\"blood\", \"twerk\", \"making love\", \"voluptuous\", \"naughty\", \"wincest\", \"orgy\", \"no clothes\", \"au naturel\", \"no shirt\", \"decapitate\", \"bare\", \"nude\", \"barely dressed\", \"nude\", \"bra\", \"risque\", \"scantily clad\", \"cleavage\", \"stripped\", \"infested\", \"full frontal\", \"unclothed\", \"invisible clothes\", \"wearing nothing\", \"lingerie\", \"with no shirt\", \"naked\", \"without clothes on\", \"negligee\", \"zero clothes\", \"gruesome\", \"fascist\", \"nazi\", \"prophet mohammed\", \"slave\", \"coon\", \"honkey\", \"cocaine\", \"heroin\", \"meth\", \"crack\", \"kill\", \"belle delphine\", \"hitler\", \"jinping\", \"lolita\", \"president xi\", \"torture\", \"disturbing\", \"farts\", \"fart\", \"poop\", \"infected\", \"warts\", \"shit\", \"brown pudding\", \"bunghole\", \"vomit\", \"voluptuous\", \"seductive\", \"sperm\", \"sexy\", \"sadist\", \"sensored\", \"censored\", \"silenced\", \"deepfake\", \"inappropriate\", \"waifu\", \"succubus\", \"slaughter\", \"surgery\", \"reproduce\", \"crucified\", \"seductively\", \"explicit\", \"inappropriate\", \"large bust\", \"explicit\", \"wang\", \"inappropriate\", \"teratoma\", \"intimate\", \"see through\", \"tryphophobia\", \"bloodbath\", \"wound\", \"cronenberg\", \"khorne\", \"cannibal\", \"cannibalism\", \"visceral\", \"guts\", \"bloodshot\", \"gory\", \"killing\", \"crucifixion\", \"surgery\", \"vivisection\", \"massacre\", \"hemoglobin\", \"suicide\", \"arse\", \"labia\", \"ass\", \"mammaries\", \"badonkers\", \"bloody\", \"minge\", \"big ass\", \"mommy milker\", \"booba\", \"nipple\", \"oppai\", \"booty\", \"organs\", \"bosom\", \"ovaries\", \"flesh\", \"breasts\", \"penis\", \"busty\", \"phallus\", \"clunge\", \"sexy female\", \"crotch\", \"skimpy\", \"dick\", \"thick\", \"bruises\", \"girth\", \"titty\", \"honkers\", \"vagina\", \"hooters\", \"veiny\", \"knob\", \"ahegao\", \"pinup\", \"ballgag\", \"car crash\", \"playboy\", \"bimbo\", \"pleasure\", \"bodily fluids\", \"pleasures\", \"boudoir\", \"rule34\", \"brothel\", \"seducing\", \"dominatrix\", \"corpse\", \"seductive\", \"erotic\", \"seductive\", \"fuck\", \"sensual\", \"hardcore\", \"sexy\", \"hentai\", \"shag\", \"horny\", \"crucified\", \"shibari\", \"incest\", \"smut\", \"jav\", \"succubus\", \"jerk off king at pic\", \"thot\", \"kinbaku\", \"legs spread\", \"sensuality\", \"belly button\", \"porn\", \"patriotic\", \"bleed\", \"excrement\", \"petite\", \"seduction\", \"mccurry\", \"provocative\", \"sultry\", \"erected\", \"camisole\", \"tight white\", \"arrest\", \"see-through\", \"feces\", \"anus\", \"revealing clothing\", \"vein\", \"loli\", \"-edge\", \"boobs\", \"-backed\", \"tied up\", \"zedong\", \"bathing\", \"jail\", \"reticulum\", \"rear end\", \"sakimichan\", \"behind bars\", \"shirtless\", \"sakimichan\", \"seductive\", \"sexi\", \"sexualiz\", \"sexual\"]', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (150, '2023-10-11 11:32:55', '2023-10-11 11:32:55', 0, 'NUM_DISCORD_IMPORT', 'DISCORD默认导入额度', 'NUM_DISCORD_IMPORT', '', '500', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (151, '2023-10-26 15:27:50', '2023-10-26 15:27:50', 0, 'DEFAULT_DISCORD_ACCOUNT', '默认用于更新API版本号的账号ID', 'DEFAULT_DISCORD_ACCOUNT', '', '', 0);
INSERT INTO `df_dict` (`id`, `gmt_create`, `gmt_modified`, `delete_flag`, `group_key`, `group_name`, `cons_key`, `cons_name`, `cons_value`, `sort`) VALUES (152, '2023-12-27 10:26:43', '2023-12-27 10:26:43', 0, 'PANDORA_CONFIG_INFO', 'Pandora 配置', 'PANDORA_CONFIG_INFO', '', '{\r\n    \"host\": \"",\r\n    \"poolToken\": \"\",    \"apiPrefix\": \"gpt4Access\",\r\n}', 0);


-- ----------------------------
-- Records of df_robot_prompt
-- ----------------------------
INSERT INTO `df_robot_prompt` VALUES (8616, '干净背景', 'clean background', 'changyongxiushi/4jqn2vsph0qi35r2.png', 12, '2023-08-20 16:11:19', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8617, '超广角', 'Ultra wide view shot', 'changyongxiushi/e8igrkfticl6frbo.png', 12, '2023-08-20 16:11:19', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8618, '半身拍摄', 'fullbody shot', 'changyongxiushi/5qw2rj6fzll9ytsl.png', 12, '2023-08-20 16:11:19', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8619, '低饱和度', 'low saturation', 'changyongxiushi/us6f0hn5ql9rieh0.png', 12, '2023-08-20 16:11:19', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8620, '景深', 'depth of field', 'changyongxiushi/4f16pkzh0ub4xcub.png', 12, '2023-08-20 16:11:19', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8621, '散点构图', 'Scattered Composition', 'changyongxiushi/hgh5p49ep4eozu5w.png', 12, '2023-08-20 16:11:19', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8622, '获奖作品', 'Award-winning', 'changyongxiushi/f8huskiglt2a3pik.png', 12, '2023-08-20 16:11:19', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8623, '全身拍摄', 'half body shot', 'changyongxiushi/9jptdyrwe052dc3c.png', 12, '2023-08-20 16:11:19', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8624, '全息五彩', 'holographic', 'changyongxiushi/b8o2sq4n9wam7vet.png', 12, '2023-08-20 16:11:19', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8625, '电影质感', 'cinematic style', 'changyongxiushi/nujcyhlbgt3asyf6.png', 12, '2023-08-20 16:11:19', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8626, '对称构图', 'symmetrical composition', 'changyongxiushi/kxl4o5zpfeqt1h4x.png', 12, '2023-08-20 16:11:19', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8627, '仰视视角', 'upside-down Composition', 'changyongxiushi/m4l74mssjanqxjc2.png', 12, '2023-08-20 16:11:19', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8628, '未来主义', 'Futurism', 'changyongxiushi/70nmngmph1y7ow85.png', 12, '2023-08-20 16:11:19', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8629, '复杂细节', 'detailed intricate', 'changyongxiushi/7ptsajddjybhwa3g.png', 12, '2023-08-20 16:11:19', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8630, '纪实摄影', 'documentary photography', 'changyongxiushi/zawe63rp3flgsk30.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8631, '复古未来主义', 'Retro-futurism', 'changyongxiushi/57144d66wwms9s1m.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8632, '超写实', 'hyper realistic', 'changyongxiushi/0ep12kvxpvh5g9l6.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8633, '极简主义', 'minimalist', 'changyongxiushi/drcnkabwrdiq76kp.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8634, '超细节', 'hyper detailed', 'changyongxiushi/zs013c4ao0xu1fwe.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8635, '超现实主义', 'surrealism', 'changyongxiushi/yefkucwqfc2814yq.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8636, '超模', 'supermodel', 'changyongxiushi/6i1gtwwyah2vhtmc.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8637, '3D渲染', '3D rendering', 'changyongxiushi/9i0jp2ev3wqzc2za.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8638, '拟真感', 'photorealistic', 'changyongxiushi/790o3o4s9f9vsvyv.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8639, 'Blender软件', 'Blender', 'changyongxiushi/otunyc5deq973tlt.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8640, '3D模型', '3D model', 'changyongxiushi/23gzdnem843wl6uj.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8641, 'C4D软件', 'Cinema4D', 'changyongxiushi/pke21yjtj0jpd530.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8642, 'OC渲染器', 'octane rendering', 'changyongxiushi/hukyqnlv3zs2c4vg.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8643, '超精细', 'ultra-detailed', 'changyongxiushi/m2r0ev821akqupqh.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8644, '虚幻引擎5', 'unreal engine 5', 'changyongxiushi/hlnwjqq08lp6r30x.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8645, '高分辨率', 'high resolution', 'changyongxiushi/1xocjsnf36ceuezi.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8646, '16K质量', '16K', 'changyongxiushi/okye0enfzhj03bbl.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8647, 'HDR效果', 'HDR', 'changyongxiushi/y6viw5982oevrazx.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8648, '超高清', 'UHD', 'changyongxiushi/xbg7j8bhrg1m4h74.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8649, '最佳质量', 'Best quality', 'changyongxiushi/xns2ebtyo36yukg6.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8650, '等距效果', 'isometric', 'changyongxiushi/rw01za4p93he6iav.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8651, '摄影棚灯光', 'studio light', 'changyongxiushi/hsyqy1z030moijoe.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8652, '梦幻色彩', 'Dream colors', 'changyongxiushi/u94os4uwjedzap0t.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8653, '细腻肤质', 'delicate skin texture', 'changyongxiushi/fhmjxrxwygscwu0t.png', 12, '2023-08-20 16:11:18', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8654, '丰满妆容', 'full lipsheavy bright makeupnatural volumetric', 'changyongxiushi/6pm1ltaizgpsr52t.png', 12, '2023-08-20 16:11:17', '2023-12-28 13:54:21', 0, 'changyongxiushi', '');
INSERT INTO `df_robot_prompt` VALUES (8655, '奢华金', 'Luxurious Gold tones', 'yanse/on9clim6dcrjf5nd.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8656, '珊瑚色', 'Coral tones', 'yanse/gkiauqethd0g6gzl.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8657, '白', 'White color', 'yanse/2mzodsn4pfzv7xv0.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8658, '白绿', 'white and green tones', 'yanse/2v06ffo9sddmbjrs.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8659, '白紫', 'purple and white tones', 'yanse/56arfi117c8bwwm5.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8660, '白金', 'gold and white tone', 'yanse/qk3qvtx7zxz1uwea.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8661, '米色', 'Beige tones', 'yanse/cowlxjz35iuij0xi.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8662, '白红', 'white and red tones', 'yanse/5lllyqp02q9qhxqj.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8663, '粉彩色', 'Pastel Color tones', 'yanse/3h4k2x9rmnj76ar2.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8664, '白黄', 'yellow and white tones', 'yanse/3xvezo6eysezpgrp.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8665, '粉白', 'white and pink tone', 'yanse/n1j9w82a77qy6ktp.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8666, '莫兰迪色', 'Morandi tone', 'yanse/gge779115dhk23at.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8667, '象牙白', 'Ivory White tones', 'yanse/3ve0ro5830bao40a.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8668, '黑金', 'gold and black tone', 'yanse/9a80pr3zxh1nwbxb.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8669, '金银', 'Gold and silver tones', 'yanse/iwf4o52xq2ua8dng.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8670, '黑白', 'black and white color', 'yanse/i78ixgsiv49tseqo.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8671, '丹宁蓝', 'Denim Blue tones', 'yanse/5bhjiu9x8afzpgje.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8672, '天蓝', 'Azure tones', 'yanse/syxh4o92zxdcy546.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8673, '亮黑', 'Light-Black tones', 'yanse/rvv777xe9du8us63.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8674, '土耳其蓝', 'Turquoise tone', 'yanse/vnfw0vi2olj9e0ga.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8675, '宝宝蓝', 'baby blue tones', 'yanse/rvulqr0kxiokpt5w.png', 12, '2023-08-20 16:11:24', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8676, '时尚灰', 'Fashionable Gray tones', 'yanse/ftj0h5osmjb2oqhb.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8677, '枫叶红', 'Maple Red tone', 'yanse/uvx8u7orhppmmgn0.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8678, '樱桃', 'cherry tones', 'yanse/hhnvbwlwp3jch70q.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8679, '橄榄绿', 'Olive-Green', 'yanse/fqlzf1llb97v4aou.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8680, '橙色', 'orange tones', 'yanse/9jdcgvzt2269fpi5.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8681, '水绿', 'Aqua color', 'yanse/emlcp3mg4x5429zt.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8682, '玫瑰金', 'Rose Gold tones', 'yanse/pu5wn6wodx7n3o8x.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8683, '稳重蓝', 'Steady Blue tones', 'yanse/5t8pbmz914ede4ci.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8684, '紫罗兰', 'Lavender tones', 'yanse/4tih6mij1faufl1t.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8685, '粉', 'pink tones', 'yanse/gv6ykzt77a4jphcu.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8686, '红', 'red tones', 'yanse/33xus6zb70ytsojl.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8687, '绿松石', 'Turquoise color', 'yanse/4ksyfy2m4muuj2eb.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8688, '绿野仙踪', 'Emerald tones', 'yanse/uyeeetrlb5mmkus6.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8689, '自然绿', 'Natural Green tones', 'yanse/sskamfpv8jzcte7v.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8690, '芥末黄', 'mustard tones', 'yanse/45c0i0os46qh3rzv.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8691, '酒红', 'Burgundy tone', 'yanse/04xri3n1of78mzyc.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8692, '靛蓝', 'Indigo color', 'yanse/lyx0c57bt6wz10wg.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8693, '黄', 'yellow tones', 'yanse/s7lm0sk4ekal00n9.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8694, '黑', 'Black color', 'yanse/gk5vcbikxkkqizgp.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8695, '天空蓝', 'sky Blue color', 'yanse/xmbsjrq3ow9whoz2.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8696, '暖棕', 'Warm Brown tones', 'yanse/1t10k8rf5b4n0v9l.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8697, '柔粉', 'soft pink tones', 'yanse/r5ex6ywjouekzkjr.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8698, '暗黄', 'Dark-yellow tones', 'yanse/8jvcf7vjo326c638.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8699, '柠檬黄', 'Lemon Yellow tones', 'yanse/89xyhqwmnkq6le53.png', 12, '2023-08-20 16:11:23', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8700, '洋紫荆', 'Fuchsia color', 'yanse/926wevpus1934hjn.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8701, '浅橙', 'Light-Orange tones', 'yanse/3ho99z9cxlugc2z8.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8702, '浅绿', 'Light-Green', 'yanse/3eq77a81mefmg3fe.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8703, '浅青', 'Light-Cyan', 'yanse/xt84927u51j6chrf.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8704, '浅蓝', 'Light-Blue', 'yanse/f09p2la9slboeo5s.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8705, '深栗', 'Dark-Maroon tones', 'yanse/rd723onvmoczqhe6.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8706, '深红', 'Dark-Red', 'yanse/a0vhljnys7adq880.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8707, '深蓝', 'Dark-Blue tones', 'yanse/bd0fjgxk4gi0qovj.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8708, '艳橙', 'Vivid-Orange color', 'yanse/zdcn30bo2z6lsfom.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8709, '艳柠檬绿', 'Vivid-Lime color', 'yanse/tn76m2kzkfgnmkpl.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8710, '艳棕', 'Vivid-Brown color', 'yanse/8m5xzsrvb3h0bp1l.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8711, '艳粉', 'Vivid-Magenta color', 'yanse/djbwsigv741e8b33.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8712, '基恩哈林', 'keith haring color', 'yanse/a5be8dc59yoh5ixt.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8713, '艳蓝', 'Vivid-Blue color', 'yanse/k6hq7mqde51gqok0.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8714, '秋日棕', 'Autumn Brown tones', 'yanse/61sdhqmz1wyb26ta.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8715, '日落渐变', 'Sunset Gradient tone', 'yanse/43k98w300c70q9kg.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8716, '彩虹色', 'Iridescent tones', 'yanse/xq1qhuh12lerunfv.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8717, '波普色', 'Pop Art tone', 'yanse/5noj1rafs0638idl.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8718, '沃霍尔', 'Warhol color', 'yanse/s49k48owou8wboei.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8719, '约翰哈里斯', 'John Harris', 'yanse/93necsedg09r3rm8.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8720, '梵高', 'Van Gogh color', 'yanse/mh2om16mcdfhwy9j.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8721, '大卫霍尼克', 'david hockney color', 'yanse/cpv93zxqwomkc4n4.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8722, '蒸汽波', 'vaporwave tones', 'yanse/9bp7d7utfl7i8m4p.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8723, '钛', 'Titanium tones', 'yanse/flmdbt32ktaonx94.png', 12, '2023-08-20 16:11:22', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8724, '马蒂斯', 'Matisse color', 'yanse/snm5b14klewd3xrs.png', 12, '2023-08-20 16:11:21', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8725, '镭射糖果纸', 'laser candy paper color', 'yanse/1ih92gc31fvd8emg.png', 12, '2023-08-20 16:11:21', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8726, '霓虹', 'neon shades', 'yanse/2rtxtn5ppi1ov4gc.png', 12, '2023-08-20 16:11:21', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8727, '水晶蓝', 'Crystal Blue tones', 'yanse/ub5gjbr83cuz1b88.png', 12, '2023-08-20 16:11:21', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8728, '红绿', 'red and green tones', 'yanse/jl1c01hiakfaef4g.png', 12, '2023-08-20 16:11:21', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8729, '紫红', 'purple and red tones', 'yanse/yggx8tfpj7255kez.png', 12, '2023-08-20 16:11:21', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8730, '紫黄', 'purple and yellow tones', 'yanse/vd478853nk6vcbxz.png', 12, '2023-08-20 16:11:21', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8731, '深棕', 'Dark-Brown tones', 'yanse/asauxs25bnvxeevc.png', 12, '2023-08-20 16:11:21', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8732, '红黄蓝', 'yellow and red and blue tones', 'yanse/1yklrh2wsas3sr67.png', 12, '2023-08-20 16:11:21', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8733, '红黑', 'red and black tone', 'yanse/lz7ok80iap6j3sh2.png', 12, '2023-08-20 16:11:21', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8734, '绿紫', 'purple and green tones', 'yanse/fwntktmph2byeuos.png', 12, '2023-08-20 16:11:21', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8735, '经典黑白红', 'Classic Red Black and White tones', 'yanse/rzpcsnhpb6q9v48x.png', 12, '2023-08-20 16:11:21', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8736, '蓝红', 'blue and red tones', 'yanse/qiy7hac449hj41gq.png', 12, '2023-08-20 16:11:21', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8737, '蓝绿', 'blue and green tones', 'yanse/qe90hc9vmllioc3h.png', 12, '2023-08-20 16:11:21', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8738, '黑黄', 'yellow and black tone', 'yanse/wh8k614ddanro09y.png', 12, '2023-08-20 16:11:21', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8739, '黑紫', 'purple and black tones', 'yanse/xrw8w5n84l7dxfc6.png', 12, '2023-08-20 16:11:21', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8740, '蓝黄', 'blue and yellow tones', 'yanse/01iazrpuj2g6bnyq.png', 12, '2023-08-20 16:11:21', '2023-12-28 13:54:21', 0, 'yanse', '');
INSERT INTO `df_robot_prompt` VALUES (8741, '中式服装', 'Chinese costume', 'zhongguoyuansu/atmb7r30j4ekleds.png', 12, '2023-08-20 16:11:30', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8742, '丝绸', 'silk', 'zhongguoyuansu/unz9zjb6qfiow9px.png', 12, '2023-08-20 16:11:30', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8743, '旗袍', 'Cheongsam', 'zhongguoyuansu/qnfehzxmuf9f80g8.png', 12, '2023-08-20 16:11:30', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8744, '功夫', 'Kung Fu', 'zhongguoyuansu/akdueruaorcapd7n.png', 12, '2023-08-20 16:11:30', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8745, '刺绣', 'Embroidered', 'zhongguoyuansu/uq3ma5bbmevhed8w.png', 12, '2023-08-20 16:11:30', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8746, '武侠', 'Wuxia', 'zhongguoyuansu/1dgkme8g8i0zs8a5.png', 12, '2023-08-20 16:11:30', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8747, '汉服', 'Hanfu', 'zhongguoyuansu/opqn5sgcsshnlgsh.png', 12, '2023-08-20 16:11:30', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8748, '禅', 'Dhyana', 'zhongguoyuansu/crjsq891jmearszc.png', 12, '2023-08-20 16:11:30', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8749, '世外桃源', 'Arcadia', 'zhongguoyuansu/05yaj0b4yrxb5xcx.png', 12, '2023-08-20 16:11:30', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8750, '中国结', 'Chinese knot', 'zhongguoyuansu/6sahoz1ih9r3inua.png', 12, '2023-08-20 16:11:30', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8751, '中国凤凰', 'Chinese phoenix', 'zhongguoyuansu/8zzac19h4m601rse.png', 12, '2023-08-20 16:11:30', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8752, '中国墨', 'Chinese ink', 'zhongguoyuansu/8zs3x8aio9ohyqmv.png', 12, '2023-08-20 16:11:30', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8753, '中国龙', 'Chinese dragon', 'zhongguoyuansu/m9x4c7goh1w397rc.png', 12, '2023-08-20 16:11:30', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8754, '书法', 'Chinese calligraphy', 'zhongguoyuansu/odwcydqxpnntwu5r.png', 12, '2023-08-20 16:11:30', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8755, '京剧', 'Beijing Opera', 'zhongguoyuansu/ix98659ks9mu6l6k.png', 12, '2023-08-20 16:11:30', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8756, '丹顶鹤', 'Red-crowned crane', 'zhongguoyuansu/acdix36iyaadr99z.png', 12, '2023-08-20 16:11:30', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8757, '儒家文化', 'Confucian Culture', 'zhongguoyuansu/rcvkz63butz8tbl4.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8758, '亭子', 'Pavilion', 'zhongguoyuansu/9lymzfuvhywg1vu7.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8759, '八卦', 'Eight Trigrams', 'zhongguoyuansu/mds4s288wddusbr4.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8760, '兵马俑', 'Terracotta Warriors', 'zhongguoyuansu/ww4ig3aygox84zug.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8761, '全景长卷轴', 'Panorama painting', 'zhongguoyuansu/2l4oaycj25u6i9ah.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8762, '古剑', 'Ancient Chinese sword', 'zhongguoyuansu/wrnutam33gq2ev1l.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8763, '剪纸', 'Paper Cutting', 'zhongguoyuansu/888aixrjpt929grw.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8764, '国墨', 'Chinese ink', 'zhongguoyuansu/hyuavi8lton7vyqy.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8765, '唐三彩', 'Tri-color Pottery of the Tang Dynasty', 'zhongguoyuansu/2ynmh1ecvs19erk0.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8766, '园林', 'chinese Gardens', 'zhongguoyuansu/5gdt832udveaanwl.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8767, '国画', 'Chinese painting', 'zhongguoyuansu/l4i5a0rdgasgerky.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8768, '咏春', 'Wing Tsun', 'zhongguoyuansu/p06yrl79fo32cdav.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8769, '故宫', 'Forbidden City', 'zhongguoyuansu/w5hxgn9558wnqmyn.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8770, '折扇', 'Hand fan', 'zhongguoyuansu/xx69hemicz7srzcl.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8771, '工笔画', 'Gongbi painting', 'zhongguoyuansu/9gt496iv929lo80k.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8772, '山海经', 'Mountains and Seas Sutra', 'zhongguoyuansu/6xwk3kw7v8i7d2ai.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8773, '景泰蓝', 'Cloisonne', 'zhongguoyuansu/8g4vqk03z2wlt688.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8774, '月兔', 'Moon rabbit', 'zhongguoyuansu/hw187st93hvugtbz.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8775, '月饼', 'Mooncakes', 'zhongguoyuansu/a7krkc6jcrf6xmts.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8776, '武术', 'Chinese Martial Arts', 'zhongguoyuansu/ky447d6086gmvzdy.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8777, '汤圆', 'Tangyuan', 'zhongguoyuansu/nuinz0aqd2d91bk5.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8778, '朱雀', 'Vermilion bird', 'zhongguoyuansu/2tvp8t3xhq7i0e2j.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8779, '水墨', 'lnk and wash painting', 'zhongguoyuansu/cv36v26sr4l9xmvz.png', 12, '2023-08-20 16:11:29', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8780, '梅花', 'Plum blossom', 'zhongguoyuansu/x3d99hyzy4dtrad5.png', 12, '2023-08-20 16:11:28', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8781, '火锅', 'Hotpot', 'zhongguoyuansu/a5f42anqauj0yo02.png', 12, '2023-08-20 16:11:28', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8782, '灯笼', 'Chinese lanterns', 'zhongguoyuansu/x6d4sniijfs6bhit.png', 12, '2023-08-20 16:11:28', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8783, '爆竹', 'Fireworks and firecracker', 'zhongguoyuansu/s8ifwwdrr3ndf8c5.png', 12, '2023-08-20 16:11:28', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8784, '玉', 'Jade', 'zhongguoyuansu/d24oyk4gygemdtgg.png', 12, '2023-08-20 16:11:28', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8785, '熊猫', 'Panda', 'zhongguoyuansu/11vmsgxpr0uxj6d0.png', 12, '2023-08-20 16:11:28', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8786, '牡丹', 'Peony', 'zhongguoyuansu/oz4mzrjw8orrggt9.png', 12, '2023-08-20 16:11:28', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8787, '相声', 'Cross-talk', 'zhongguoyuansu/zzbotmtseg7adddf.png', 12, '2023-08-20 16:11:28', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8788, '瓷器', 'Porcelain', 'zhongguoyuansu/xpt3e348cq6jc0pb.png', 12, '2023-08-20 16:11:28', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8789, '石狮子', 'Guardian lion', 'zhongguoyuansu/qw1rpr844gvwb6wp.png', 12, '2023-08-20 16:11:28', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8790, '禅宗', 'Zen Buddhism', 'zhongguoyuansu/oazydqvrdigtea9w.png', 12, '2023-08-20 16:11:28', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8791, '红楼梦', 'A Dream in Red Mansions', 'zhongguoyuansu/262gq7q8s812sm3x.png', 12, '2023-08-20 16:11:28', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8792, '舞狮', 'Lion Dance', 'zhongguoyuansu/ow82ijkuzhz93ukr.png', 12, '2023-08-20 16:11:28', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8793, '竹子', 'Bamboo', 'zhongguoyuansu/mvtvulvq1x5th5jh.png', 12, '2023-08-20 16:11:28', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8794, '脸谱', 'Chinese opera mask', 'zhongguoyuansu/r5q7p491n8kjc5tk.png', 12, '2023-08-20 16:11:27', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8795, '翡翠', 'Jadeite', 'zhongguoyuansu/zmhhycbjtypylvo4.png', 12, '2023-08-20 16:11:27', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8796, '莫高窟', 'Mogao Caves', 'zhongguoyuansu/1anu7zsfuyyuss4j.png', 12, '2023-08-20 16:11:27', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8797, '针灸', 'Acupuncture', 'zhongguoyuansu/8t2rinve43vx8pvq.png', 12, '2023-08-20 16:11:27', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8798, '笛子', 'Flute', 'zhongguoyuansu/v376l6h7uq07d94v.png', 12, '2023-08-20 16:11:27', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8799, '道', 'Daoism', 'zhongguoyuansu/ev0d10uvi13sj7gb.png', 12, '2023-08-20 16:11:27', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8800, '荷花', 'Lotus', 'zhongguoyuansu/cod5xeh2lo7eqsht.png', 12, '2023-08-20 16:11:27', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8801, '锦鲤', 'Chinese Koi', 'zhongguoyuansu/xa2030tlctkmbabl.png', 12, '2023-08-20 16:11:27', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8802, '阴阳', 'Yin,Yang', 'zhongguoyuansu/ylhkpwykb3tghm8a.png', 12, '2023-08-20 16:11:27', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8803, '麒麟', 'Kylin', 'zhongguoyuansu/u8lcwioigcovg5kh.png', 12, '2023-08-20 16:11:27', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8804, '麻将', 'Mahjong', 'zhongguoyuansu/xi698ncfvs4wj7fq.png', 12, '2023-08-20 16:11:27', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8805, '龙舟', 'Dragon Boat', 'zhongguoyuansu/7dgis0rcdq3ico08.png', 12, '2023-08-20 16:11:27', '2023-12-28 13:54:21', 0, 'zhongguoyuansu', '');
INSERT INTO `df_robot_prompt` VALUES (8806, '艾莉·布罗什', 'Allie Brosh', 'chahua/rayss7d932ki3q3k.png', 12, '2023-08-20 16:11:50', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8807, '阿德里安·托米恩', 'Adrian Tomine', 'chahua/6a0b27i1ke7mo2h2.png', 12, '2023-08-20 16:11:50', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8808, '艾尔·威廉森', 'Al Williamson', 'chahua/o802nfes18op2q9o.png', 12, '2023-08-20 16:11:50', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8809, '安吉拉·巴雷特', 'Angela Barrett', 'chahua/rq72tq6325nq6pr3.png', 12, '2023-08-20 16:11:50', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8810, '鸟山明', 'Akira Toriyama', 'chahua/qjycg7xpwjrd5aqs.png', 12, '2023-08-20 16:11:50', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8811, '阿萨夫哈努卡', 'Asaf Hanuka', 'chahua/hi15biqvvdufhix8.png', 12, '2023-08-20 16:11:50', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8812, '本杰明·拉科姆', 'Benjamin Lacombe', 'chahua/0oiddggt8922dtbp.png', 12, '2023-08-20 16:11:50', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8813, '查尔斯·维斯', 'Charles Vess', 'chahua/lof9gb139pmi1mt9.png', 12, '2023-08-20 16:11:50', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8814, '凯瑟琳·诺林', 'Catherine Nolin', 'chahua/f8js48zriowb6svf.png', 12, '2023-08-20 16:11:50', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8815, '丹·麦克法林', 'Dan McPharlin', 'chahua/egqgj4y4pm68ceo8.png', 12, '2023-08-20 16:11:50', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8816, '艾温德·厄尔', 'Eyvind Earle', 'chahua/g4iwcbinc2j81hur.png', 12, '2023-08-20 16:11:50', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8817, '加里·潘特', 'Gary Panter', 'chahua/k9a2hbplvuawiv8c.png', 12, '2023-08-20 16:11:50', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8818, '杰夫·麦克菲特里奇', 'Geoff McFetridge', 'chahua/jugmum9fpmtwodo0.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8819, '达尔文·库克', 'Darwyn Cooke', 'chahua/emeaepkvt6ps6m9m.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8820, '空山创', 'Hajime Sorayama', 'chahua/3zw80g25sj0gzvxg.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8821, '格雷森·佩里', 'Grayson Perry', 'chahua/ab3dfaiqtt4wt4pl.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8822, '凯·尼尔森', 'Kay Nielsen', 'chahua/qngalieknz60u47w.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8823, '诺玛酒吧', 'Noma Bar', 'chahua/sboealum4m7drtnu.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8824, '萧荣成', 'Hsiao Ron Cheng', 'chahua/9i174ex3ze8fwvya.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8825, '哈里·克拉克', 'Harry Clarke', 'chahua/aiax288z4blpn5rr.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8826, '劳里·格里斯利', 'Laurie Greasley', 'chahua/ze9wegesmjtvxai4.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8827, '蒂姆·拉汉', 'Tim Lahan', 'chahua/ucnjq2tcf283d0tl.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8828, '托芙·詹森', 'Tove Jansson', 'chahua/iuzwb7icfde88kd9.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8829, '阿德里安·史密斯', 'Adrian Smith', 'chahua/bezpij2eupytb7us.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8830, '亚伦·麦克格鲁德', 'Aaron McGruder', 'chahua/9b6zbt8pti39i7tb.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8831, '邓有洪', 'Tang Yau Hoong', 'chahua/1ffisgn451k4rmgp.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8832, '西蒙·斯塔伦哈格', 'Simon Stalenhag', 'chahua/0h7awpq46zrfuj88.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8833, '亚历克斯·安德烈夫', 'Alex Andreev', 'chahua/pqmk8nr3glob0y7i.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8834, '亚历山德罗·戈塔多', 'Alessandro Gottardo', 'chahua/ty3o7rmp3pscf618.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8835, '阿曼达·克拉克', 'Amanda Clark', 'chahua/xhcng2fdni0myfng.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8836, '亚历杭德罗·布尔迪西奥', 'Alejandro Burdisio', 'chahua/bjv6rs7ax71eots9.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8837, '安格斯·麦基', 'Angus McKie', 'chahua/ymfqgdtmw5w8d6t2.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8838, '阿瑟·拉克姆', 'Arthur Rackham', 'chahua/pjjl43cxm7p5pft3.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8839, '贝基·克鲁南', 'Becky Cloonan', 'chahua/egw26k3whe6d3wp4.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8840, '安娜·迪特曼', 'Anna Dittmann', 'chahua/2hfo36p6p19un423.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8841, '阿蒂·盖兰', 'Atey Ghailan', 'chahua/xw9nw8ukt6zlicpf.png', 12, '2023-08-20 16:11:49', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8842, '本·古森斯', 'Ben Goossens', 'chahua/3nzi5gmc3cxjq0en.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8843, '本尼迪克·巴纳', 'Benedick Bana', 'chahua/cjiqjod4irzeoddc.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8844, '布赖恩·弗洛德', 'Brian Froud', 'chahua/xqyrlm7jipyld3e0.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8845, '布赖恩·凯辛格', 'Brian Kesinger', 'chahua/sam2lmbcm1tww1c3.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8846, '鲍勃·克拉佩特', 'Bob Clampett', 'chahua/cf9ctuvrbzqbpld0.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8847, '比尔·卡曼', 'Bill Carman', 'chahua/dfildscdpqe94ly5.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8848, '布莱恩·李·奥马利', 'Bryan Lee O\'Malley', 'chahua/qzepf6d5eklnf5tp.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8849, '克里斯·拉布罗伊', 'Chris LaBrooy', 'chahua/9iw6qrcrf2pww422.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8850, '克里斯托弗·巴拉斯卡斯', 'Christopher Balaskas', 'chahua/18u678j7huu17gpi.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8851, '克里斯蒂安·施洛', 'Christian Schloe', 'chahua/6h2m18j0y2389kki.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8852, '加里·拉尔森', 'Gary Larson', 'chahua/ijmev2k1grsrl7uy.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8853, '戴夫·多曼', 'Dave Dorman', 'chahua/iu3ofwer6ksvaogn.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8854, '艾尔·利西茨基', 'El Lissitzky', 'chahua/q9mbza844s4o30wh.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8855, '多萝西·拉斯罗普', 'Dorothy Lathrop', 'chahua/ot5ocbal0wmguu90.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8856, '杰玛·科雷尔', 'Gemma Correll', 'chahua/zt4i6o31rrr3a10k.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8857, '弗里登斯雷·百水', 'Friedensreich Hundertwasser', 'chahua/n8oagftgm9o69621.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8858, '格雷瓜尔·吉耶曼', 'Gregoire Guillemin', 'chahua/ump97zvqpmgvr8zo.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8859, '艾德·布鲁贝克', 'Ed Brubaker', 'chahua/ff36sj3ngogrgwoc.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8860, '埃尔热', 'Herge', 'chahua/w22q98knqp9jj6om.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8861, '盖伊·比劳特', 'Guy Billout', 'chahua/hjcrqm667rm380qf.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8862, '杰夫·达罗', 'Geof Darrow', 'chahua/dvlf8hqjslkc4p9k.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8863, '杰拉尔德·斯卡夫', 'Gerald Scarfe', 'chahua/9hxowjsfqozw8u9y.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8864, '伊利亚·库夫希诺夫', 'Ilya Kuvshinov', 'chahua/ammh4o06tvfovycb.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8865, '雅库布·罗扎尔斯基', 'Jakub Rozalski', 'chahua/qc1yg9xcnq0chqp1.png', 12, '2023-08-20 16:11:48', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8866, '艾达·伦图尔·奥斯韦特', 'Ida Rentoul Outhwaite', 'chahua/2bmva0tbjh7mviqn.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8867, '下田光', 'Hikari Shimoda', 'chahua/z8hwutf1onohxko2.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8868, '杰克·休斯', 'Jack Hughes', 'chahua/d8l2pz243928hvg5.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8869, '伊恩·麦奎', 'Ian McQue', 'chahua/cjgi2arzf35tcugw.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8870, '约翰·哈里斯', 'John Harris', 'chahua/kl2x6b8ikgimkdo9.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8871, '杰弗里·凯瑟琳·琼斯', 'Jeffrey Catherine Jones', 'chahua/x76pwbyigfnjr3h9.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8872, '周乔伊', 'Joey Chou', 'chahua/red3jm6ms49em5cb.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8873, '詹姆斯·吉拉德', 'James Gilleard', 'chahua/ywuovvtxh4rwk0pi.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8874, '凯特·比顿', 'Kate Beaton', 'chahua/h73y35upjjcs7a8j.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8875, '大友克洋', 'Katsuhiro Otomo', 'chahua/b6o70htwpq4g7ucy.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8876, '朱莉·杜塞特', 'Julie Doucet', 'chahua/2lgb44wyagnom76b.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8877, '基思·尼格利', 'Keith Negley', 'chahua/og8q4r6m2yo3o9ls.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8878, '拉里·卡尔森', 'Larry Carlson', 'chahua/fx13zl3867553pm8.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8879, '乔什·阿格尔', 'Josh Agle', 'chahua/q2981245l4l3vpf4.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8880, '拉斯洛·莫霍利-纳吉', 'Laszlo Moholy-Nagy', 'chahua/nf8iuwtv4rus3gn1.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8881, '路德维希·贝尔曼斯', 'Ludwig Bemelmans', 'chahua/fh5fal01b2ck771a.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8882, '滨口真央', 'Mao Hamaguchi', 'chahua/ljo7379e15uws06r.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8883, '押井守', 'Mamoru Oshii', 'chahua/sy40hdznpk61vsmf.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8884, '玛丽·布莱尔', 'Mary Blair', 'chahua/r52f8pnqzutw4zq7.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8885, '马尔科·马内夫', 'Marko Manev', 'chahua/ebx341m8lbnogih2.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8886, '马特·瓦格纳', 'Matt Wagner', 'chahua/b0kdo8iuxic009gp.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8887, '迈克·坎波', 'Mike Campau', 'chahua/83typ75tmj38ku7n.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8888, '奥托·皮埃内', 'Otto Piene', 'chahua/wgpl200unkjdihxy.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8889, '帕特里克·内格尔', 'Patrick Nagel', 'chahua/fvso2cb8jdu4nn2r.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8890, '迈克·温克尔曼', 'Mike Winkelmann', 'chahua/n9x7bsikucpgafwk.png', 12, '2023-08-20 16:11:47', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8891, '菲利普·德鲁耶', 'Philippe Druillet', 'chahua/at3yxw9dsyn7q6q4.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8892, '拉乌尔·豪斯曼', 'Raoul Hausmann', 'chahua/ohuv16wsfdakp8ny.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8893, '帕特里克·伍德罗夫', 'Patrick Woodroffe', 'chahua/c49lsaftmj216euz.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8894, '伦道夫·凯迪克', 'Randolph Caldecott', 'chahua/yx0byiwgfqswq1sv.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8895, '罗杰·迪恩', 'Roger Dean', 'chahua/k0xq2bvi2tpvxlv4.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8896, '西德·米德', 'Syd Mead', 'chahua/dnfbq6v6rc5bai2m.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8897, '陈绍恩', 'Shaun Tan', 'chahua/ajj06lpvbkmucnvl.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8898, '黄泰瑞', 'Tyrus Wong', 'chahua/q8006od54h2ik2lf.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8899, '魏克托', 'Victo Ngai', 'chahua/aajxpltz3bquaycj.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8900, '佐伯敏夫', 'Toshio Saeki', 'chahua/g89vvsw5skc48iew.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8901, '蒂姆·怀特', 'Tim White', 'chahua/84h8sj80byen17v0.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8902, '特蕾西·格里姆伍德', 'Tracie Grimwood', 'chahua/jlvaev5mu1vf29q7.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8903, '弗吉尼亚·弗朗西斯·斯特', 'Virginia Frances Sterrett', 'chahua/0gof2stov7ja42at.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8904, '特拉维斯·查雷斯特', 'Travis Charest', 'chahua/2x3yse7wwpi80suh.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8905, '沃利·伍德', 'Wally Wood', 'chahua/hb09oetoozxv4047.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8906, '威廉·雷', 'William Wray', 'chahua/u7lbeuig9q4tp5l6.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8907, '阿比盖尔·拉尔森', 'Abigail Larson', 'chahua/yuk9jrnigu58d850.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8908, '威廉·S·巴勒斯', 'William S. Burroughs', 'chahua/javmaezqlr794lk6.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8909, '亚伦·霍基', 'Aaron Horkey', 'chahua/ugaow00qx64gl4o7.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8910, '安迪·沃霍尔', 'Andy Warhol', 'chahua/rhxt669ydpszrrg1.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8911, '亨利·达尔格', 'Henry Darger', 'chahua/kho8nl7gw0202dcu.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8912, '哈尔·福斯特', 'Hal Foster', 'chahua/szovlg44es7do49x.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8913, '瓦迪姆·卡辛', 'Wadim Kashin', 'chahua/sd4meknevdbhain1.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8914, '詹姆斯·里兹', 'James Rizzi', 'chahua/vfv34gimidf3vssm.png', 12, '2023-08-20 16:11:46', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8915, '乔·库伯特', 'Joe Kubert', 'chahua/anfwl7fnxpup9j0h.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8916, '吉姆·马赫福德', 'Jim Mahfood', 'chahua/21ly1edmdjmmkr34.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8917, '安迪·基霍', 'Andy Kehoe', 'chahua/qatheh6365gsz3av.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8918, '艾琳琼脂', 'Eileen Agar', 'chahua/vaqgirfdo7gim26q.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8919, '里卡多·西里', 'Ricardo Siri', 'chahua/5u9idfwmwwtjmrp4.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8920, '亚当·休斯', 'Adam Hughes', 'chahua/0naj9glyoyhle5mi.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8921, '李载', 'Jae Lee', 'chahua/1fgsknb8ghle6jp3.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8922, '小池一夫', 'Kazuo Koike', 'chahua/4mb9gohvi4tolf5y.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8923, '长尾曜', 'Yoh Nagao', 'chahua/w2bdchfea4jd6hcd.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8924, '清水裕子', 'Yuko Shimizu', 'chahua/487hgutvf3zr3b6l.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8925, '吉田明彦', 'Akihiko Yoshida', 'chahua/47gsvjdkw5kax3l2.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8926, '艾伦·李', 'Alan Lee', 'chahua/dcat269xejpp9aaj.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8927, '艾尔·赫希菲尔德', 'Al Hirschfeld', 'chahua/ta9dksdt1612pw64.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8928, '阿尔贾菲', 'Al Jaffee', 'chahua/32hjgf7c2vyd8w61.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8929, '艾伦·戴维斯', 'Alan Davis', 'chahua/8kghqsaqejdn9q2t.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8930, '艾尔·卡普', 'Al Capp', 'chahua/lcun67bjljshck2c.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8931, '艾伦·摩尔', 'Alan Moore', 'chahua/2xh5vdl8w5w3p1cc.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8932, '阿尔伯特·乌德佐', 'Albert Uderzo', 'chahua/on2atvfc9r3v992b.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8933, '亚历克斯·赫希', 'Alex Hirsch', 'chahua/a0ic6m5jdhmge1z7.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8934, '阿莱娜·埃纳米', 'Alena Aenami', 'chahua/krnkx55qz1a1mqls.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8935, '亚历克斯·霍利', 'Alex Horley', 'chahua/5jkdv09xx7mfvkf8.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8936, '阿尔贝托·塞维索', 'Alberto Seveso', 'chahua/ykj8n5w062q093wr.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8937, '亚历克斯·帕迪', 'Alex Pardee', 'chahua/c33gek1y6vi42bp0.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8938, '亚历山大·詹森', 'Alexander Jansson', 'chahua/zc0xwmseqgo6zd1d.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8939, '亚历克斯·托特', 'Alex Toth', 'chahua/pghee2g36xs9gujf.png', 12, '2023-08-20 16:11:45', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8940, '亚历山大·罗德钦科', 'Alexander Rodchenko', 'chahua/6bstc3zwcxtim2y9.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8941, '安德烈亚斯·维萨里', 'Andreas Vesalius', 'chahua/047585oy52ubk3rb.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8942, '亚历克斯·罗斯', 'Alex Ross', 'chahua/2smuveky1jtm82zo.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8943, '艾米·厄尔斯', 'Amy Earles', 'chahua/j3288pt0gv2dx0e9.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8944, '亚历克斯·马列夫', 'Alex Maleev', 'chahua/nwdy9l62p8mi812a.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8945, '阿纳托·芬斯塔克', 'Anato Finnstark', 'chahua/lu9h3y631ed5idhb.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8946, '安德鲁·罗宾逊', 'Andrew Robinson', 'chahua/6h3wbbzcv9rbl25h.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8947, '安德鲁·费雷兹', 'Andrew Ferez', 'chahua/0mciwwt84n159n2e.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8948, '艾莉森·贝克德尔', 'Alison Bechdel', 'chahua/xntml1t1um74qikh.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8949, '安迪·费尔赫斯特', 'Andy Fairhurst', 'chahua/licjhgw6c26p7se2.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8950, '安迪·辛格', 'Andy Singer', 'chahua/ywu7jiwt5y5omsg5.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8951, '安妮·巴什利尔', 'Anne Bachelier', 'chahua/i1yux9la5a59kq71.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8952, '安东·谢苗诺夫', 'Anton Semenov', 'chahua/whys3ilbozsy4ozl.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8953, '安东尼奥·莫拉', 'Antonio Mora', 'chahua/jh5kezykn3ofqcon.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8954, '安妮·斯托克斯', 'Anne Stokes', 'chahua/g9y2e8c5x98suzqs.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8955, '阿波罗尼亚·圣克莱尔', 'Apollonia Saintclair', 'chahua/c6smyrhtzcf47jyo.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8956, '安娜和埃琳娜·巴尔布索', 'Anna and Elena Balbusso', 'chahua/p8sreqa7dk6x48g8.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8957, '阿伦·维森菲尔德', 'Aron Wiesenfeld', 'chahua/r34d59wvcsc0k0gk.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8958, '阿尔特杰姆', 'Artgerm', 'chahua/cghdfynvesafri8e.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8959, '安东·奥托·费舍尔', 'Anton Otto Fischer', 'chahua/w6j6xvkyl5r9do1y.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8960, '阿瑟·亚当斯', 'Arthur Adams', 'chahua/eb59euywecufkop1.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8961, '阿特·斯皮格曼', 'Art Spiegelman', 'chahua/crf8wbu8jxtufrq7.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8962, '奥斯汀·布里格斯', 'Austin Briggs', 'chahua/c8y05x9j1c7746hj.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8963, '亚瑟·萨尔诺夫', 'Arthur Sarnoff', 'chahua/x88ubron286eaqy8.png', 12, '2023-08-20 16:11:44', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8964, '阿克塞尔·谢夫勒', 'Axel Scheffler', 'chahua/4konyp9dadecw8am.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8965, '奥尔辛斯基工作室', 'Atelier Olschinsky', 'chahua/4feims1eoeownozs.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8966, '奥布里·比尔兹利', 'Aubrey Beardsley', 'chahua/n6xhdq44uro5eh70.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8967, '阿什利·伍德', 'Ashley Wood', 'chahua/uuyr6q99vcrp9s1i.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8968, '芭芭拉·克鲁格', 'Barbara Kruger', 'chahua/viiqj8mqx93kkve1.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8969, '巴克莱·肖', 'Barclay Shaw', 'chahua/fhw30y2afwtu8kwg.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8970, '巴兹尔·戈戈斯', 'Basil Gogos', 'chahua/m35b8cbqbhppwit0.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8971, '巴兹尔沃尔弗顿', 'Basil Wolverton', 'chahua/bgo9njn0u0jo3mj7.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8972, '奥斯汀·奥斯曼 备用', 'Austin Osman Spare', 'chahua/29vsfqpkixdnhpyw.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8973, '巴斯蒂安·勒库夫-德阿姆', 'Bastien Lecouffe-Deharme', 'chahua/g03vuddmbut3t4pe.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8974, '伯尼·赖特森', 'Bernie Wrightson', 'chahua/umfo0uhl9nizhk2a.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8975, '本·坦普尔史密斯', 'Ben Templesmith', 'chahua/4bozql14wdrfhcej.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8976, '碧翠丝·波特', 'Beatrix Potter', 'chahua/20j0l8t0y0othnuj.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8977, '贝丝·康克林', 'Beth Conklin', 'chahua/t3uglbyra3ajgw17.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8978, '鲍勃·埃格尔顿', 'Bob Eggleton', 'chahua/uoqlmpqmq5j5omp2.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8979, '鲍勃·莱泽尔', 'Bob Layzell', 'chahua/4l8hwbf734pwiif6.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8980, '比尔·沃特森', 'Bill Watterson', 'chahua/rolyxqewow82ffv4.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8981, '博扬·耶夫蒂奇', 'Bojan Jevtic', 'chahua/i4b4ixwgaugi3rcd.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8982, '布赖恩·博兰', 'Brian Bolland', 'chahua/uetm66yv7wl85lie.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8983, '布赖恩·德斯潘', 'Brian Despain', 'chahua/du0zqhf29wlfzmdo.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8984, '布莱恩·M·维韦罗斯', 'Brian M. Viveros', 'chahua/yyp5qqqeg06aoco2.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8985, '鲍里斯·瓦列霍', 'Boris Vallejo', 'chahua/aretnt2hg4ue17jd.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8986, '比尔·显克维奇', 'Bill Sienkiewicz', 'chahua/odsuoldtyqj947s1.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8987, '格林兄弟', 'Brothers Grimm', 'chahua/6xq01h7xq00otjkr.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8988, '布鲁斯·蒂姆', 'Bruce Timm', 'chahua/0m2saprkmwnofh2f.png', 12, '2023-08-20 16:11:43', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8989, '布莱恩·希奇', 'Bryan Hitch', 'chahua/brxn5udumv9cjrzn.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8990, '卡拉斯·约努特', 'Caras Ionut', 'chahua/x1phkdwy4g9qxjsl.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8991, '卡洛斯·克鲁兹-迪兹', 'Carlos Cruz-Diez', 'chahua/te8jywmhjne57qj5.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8992, '布莱恩·K·沃恩', 'Brian K. Vaughan', 'chahua/6k7onjig5llfkl6j.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8993, '希尔德布兰特兄弟', 'Brothers Hildebrandt', 'chahua/lhyx2zex7l6zjz9g.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8994, '布鲁斯·彭宁顿', 'Bruce Pennington', 'chahua/k5xr1vuyxtxd2lba.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8995, '凯瑟琳·海德', 'Catherine Hyde', 'chahua/h8l1lahla202sy93.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8996, '塞西莉·玛丽·巴克', 'Cecily Mary Barker', 'chahua/ydy0bq4frjhs2ddu.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8997, '卡恩·格里菲斯', 'Carne Griffiths', 'chahua/9pbm8iods55iihjp.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8998, '卡尔·巴克斯', 'Carl Barks', 'chahua/pbgponzksaz7p84r.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (8999, '查理·鲍沃特', 'Charlie Bowater', 'chahua/xahhpdsb7indalu4.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9000, '查尔斯·亚当斯', 'Charles Addams', 'chahua/m7mrn10gdyga5tef.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9001, '查尔斯·舒尔茨', 'Charles Schulz', 'chahua/x1f9s8qj78udcj9o.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9002, '屠夫比利', 'Butcher Billy', 'chahua/n2l0ngfjsxydctht.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9003, '查尔斯·伯恩斯', 'Charles Burns', 'chahua/8kp5rp24sxfs2a9w.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9004, '克里斯·巴查洛', 'Chris Bachalo', 'chahua/rze68oxny9t62m75.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9005, '克里斯·福斯', 'Chris Foss', 'chahua/3093ocguod3ppxt1.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9006, '克里斯·摩尔', 'Chris Moore', 'chahua/cqrd64aeurca536n.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9007, '克里斯·里德尔', 'Chris Riddell', 'chahua/nuoqkx49vozv0lxm.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9008, '克里斯·戴尔', 'Chris Dyer', 'chahua/047xl30lxraahdey.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9009, '克里斯·范·奥尔斯伯格', 'Chris Van Allsburg', 'chahua/f4n3yi853ig3wpb5.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9010, '查克·克洛斯', 'Chuck Close', 'chahua/h6hyxywrrdkizg30.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9011, '康拉德·罗塞特', 'Conrad Roset', 'chahua/230b8hi06etiy38z.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9012, '克雷格·戴维森', 'Craig Davison', 'chahua/ejx314n9lqtczvo1.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9013, '克雷格·马林斯', 'Craig Mullins', 'chahua/ckdmtjb6wonn8h0f.png', 12, '2023-08-20 16:11:42', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9014, '科比·惠特莫尔', 'Coby Whitmore', 'chahua/t28tjwn2pgu338iq.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9015, '科里·洛夫蒂斯', 'Cory Loftis', 'chahua/fu2q7zxnvoyib3mb.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9016, '科尔斯菲利普斯', 'Coles Phillips', 'chahua/4qi2hqobzgh0vbsc.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9017, '克莱德考德威尔', 'Clyde Caldwell', 'chahua/lqpvcrksfdwhbvpx.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9018, '丹·希利尔', 'Dan Hillier', 'chahua/2mqsxkdly3ewkjfr.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9019, '丹·马图蒂纳', 'Dan Matutina', 'chahua/rvgs7dgpir1qlfys.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9020, '丹·克洛斯', 'Dan Clowes', 'chahua/ohmbuviq6q0zlglw.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9021, '西里尔·罗兰多', 'Cyril Rolando', 'chahua/44nc76z3uoxdqmbf.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9022, '戴夫·佩里洛', 'Dave Perillo', 'chahua/cemyhszhqwhfltvq.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9023, '戴夫·麦基恩', 'Dave McKean', 'chahua/6rnbs91avw5nrnoz.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9024, '戴夫·吉本斯', 'Dave Gibbons', 'chahua/elctifahme7znjpe.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9025, '丹妮拉·乌利格', 'Daniela Uhlig', 'chahua/i106shdnd7agso94.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9026, '丹·希普', 'Dan Hipp', 'chahua/ikn767lp1gfs8bmu.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9027, '大卫·威斯纳', 'David Wiesner', 'chahua/3ycdyd0tzj9lzctm.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9028, '大卫·芬奇', 'David Finch', 'chahua/4fxy7a09ml9e4lp0.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9029, '大卫·麦克', 'David Mack', 'chahua/xh65f6oiyf3hb4kx.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9030, '丹·芒福德', 'Dan Mumford', 'chahua/qcsm1ny5549po5ks.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9031, '唐·布鲁斯', 'Don Bluth', 'chahua/tp8uktbviev5oyej.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9032, '多纳托·詹科拉', 'Donato Giancola', 'chahua/x36ahn8cqfcrw4gh.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9033, '唐罗莎', 'Don Rosa', 'chahua/k2dw5i9uv9ixhdxq.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9034, '迪恩·埃利斯', 'Dean Ellis', 'chahua/51lvfc4jxsvj83u9.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9035, '唐·梅兹', 'Don Maitz', 'chahua/675rr2milhtd0n3n.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9036, '诺雷姆伯爵', 'Earl Norem', 'chahua/1hbxvnp57sb0va3k.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9037, '德鲁·斯特鲁赞', 'Drew Struzan', 'chahua/e58ju1wxb0xxm0vg.png', 12, '2023-08-20 16:11:41', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9038, '埃德·埃姆什维勒', 'Ed Emshwiller', 'chahua/1n4q4xypckrg4cna.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9039, '德鲁·布罗菲', 'Drew Brophy', 'chahua/tphobydqx5wjaij1.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9040, '埃迪·坎贝尔', 'Eddie Campbell', 'chahua/nbq8gy7v6q8togyt.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9041, '爱德华·戈里', 'Edward Gorey', 'chahua/0pfjg20i8h79x82w.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9042, '埃德蒙·杜拉克', 'Edmund Dulac', 'chahua/kat0jwhjewd3g0op.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9043, '艾德·皮斯科', 'Ed Piskor', 'chahua/7qmh9rkpptopkheb.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9044, '达斯汀·阮', 'Dustin Nguyen', 'chahua/z5cxtbqeheu13qp4.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9045, '爱德华·李尔', 'Edward Lear', 'chahua/z0mi8enrfpmldfei.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9046, '爱德华·塔夫特', 'Edward Tufte', 'chahua/ayy1uw0ux10yk40k.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9047, '尾田荣一郎', 'Eiichiro Oda', 'chahua/awnmm4qsuawy22ca.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9048, '艾德·罗斯', 'Ed Roth', 'chahua/ej8juryo4wfme711.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9049, '艾尔莎·贝斯科夫', 'Elsa Beskow', 'chahua/ak20pdr1ku6c4hc9.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9050, '恩斯特·海克尔', 'Ernst Haeckel', 'chahua/xckjco17heowoi9o.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9051, '恩基·比拉尔', 'Enki Bilal', 'chahua/5j31qqjsuz0idu41.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9052, '失败', 'FAILE', 'chahua/j3dqlquj5m0szfkr.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9053, '埃梅克·戈兰', 'Emek Golan', 'chahua/fzi0l5nyhaqaaxai.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9054, '弗朗西斯科·弗兰卡维拉', 'Francesco Francavilla', 'chahua/kq8dwfmr0oy4oj5f.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9055, '法雷尔·达尔林普尔', 'Farel Dalrymple', 'chahua/kskqj4cdt6ratdwr.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9056, '弗兰克·米勒', 'Frank Miller', 'chahua/m4fv1hkenqwbab2e.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9057, '弗兰克·弗雷泽塔', 'Frank Frazetta', 'chahua/zensoe3fwkvh7hlp.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9058, '弗兰克·奎特利', 'Frank Quitely', 'chahua/b7zbtz637enc8zjo.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9059, '弗兰克·曹', 'Frank Cho', 'chahua/cwyrgdm0kzs4z61f.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9060, '格迪米纳斯·普兰克维丘斯', 'Gediminas Pranckevicius', 'chahua/fi1akfh129ntgzxt.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9061, '杨吉恩', 'Gene Luen Yang', 'chahua/azrqjmnxxen8nie4.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9062, '加布里埃尔·帕切科', 'Gabriel Pacheco', 'chahua/kkkq52zk973b1ypq.png', 12, '2023-08-20 16:11:40', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9063, '吉尔·埃尔夫格伦', 'Gil Elvgren', 'chahua/p86hmg6njygutkdy.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9064, '杰夫·琼斯', 'Geoff Johns', 'chahua/48imy51ep172us91.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9065, '杰拉德·布罗姆', 'Gerald Brom', 'chahua/ew1o7qgk7vghthf1.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9066, '加里·特鲁多', 'Garry Trudeau', 'chahua/8uclqddfmjrdoud7.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9067, '格伦·基恩', 'Glen Keane', 'chahua/hrc56iwce2r6rkb7.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9068, '格里斯·格里姆利', 'Gris Grimly', 'chahua/babvuobhudat0eni.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9069, '谏山创', 'Hajime Isayama', 'chahua/vkj90x3rndkqscif.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9070, '乔治·巴比尔', 'George Barbier', 'chahua/yxpwfzd6kcu4u7g6.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9071, '宫崎骏', 'Hayao Miyazaki', 'chahua/5rxyaqsg2b7rlakt.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9072, '伊斯梅尔·因乔格鲁', 'Ismail Inceoglu', 'chahua/n4buc203m1vitval.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9073, '亨德里克·戈尔齐乌斯', 'Hendrick Goltzius', 'chahua/aro1tcqtzwhqzra7.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9074, '霍普·冈格洛夫', 'Hope Gangloff', 'chahua/jg94l4hfirsvobgp.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9075, '吉尔·凯恩', 'Gil Kane', 'chahua/5k7f20dzduzubonr.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9076, '伊万·比利宾', 'Ivan Bilibin', 'chahua/lbrgpvpuzfk967tp.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9077, '杰克·戴维斯', 'Jack Davis', 'chahua/9lw7gu3rhe9nibtb.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9078, '哈维·库兹曼', 'Harvey Kurtzman', 'chahua/zv99yt5gzkbpflxz.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9079, '杰克·欧曼', 'Jack Ohman', 'chahua/adez1o5vkj2cqk9n.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9080, '詹姆斯·克里斯滕森', 'James C. Christensen', 'chahua/aykzip5yvl2vltbu.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9081, '让·吉罗', 'Jean Giraud', 'chahua/n6gmgldzf7z70qh0.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9082, '杰米·休利特', 'Jamie Hewlett', 'chahua/4kk0nwob0d8f43gk.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9083, '茉莉·贝克特·格里菲斯', 'Jasmine Becket-Griffith', 'chahua/wn86ilep8cq4ivqy.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9084, '雅克·塔尔迪', 'Jacques Tardi', 'chahua/zofgtqugbelauvxg.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9085, '杰夫·伊斯利', 'Jeff Easley', 'chahua/0t6cmmrunsm5ag2o.png', 12, '2023-08-20 16:11:39', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9086, '杰里·平克尼', 'Jerry Pinkney', 'chahua/g6vizl6x5g1d6r9s.png', 12, '2023-08-20 16:11:38', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9087, '吉姆·斯特兰科', 'Jim Steranko', 'chahua/l85g55vqgxofb239.png', 12, '2023-08-20 16:11:38', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9088, '杰夫·史密斯', 'Jeff Smith', 'chahua/jmaixpmwlpw5vsqs.png', 12, '2023-08-20 16:11:38', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9089, '让-巴蒂斯特·蒙日', 'Jean-Baptiste Monge', 'chahua/psqhfhqjvbwfwvz0.png', 12, '2023-08-20 16:11:38', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9090, '杰西卡·罗西尔', 'Jessica Rossier', 'chahua/b726ufj39gr3ybo1.png', 12, '2023-08-20 16:11:38', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9091, '琼·冯特库伯塔', 'Joan Fontcuberta', 'chahua/bk1nf1fbt8t0oqtq.png', 12, '2023-08-20 16:11:38', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9092, '约翰·鲍尔', 'John Bauer', 'chahua/gutzf5zttgvtlxa1.png', 12, '2023-08-20 16:11:38', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9093, '约翰·豪', 'John Howe', 'chahua/bf984m6gy8xm1ptb.png', 12, '2023-08-20 16:11:38', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9094, '约翰·布西马', 'John Buscema', 'chahua/w9s1vcvzj4wnn6tg.png', 12, '2023-08-20 16:11:38', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9095, '梅津一夫', 'Kazuo Umezu', 'chahua/gt63vgz6c8woklb4.png', 12, '2023-08-20 16:11:38', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9096, '伊藤润二', 'Junji Ito', 'chahua/m5n5ebtbtm8gggdt.png', 12, '2023-08-20 16:11:38', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9097, '卡瓦西', 'Kawacy', 'chahua/vso3t6te4kq725cr.png', 12, '2023-08-20 16:11:38', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9098, '小约翰·罗米塔', 'John Romita Jr', 'chahua/hh9enl59t88ksc9h.png', 12, '2023-08-20 16:11:38', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9099, '约翰·肯恩·莫滕森', 'John Kenn Mortensen', 'chahua/2hawpuuc0higx64o.png', 12, '2023-08-20 16:11:38', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9100, '金正基', 'Kim Jung Gi', 'chahua/vl300tnopl3thv8x.png', 12, '2023-08-20 16:11:38', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9101, '凯文·伊士曼', 'Kevin Eastman', 'chahua/2qao56kc5me8cfsr.png', 12, '2023-08-20 16:11:38', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9102, '凯莉·苏·德康尼克', 'Kelly Sue Deconnick', 'chahua/6jkjnoildeyxdm27.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9103, '劳伦·浮士德', 'Lauren Faust', 'chahua/kznbomukljk1zv1z.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9104, '小鹿和夫', 'Kazuo Oga', 'chahua/cuctm9clhdeoo05r.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9105, '莱昂内托·卡皮耶罗', 'Leonetto Cappiello', 'chahua/6uup2mc68sdenosd.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9106, '松本零二', 'Leiji Matsumoto', 'chahua/uay0pcqi9ipva9ll.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9107, '拉里·埃尔莫尔', 'Larry Elmore', 'chahua/p04a5tdjwjgyjy67.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9108, '库尔特·施维特斯', 'Kurt Schwitters', 'chahua/w2dk5h0602no3foq.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9109, '琪琪·史密斯', 'Kiki Smith', 'chahua/sd43hu84kzezkmcs.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9110, '莱斯·爱德华兹', 'Les Edwards', 'chahua/0p1ahsmb2eglx4sn.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9111, '路易斯·范巴尔勒', 'Lois Van Baarle', 'chahua/msvrj6wcwmw4ebn9.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9112, '丽莎弗兰克', 'Lisa Frank', 'chahua/j1tq9ygpur73ptkm.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9113, '马克·西尔维斯特里', 'Marc Silvestri', 'chahua/4f8tv1sgkgoc1d3c.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9114, '马克·西蒙内蒂', 'Marc Simonetti', 'chahua/54veoq4lgn0af0v1.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9115, '玛嘉·莎塔碧', 'Marjane Satrapi', 'chahua/u84wjryph6v3ysko.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9116, '洛特·雷尼格', 'Lotte Reiniger', 'chahua/76syyg00szirtwiq.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9117, '马克·戴维斯', 'Marc Davis', 'chahua/jf9bkrvv5kx6duuj.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9118, '马克·凯茨比', 'Mark Catesby', 'chahua/c9a7cyc82bhs9jed.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9119, '马丁·安辛', 'Martin Ansin', 'chahua/guygerf1bkfrlxgl.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9120, '马乔里·米勒', 'Marjorie Miller', 'chahua/98kw7w7l4p09ndah.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9121, '路易斯·罗约', 'Luis Royo', 'chahua/pkjybyi0w5o7u4j2.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9122, '莫里斯·森达克', 'Maurice Sendak', 'chahua/ah6uy4s6ejo1jp23.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9123, '马特·博尔斯', 'Matt Bors', 'chahua/dpw37zsx33h2v2jx.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9124, '马蒂亚斯·阿道夫森', 'Mattias Adolfsson', 'chahua/kgzshwdynlq7eezj.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9125, '马特·格勒宁', 'Matt Groening', 'chahua/hvf4u3xpkxos8hyp.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9126, '马特分数', 'Matt Fraction', 'chahua/j31ld0h70n5cc5kd.png', 12, '2023-08-20 16:11:37', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9127, '玛丽·塞维林', 'Marie Severin', 'chahua/5cu3x1qgssc58fqo.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9128, '迈克尔·文森特·马纳洛', 'Michael Vincent Manalo', 'chahua/fu8icdb447tf1jsi.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9129, '马克斯·弗莱舍', 'Max Fleischer', 'chahua/tb0oy0ameqf80yxh.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9130, '麦克斯菲尔德·帕里什', 'Maxfield Parrish', 'chahua/p1v28gvboi3erltb.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9131, '莫里茨·科内利斯·埃舍尔', 'Maurits Cornelis Escher', 'chahua/gb5y74iikhdk13tq.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9132, '米哈尔·卡尔茨', 'Michal Karcz', 'chahua/vsjrfvujmp7uc460.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9133, '迈克尔·惠兰', 'Michael Whelan', 'chahua/2g4z9rmh9ydm0py6.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9134, '迈克·奥尔雷德', 'Mike Allred', 'chahua/6jrp0pkw7apln2u8.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9135, '迈克尔·卡卢塔', 'Michael Kaluta', 'chahua/rsf3vw6clzgyah3k.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9136, '迈克·梅休', 'Mike Mayhew', 'chahua/wmjsqed7iln0zsxm.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9137, '迈克·贾奇', 'Mike Judge', 'chahua/667u1w6cso1jyv0e.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9138, '迈克·米格诺拉', 'Mike Mignola', 'chahua/h4dxmlj3h8pmx15j.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9139, '迈克·德奥达托', 'Mike Deodato', 'chahua/t2t90ketm4qm21lo.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9140, '迈克·普鲁格', 'Mike Ploog', 'chahua/gbn15kc45va0qk4u.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9141, '迈克·格雷尔', 'Mike Grell', 'chahua/vhklrdkhfdvc2l8p.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9142, '米尔顿·卡尼夫', 'Milton Caniff', 'chahua/a4y00hu8rfh9qtb0.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9143, '浦泽直树', 'Naoki Urasawa', 'chahua/q1ygcjeiuk35zgbd.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9144, '米莫·罗特拉', 'Mimmo Rotella', 'chahua/zlgk4hjffs490tv3.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9145, '迈尔斯·伯克特·福斯特', 'Myles Birket Foster', 'chahua/e8he96a0joyfq64t.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9146, '娜塔莉·肖', 'Natalie Shau', 'chahua/nxfoslgh5ngd77xw.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9147, '诺曼·基思·柯林斯', 'Norman Keith Collins', 'chahua/leq14uuk9xsaoi1v.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9148, '奥利弗·杰弗斯', 'Oliver Jeffers', 'chahua/fe23z3dxzhphrsxp.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9149, '萩元元', 'Moto Hagio', 'chahua/1pvzg5ll11maqbm5.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9150, '尼尔·亚当斯', 'Neal Adams', 'chahua/goh7cfrlc1tlf9iz.png', 12, '2023-08-20 16:11:36', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9151, '奥斯卡施莱默', 'Oskar Schlemmer', 'chahua/ynvvlaxjveymku1i.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9152, '奥斯卡·菲辛格', 'Oskar Fischinger', 'chahua/kdpz89igo295dmod.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9153, '帕特里斯·穆西亚诺', 'Patrice Murciano', 'chahua/lr59fvhc43rfme2x.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9154, '帕斯卡尔·坎皮恩', 'Pascale Campion', 'chahua/zrg3qp5dcpzh2syh.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9155, '保罗·莱尔', 'Paul Lehr', 'chahua/i6flu66b5c7c7nkq.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9156, '昆汀·布莱克', 'Quentin Blake', 'chahua/rcximluw3pizcfxj.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9157, '雷娜·特尔格迈尔', 'Raina Telgemeier', 'chahua/58kugfoatrlfoig7.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9158, '拉斐尔·阿尔伯克基', 'Rafael Albuquerque', 'chahua/gfyw9f7ggrb1266z.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9159, '保罗·卡瑟罗尔', 'Paul Catherall', 'chahua/ohvwpxjw2hhet1px.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9160, '拉尔夫·巴克希', 'Ralph Bakshi', 'chahua/h35tpw4bp8ev5uhn.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9161, '拉尔夫·麦夸里', 'Ralph McQuarrie', 'chahua/372q4ianbudugf1q.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9162, '雷蒙德·佩蒂邦', 'Raymond Pettibon', 'chahua/r6klz4psrhytryzt.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9163, '拉尔夫·斯特德曼', 'Ralph Steadman', 'chahua/x0rub4dqshw66gfz.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9164, '拉斐尔·基什内尔', 'Raphael Kirchner', 'chahua/4cduddk9r7skavi9.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9165, '理查德·科本', 'Richard Corben', 'chahua/3zz0hw3ooxizrqt9.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9166, '罗伯特·克拉姆', 'Robert Crumb', 'chahua/dukfjk86fzvatd0l.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9167, '罗布·莱菲尔德', 'Rob Liefeld', 'chahua/y6wscr9m3s18fag1.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9168, '理查德·斯卡里', 'Richard Scarry', 'chahua/49jlif18qcr9clgd.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9169, '丽贝卡·盖伊', 'Rebecca Guay', 'chahua/5sns4gddpn2gdr3k.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9170, '拉斯·米尔斯', 'Russ Mills', 'chahua/we8uriwzah76789k.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9171, '罗梅罗·布里托', 'Romero Britto', 'chahua/psjhnfiww4zgjlo4.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9172, '鲁布·戈德堡', 'Rube Goldberg', 'chahua/zta0jbxenhxcso7m.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9173, '罗兰·托波尔', 'Roland Topor', 'chahua/o20kyjcpxo556czd.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9174, '长谷亮平', 'Ryohei Hase', 'chahua/tmxq8bt1ngumbqg3.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9175, '萨姆·托夫特', 'Sam Toft', 'chahua/9au5kacde6u256tm.png', 12, '2023-08-20 16:11:35', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9176, '萨巴斯·阿普特鲁斯', 'Sabbas Apterus', 'chahua/xasbm7l98rtvmfmq.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9177, '塞尔吉奥·阿拉贡内斯', 'Sergio Aragones', 'chahua/088dln07e1d3agyj.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9178, '莎拉·安徒生', 'Sarah Andersen', 'chahua/4mnzg24cef7on1n0.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9179, '谢尔·西尔弗斯坦', 'Shel Silverstein', 'chahua/cqen60eksq89kv6x.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9180, '萨姆·基思', 'Sam Kieth', 'chahua/e8qeb1w5eks8xgpz.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9181, '斯蒂芬·马蒂尼埃', 'Stephan Martiniere', 'chahua/b4pv3491ii0yleel.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9182, '索菲·布莱考尔', 'Sophie Blackall', 'chahua/nlqfwl6vbdnltenr.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9183, '斯科蒂·杨', 'Skottie Young', 'chahua/7tn9bq1yewilwo91.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9184, '村上隆', 'Takashi Murakami', 'chahua/ejhl9kjfmycsdd1m.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9185, '史蒂夫·鲁德', 'Steve Rude', 'chahua/e8kkoouqtxqauo4k.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9186, '史蒂夫·迪特科', 'Steve Ditko', 'chahua/vxzlp1n9xdsrydnb.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9187, '山本隆人', 'Takato Yamamoto', 'chahua/9j7fvjzy6tu88vso.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9188, '特德·纳斯史密斯', 'Ted Nasmith', 'chahua/hjtghnwe8cvj696e.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9189, '斯蒂芬·加梅尔', 'Stephen Gammell', 'chahua/kdb6yaxnimi4e2th.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9190, '特里·多德森', 'Terry Dodson', 'chahua/ujfh3orb3wq3zm8x.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9191, '托德·肖尔', 'Todd Schorr', 'chahua/oe12hf29er8m87ig.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9192, '蒂姆·波顿', 'Tim Burton', 'chahua/0t4rxmil3tb012h3.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9193, '冈上敏子', 'Toshiko Okanoue', 'chahua/cw2h9l7f8v5yw6qz.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9194, '二平勉', 'Tsutomu Nihei', 'chahua/lrofmnpogjs1pu2i.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9195, '托尼·迪特利兹', 'Tony DiTerlizzi', 'chahua/j031fn5g52hafjaa.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9196, '沃尔特·凯利', 'Walt Kelly', 'chahua/3lehsdcyuwzhg4ph.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9197, '沃德·金博尔', 'Ward Kimball', 'chahua/8m0maw6xofwxqy3j.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9198, '文斯·科莱塔', 'Vince Colletta', 'chahua/q04z9otuy6km2u2j.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9199, '托德·麦克法兰', 'Todd McFarlane', 'chahua/cxo8gtcp5w5qop4u.png', 12, '2023-08-20 16:11:34', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9200, '陈阮', 'Tran Nguyen', 'chahua/n10zpg2sbzllgq4s.png', 12, '2023-08-20 16:11:33', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9201, '韦恩·巴洛', 'Wayne Barlowe', 'chahua/qw03cz97jogqpe4c.png', 12, '2023-08-20 16:11:33', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9202, '威尔·艾斯纳', 'Will Eisner', 'chahua/wfau5e6sl0q35q6s.png', 12, '2023-08-20 16:11:33', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9203, '沃尔特·克兰', 'Walter Crane', 'chahua/43y7yyy3aec4feu3.png', 12, '2023-08-20 16:11:33', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9204, '威廉·肯特里奇', 'William Kentridge', 'chahua/57muhp6fowmsehct.png', 12, '2023-08-20 16:11:33', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9205, '沃尔特·西蒙森', 'Walter Simonson', 'chahua/ruekpu573d9xr7eh.png', 12, '2023-08-20 16:11:33', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9206, '新川洋二', 'Yoji Shinkawa', 'chahua/xhlioj1l0cqevwmu.png', 12, '2023-08-20 16:11:33', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9207, '威廉·斯托特', 'William Stout', 'chahua/k1a9siefheokmmi0.png', 12, '2023-08-20 16:11:33', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9208, '温莎·麦凯', 'Winsor McCay', 'chahua/ut4hbm7hot4owe7t.png', 12, '2023-08-20 16:11:33', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9209, '天野喜孝', 'Yoshitaka Amano', 'chahua/e485irgcqi0vlnk8.png', 12, '2023-08-20 16:11:33', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9210, '威廉·蒂姆林', 'William Timlin', 'chahua/olt2t8m36o8bh33j.png', 12, '2023-08-20 16:11:33', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9211, '阿法林·萨杰迪', 'Afarin Sajedi', 'huajia/vxca77k57433821a.png', 12, '2023-08-20 16:13:21', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9212, '亚伦·贾辛斯基', 'Aaron Jasinski', 'huajia/n3h2py9m8qy9rdwo.png', 12, '2023-08-20 16:13:21', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9213, '富野由之', 'Yoshiyuki Tomino', 'chahua/jxwo4btg4xgqeocf.png', 12, '2023-08-20 16:11:33', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9214, '阿道夫·戈特利布', 'Adolph Gottlieb', 'huajia/8kl5u1kcg538vayt.png', 12, '2023-08-20 16:13:21', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9215, '麦克贝斯', 'mcbess', 'chahua/2zhxc0ugz1ts0pmc.png', 12, '2023-08-20 16:11:33', '2023-12-28 13:54:21', 0, 'chahua', '');
INSERT INTO `df_robot_prompt` VALUES (9216, '亚历克斯·格罗斯', 'Alex Gross', 'huajia/xfkm2dz23i4oyxqs.png', 12, '2023-08-20 16:13:21', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9217, '阿尔伯特·马奎特', 'Albert Marquet', 'huajia/3npntgbc4te6at6y.png', 12, '2023-08-20 16:13:21', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9218, '艾格尼丝·劳伦斯·佩尔顿', 'Agnes Lawrence Pelton', 'huajia/dtety3zc86rkmrzt.png', 12, '2023-08-20 16:13:21', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9219, '亚历克斯·科尔维尔', 'Alex Colville', 'huajia/a93y6xsekjbpc9wu.png', 12, '2023-08-20 16:13:21', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9220, '艾伦·帕里', 'Alan Parry', 'huajia/m4f6gsm2ec2unj7u.png', 12, '2023-08-20 16:13:21', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9221, '安布罗修斯·博斯查尔特', 'Ambrosius Bosschaert', 'huajia/tohh1wx6fls3j45c.png', 12, '2023-08-20 16:13:21', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9222, '艾米·谢拉尔德', 'Amy Sherald', 'huajia/zojpl6qnol0lgi01.png', 12, '2023-08-20 16:13:21', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9223, '阿尔方斯·奥斯伯特', 'Alphonse Osbert', 'huajia/m86rh12qsprxxprx.png', 12, '2023-08-20 16:13:21', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9224, '阿梅代奥·莫迪利亚尼', 'Amedeo Modigliani', 'huajia/0acg06wyyo33ngou.png', 12, '2023-08-20 16:13:21', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9225, '安娜·安彻', 'Anna Ancher', 'huajia/9gyhn2rxpiw9mco8.png', 12, '2023-08-20 16:13:21', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9226, '安妮·帕卡德', 'Anne Packard', 'huajia/vn2ilna5nq1eivpg.png', 12, '2023-08-20 16:13:21', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9227, '艾丽丝·尼尔', 'Alice Neel', 'huajia/iivn660q67csr8ie.png', 12, '2023-08-20 16:13:21', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9228, '安德烈·雷姆涅夫', 'Andrey Remnev', 'huajia/fvr4sx4l75fiaapu.png', 12, '2023-08-20 16:13:21', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9229, '安妮·苏丹', 'Annie Soudain', 'huajia/0cyogjkxlbw5cttf.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9230, '艾米·希尔曼', 'Amy Sillman', 'huajia/91xf3kmlicrc6jwo.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9231, '阿希尔·高尔基', 'Arshile Gorky', 'huajia/45c5fpeimz6tlckm.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9232, '阿诺德·博克林', 'Arnold Bocklin', 'huajia/tfp7kjg4v6h51jwn.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9233, '阿尔芒·吉约曼', 'Armand Guillaumin', 'huajia/u6cwizxgl2dlvexb.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9234, '阿斯格·乔恩', 'Asger Jorn', 'huajia/96po6yitubtck3r0.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9235, '亚瑟·斯特里顿', 'Arthur Streeton', 'huajia/xya0o76pmc82jvfu.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9236, '竹永芭芭拉', 'Barbara Takenaga', 'huajia/6n8uxmqh26dny2up.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9237, '伯纳德·巴菲特', 'Bernard Buffet', 'huajia/6pdsesdz45twqbt1.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9238, '布彭·卡哈尔', 'Bhupen Khakhar', 'huajia/g0on0njsro1e28qw.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9239, '奥古斯特·赫宾', 'Auguste Herbin', 'huajia/2kn7xywt09793c4w.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9240, '克劳德·莫奈', 'Claude Monet', 'huajia/7vaojlwqqawenttv.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9241, '克里斯·奥菲利', 'Chris Ofili', 'huajia/gk01cw7e8dn49yoj.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9242, '克劳拉', 'Craola', 'huajia/ukgs75efg4g9g264.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9243, '查尔斯·布莱克曼', 'Charles Blackman', 'huajia/ik0m6c6av6h77i3g.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9244, '比利·柴迪什', 'Billy Childish', 'huajia/wqokpys7im71xdbk.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9245, '鲍里斯·库斯托季耶夫', 'Boris Kustodiev', 'huajia/1u3mh66zjl03agz1.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9246, '丹尼尔·梅里亚姆', 'Daniel Merriam', 'huajia/sjhylk9cwt7vnz7j.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9247, '库诺·阿米特', 'Cuno Amiet', 'huajia/5t1hbkeqo1tm0h8d.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9248, '迪·尼克森', 'Dee Nickerson', 'huajia/dl3ozl6sl02thx7a.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9249, '艾德·梅尔', 'Ed Mell', 'huajia/f0n7clms1cqmwbv2.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9250, '大卫·伯留克', 'David Burliuk', 'huajia/axnlc35yz13gz05g.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9251, '大卫·霍克尼', 'David Hockney', 'huajia/uik8i6nqurar4aoc.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9252, '德斯蒙德·莫里斯', 'Desmond Morris', 'huajia/s4y0o2gjur8o1kh9.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9253, '埃米尔·诺尔德', 'Emil Nolde', 'huajia/kfmtghv14tnbiicp.png', 12, '2023-08-20 16:13:20', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9254, '埃里希·赫克尔', 'Erich Heckel', 'huajia/j6rqc3dy0zmw3qjr.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9255, '爱德华·霍珀', 'Edward Hopper', 'huajia/v3wz00oaopyyh3ls.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9256, '爱德华·维亚尔', 'Edouard Vuillard', 'huajia/ajhiter43w8k1dgg.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9257, '埃特尔·阿德南', 'Etel Adnan', 'huajia/8swy2okfff51nbyu.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9258, '菲利斯·卡索拉蒂', 'Felice Casorati', 'huajia/nvb7wlo8ggy3gix5.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9259, '艾琳·汉森', 'Erin Hanson', 'huajia/jj2d09cxs91hivh1.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9260, '方力钧', 'Fang Lijun', 'huajia/6xj7i3m7alk8vo5c.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9261, '菲斯·林戈尔德', 'Faith Ringgold', 'huajia/4t4iofsodv2prkmg.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9262, '加布里埃尔·蒙特', 'Gabriele Munter', 'huajia/t72doigem4iar0az.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9263, '加里·梅尔彻斯', 'Gari Melchers', 'huajia/eli965ggiv8cveem.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9264, '加斯顿·布西埃', 'Gaston Bussiere', 'huajia/xh7y51wevpbj2i8e.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9265, '斐迪南·杜普伊戈多', 'Ferdinand du Puigaudeau', 'huajia/u9u69go3jg6b5xp1.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9266, '加里·邦特', 'Gary Bunt', 'huajia/vg6u5ibkcbidtdov.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9267, '乔治·奥尔特', 'George Ault', 'huajia/qac2praiv5xxpurp.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9268, '乔治·巴塞利兹', 'Georg Baselitz', 'huajia/crrtha0qp5r8grfe.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9269, '弗里茨·斯科尔德', 'Fritz Scholder', 'huajia/0n5dz53l9p29mvs8.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9270, '乔治·比勒尔', 'George Birrell', 'huajia/lqdrffhl91iy0ms2.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9271, '乔治·图克', 'George Tooker', 'huajia/xpwpl2mgkb5pv5k1.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9272, '格特鲁德·阿伯克龙比', 'Gertrude Abercrombie', 'huajia/gy1pg5y1v58lri4m.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9273, '乔治·鲁奥', 'George Rouault', 'huajia/y93o8ayjz3mrbtlf.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9274, '古斯塔夫·克里姆特', 'Gustav Klimt', 'huajia/qn1m3zain1t4osvs.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9275, '乔治·格罗兹', 'George Grosz', 'huajia/xhnwkkttrpyjqus1.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9276, '哈拉尔德·索尔伯格', 'Harald Sohlberg', 'huajia/xuww7ewzdz16e51h.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9277, '汉斯·哈同', 'Hans Hartung', 'huajia/vme1yguj1y8ikudv.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9278, '格兰特·伍德', 'Grant Wood', 'huajia/d9z1mjymuj3utc8j.png', 12, '2023-08-20 16:13:19', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9279, '霍勒斯·皮平', 'Horace Pippin', 'huajia/kroh728m4stxi57q.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9280, '希尔玛·阿芙·克林特', 'Hilma af Klint', 'huajia/biyya4xyui71ho7v.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9281, '伊琳娜·叶尔莫洛娃', 'Iryna Yermolova', 'huajia/9bt75urv68kgvdyr.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9282, '伊万·费多罗维奇·乔尔策', 'Ivan Fedorovich Choultse', 'huajia/lsatfyjbzpd63uam.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9283, '雅各布·劳伦斯', 'Jacob Lawrence', 'huajia/pbwlxmzj5aowvfje.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9284, '霍华德·霍奇金', 'Howard Hodgkin', 'huajia/je0u2fmfj7fgl5dm.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9285, '伊沃娜·利夫希斯', 'Iwona Lifsches', 'huajia/s8ida50ailxl5np3.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9286, '贾斯帕·琼斯', 'Jasper Johns', 'huajia/6dnhn3tvmojtrbwn.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9287, '亨利·马蒂斯', 'Henri Matisse', 'huajia/gpn2c8sjprm84sdz.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9288, '詹姆斯·纳尔斯', 'James Nares', 'huajia/day1lpq1yk6n17c0.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9289, '雅克·路易·大卫', 'Jacques-Louis David', 'huajia/j8qa7mxc764s0z6h.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9290, '让·德尔维尔', 'Jean Delville', 'huajia/asr0a6btdh26refy.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9291, '拉里·潘斯', 'Larry Poons', 'huajia/oamd5ki8ppu2u0e4.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9292, '琼·米罗', 'Joan Miro', 'huajia/o8u44lzb6ylptkhe.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9293, '洛朗·格拉索', 'Laurent Grasso', 'huajia/9wkpa3zwmuwat92d.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9294, '卡雷尔·托勒', 'Karel Thole', 'huajia/3ohajehkdm7719tm.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9295, '珍妮·萨维尔', 'Jenny Saville', 'huajia/pvglazzzm7rw7jp4.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9296, '林风眠', 'Lin Fengmian', 'huajia/f7xq276jzz9mvosz.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9297, '勒罗伊·内曼', 'LeRoy Neiman', 'huajia/31i8ak38wfwoqoof.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9298, '刘野', 'Liu Ye', 'huajia/gx1s3ua8699y8d8w.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9299, '莱昂·巴克斯特', 'Leon Bakst', 'huajia/naq7u00niz2lm8we.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9300, '玛丽亚·拉斯尼格', 'Maria Lassnig', 'huajia/vx77tdy5i4ny3bqb.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9301, '马克斯·恩斯特', 'Max Ernst', 'huajia/290apy2qyt8h7y0j.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9302, '莫里斯·普伦德加斯特', 'Maurice Prendergast', 'huajia/w3nux3cw2ospmw28.png', 12, '2023-08-20 16:13:18', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9303, '玛丽·劳伦森', 'Marie Laurencin', 'huajia/tt70bqr2anxvwbo8.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9304, '米里亚姆·夏皮罗', 'Miriam Schapiro', 'huajia/la9ikjze5j41ymh9.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9305, '路易斯·韦恩', 'Louis Wain', 'huajia/m1jgtimmp1381ggs.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9306, '奥斯瓦尔多·瓜亚萨明', 'Oswaldo Guayasamin', 'huajia/9gmu1imuffn9pmpu.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9307, '迈克·沃勒尔', 'Mike Worrall', 'huajia/ug9gnfih27ebwabo.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9308, '保罗·拉弗利', 'Paul Laffoley', 'huajia/anzsjair517doxrt.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9309, '莫里斯·赫什菲尔德', 'Morris Hirshfield', 'huajia/tup8q1z7rs5eh9kx.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9310, '彼得·多伊格', 'Peter Doig', 'huajia/t3ic296pv2cuhs3w.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9311, '保罗·高更', 'Paul Gauguin', 'huajia/wu7buqoi8imutjbs.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9312, '雷切尔·鲁伊斯', 'Rachel Ruysch', 'huajia/q7id4mj0j643fw02.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9313, '雷蒙兹·斯塔普拉斯', 'Raimonds Staprans', 'huajia/vvb5kt4agey4euvx.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9314, '雷内·马格里特', 'Rene Magritte', 'huajia/96kxqj7q36baknes.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9315, '雷金纳德·马什', 'Reginald Marsh', 'huajia/t5a4h9q8mdxxxoj1.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9316, '拉乌尔·杜菲', 'Raoul Dufy', 'huajia/p79hd30anfr4bnok.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9317, '罗布·冈萨尔维斯', 'Rob Gonsalves', 'huajia/gh3zpo2b04vpegj8.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9318, '特洛伊·布鲁克斯', 'Troy Brooks', 'huajia/4ffs65begb77777k.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9319, '翠西·艾敏', 'Tracey Emin', 'huajia/qzulcd6n86yii1ec.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9320, '雷吉娜·瓦卢齐', 'Regina Valluzzi', 'huajia/aonexx3fe46pc6i2.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9321, '藤田嗣治', 'Tsuguharu Foujita', 'huajia/agrqp4ybnr3v35sr.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9322, '威廉·兰森·拉斯罗普', 'William Langson Lathrop', 'huajia/1cfs6e26um2wg4k5.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9323, '威廉·德·库宁', 'Willem de Kooning', 'huajia/ih4yozwf3b2ghcq9.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9324, '维克托·尼佐夫采夫', 'Victor Nizovtsev', 'huajia/ehaqhj36g4zeqy9p.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9325, '威尔·巴尼特', 'Will Barnet', 'huajia/pi8o3q7n0fw4t30g.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9326, '徐悲鸿', 'Xu Beihong', 'huajia/qead4n2kfekhlpgx.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9327, '威廉·惠特克', 'William Whitaker', 'huajia/z2slvhlyuafjjqkt.png', 12, '2023-08-20 16:13:17', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9328, '杨永良', 'Yang Yongliang', 'huajia/74x03npjm5g1hff0.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9329, '张大千', 'Zhang Daqian', 'huajia/z73a87674owwacjp.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9330, '安德烈·德兰', 'Andre Derain', 'huajia/0p2bx3q2070ywyv3.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9331, '文森特 - 梵高', 'Vincent van Gogh', 'huajia/1k8e97ya9w62an8f.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9332, '吴冠中', 'Wu Guanzhong', 'huajia/uncyktfcagr6e43u.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9333, '伊冯·库伯', 'Yvonne Coomber', 'huajia/15zvxglj7ix7jip8.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9334, '安东尼·塔皮埃斯', 'Antoni Tapies', 'huajia/6fjn0larcy2mqg1q.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9335, '阿尔基普·库因吉', 'Arkhyp Kuindzhi', 'huajia/tbp756e7wslk3x48.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9336, '阿波利纳里·瓦斯涅佐夫', 'Apollinary Vasnetsov', 'huajia/g0hx3g8ff0a5cfc4.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9337, '艾德·帕施克', 'Ed Paschke', 'huajia/zz6oy96ede1ta6je.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9338, '埃米尔·伯纳德', 'Emile Bernard', 'huajia/jftr8ym5t89wpiwi.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9339, '保罗·克利', 'Paul Klee', 'huajia/h1o11l9ift5u1emt.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9340, '吉诺·塞韦里尼', 'Gino Severini', 'huajia/7fw06vrd9ozt3ymi.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9341, '威廉·詹姆斯·格拉肯斯', 'William James Glackens', 'huajia/gp9knrqgpqyoqg5h.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9342, '亨利·卢梭', 'Henri Rousseau', 'huajia/8b0d99eth92xq3x1.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9343, '伊莱恩·德·库宁', 'Elaine de Kooning', 'huajia/2veg3mjxcvy42ge6.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9344, '雅培·汉德森·塞耶', 'Abbott Handerson Thayer', 'huajia/w9a0zrk4hr8yemja.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9345, '阿杰·卡森', 'A. J. Casson', 'huajia/aioy5kact1qk7032.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9346, '亚当·埃尔斯海默', 'Adam Elsheimer', 'huajia/ca8i241qls1p11ba.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9347, '阿德·莱因哈特', 'Ad Reinhardt', 'huajia/21ft3iswd4svqcq3.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9348, '雅培·富勒·格雷夫斯', 'Abbott Fuller Graves', 'huajia/56ajlzz1v81bvd9q.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9349, '齐斯瓦夫·贝克辛斯基', 'Zdzislaw Beksinski', 'huajia/dvqt5ppf84dx4d8p.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9350, '阿德里安·范·奥斯塔德', 'Adriaen van Ostade', 'huajia/v9xi6bfnql5b7iz8.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9351, '阿多娜·卡雷', 'Adonna Khare', 'huajia/qy5yo972w1x0rixt.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9352, '阿道夫·门泽尔', 'Adolph Menzel', 'huajia/4zd0spr3d6qxzj9n.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9353, '阿凡迪', 'Affandi', 'huajia/wi3gc0dy10xzfpp7.png', 12, '2023-08-20 16:13:16', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9354, '艾格尼丝·塞西尔', 'Agnes Cecile', 'huajia/t96jtifzma59kza4.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9355, '阿德里安努斯·埃弗森', 'Adrianus Eversen', 'huajia/0r35vco1rj1vx12f.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9356, '阿德里安·格尼', 'Adrian Ghenie', 'huajia/0nu6udpju2ysdy0m.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9357, '阿戈斯蒂诺·阿里瓦贝内', 'Agostino Arrivabene', 'huajia/v0ukomf83gfi59qf.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9358, '艾格尼丝·马丁', 'Agnes Martin', 'huajia/0ryf1mclty2lgj52.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9359, '阿德里安·范·乌得勒支', 'Adriaen van Utrecht', 'huajia/5dyw42sihhby26l8.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9360, '艾伦·肯尼', 'Alan Kenny', 'huajia/u7bbp23218kuzhun.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9361, '艾伦·宾', 'Alan Bean', 'huajia/pkqtxy6ahtau0n8h.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9362, '阿尔伯特·格莱兹', 'Albert Gleizes', 'huajia/nvtf1lgjdv0onxbg.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9363, '阿尔伯特·比尔施塔特', 'Albert Bierstadt', 'huajia/j5tq2rdtqkou846j.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9364, '阿尔伯特·班诺瓦', 'Albert Benois', 'huajia/hwvcs21n4doi9pnc.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9365, '阿尔伯特·古德温', 'Albert Goodwin', 'huajia/gpm0862ysi7z5fkg.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9366, '阿尔伯特·安克', 'Albert Anker', 'huajia/hqz4w05aav7g3wsi.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9367, '阿尔贝托·布里', 'Alberto Burri', 'huajia/qi6jyw0e4w3xghrk.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9368, '阿尔伯特·林奇', 'Albert Lynch', 'huajia/zg4noyerrmjr7wum.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9369, '阿列克谢·萨弗拉索夫', 'Aleksey Savrasov', 'huajia/hu8x3s9v7z16vomz.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9370, '阿尔伯特·约瑟夫·摩尔', 'Albert Joseph Moore', 'huajia/k05eqv213hgcxr8l.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9371, '阿尔伯特·平卡姆·赖德', 'Albert Pinkham Ryder', 'huajia/y6jyp4028j5d7igd.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9372, '亚历克斯·加兰特', 'Alex Garant', 'huajia/i9pwrgeipcpk9z3s.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9373, '亚历克斯·拉塞尔·弗林特', 'Alex Russell Flint', 'huajia/aylwybj42qnbnkyl.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9374, '亚历克斯·格雷', 'Alex Grey', 'huajia/ptqxz1zhwqh8tk9y.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9375, '亚历山大·阿维林', 'Alexandr Averin', 'huajia/rsqaasvlkglj65ga.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9376, '亚历克斯·阿勒曼尼', 'Alex Alemany', 'huajia/0oina47mbu8uosbg.png', 12, '2023-08-20 16:13:15', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9377, '亚历山大·贝诺瓦', 'Alexandre Benois', 'huajia/xjf750qtqu0gxsfx.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9378, '亚历山大·卡巴内尔', 'Alexandre Cabanel', 'huajia/ua768blzmmega3cv.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9379, '亚历山大·米勒', 'Alexander Millar', 'huajia/7qkk9dni7dpgu0sq.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9380, '亚历山大·埃瓦里斯特·弗', 'Alexandre-Evariste Fragonard', 'huajia/5g0h5e2dv36umv5q.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9381, '阿尔弗雷德·吉尤', 'Alfred Guillou', 'huajia/7x8wsbqx6d5km8lx.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9382, '阿列克谢·哈拉莫夫', 'Alexei Harlamoff', 'huajia/cojt5xd7cd2ua0ez.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9383, '阿尔弗雷德·史蒂文斯', 'Alfred Stevens', 'huajia/1ze5ozr5s9lrgkk6.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9384, '亚历山大卡拉梅', 'Alexandre Calame', 'huajia/5qzniss7juwde1kg.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9385, '阿尔弗雷德·亨利·毛雷尔', 'Alfred Henry Maurer', 'huajia/pzof3o66opibzlb4.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9386, '阿尔弗雷德·芒宁斯', 'Alfred Munnings', 'huajia/8o9genjfxancnf5j.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9387, '阿尔森·斯金纳·克拉克', 'Alson Skinner Clark', 'huajia/rsh13bvad4apmrqv.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9388, '阿尔方斯·穆夏', 'Alphonse Mucha', 'huajia/wa15bwesihheg4xa.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9389, '阿洛伊斯·阿内格', 'Alois Arnegger', 'huajia/7od94gi84zea91q2.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9390, '艾丽莎·蒙克斯', 'Alyssa Monks', 'huajia/o7d45mcay7m4f21d.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9391, '爱丽丝·贝利', 'Alice Bailly', 'huajia/0voia3h8diasrwe6.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9392, '安布罗修斯·本森', 'Ambrosius Benson', 'huajia/bxmuud5p0nk0skl4.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9393, '艾米·贾德', 'Amy Judd', 'huajia/ndksyi0g12fu7y9l.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9394, '阿纳托利·梅特兰', 'Anatoly Metlan', 'huajia/d8kw1urv5d0tzi60.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9395, '阿尔玛·伍德西·托马斯', 'Alma Woodsey Thomas', 'huajia/sp5y4a6ge4iok4qi.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9396, '安德斯·佐恩', 'Anders Zorn', 'huajia/lldag4be3o8u7s13.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9397, '安德烈·科恩', 'Andre Kohn', 'huajia/cavn43p29gele4g5.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9398, '安德里亚·科奇', 'Andrea Kowch', 'huajia/2zahiutcxdtjh7kc.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9399, '安德烈·洛特', 'Andre Lhote', 'huajia/4dslog22xcnoqnp5.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9400, '安德烈亚斯·阿肯巴赫', 'Andreas Achenbach', 'huajia/bz5gh5xapwy8q27a.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9401, '安德鲁·阿特罗申科', 'Andrew Atroshenko', 'huajia/16lhs9iw1r3v4j84.png', 12, '2023-08-20 16:13:14', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9402, '安德烈·鲁布廖夫', 'Andrei Rublev', 'huajia/igmfr30udggpbgky.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9403, '安德鲁·马卡拉', 'Andrew Macara', 'huajia/25lz99iag4p19z6j.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9404, '安德里亚·曼特尼亚', 'Andrea Mantegna', 'huajia/h4u4inaqt14ojox8.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9405, '安妮·德瓦利', 'Anne Dewailly', 'huajia/6q2dc55wa72pb24t.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9406, '安妮·罗森斯坦', 'Anne Rothenstein', 'huajia/fu7hv0u1kwsg709o.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9407, '安妮·路易斯·吉洛代', 'Anne-Louis Girodet', 'huajia/zjvinmbgpis5gvt1.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9408, '安德鲁·怀斯', 'Andrew Wyeth', 'huajia/xq5ayo0fziggciwp.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9409, '安尼克·布瓦蒂尔', 'Annick Bouvattier', 'huajia/8e5owbqa0wke0w6e.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9410, '安妮·斯温纳顿', 'Annie Swynnerton', 'huajia/ljv9obbk6m5pud2i.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9411, '安塞姆·基弗', 'Anselm Kiefer', 'huajia/krcu0hxh7d2d4p04.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9412, '安娜·博切克', 'Anna Bocek', 'huajia/3vsut7y3uytv4k3l.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9413, '安东尼·蒂姆', 'Anthony Thieme', 'huajia/2o0m50h23un0ur6g.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9414, '安东·拉斐尔·门斯', 'Anton Raphael Mengs', 'huajia/7240dwlo6vi5xcj4.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9415, '安东·莫夫', 'Anton Mauve', 'huajia/f36hkdn2yez0ll57.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9416, '安东内罗·达·梅西纳', 'Antonello da Messina', 'huajia/1719g068brbw7asj.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9417, '安东·皮克', 'Anton Pieck', 'huajia/avhqzi09masdo6by.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9418, '阿特·弗拉姆', 'Art Frahm', 'huajia/by8n2edcqvopm4l4.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9419, '安托万·布兰查德', 'Antoine Blanchard', 'huajia/zha00s9tcc0t2074.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9420, '艾蒿', 'Artemisia Gentileschi', 'huajia/z36xad75rxqslojf.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9421, '阿里斯塔克·伦图洛夫', 'Aristarkh Lentulov', 'huajia/tna66avw7bsfmkn2.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9422, '安东尼·凡·戴克', 'Anthony van Dyck', 'huajia/mt373in0wjbsue06.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9423, '阿奇博尔德·索伯恩', 'Archibald Thorburn', 'huajia/3h24tqc7gbekmyca.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9424, '阿瑟·哈克', 'Arthur Hacker', 'huajia/dbkt68uv0xum0ka7.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9425, '亚瑟·博伊德', 'Arthur Boyd', 'huajia/9g3qnwilk0tr80aq.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9426, '亚瑟·达夫', 'Arthur Dove', 'huajia/kj6refklcitf9wib.png', 12, '2023-08-20 16:13:13', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9427, '阿瑟·休斯', 'Arthur Hughes', 'huajia/38t6unb3gpbdcqxo.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9428, '亚瑟·沃德尔', 'Arthur Wardle', 'huajia/g3zceg7noi9ol1vb.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9429, '阿图罗·索托', 'Arturo Souto', 'huajia/9hl92j03u1i7fshc.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9430, '亚瑟·利斯默', 'Arthur Lismer', 'huajia/qv90p79mt4yibuop.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9431, '阿里·谢弗', 'Ary Scheffer', 'huajia/08ifpr5584z98yxn.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9432, '奥黛丽·川崎', 'Audrey Kawasaki', 'huajia/isiutkfhlhtdq9up.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9433, '奥古斯都·埃德温·马尔雷', 'Augustus Edwin Mulready', 'huajia/4xid5anbno2o8344.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9434, '奥古斯特·麦克', 'August Macke', 'huajia/v1tgco85fhjnzod7.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9435, '奥古斯都·约翰', 'Augustus John', 'huajia/zrm71efyaq3ezbuv.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9436, '奥古斯特·图尔穆什', 'Auguste Toulmouche', 'huajia/9vr6mbmj4wyyawei.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9437, '巴尔蒂斯', 'Balthus', 'huajia/xp8g4sb6vfe0jpwu.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9438, '巴托洛梅·埃斯特万·穆里', 'Bartolome Esteban Murillo', 'huajia/csyvo2ei87ca9rla.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9439, '巴克利·亨德里克斯', 'Barkley L. Hendricks', 'huajia/02y8xw23bolx6nye.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9440, '博福德·德莱尼', 'Beauford Delaney', 'huajia/lo6rexmtp9c6ahhv.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9441, '本·阿伦森', 'Ben Aronson', 'huajia/jka8lq516coan7kt.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9442, '伯努瓦·曼德尔布罗特', 'Benoit B. Mandelbrot', 'huajia/ncadbwct19jwvrdo.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9443, '比尔·杰克林', 'Bill Jacklin', 'huajia/g1dhpqw2zy7ydei3.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9444, '本·尼科尔森', 'Ben Nicholson', 'huajia/3ffvulleovbce6z1.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9445, '比尔·布劳尔', 'Bill Brauer', 'huajia/8ygw9cy4t8fb4rsv.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9446, '本·奎尔蒂', 'Ben Quilty', 'huajia/fwieepjk6jb2rz5u.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9447, '博·巴特利特', 'Bo Bartlett', 'huajia/xxh5xwwuhnuuw821.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9448, '比尔·特雷勒', 'Bill Traylor', 'huajia/tex29vawy87u9vfb.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9449, '本·沙恩', 'Ben Shahn', 'huajia/97udauroatfdsvdv.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9450, '鲍勃·罗斯', 'Bob Ross', 'huajia/5qf70rnxejd0crha.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9451, '鲍勃·拜尔利', 'Bob Byerley', 'huajia/a4g71u42t65mi54h.png', 12, '2023-08-20 16:13:12', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9452, '鲍里斯·格里戈里耶夫', 'Boris Grigoriev', 'huajia/xgpy2jylyc6ueqg4.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9453, '布伦特·海顿', 'Brent Heighton', 'huajia/d65ybnbrn3zh0a7y.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9454, '布伦特棉花', 'Brent Cotton', 'huajia/mmsjqpux4trl8u7v.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9455, '布雷特·怀特利', 'Brett Whiteley', 'huajia/v4cbqb0a3g0fzut3.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9456, '布里奇特·贝特·蒂奇诺', 'Bridget Bate Tichenor', 'huajia/0oz1zzoytmie2wpu.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9457, '英国人里维埃', 'Briton Riviere', 'huajia/c061b350ry4q05wl.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9458, '布赖恩·马什本', 'Brian Mashburn', 'huajia/36h3jz8fn72pyh5c.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9459, '布里奇特·赖利', 'Bridget Riley', 'huajia/fbybshw0w53bpwq3.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9460, '布莱斯·马登', 'Brice Marden', 'huajia/vm1p80nzeut0nlyx.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9461, '布拉德·昆克尔', 'Brad Kunkle', 'huajia/c6j0degxsauo3dxe.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9462, '比亚姆·肖', 'Byam Shaw', 'huajia/5pbsdwdgt67z0623.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9463, '凯莉·芬克', 'Callie Fink', 'huajia/ksfkqys0a60tmzpj.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9464, '坎迪多·波尔蒂纳里', 'Candido Portinari', 'huajia/aqc9y2o5t2eax1y9.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9465, '卡纳莱托', 'Canaletto', 'huajia/an4wiiqhlb3r3y39.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9466, '卡米尔·柯罗', 'Camille Corot', 'huajia/yceflvp050xj06gq.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9467, '卡尔·拉森', 'Carl Larsson', 'huajia/cak1qu8qm9qmm99o.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9468, '卡雷尔·威林克', 'Carel Willink', 'huajia/oadkxtce7eo655nh.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9469, '卡米尔·毕沙罗', 'Camille Pissarro', 'huajia/uscklezkkhoypzzf.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9470, '卡尔·古斯塔夫·卡鲁斯', 'Carl Gustav Carus', 'huajia/aathgeq284hu3gtz.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9471, '布龙齐诺', 'Bronzino', 'huajia/tk3ryng0hiicb2sv.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9472, '卡斯帕·大卫·弗里德里希', 'Caspar David Friedrich', 'huajia/se5fqthnvkog5o6z.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9473, '卡尔·施皮茨韦格', 'Carl Spitzweg', 'huajia/fojw5lov5j37a6i7.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9474, '卡拉瓦乔', 'Caravaggio', 'huajia/fctsew77x4xtsl3t.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9475, '卡尔·霍尔索', 'Carl Holsoe', 'huajia/6kj0c5owcas3vk0d.png', 12, '2023-08-20 16:13:11', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9476, '查尔斯·安格朗', 'Charles Angrand', 'huajia/hfsr8gyuyqpdzrxp.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9477, '查尔斯·德穆斯', 'Charles Demuth', 'huajia/fneho1wgqn7bbjz0.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9478, '塞西莉·布朗', 'Cecily Brown', 'huajia/koebh9fqzfqroacs.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9479, '卡罗·克里韦利', 'Carlo Crivelli', 'huajia/fmasfwf41952mph1.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9480, '查姆·苏丁', 'Chaim Soutine', 'huajia/v7weifwilbzql30n.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9481, '切斯利·博内斯特尔', 'Chesley Bonestell', 'huajia/sdndx1g1x91bvu34.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9482, '克里斯蒂安·沙德', 'Christian Schad', 'huajia/1f8tga8dep01buqr.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9483, '查尔斯·马里恩·拉塞尔', 'Charles Marion Russell', 'huajia/55ir7129ukc37ihu.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9484, '克里斯托弗·RW·内文森', 'Christopher R. W. Nevinson', 'huajia/4xibcwxqyjrkhdd9.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9485, '查尔斯·伯奇菲尔德', 'Charles E. Burchfield', 'huajia/qnxqgsw3d56ogcpy.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9486, '克莱夫·马奇威克', 'Clive Madgwick', 'huajia/3mccegijlsfv6dlm.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9487, '达纳·舒茨', 'Dana Schutz', 'huajia/udasobicze6tqgih.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9488, '科内利斯施普林格', 'Cornelis Springer', 'huajia/4yix1vs8uddsi4oi.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9489, '迭戈·贝拉斯克斯', 'Diego Velazquez', 'huajia/tb29t0bj04b9vtok.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9490, '丹尼尔·李奇微·奈特', 'Daniel Ridgway Knight', 'huajia/24fa5a9qjos4r18c.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9491, '迪诺·瓦尔斯', 'Dino Valls', 'huajia/1bxwk75jilxq4td8.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9492, '迭戈·里维拉', 'Diego Rivera', 'huajia/tz9rzmzotdmk9wom.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9493, '爱德华·马奈', 'Edouard Manet', 'huajia/slv3jv56t75hjub5.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9494, '德米特里·丹麦', 'Dmitri Danish', 'huajia/fgqbxxh336ggx0dt.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9495, '埃德蒙·莱顿', 'Edmund Leighton', 'huajia/x9ngsqjah9keo778.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9496, '埃德加·德加', 'Edgar Degas', 'huajia/e7a91hi9l1rjttlk.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9497, '多萝西娅·坦宁', 'Dorothea Tanning', 'huajia/hklbmt8ujcq3yjet.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9498, '爱德华·蒙克', 'Edvard Munch', 'huajia/5xw0yg5kf909phtc.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9499, '爱德华·莫兰', 'Edward Moran', 'huajia/s3y58ikbtjjsuajc.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9500, '埃德温·奥斯汀·阿比', 'Edwin Austin Abbey', 'huajia/vo3dlroibpcr8wtl.png', 12, '2023-08-20 16:13:10', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9501, '爱德华·伯恩-琼斯', 'Edward Burne-Jones', 'huajia/yglk0qj6rtqrcrv2.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9502, '爱德华·罗伯特·休斯', 'Edward Robert Hughes', 'huajia/nvds386icasjnn6y.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9503, '埃贡·席勒', 'Egon Schiele', 'huajia/tmc7s43b5vm6k2wv.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9504, '格列柯', 'El Greco', 'huajia/cp9rwhnu3fsr8p8y.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9505, '伊诺克·博勒斯', 'Enoch Bolles', 'huajia/j5j1psihx147yju6.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9506, '埃莉诺·福蒂斯丘-布里克', 'Eleanor Fortescue-Brickdale', 'huajia/qjlfnsd119fo3vj9.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9507, '埃里克·齐纳', 'Eric Zener', 'huajia/gb3fdyl90z5zygsr.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9508, '菲利西安·罗普斯', 'Felicien Rops', 'huajia/6r4fw25f05ufidv4.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9509, '恩斯特·路德维希·基什内', 'Ernst Ludwig Kirchner', 'huajia/r9t0r9derijh5e29.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9510, '费尔南德·克诺普夫', 'Fernand Khnopff', 'huajia/13br3fxpkiz7dt7b.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9511, '法比安·佩雷斯', 'Fabian Perez', 'huajia/rhyf37bj9o6u2s2z.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9512, '埃丝特·毕沙罗', 'Esther Pissarro', 'huajia/lji7lx1g3zc0yqxb.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9513, '欧内斯特·哈姆林·贝克', 'Ernest Hamlin Baker', 'huajia/gambep15of0m6xb9.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9514, '法式培根', 'Francis Bacon', 'huajia/4soffjvvj666jcn7.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9515, '弗朗西斯科·戈雅', 'Francisco Goya', 'huajia/d9v1ka2qjig2zgmh.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9516, '弗朗西斯·毕卡比亚', 'Francis Picabia', 'huajia/nk9itxt6uuqpwypd.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9517, '弗朗索瓦·布歇', 'Francois Boucher', 'huajia/8s1a3t2kqkm1qhty.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9518, '菲利皮诺·里皮', 'Filippino Lippi', 'huajia/0dbmgrzy4gd2szjm.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9519, '弗朗茨·塞德拉切克', 'Franz Sedlacek', 'huajia/lu7lq6dz8q9ywekn.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9520, '弗朗茨·克萨韦尔·温特哈', 'Franz Xaver Winterhalter', 'huajia/45a81o7177yrlmth.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9521, '弗兰茨·马克', 'Franz Marc', 'huajia/xlo8w7754df5h9d9.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9522, '弗朗茨·克莱恩', 'Franz Kline', 'huajia/jilng2nnx9vcbbit.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9523, '弗兰克·奥尔巴赫', 'Frank Auerbach', 'huajia/lg9hnerch4cl6jqi.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9524, '弗雷德里克·埃德温·丘奇', 'Frederic Edwin Church', 'huajia/2hexsokd6ftcvgix.png', 12, '2023-08-20 16:13:09', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9525, '弗里茨·索罗', 'Frits Thaulow', 'huajia/65ae7wk58cnuku2x.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9526, '弗雷德里克·罗德·莱顿', 'Frederik Lord Leighton', 'huajia/j6gg8kryh4vm39vy.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9527, '弗里达·卡罗', 'Frida Kahlo', 'huajia/58bhwkehcqvdod1b.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9528, '傅抱石', 'Fu Baoshi', 'huajia/joa8ub618htbgeni.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9529, '盖尔·波托茨基', 'Gail Potocki', 'huajia/6088yprkphyzsnvv.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9530, '乔治·弗雷德里克·瓦茨', 'George Frederic Watts', 'huajia/oig9jj84fti6a7dq.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9531, '乔治·贝洛斯', 'George Bellows', 'huajia/klx42ym3y4nor89z.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9532, '加布里埃尔·梅苏', 'Gabriel Metsu', 'huajia/wjo7ayfcko5phcgj.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9533, '乔治·英尼斯', 'George Inness', 'huajia/kvau5d8unhvd7end.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9534, '乔治·卢克斯', 'George Luks', 'huajia/9lzle13ci0bnvp8x.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9535, '乔瓦尼·贝利尼', 'Giovanni Bellini', 'huajia/sbtet52923vnfeu2.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9536, '乔治·布拉克', 'Georges Braque', 'huajia/ooz7e3oppzy54il6.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9537, '古斯塔夫·卡耶博特', 'Gustave Caillebotte', 'huajia/e7asixjpxddx921g.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9538, '汉斯·巴尔东', 'Hans Baldung', 'huajia/szr0oaq6gwqo72c1.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9539, '朱塞佩·阿尔钦博托', 'Giuseppe Arcimboldo', 'huajia/28pnpmpzsm4yewt2.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9540, '汉斯·扎茨卡', 'Hans Zatzka', 'huajia/uhq39qaf251looya.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9541, '亨利·埃德蒙·克罗斯', 'Henri-Edmond Cross', 'huajia/vp5ciwnu5ik7o3l4.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9542, '汉斯·马卡特', 'Hans Makart', 'huajia/xomgh79gx75m876t.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9543, '亨利·德·图卢兹·劳特累', 'Henri de Toulouse-Lautrec', 'huajia/78g72knp0mwx4f0q.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9544, '人力资源吉格尔', 'H. R. Giger', 'huajia/zbngycsappp8u4nj.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9545, '希罗尼穆斯·博斯', 'Hieronymus Bosch', 'huajia/t5ypxplcnr0lx17g.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9546, '霍勒斯·韦尔内', 'Horace Vernet', 'huajia/7k7ng62cmybug0e7.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9547, '伊利亚·马什科夫', 'Ilya Mashkov', 'huajia/njdxrlmjzpnn3ulu.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9548, '伊恩·达文波特', 'Ian Davenport', 'huajia/puhg6ibh3n6j13m8.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9549, '艾萨克·迈蒙', 'Isaac Maimon', 'huajia/lj8ty3flo74su5ty.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9550, '艾萨克·列维坦', 'Isaac Levitan', 'huajia/cklnwdsappjekyid.png', 12, '2023-08-20 16:13:08', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9551, '伊利亚·列宾', 'Ilya Repin', 'huajia/chmlj5cwjgmbn2ad.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9552, '伊万·马丘克', 'Ivan Marchuk', 'huajia/y05ci1bq97dy0mvm.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9553, '亨利·奥萨瓦·坦纳', 'Henry Ossawa Tanner', 'huajia/lkbms83qae8k2vio.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9554, '伊万·艾瓦佐夫斯基', 'Ivan Aivazovsky', 'huajia/bwm94ibfp92v92lf.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9555, '伊万·希什金', 'Ivan Shishkin', 'huajia/32cn1s5sg80krpp1.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9556, 'JC莱恩德克', 'J.C. Leyendecker', 'huajia/4dysb60ulmzm5jnn.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9557, '伊万·奥尔布赖特', 'Ivan Albright', 'huajia/ix6yrwsjy3262mzu.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9558, '杰克·维特里亚诺', 'Jack Vettriano', 'huajia/7jhkthg31p0a7uyt.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9559, '雅采克·耶尔卡', 'Jacek Yerka', 'huajia/ksjm0extsdg933hs.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9560, '雅克·洛朗·阿加塞', 'Jacques-Laurent Agasse', 'huajia/9ip9g7drni0xjnf9.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9561, '雅克·维庸', 'Jacques Villon', 'huajia/zul0bvmdtev3vcq0.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9562, '杰克·惠顿', 'Jack Whitten', 'huajia/qprbk318tlqeyjvs.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9563, '雅库布·斯卡内德', 'Jakub Schikaneder', 'huajia/i8pnl6ibntkp60mt.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9564, '詹姆斯·麦金托什·帕特里', 'James McIntosh Patrick', 'huajia/jhpel34h9s6e94pz.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9565, '珍妮特·希尔', 'Janet Hill', 'huajia/kxp8q968yb1o6wai.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9566, '杰里米·曼', 'Jeremy Mann', 'huajia/a15jfdxzyvsqrz3c.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9567, '珍妮·玛曼', 'Jeanne Mammen', 'huajia/1umkqg7csi910aty.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9568, '让-米歇尔·巴斯奎特', 'Jean-Michel Basquiat', 'huajia/xtftsa18o25bjlnq.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9569, '扬·凡·艾克', 'Jan Van Eyck', 'huajia/gtglh26ygnuitzir.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9570, '吉米·劳勒', 'Jimmy Lawlor', 'huajia/rph8yygtuq05a7td.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9571, '约翰内斯·科内利斯·韦斯', 'Johannes Cornelisz Verspronck', 'huajia/rx84eicus9j6up20.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9572, '杰克逊·波洛克', 'Jackson Pollock', 'huajia/k39u0nhvvxykkvwb.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9573, '扬·斯蒂恩', 'Jan Steen', 'huajia/mu1ugppl0r6k5n0g.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9574, '约翰内斯·维米尔', 'Johannes Vermeer', 'huajia/wh6gfdbrgoqe8x9k.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9575, '约翰·霍伊兰', 'John Hoyland', 'huajia/6p9iqzmtaa72h2qt.png', 12, '2023-08-20 16:13:07', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9576, '约翰·威廉·沃特豪斯', 'John William Waterhouse', 'huajia/dwyw4z7ozaprtows.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9577, '约翰·辛格·萨金特', 'John Singer Sargent', 'huajia/xm2fhp6hm3km25vr.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9578, '卡迪尔·纳尔逊', 'Kadir Nelson', 'huajia/3be4af336cwukvbm.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9579, '约瑟芬·沃尔', 'Josephine Wall', 'huajia/gv9ntsucnu48zdnd.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9580, '何塞·克莱门特·奥罗斯科', 'Jose Clemente Orozco', 'huajia/gxshbs40p20hx2cv.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9581, '卡尔·弗里德里希·辛克尔', 'Karl Friedrich Schinkel', 'huajia/guyj2m2bfsglnpps.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9582, '卡拉·沃克', 'Kara Walker', 'huajia/c4ugg73wyrd6t0jv.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9583, '凯瑟琳·莫里斯·特罗特', 'Kathryn Morris Trotter', 'huajia/hzzz3otx371yi750.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9584, '卡齐米尔·马列维奇', 'Kazimir Malevich', 'huajia/d18uvdmyria4k2zu.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9585, '卡罗尔·巴克', 'Karol Bak', 'huajia/jfmmtklovdmcn41f.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9586, '凯欣德·威利', 'Kehinde Wiley', 'huajia/fk8uytnwn4j7gwzi.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9587, '白发一夫', 'Kazuo Shiraga', 'huajia/iyu8ls14jexcl3lt.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9588, '基思·哈林', 'Keith Haring', 'huajia/vtdw64j7c73e5ck5.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9589, '高松一树', 'Kazuki Takamatsu', 'huajia/en8nfxu3g4jfmfu9.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9590, 'LS洛瑞', 'L. S. Lowry', 'huajia/9bi6vtwdlugjwosb.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9591, '凯莉·维万科', 'Kelly Vivanco', 'huajia/78pbwrkkzv4jx4q9.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9592, 'L·伯奇·哈里森', 'L. Birge Harrison', 'huajia/j3ixr6kb6fh296xo.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9593, '基思·马利特', 'Keith Mallett', 'huajia/pvv803jpedcxmkwn.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9594, '劳伦斯·阿尔玛·塔德玛', 'Lawrence Alma-Tadema', 'huajia/6ixm6pladuvxmo3a.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9595, '肯·霍华德', 'Ken Howard', 'huajia/fqry0idk61ejtiep.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9596, '莱昂·斯皮利亚特', 'Leon Spilliaert', 'huajia/ucxk9cfs4otbvuwe.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9597, '李博格尔', 'Lee Bogle', 'huajia/bifvfbjpusvr9k7a.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9598, '列奥纳多·达·芬奇', 'Leonardo Da Vinci', 'huajia/f0lopprse6xczjny.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9599, '利奥·普茨', 'Leo Putz', 'huajia/by8gs96ipzomqaaj.png', 12, '2023-08-20 16:13:06', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9600, '列昂尼德·阿夫雷莫夫', 'Leonid Afremov', 'huajia/63apryhsij98gunt.png', 12, '2023-08-20 16:13:05', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9601, '刘小东', 'Liu Xiaodong', 'huajia/qhqduce3i2wn42q0.png', 12, '2023-08-20 16:13:05', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9602, '利奥诺拉·卡林顿', 'Leonora Carrington', 'huajia/zaa7fm3wcib85akd.png', 12, '2023-08-20 16:13:05', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9603, '小尤里', 'Lesser Ury', 'huajia/5q1osifdpq3xxzl3.png', 12, '2023-08-20 16:13:05', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9604, 'MF侯赛因', 'M.F. Husain', 'huajia/56usoyb6jh4dg8s8.png', 12, '2023-08-20 16:13:05', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9605, '柳博夫·波波娃', 'Lyubov Popova', 'huajia/0c02tyejor103x3x.png', 12, '2023-08-20 16:13:05', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9606, '马尔科姆·蒂斯代尔', 'Malcolm Teasdale', 'huajia/43i7a7hy1i6rl176.png', 12, '2023-08-20 16:13:05', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9607, '卢西安·弗洛伊德', 'Lucian Freud', 'huajia/stmf321vsn100xsd.png', 12, '2023-08-20 16:13:05', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9608, '玛吉·汉布林', 'Maggi Hambling', 'huajia/ftskn1md1m182lb6.png', 12, '2023-08-20 16:13:05', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9609, '玛格丽特·基恩', 'Margaret Keane', 'huajia/pjfbuwu2grv9k2s4.png', 12, '2023-08-20 16:13:05', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9610, '玛格丽特·普雷斯顿', 'Margaret Preston', 'huajia/76tyliblizetvnm6.png', 12, '2023-08-20 16:13:05', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9611, '玛格丽特·奥利', 'Margaret Olley', 'huajia/l7j3hw05ne1b40ds.png', 12, '2023-08-20 16:13:05', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9612, '马克·夏加尔', 'Marc Chagall', 'huajia/bbdutdd5jkyrgmjm.png', 12, '2023-08-20 16:13:05', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9613, '莱昂诺·菲尼', 'Leonor Fini', 'huajia/kg0d83kbydto7xil.png', 12, '2023-08-20 16:13:05', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9614, '马克·德姆斯特德', 'Mark Demsteader', 'huajia/wtdbqw8gb1n594mb.png', 12, '2023-08-20 16:13:05', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9615, '玛丽安·斯托克斯', 'Marianne Stokes', 'huajia/lz6k960abu35l2s7.png', 12, '2023-08-20 16:13:05', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9616, '马克·格特勒', 'Mark Gertler', 'huajia/84oplzbn21payc1x.png', 12, '2023-08-20 16:13:04', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9617, '马克·布里斯科', 'Mark Briscoe', 'huajia/tq837j2ctbmcpqtr.png', 12, '2023-08-20 16:13:04', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9618, '马克·布拉德福德', 'Mark Bradford', 'huajia/0dy2mzg6exzymmol.png', 12, '2023-08-20 16:13:04', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9619, '马克·汉森', 'Mark Henson', 'huajia/xsxsrm1lvf3b0z2j.png', 12, '2023-08-20 16:13:04', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9620, '马克·基思利', 'Mark Keathley', 'huajia/ee9h3u41511vg3ay.png', 12, '2023-08-20 16:13:04', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9621, '马克·科斯塔比', 'Mark Kostabi', 'huajia/nu6g147ooyuuq11c.png', 12, '2023-08-20 16:13:04', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9622, '马克·拉格', 'Mark Lague', 'huajia/cbrcoghyv3vqf2kh.png', 12, '2023-08-20 16:13:04', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9623, '马克·罗斯科', 'Mark Rothko', 'huajia/o6mmg0xjyh9qhdew.png', 12, '2023-08-20 16:13:04', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9624, '马克·托比', 'Mark Tobey', 'huajia/5t0vypfy3nwffk37.png', 12, '2023-08-20 16:13:04', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9625, '马琳·杜马斯', 'Marlene Dumas', 'huajia/svqhrjailg7llkmd.png', 12, '2023-08-20 16:13:04', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9626, '马丁·格雷尔', 'Martin Grelle', 'huajia/pf79dzc7r03cxqmp.png', 12, '2023-08-20 16:13:04', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9627, '马克·莱登', 'Mark Ryden', 'huajia/9sou5zx2ur8td3xu.png', 12, '2023-08-20 16:13:04', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9628, '马丁·约翰娜', 'Martine Johanna', 'huajia/sl83lfgea5b758bb.png', 12, '2023-08-20 16:13:04', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9629, '马丁·威特福特', 'Martin Wittfooth', 'huajia/9bs2odorrek2y49i.png', 12, '2023-08-20 16:13:04', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9630, '马丁·基彭伯格', 'Martin Kippenberger', 'huajia/0st9mq786iri2oyq.png', 12, '2023-08-20 16:13:04', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9631, '玛丽·费登', 'Mary Fedden', 'huajia/atxst7fd705w02hg.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9632, '马蒂罗斯·萨里扬', 'Martiros Saryan', 'huajia/a9n82fkro1ul8if5.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9633, '玛丽·布拉迪什·蒂特科姆', 'Mary Bradish Titcomb', 'huajia/wciqv9nfln14194p.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9634, '玛丽·简·安塞尔', 'Mary Jane Ansell', 'huajia/yb6gs7bgotk11idf.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9635, '寺冈雅美', 'Masami Teraoka', 'huajia/cq2ees8i30si7kr9.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9636, '马萨乔', 'Masaccio', 'huajia/it6bxq9da4tmmm2d.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9637, '莫里斯·萨皮罗', 'Maurice Sapiro', 'huajia/y76zi1ya4jql7fhy.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9638, '莫里斯·郁特里罗', 'Maurice Utrillo', 'huajia/yl0mvur8v1flhij9.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9639, '玛丽·海尔曼', 'Mary Heilmann', 'huajia/9zjn8n030709f9vv.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9640, '莫里斯·丹尼斯', 'Maurice Denis', 'huajia/4r3wvlv0oyxhsksl.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9641, '米卡琳·托马斯', 'Mickalene Thomas', 'huajia/0vuj8cncpu34wt6o.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9642, '米哈伊尔·拉里奥诺夫', 'Mikhail Larionov', 'huajia/6sl3ljylz2g42tn0.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9643, '莫里斯·德·弗拉芒克', 'Maurice de Vlaminck', 'huajia/65w0ooajlr6y9i9m.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9644, '迈克·达尔加斯', 'Mike Dargas', 'huajia/fcdy7vm1brwfsxo9.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9645, '米开朗基罗·皮斯托莱托', 'Michelangelo Pistoletto', 'huajia/fnst32tzzloka2my.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9646, '马克斯·利伯曼', 'Max Liebermann', 'huajia/9vzwvhnmm0kv1yce.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9647, '米哈伊尔·弗鲁贝尔', 'Mikhail Vrubel', 'huajia/m9ail821wo858tj9.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9648, '莫迪凯·阿尔东', 'Mordecai Ardon', 'huajia/434ewc2ypqgvxda6.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9649, '莫伊斯·基斯林', 'Moise Kisling', 'huajia/kq1goos4fs3bo90l.png', 12, '2023-08-20 16:13:03', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9650, '莫里斯·路易斯', 'Morris Louis', 'huajia/y8ap0ah0bm439kcm.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9651, '摩西·索耶', 'Moses Soyer', 'huajia/xn77i1cirg60g8mk.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9652, '娜奥米·泰德曼', 'Naomi Tydeman', 'huajia/58tgnjb3vvkt3ewx.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9653, '米哈伊尔·内斯特罗夫', 'Mikhail Nesterov', 'huajia/5ah6ff0umy2slf3y.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9654, '尼古拉斯·海利·哈钦森', 'Nicholas Hely Hutchinson', 'huajia/pk0rwhsuuyhjhrxa.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9655, '服部直人', 'Naoto Hattori', 'huajia/wagoilanuv7kut99.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9656, '尼古拉斯·罗里奇', 'Nicholas Roerich', 'huajia/quz9h3w2ta6jwoy4.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9657, '尼克·阿尔姆', 'Nick Alm', 'huajia/uam53yn8zhvufuq8.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9658, '尼古拉斯·范·韦伦达尔', 'Nicolaes van Verendael', 'huajia/49trqogcgdxhqdnd.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9659, '奥克塔维奥·奥坎波', 'Octavio Ocampo', 'huajia/yqee6av45s10ikq8.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9660, '大久保直美', 'Naomi Okubo', 'huajia/c56lvxrj20jfuvt5.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9661, '诺曼·洛克威尔', 'Norman Rockwell', 'huajia/hg61ft7gd78y54b2.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9662, '尼古拉·萨莫里', 'Nicola Samori', 'huajia/hnrmifzli17d5qvt.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9663, '奥田生力啤酒', 'Okuda San Miguel', 'huajia/wd9qfab5x9am1lgr.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9664, '诺曼·艾克罗伊德', 'Norman Ackroyd', 'huajia/w3vfmqfk0lhcz5d9.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9665, '奥拉齐奥·真蒂莱斯基', 'Orazio Gentileschi', 'huajia/ph2lol3tvgwo6sko.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9666, '奥列格·舒普利亚克', 'Oleg Shuplyak', 'huajia/lzjb71gyb6sjo2f6.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9667, '尼古拉斯·梅斯', 'Nicolaes Maes', 'huajia/ydnug8exj8af82sc.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9668, '奇怪的尼德鲁姆', 'Odd Nerdrum', 'huajia/j0b7dxv2kvpbipn1.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9669, '奥斯卡·科科施卡', 'Oskar Kokoschka', 'huajia/xuskhq4djfxvmtqo.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9670, '帕尔·斯兹尼·梅尔斯', 'Pal Szinyei Merse', 'huajia/jycys9dkcdivbnqm.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9671, '巴勃罗毕加索', 'Pablo Picasso', 'huajia/3j7mbmq5en6cgsx0.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9672, '奥托·迪克斯', 'Otto Dix', 'huajia/magfzsg732mc9cbf.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9673, '保罗·科菲尔德', 'Paul Corfield', 'huajia/h1d3bajsobc184iz.png', 12, '2023-08-20 16:13:02', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9674, '保罗·卡德摩斯', 'Paul Cadmus', 'huajia/8z4qckgjgs2tjb4m.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9675, '帕特·斯泰尔', 'Pat Steir', 'huajia/zn1zx3m42ttnsbc8.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9676, '保罗·查巴斯', 'Paul Chabas', 'huajia/39d5b9r2vovlt7rx.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9677, '彼得·保罗·鲁本斯', 'Peter Paul Rubens', 'huajia/c7aztvpv1ovnaurs.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9678, '彼得·格里克', 'Peter Gric', 'huajia/odubxtwa7t90x586.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9679, '保罗·塞尚', 'Paul Cezanne', 'huajia/tnkvnh1v6p43bmfk.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9680, '保拉·莫德森-贝克尔', 'Paula Modersohn-Becker', 'huajia/rck3p693s2pibw84.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9681, '皮埃尔·苏拉吉', 'Pierre Soulages', 'huajia/44pnf82fcmrfzh4y.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9682, '保拉·雷戈', 'Paula Rego', 'huajia/pl8w38gmi8su2d1o.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9683, '皮埃尔·奥古斯特·雷诺阿', 'Pierre-Auguste Renoir', 'huajia/6shorubx0bz19hxr.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9684, '皮耶罗·德拉·弗朗西斯卡', 'Piero della Francesca', 'huajia/r03ejcpuimg3mxo1.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9685, '皮埃尔·约瑟夫·雷杜特', 'Pierre-Joseph Redoute', 'huajia/g5sicuc81k0ypi2c.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9686, '皮埃尔·波纳尔', 'Pierre Bonnard', 'huajia/2tk0kh15qlbuqxbp.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9687, '彼特·蒙德里安', 'Piet Mondrian', 'huajia/h3comr8io3djjy1r.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9688, '齐白石', 'Qi Baishi', 'huajia/hrxy17guj0to6t7g.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9689, '彼得·孔查洛夫斯基', 'Pyotr Konchalovsky', 'huajia/ztdmyb2k5mkmna49.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9690, '昆特·布赫霍尔兹', 'Quint Buchholz', 'huajia/ymyclbqifayx4565.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9691, 'R·肯顿·纳尔逊', 'R. Kenton Nelson', 'huajia/0ug7yds9gl8x1jmt.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9692, '雷蒙多·德·马德拉索·加', 'Raimundo de Madrazo y Garreta', 'huajia/0qfnygrt2woxegon.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9693, '拉尔夫·布莱克洛克', 'Ralph Blakelock', 'huajia/req6xd8mp9voqrbh.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9694, '拉斐尔·索耶', 'Raphael Soyer', 'huajia/rea0wix038u7a1hx.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9695, '拉蒙·卡萨斯', 'Ramon Casas', 'huajia/lefb0ts1olsy3y70.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9696, '拉乌尔·德凯泽', 'Raoul De Keyser', 'huajia/9qyeaka57o447txv.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9697, '拉斐尔', 'Raphael', 'huajia/rwjuj4pzjy6nuenp.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9698, '雷·唐利', 'Ray Donley', 'huajia/9mbvzvtjo60ktcja.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9699, '伦勃朗·哈门松·范·莱恩', 'Rembrandt Harmenszoon van Rijn', 'huajia/3rt1c110ocv14i94.png', 12, '2023-08-20 16:13:01', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9700, '雷蒙德·利奇', 'Raymond Leech', 'huajia/ne85xa2wwos2uo1b.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9701, '罗伯特·德劳内', 'Robert Delaunay', 'huajia/dxi7vird0l6phtge.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9702, '罗伯特·马瑟韦尔', 'Robert Motherwell', 'huajia/g5bwypvz2eiu2e0p.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9703, '罗伯特·劳森伯格', 'Robert Rauschenberg', 'huajia/heobfoyp0nim9rcp.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9704, '罗伯托·费里', 'Roberto Ferri', 'huajia/i3cb463ynmbmuvwc.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9705, '罗曼·布鲁克斯', 'Romaine Brooks', 'huajia/engphwf1xe6ewdz3.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9706, '罗伯特·谢尔顿·邓肯森', 'Robert Seldon Duncanson', 'huajia/lwuvmrqqlio6e0nj.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9707, '罗伊·利希滕斯坦', 'Roy Lichtenstein', 'huajia/yogbej83h072e40g.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9708, '萨尔瓦多·达利', 'Salvador Dali', 'huajia/0ruws03kc33l1azy.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9709, '鲁菲诺·塔马约', 'Rufino Tamayo', 'huajia/r1e5mac3zbax3rf6.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9710, '莎莉·斯托奇', 'Sally Storch', 'huajia/aifo73jco0wm2vu8.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9711, '罗杰·德·拉·弗雷斯奈', 'Roger de La Fresnaye', 'huajia/zck8ufigmgxxbmrr.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9712, '萨姆·弗朗西斯', 'Sam Francis', 'huajia/h6wklieaponzqv7g.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9713, '所罗门·范·鲁伊斯达尔', 'Salomon van Ruysdael', 'huajia/0wzroyucu3bd9im7.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9714, '萨姆·吉列姆', 'Sam Gilliam', 'huajia/f4zymkgmhrr335sz.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9715, '萨曼莎·基利·史密斯', 'Samantha Keely Smith', 'huajia/2p1oofxve8w98b7c.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9716, '萨姆·盖伊', 'Sam Guay', 'huajia/8v23dujecba8oyuy.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9717, '萨尔瓦多·罗莎', 'Salvator Rosa', 'huajia/kfpazgb69wasonat.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9718, '常玉', 'Sanyu', 'huajia/tu5mnufgzkkouyft.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9719, '塞缪尔·梅尔顿·费舍尔', 'Samuel Melton Fisher', 'huajia/6x8hv35vsju9pdfm.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9720, '塞缪尔·佩普洛', 'Samuel Peploe', 'huajia/y5h9wyy1kys8gikz.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9721, '塔玛拉·德·伦皮卡', 'Tamara de Lempicka', 'huajia/7t07fr59dc44wwwh.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9722, '萨图尔诺·布托', 'Saturno Butto', 'huajia/8dox4oqt1k97yvnd.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9723, '坦尼娅·沙采娃', 'Tanya Shatseva', 'huajia/iigjcfthmuq1y9e7.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9724, '塔尔博特·休斯', 'Talbot Hughes', 'huajia/a9m4fbwynx1swujq.png', 12, '2023-08-20 16:13:00', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9725, '塔西拉·多·阿马拉尔', 'Tarsila do Amaral', 'huajia/cmdn3i4ne99w7r34.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9726, '瓦伦丁·谢罗夫', 'Valentin Serov', 'huajia/z9y79o3y1qte9i1q.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9727, '塔拉斯·洛博达', 'Taras Loboda', 'huajia/y58bhioe14bmmtr6.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9728, '提图斯·卡法尔', 'Titus Kaphar', 'huajia/1vnu92gcmx3dgsup.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9729, '瓦莱丽赫加蒂', 'Valerie Hegarty', 'huajia/wo3vwyk7fvnlqsge.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9730, '瓦伦丁·德·布洛涅', 'Valentin de Boulogne', 'huajia/3hc9cvevtlahs922.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9731, '瓦西里·韦列夏金', 'Vasily Vereshchagin', 'huajia/3ihp5kt543ssfvo4.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9732, '凡妮莎·贝尔', 'Vanessa Bell', 'huajia/etc46rrafq08v4ep.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9733, '冈本太郎', 'Taro Okamoto', 'huajia/v2xmr6xru5i3de8u.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9734, '植村书园', 'Uemura Shoen', 'huajia/pikc2pl4drtuno04.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9735, '维克多·帕斯莫尔', 'Victor Pasmore', 'huajia/6kyrckyp9f8k2obp.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9736, '维克托·瓦萨雷利', 'Victor Vasarely', 'huajia/tkn1nni2y097nrwl.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9737, '维多利亚·克劳', 'Victoria Crowe', 'huajia/fgw0yormqcwvmi9a.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9738, '维贾·塞尔明斯', 'Vija Celmins', 'huajia/s7wtcxkpwwpidkkw.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9739, '维森特·罗梅罗·雷东多', 'Vicente Romero Redondo', 'huajia/vcoclhv0zpv4y4mn.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9740, '文森特·德西德里奥', 'Vincent Desiderio', 'huajia/aipwk0pieqr6ok3q.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9741, '维托里奥·马泰奥·科科斯', 'Vittorio Matteo Corcos', 'huajia/xp37x3ym6e1n3nly.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9742, '维克多·瓦斯涅佐夫', 'Viktor Vasnetsov', 'huajia/eg0uwlyfpf2r4irp.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9743, '弗拉基米尔·库什', 'Vladimir Kush', 'huajia/gf9afumt4vkt0lmx.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9744, '万吉奇·穆图', 'Wangechi Mutu', 'huajia/19tzcguofhf7202l.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9745, '瓦西里·康定斯基', 'Wassily Kandinsky', 'huajia/h38a5wbhi3pxn016.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9746, '维托里奥·雷贾尼尼', 'Vittorio Reggianini', 'huajia/t6fm2i25ubp2cy1z.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9747, '沃尔特·西克特', 'Walter Sickert', 'huajia/9rsyzv73c1lxs7ir.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9748, '沃尔特·朗特·帕尔默', 'Walter Launt Palmer', 'huajia/x32tk12aqr7htjd7.png', 12, '2023-08-20 16:12:59', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9749, '韦恩·蒂博', 'Wayne Thiebaud', 'huajia/m3yit9027eiqufnj.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9750, '威廉·卡尔夫', 'Willem Kalf', 'huajia/l4i42oriqrye2zqy.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9751, '威廉敏娜·巴恩斯·格雷厄', 'Wilhelmina Barns-Graham', 'huajia/8e8tomhz09cxkt1d.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9752, '威拉德·梅特卡夫', 'Willard Metcalf', 'huajia/k6f7jo89l6r7yj4d.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9753, '威廉·哈恩雷茨', 'Willem Haenraets', 'huajia/srn90wbsrijj9gqh.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9754, '威廉·范·阿尔斯特', 'Willem van Aelst', 'huajia/1o7e1g95o4jl3lsf.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9755, '威廉·埃蒂', 'William Etty', 'huajia/la4fax1xkqdprqps.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9756, '威利·鲍迈斯特', 'Willi Baumeister', 'huajia/001o3n1jj7txn96o.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9757, '威廉·亨利·马格森', 'William Henry Margetson', 'huajia/vyrc0uqz2y25jqbm.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9758, '威廉·霍加斯', 'William Hogarth', 'huajia/l87twaeqr54n88xk.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9759, '威廉·戴斯', 'William Dyce', 'huajia/v4wuat1ek5zpvvq0.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9760, '威廉·尼科尔森', 'William Nicholson', 'huajia/ss96sli17xd7lr17.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9761, '威廉·拉塞尔·弗林特', 'William Russell Flint', 'huajia/q47bt6mmizvctfo5.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9762, '威廉·特罗斯特·理查兹', 'William Trost Richards', 'huajia/fogwa072j1cc3ytv.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9763, '威妮弗莱德·奈特斯', 'Winifred Knights', 'huajia/nywixxdrvkhhs3tp.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9764, '瓦德·萨夫罗诺', 'Wlad Safronow', 'huajia/gc159hq8jf1y4ve9.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9765, '威廉·奥克瑟', 'William Oxer', 'huajia/xvhwewxgwppr9n6p.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9766, '沃辛顿·惠特里奇', 'Worthington Whittredge', 'huajia/3d9pkj16dq9u8f97.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9767, '约安·洛塞尔', 'Yoann Lossel', 'huajia/udk4ctlkcsyg1qwn.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9768, '岳敏君', 'Yue Minjun', 'huajia/nb8ysojlh70otar4.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9769, '齐娜伊达·塞雷布里亚科娃', 'Zinaida Serebriakova', 'huajia/0bsel3p10rdbmrb8.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9770, '伊夫·克莱因', 'Yves Klein', 'huajia/686klzj2a456irho.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9771, '阿科斯·梅杰', 'Akos Major', 'sheyingshi/o6z54c5qexzewla2.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9772, '伊格尔·奥塞里', 'Yigal Ozeri', 'huajia/y3lyqojf3ezklcu9.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9773, '艾伦·夏勒', 'Alan Schaller', 'sheyingshi/orul0g0qybiz8hir.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9774, '张晓刚', 'Zhang Xiaogang', 'huajia/sj8adncfpamo3189.png', 12, '2023-08-20 16:12:58', '2023-12-28 13:54:21', 0, 'huajia', '');
INSERT INTO `df_robot_prompt` VALUES (9775, '亚历克·索斯', 'Alec Soth', 'sheyingshi/pt9kdrb051lafxgo.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9776, '亚历克斯·普拉格', 'Alex Prager', 'sheyingshi/c7guhmlwqzruyt8c.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9777, '阿拉斯泰尔·马纳尔多', 'Alastair Magnaldo', 'sheyingshi/vz6gegdlf2d8uuvq.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9778, '亚历山德拉·桑吉内蒂', 'Alessandra Sanguinetti', 'sheyingshi/gi9r51egd2r2u0jv.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9779, '亚历克斯·斯特罗尔', 'Alex Strohl', 'sheyingshi/9g6dw88q5dfz7owl.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9780, '艾伦·塞库拉', 'Allan Sekula', 'sheyingshi/rxzqdhhhex5h4hrt.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9781, '亚历克斯·韦伯', 'Alex Webb', 'sheyingshi/q5804rzwpno3kx3g.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9782, '安德烈亚斯·弗兰克', 'Andreas Franke', 'sheyingshi/9nzho3144qvwg10a.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9783, '阿尔弗雷德·艾森斯塔特', 'Alfred Eisenstaedt', 'sheyingshi/6jzexmqyc00torbp.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9784, '艾琳·史密森', 'Aline Smithson', 'sheyingshi/j6lwzsyev0sl5p1m.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9785, '安德烈·克泰斯', 'Andre Kertesz', 'sheyingshi/2a7slts3aptmhemp.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9786, '安德烈斯·塞拉诺', 'Andres Serrano', 'sheyingshi/een2tnxvi398ui3r.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9787, '阿诺德·纽曼', 'Arnold Newman', 'sheyingshi/kj1fvhc7o4d71ryi.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9788, '亚瑟·特雷斯', 'Arthur Tress', 'sheyingshi/scqariuszdxdacl3.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9789, '伯蒂尔·尼尔森', 'Bertil Nilsson', 'sheyingshi/b50anz7jzkbnanya.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9790, '安德烈亚斯·古尔斯基', 'Andreas Gursky', 'sheyingshi/dbldq1kz9xqvy379.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9791, '安德烈亚斯·莱弗斯', 'Andreas Levers', 'sheyingshi/po7s4eaoyqnfmuuq.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9792, '比尔·勃兰特', 'Bill Brandt', 'sheyingshi/a8exbvighdifv85h.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9793, '布鲁斯·吉尔登', 'Bruce Gilden', 'sheyingshi/c61sbshz64k4szq0.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9794, '卡米尔·维维尔', 'Camille Vivier', 'sheyingshi/guw5pc0ko37v5727.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9795, '比尔·德金', 'Bill Durgin', 'sheyingshi/0e1jamshxmw37w1c.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9796, '卡斯滕·迈耶迪克斯', 'Carsten Meyerdierks', 'sheyingshi/m3uj5hu843yi498g.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9797, '布雷特·沃克', 'Brett Walker', 'sheyingshi/xdnhc9rsebk1i4fd.png', 12, '2023-08-20 16:15:28', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9798, '卡尔克莱纳', 'Carl Kleiner', 'sheyingshi/2nxkfr189j8nkoec.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9799, '布鲁诺·巴贝', 'Bruno Barbey', 'sheyingshi/awz0c2j9oqyr7x79.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9800, '布鲁克·迪多纳托', 'Brooke DiDonato', 'sheyingshi/c4htnxnkt2tsrb27.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9801, '克里斯坎宁安', 'Chris Cunningham', 'sheyingshi/kjnuwwvllpk9ru63.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9802, '辛迪·谢尔曼', 'Cindy Sherman', 'sheyingshi/ooua3xboxdaqr5r0.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9803, '森山大道', 'Daido Moriyama', 'sheyingshi/wffkfog2gax501tp.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9804, '克里斯·伯卡德', 'Chris Burkard', 'sheyingshi/k4kbs1hwn3q2vkbh.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9805, '克里斯托弗·瑞安·麦肯尼', 'Christopher Ryan McKenney', 'sheyingshi/1vm15i52ker1zogw.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9806, '爱德华·伯廷斯基', 'Edward Burtynsky', 'sheyingshi/3pvo0d1nm8sdcw91.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9807, '艾德·弗里曼', 'Ed Freeman', 'sheyingshi/1hb3907exkg0b2vv.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9808, '大卫·伯登尼', 'David Burdeny', 'sheyingshi/6anzeg1ffar9yarz.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9809, '大卫·拉切贝尔', 'David LaChapelle', 'sheyingshi/bzpebgwuut9ba3hf.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9810, '伊丽莎白·加德', 'Elizabeth Gadd', 'sheyingshi/52ditquso86og95k.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9811, '恩斯特·哈斯', 'Ernst Haas', 'sheyingshi/3lcfkf0dbf42taiz.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9812, '艾尔莎·布莱达', 'Elsa Bleda', 'sheyingshi/yskixtq4ry4kxntb.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9813, '埃里克·马迪根·赫克', 'Erik Madigan Heck', 'sheyingshi/3fl7aw8czpxe4biu.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9814, '埃兹拉·斯托勒', 'Ezra Stoller', 'sheyingshi/3i8ctcbo3z3hwrst.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9815, '何帆', 'Fan Ho', 'sheyingshi/w4an0df7zvdko4jr.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9816, '欧文·布卢门菲尔德', 'Erwin Blumenfeld', 'sheyingshi/0oz08leow06v73u3.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9817, '费利西亚·西蒙', 'Felicia Simion', 'sheyingshi/vl8gy9vpjp95hhom.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9818, '埃琳娜·布拉瑟斯', 'Elina Brotherus', 'sheyingshi/cytim5uw1z0f0zja.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9819, '弗洛拉·博尔西', 'Flora Borsi', 'sheyingshi/lg0haycsa90cndeu.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9820, '弗兰克·霍瓦特', 'Frank Horvat', 'sheyingshi/aet2oncu5lr7rhiy.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9821, '菲利普·杜雅尔丁', 'Filip Dujardin', 'sheyingshi/d1199hwmsv5kuqfd.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9822, '弗兰斯·兰廷', 'Frans Lanting', 'sheyingshi/158nddsqm6zygv5e.png', 12, '2023-08-20 16:15:27', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9823, '弗里克·詹森斯', 'Frieke Janssens', 'sheyingshi/4v849bqwaxd8dd7t.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9824, '戈特弗里德·赫尔温', 'Gottfried Helnwein', 'sheyingshi/hz1fk9tgkw7f6i6v.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9825, '格雷戈里·克鲁森', 'Gregory Crewdson', 'sheyingshi/prcplr8eodyzqmn2.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9826, '盖伊·伯丁', 'Guy Bourdin', 'sheyingshi/pcvv9tlpo9bguimh.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9827, '哈罗德·埃哲顿', 'Harold Edgerton', 'sheyingshi/kt8wmvxzxohb6di4.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9828, '休·克莱奇默', 'Hugh Kretschmer', 'sheyingshi/ufqxpiypfnfx28r5.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9829, '杉本博司', 'Hiroshi Sugimoto', 'sheyingshi/q5vf1ntnfjcb0e3m.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9830, '加布里埃尔·维尔特尔', 'Gabriele Viertel', 'sheyingshi/osvol40f631hyywu.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9831, '因娜·莫西纳', 'Inna Mosina', 'sheyingshi/xmjzo01vjw4jdgvj.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9832, '伊万·班恩', 'Iwan Baan', 'sheyingshi/wecgb5y7uj2560cu.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9833, '乔尔·迈耶罗维茨', 'Joel Meyerowitz', 'sheyingshi/sz96i3j3d4imwk48.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9834, '朱莉·布莱克蒙', 'Julie Blackmon', 'sheyingshi/3otki2ljbw50r0yw.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9835, '凯伦·克诺尔', 'Karen Knorr', 'sheyingshi/1e6ucxydffk56sj4.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9836, '杰米霍克斯沃斯', 'Jamie Hawkesworth', 'sheyingshi/i119c6pqq9wt20ev.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9837, '洛朗·巴赫', 'Laurent Baheux', 'sheyingshi/7f9i3302lh8t5gie.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9838, '拉里·苏丹', 'Larry Sultan', 'sheyingshi/m9f1a630wwmd1c3i.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9839, '玛雅·弗洛尔', 'Maia Flore', 'sheyingshi/yyg0ytnshzejrsnw.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9840, '马尔辛·索巴斯', 'Marcin Sobas', 'sheyingshi/3f03jpsj0q8451cw.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9841, '利亚姆·黄', 'Liam Wong', 'sheyingshi/ziexzsnim5f4tsoa.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9842, '杰夫·沃尔', 'Jeff Wall', 'sheyingshi/nt6rmfvbj4u1bmg3.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9843, '曼迪·迪舍尔', 'Mandy Disher', 'sheyingshi/wmzmwx9umm08tst8.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9844, '玛丽莲·明特', 'Marilyn Minter', 'sheyingshi/rbjg9302k6tsiehw.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9845, '马丁·帕尔', 'Martin Parr', 'sheyingshi/hww3uagyyi0uh9db.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9846, '迈克尔·肯纳', 'Michael Kenna', 'sheyingshi/nnd0i7r34mn3e71u.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9847, '马丁·舍勒', 'Martin Schoeller', 'sheyingshi/2uk6fphd5ue209or.png', 12, '2023-08-20 16:15:26', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9848, '马蒂亚斯·荣格', 'Matthias Jung', 'sheyingshi/r0wzuns3rka41xym.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9849, '浅井美纪', 'Miki Asai', 'sheyingshi/3qla27jr2d9zqvtq.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9850, '迈克尔·谢恩布卢姆', 'Michael Shainblum', 'sheyingshi/o57egg9dtzwzv7yb.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9851, '迈尔斯·奥尔德里奇', 'Miles Aldridge', 'sheyingshi/qjw72k45k2q5s30a.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9852, '迈克尔·韦斯利', 'Michael Wesely', 'sheyingshi/j5so4hkszg6al3zc.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9853, '莫妮娅·梅洛', 'Monia Merlo', 'sheyingshi/e6xj8u4guobi7mke.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9854, '纳达夫·坎德', 'Nadav Kander', 'sheyingshi/70mgzscryf0c6wf2.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9855, '尼古拉斯·休斯', 'Nicholas Hughes', 'sheyingshi/hngzzylv1p4u2981.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9856, '奥列格·奥普里斯科', 'Oleg Oprisco', 'sheyingshi/nu4cqds6mhbj5iw5.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9857, '尼克·奈特', 'Nick Knight', 'sheyingshi/iae9u0kk0ewljdg8.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9858, '米莎·戈丁', 'Misha Gordin', 'sheyingshi/iii6xy7v9og35x46.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9859, '奥利维尔·瓦尔塞基', 'Olivier Valsecchi', 'sheyingshi/j8yl74c1hkn35cia.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9860, '奥利维亚·洛彻', 'Olivia Locher', 'sheyingshi/1j9yoz1akjc70bj0.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9861, '保罗·富斯科', 'Paul Fusco', 'sheyingshi/wmcotg5k4wxk1nnq.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9862, '帕蒂·马赫', 'Patty Maher', 'sheyingshi/k2knc8iwi3xvi1hb.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9863, '佩特拉·柯林斯', 'Petra Collins', 'sheyingshi/fyuaog258pqiw84l.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9864, '皮埃尔和吉尔斯', 'Pierre et Gilles', 'sheyingshi/qpf69hmyeul1h0et.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9865, '保罗·齐兹卡', 'Paul Zizka', 'sheyingshi/3meqxszwj20s34eh.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9866, '任航', 'Ren Hang', 'sheyingshi/xihxlrlolp7ccj0u.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9867, '理查德·米斯拉奇', 'Richard Misrach', 'sheyingshi/52hg3qg3yzo1l68m.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9868, '雷切尔·麦克莱恩', 'Rachel Maclean', 'sheyingshi/fplepdykyrqpa3dj.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9869, '桑迪·斯科格伦德', 'Sandy Skoglund', 'sheyingshi/353k0ub79w6v4t7p.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9870, '斯嘉丽·霍夫特·格拉夫兰', 'Scarlett Hooft Graafland', 'sheyingshi/2z8tnar0jc4nfvhv.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9871, '斯宾塞·图尼克', 'Spencer Tunick', 'sheyingshi/9knxffz600qbi6ah.png', 12, '2023-08-20 16:15:25', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9872, '泰勒·希尔兹', 'Tyler Shields', 'sheyingshi/3qnn955a12yyldob.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9873, '萨莎·戈德伯格', 'Sacha Goldberger', 'sheyingshi/egs8bim0hb4eirc4.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9874, '维罗妮卡·平克', 'Veronika Pinke', 'sheyingshi/gmw6p6x083u54ick.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9875, '威廉·埃格尔斯顿', 'William Eggleston', 'sheyingshi/tk1xoy6mcfmlfwyx.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9876, '蒂姆·沃克', 'Tim Walker', 'sheyingshi/ktdjybvu6ni8v823.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9877, '张静娜', 'Zhang Jingna', 'sheyingshi/ye1fim6p212mu7tj.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9878, '威廉韦格曼', 'William Wegman', 'sheyingshi/m4q041woltxdoghz.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9879, '艾丽莎·拉泽尔', 'Aliza Razell', 'sheyingshi/9nvfn0o2d7olwn7u.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9880, '泽娜·霍洛威', 'Zena Holloway', 'sheyingshi/r6zz6qduhs80xg1r.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9881, '维克多·恩里奇', 'Victor Enrich', 'sheyingshi/sze8o8omeis01lsl.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9882, '阿尔伯特·沃森', 'Albert Watson', 'sheyingshi/m67tttt1xx4rir3c.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9883, '安塞尔·亚当斯', 'Ansel Adams', 'sheyingshi/swk35h6k50k8pjsx.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9884, '扎内尔·穆霍利', 'Zanele Muholi', 'sheyingshi/bds6ogl9s1mctb8d.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9885, '安妮·格迪斯', 'Anne Geddes', 'sheyingshi/2jnaiccubm7siji3.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9886, '伯特·斯特恩', 'Bert Stern', 'sheyingshi/9yprm07r9zugmm4f.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9887, '安塔纳斯·苏库斯', 'Antanas Sutkus', 'sheyingshi/03bdc2kn2fexihzx.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9888, '娜塔莉亚·德雷皮娜', 'Natalia Drepina', 'sheyingshi/12fjc4l9lnaa1tsq.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9889, '乔恩·米利', 'Gjon Mili', 'sheyingshi/79dc1aj1ab7v8c5n.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9890, '内勒克·彼得斯', 'Nelleke Pieters', 'sheyingshi/uwi5ppjfldyjwk8e.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9891, '橄榄棉', 'Olive Cotton', 'sheyingshi/gz41lc6pnilo7x9s.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9892, '尼克·维西', 'Nick Veasey', 'sheyingshi/hvrc7tppo5loegkf.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9893, '保罗·巴森', 'Paul Barson', 'sheyingshi/2dwolpdkx92043n9.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9894, '阿道夫·法斯宾德', 'Adolf Fassbender', 'sheyingshi/gef5k17x0y5eymw1.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9895, '亚伦·西斯金德', 'Aaron Siskind', 'sheyingshi/gka1gel6ux3qglm8.png', 12, '2023-08-20 16:15:24', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9896, '阿德里安·多诺霍', 'Adrian Donoghue', 'sheyingshi/z2ex3835nb2wos5j.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9897, '阿拉斯代尔·麦克莱伦', 'Alasdair McLellan', 'sheyingshi/6xo2gapa6ntcbtea.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9898, '阿韦拉多·莫雷尔', 'Abelardo Morell', 'sheyingshi/psbusmkrxa9xf59z.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9899, '阿兰·拉博伊尔', 'Alain Laboile', 'sheyingshi/al3iepquzzcq3pml.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9900, '亚历克斯·豪伊特', 'Alex Howitt', 'sheyingshi/b9tdy4makl70ba3h.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9901, '亚历克斯·蒂默曼斯', 'Alex Timmermans', 'sheyingshi/isof8qad405d48qs.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9902, '阿尔弗雷德·切尼·约翰斯', 'Alfred Cheney Johnston', 'sheyingshi/6rn8nxrpv4ycsxy6.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9903, '阿尔伯特·伦格-帕茨奇', 'Albert Renger-Patzsch', 'sheyingshi/j37mujs0lr20da7a.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9904, '阿莱西奥·阿尔比', 'Alessio Albi', 'sheyingshi/ozboi421xcr3zwdv.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9905, '安藤·福克斯', 'Ando Fuchs', 'sheyingshi/f0e8f2x3yizdzqk2.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9906, '安德斯·彼得森', 'Anders Petersen', 'sheyingshi/bgkqqzihj7u5n37d.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9907, '安德烈·德·迪内斯', 'Andre de Dienes', 'sheyingshi/k1fty55rdqmxa54i.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9908, '阿尔文·兰登·科伯恩', 'Alvin Langdon Coburn', 'sheyingshi/5m6lp0jm6rah6lg4.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9909, '阿尔弗雷德·施蒂格利茨', 'Alfred Stieglitz', 'sheyingshi/45rtc06qt3aigqf3.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9910, '安德烈亚斯·费宁格', 'Andreas Feininger', 'sheyingshi/3c82w1nkgo1afl95.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9911, '安格斯·麦克比恩', 'Angus McBean', 'sheyingshi/ctwpf2fe581jrmq4.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9912, '安卡·朱拉夫莱娃', 'Anka Zhuravleva', 'sheyingshi/l4ct1sti26ves33v.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9913, '安妮莱博维茨', 'Annie Leibovitz', 'sheyingshi/g784eh5ygqv1apmz.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9914, '安东·科尔宾', 'Anton Corbijn', 'sheyingshi/fhfoizlyzy6yem3t.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9915, '亚瑟·埃尔格特', 'Arthur Elgort', 'sheyingshi/v55d5ry3mgjobppl.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9916, '阿拉古勒', 'Ara Guler', 'sheyingshi/s0vtpvsdcxc6dlwf.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9917, '奥古斯特·桑德', 'August Sander', 'sheyingshi/sa7t29eq1cto80en.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9918, '安妮·布里格曼', 'Anne Brigman', 'sheyingshi/4s2iwq30v0df9r6j.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9919, '贝拉·科塔克', 'Bella Kotak', 'sheyingshi/f0ss68l5hk3lx1g7.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9920, '贝热尼丝·阿博特', 'Berenice Abbott', 'sheyingshi/hm0ah67mogpr4vhl.png', 12, '2023-08-20 16:15:23', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9921, '贝丝·哈米蒂', 'Bess Hamiti', 'sheyingshi/z6ziisclwqn7xlzt.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9922, '伯特·哈迪', 'Bert Hardy', 'sheyingshi/n6czjwgunvjfpnh9.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9923, '比尔·吉卡斯', 'Bill Gekas', 'sheyingshi/dv9jeto2x007blx6.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9924, '布鲁克·沙登', 'Brooke Shaden', 'sheyingshi/z95j3fch10a5puyd.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9925, '比尔·汉森', 'Bill Henson', 'sheyingshi/9x1zvhzcm2rn1i22.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9926, '贝蒂娜·兰斯', 'Bettina Rheims', 'sheyingshi/f9fhrfc0ppa1rd40.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9927, '布兰登·沃尔费尔', 'Brandon Woelfel', 'sheyingshi/2iz8nlee8a999n12.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9928, '卡尔顿沃特金斯', 'Carleton Watkins', 'sheyingshi/915wv21jby8dr8rd.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9929, '布鲁斯·韦伯', 'Bruce Weber', 'sheyingshi/mn3w907ivhi1fmfn.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9930, '伯特·格林', 'Burt Glinn', 'sheyingshi/4gfhccdh0h8jx6rx.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9931, '布鲁斯·戴维森', 'Bruce Davidson', 'sheyingshi/5x9z157vcxaz3xko.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9932, '凯莉·梅·威姆斯', 'Carrie Mae Weems', 'sheyingshi/sw4ovhytn6k98z9e.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9933, '切玛·马多兹', 'Chema Madoz', 'sheyingshi/ygl1aqczq5rf3h02.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9934, '兔子·耶格尔', 'Bunny Yeager', 'sheyingshi/o3w7q7djia1yt4fl.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9935, '切斯特·希金斯', 'Chester Higgins', 'sheyingshi/1wkmdnuieqddg1wf.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9936, '克劳德·卡洪', 'Claude Cahun', 'sheyingshi/6nxbrf6pv8szwdiz.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9937, '科利尔·肖尔', 'Collier Schorr', 'sheyingshi/mk3fmfxr2094upct.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9938, '大卫·贝利', 'David Bailey', 'sheyingshi/ewbxpt1vefupon5s.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9939, '达乌德·贝伊', 'Dawoud Bey', 'sheyingshi/j8535qn5pkbq1cx6.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9940, '丹尼·里昂', 'Danny Lyon', 'sheyingshi/6o6vv8fljpajmyzj.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9941, '克里斯·弗里尔', 'Chris Friel', 'sheyingshi/7vzlifdj5jzefycj.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9942, '德克·布莱克曼', 'Dirk Braeckman', 'sheyingshi/vfbpou4kks2mp2lh.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9943, '黛安·阿勃丝', 'Diane Arbus', 'sheyingshi/bf1flrfhelz8jcgo.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9944, '唐·麦库林', 'Don McCullin', 'sheyingshi/sa1adrrcdpczoelx.png', 12, '2023-08-20 16:15:22', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9945, '克里斯托夫·雅克罗', 'Christophe Jacrot', 'sheyingshi/m7ka91wdqeh4jvxs.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9946, '达亚尼塔·辛格', 'Dayanita Singh', 'sheyingshi/9msdkd3aamr2621z.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9947, '多拉·玛尔', 'Dora Maar', 'sheyingshi/9n4ruafkx44safhs.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9948, '杜安·迈克尔斯', 'Duane Michals', 'sheyingshi/3o48kdnxk2h9w1ad.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9949, '埃德沃德·迈布里奇', 'Eadweard Muybridge', 'sheyingshi/wyiscsxtfkswiyye.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9950, '吉加·维尔托夫', 'Dziga Vertov', 'sheyingshi/pxt9u8qyq6b7zjbl.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9951, '多萝西娅·兰格', 'Dorothea Lange', 'sheyingshi/m5ldpbt7cbe5w22o.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9952, '爱德华·斯泰肯', 'Edward Steichen', 'sheyingshi/kixeb4dzw40608dl.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9953, 'Edward S. Cu', '', 'sheyingshi/giyxe5iq7kbf61co.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9954, '爱德华·拉斯查', 'Edward Ruscha', 'sheyingshi/er5yfyxqyii1de6m.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9955, '爱德华·柯蒂斯', 'Edward Curtis', 'sheyingshi/7pdwfizezcdaa7yu.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9956, '爱德华·韦斯顿', 'Edward Weston', 'sheyingshi/ndas9guw1ebpmmi6.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9957, '埃利奥特·厄维特', 'Elliott Erwitt', 'sheyingshi/jo0n2vgb7io090ng.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9958, '埃伦·冯·翁沃斯', 'Ellen von Unwerth', 'sheyingshi/ny8t8tly0m3an2o2.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9959, '欧文·奥拉夫', 'Erwin Olaf', 'sheyingshi/aom9tpqjaa1tpc6j.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9960, '尤金尼奥·雷库恩科', 'Eugenio Recuenco', 'sheyingshi/xyta09hl3o0fbw4e.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9961, '艾蒂安-朱尔斯·马雷', 'Etienne-Jules Marey', 'sheyingshi/oeczl7uojrb7wvoq.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9962, '弗里茨·亨利', 'Fritz Henle', 'sheyingshi/pzdabjpcya9rm8ik.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9963, '乔治·赫勒尔', 'George Hurrell', 'sheyingshi/zltc2tnrqz9c4sgi.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9964, '格尔达·塔罗', 'Gerda Taro', 'sheyingshi/zek4x9abdsu5ti1e.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9965, '弗朗西斯卡·伍德曼', 'Francesca Woodman', 'sheyingshi/o9q1ly7aq19j1gc2.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9966, '费伊·戈德温', 'Fay Godwin', 'sheyingshi/rlld6alvouvrhqmp.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9967, '埃米特·高文', 'Emmet Gowin', 'sheyingshi/uhmd4ktzcfhoelbz.png', 12, '2023-08-20 16:15:21', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9968, '杰夫·科恩', 'Geof Kern', 'sheyingshi/r6ffsbddvkrgd6nx.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9969, '格拉谢拉·伊图尔维德', 'Graciela Iturbide', 'sheyingshi/8wqoisdp57pl1k6m.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9970, '加里·温诺格兰德', 'Garry Winogrand', 'sheyingshi/vfsixcmzbaic27ts.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9971, '格雷戈里·科尔伯特', 'Gregory Colbert', 'sheyingshi/bmlkqcsflmdodx8b.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9972, '汉斯·贝尔默', 'Hans Bellmer', 'sheyingshi/8qruf1s86aljmzyl.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9973, '盖·阿罗克', 'Guy Aroch', 'sheyingshi/t5084e1rfbz3nweq.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9974, '戈登帕克斯', 'Gordon Parks', 'sheyingshi/ajdhkc33agkiu79c.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9975, '哈里·卡拉汉', 'Harry Callahan', 'sheyingshi/bgb8juytgrvgdiac.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9976, '赫尔穆特·牛顿', 'Helmut Newton', 'sheyingshi/81au0gr541ahcjf8.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9977, '海伦·莱维特', 'Helen Levitt', 'sheyingshi/o5wq0dvfxzypqotc.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9978, '赫伯·里茨', 'Herb Ritts', 'sheyingshi/n636xuvcwq63dq5e.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9979, '亨利·卡蒂埃·布列松', 'Henri Cartier-Bresson', 'sheyingshi/je1jwgiq0h01q15s.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9980, '格特鲁德·卡塞比尔', 'Gertrude Kasebier', 'sheyingshi/eji3qcpuxlb8ct66.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9981, '赫伯特·李斯特', 'Herbert List', 'sheyingshi/07hyovha9ptjtv3f.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9982, '伊尔斯·宾', 'Ilse Bing', 'sheyingshi/3p0imwfpskblxytb.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9983, '伊莫金·坎宁安', 'Imogen Cunningham', 'sheyingshi/2ia8807zwk8r17f6.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9984, '杰克·斯宾塞', 'Jack Spencer', 'sheyingshi/3s4pldhh05aqce48.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9985, '欧文·佩恩', 'Irving Penn', 'sheyingshi/38hu2lxglm0kyd12.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9986, '艾萨克·科达尔', 'Isaac Cordal', 'sheyingshi/onaxnxskvzphosi7.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9987, '詹姆斯·纳奇威', 'James Nachtwey', 'sheyingshi/bpbvpidagmk1v0uk.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9988, '雅克·亨利·拉蒂格', 'Jacques Henri Lartigue', 'sheyingshi/wx2zhd2z0piyz3cb.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9989, '扬·绍德克', 'Jan Saudek', 'sheyingshi/7ibpkoe2l9gg4b26.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9990, '詹姆斯·巴洛格', 'James Balog', 'sheyingshi/x1lzs8ao2f4nxqg6.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9991, '贾内克·塞德拉', 'Janek Sedlar', 'sheyingshi/w49chs3ti56tji6r.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9992, '詹姆斯·范德泽', 'James Van Der Zee', 'sheyingshi/wwyji6kcfqfs54kl.png', 12, '2023-08-20 16:15:20', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9993, '杰米·鲍德里奇', 'Jamie Baldridge', 'sheyingshi/ed1nf9l54ml54evh.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9994, '乔尔·彼得·威特金', 'Joel-Peter Witkin', 'sheyingshi/0euvesu3d0i6lgq8.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9995, '约瑟夫·考德尔卡', 'Josef Koudelka', 'sheyingshi/7tf303akx2peidrf.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9996, '约瑟夫·苏德克', 'Josef Sudek', 'sheyingshi/v6ne5fkvfbhn909k.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9997, '杰里·尤尔斯曼', 'Jerry Uelsmann', 'sheyingshi/hw0c1votl8d4jsbi.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9998, '朱利叶斯·舒尔曼', 'Julius Shulman', 'sheyingshi/k228pfnipuqqiduy.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (9999, '卡尔·布洛斯费尔特', 'Karl Blossfeldt', 'sheyingshi/g95hg5okimniqntb.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10000, '卡蒂亚·乔舍瓦', 'Katia Chausheva', 'sheyingshi/94ox0oyek0hkj90g.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10001, '基斯谢勒', 'Kees Scherer', 'sheyingshi/ex13tpq2hpmxmk13.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10002, '基思·卡特', 'Keith Carter', 'sheyingshi/e1fc43t0hvp4pg6h.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10003, '朱莉娅·玛格丽特·卡梅伦', 'Julia Margaret Cameron', 'sheyingshi/phallm81ud6riajv.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10004, '拉里·克拉克', 'Larry Clark', 'sheyingshi/mo1ordq9dldxrzp1.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10005, '李·米勒', 'Lee Miller', 'sheyingshi/190iwsyo9hkeuriw.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10006, '劳尔·阿尔宾·吉洛特', 'Laure Albin Guillot', 'sheyingshi/jfglpk9a4wpo4szo.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10007, '曼·雷', 'Man Ray', 'sheyingshi/4zf12bbi2zx4knxc.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10008, '拉里·芬克', 'Larry Fink', 'sheyingshi/mm0s0ng9hi1pikn0.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10009, '马克·拉格朗日', 'Marc Lagrange', 'sheyingshi/gdga7jq5tgqsiuae.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10010, '马里奥·贾科梅利', 'Mario Giacomelli', 'sheyingshi/64idjauzwoxmll3q.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10011, '刘易斯·海因', 'Lewis Hine', 'sheyingshi/qivh1orw6ho5x363.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10012, '马利克·西迪贝', 'Malick Sidibe', 'sheyingshi/szytb545sglhoban.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10013, '马克·塞利格', 'Mark Seliger', 'sheyingshi/bnns72cdtdcqtny9.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10014, '玛丽安娜·罗森', 'Marianna Rothen', 'sheyingshi/2l0vredh0lxfvlwh.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10015, '玛丽安·布雷斯劳尔', 'Marianne Breslauer', 'sheyingshi/f360q0e7wuu5hydk.png', 12, '2023-08-20 16:15:19', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10016, '马克·斯坦梅茨', 'Mark Steinmetz', 'sheyingshi/7sbwx864andzghg4.png', 12, '2023-08-20 16:15:18', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10017, '马丁·斯特兰卡', 'Martin Stranka', 'sheyingshi/abbxs0v5kwa1rpnd.png', 12, '2023-08-20 16:15:18', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10018, '玛尔塔·贝瓦夸', 'Marta Bevacqua', 'sheyingshi/egxrvqoj9i0jrobq.png', 12, '2023-08-20 16:15:18', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10019, '马丁·弗兰克', 'Martine Franck', 'sheyingshi/j6v84oingohozfpv.png', 12, '2023-08-20 16:15:18', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10020, '马丁·拉克', 'Martin Rak', 'sheyingshi/lplt74ha9a40b458.png', 12, '2023-08-20 16:15:18', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10021, '马修·布雷迪', 'Mathew Brady', 'sheyingshi/veaaaocfgtx9xn59.png', 12, '2023-08-20 16:15:18', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10022, '玛丽·艾伦·马克', 'Mary Ellen Mark', 'sheyingshi/gxp8q8ulcnvxtydt.png', 12, '2023-08-20 16:15:18', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10023, '玛莎·罗斯勒', 'Martha Rosler', 'sheyingshi/kexagh3i7v06rywy.png', 12, '2023-08-20 16:15:18', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10024, '马克斯·杜潘', 'Max Dupain', 'sheyingshi/bvn6gi3al63284em.png', 12, '2023-08-20 16:15:18', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10025, '米尔顿·H·格林', 'Milton H. Greene', 'sheyingshi/4catmvuqbhsrsk6m.png', 12, '2023-08-20 16:15:18', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10026, '莫里斯·塔巴德', 'Maurice Tabard', 'sheyingshi/x38w26bbb7e9zonh.png', 12, '2023-08-20 16:15:18', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10027, '米科·拉格斯泰特', 'Mikko Lagerstedt', 'sheyingshi/djnv139jrtphts6n.png', 12, '2023-08-20 16:15:18', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10028, '内森·沃斯', 'Nathan Wirth', 'sheyingshi/26kgbg9tvqcx5n6g.png', 12, '2023-08-20 16:15:18', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10029, '米罗斯拉夫·蒂奇', 'Miroslav Tichy', 'sheyingshi/wsz231xonypqfnoi.png', 12, '2023-08-20 16:15:18', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10030, '纳达尔', 'Nadar', 'sheyingshi/40e9dtwxvyykbn9n.png', 12, '2023-08-20 16:15:18', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10031, '内尔·多尔', 'Nell Dorr', 'sheyingshi/02517qom9vdpmonm.png', 12, '2023-08-20 16:15:18', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10032, '马特·莫洛伊', 'Matt Molloy', 'sheyingshi/8q3abxzwgrkxrf6j.png', 12, '2023-08-20 16:15:17', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10033, '保罗·罗维西', 'Paolo Roversi', 'sheyingshi/fz2vuhu5ow73k0jr.png', 12, '2023-08-20 16:15:17', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10034, '帕特里克·德马舍利尔', 'Patrick Demarchelier', 'sheyingshi/brfy3axbrko13tgk.png', 12, '2023-08-20 16:15:17', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10035, '荒木经惟', 'Nobuyoshi Araki', 'sheyingshi/n1kaa6yp18whxznu.png', 12, '2023-08-20 16:15:17', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10036, '南戈尔丁', 'Nan Goldin', 'sheyingshi/bp8cssptznt9boka.png', 12, '2023-08-20 16:15:17', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10037, '彼得·林德伯格', 'Peter Lindbergh', 'sheyingshi/aewvo96onsh72a9o.png', 12, '2023-08-20 16:15:17', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10038, '保罗·佩莱格林', 'Paolo Pellegrin', 'sheyingshi/wr9xl7o4ysl5zyf8.png', 12, '2023-08-20 16:15:17', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10039, '柏拉图', 'Platon', 'sheyingshi/i5e0l11s00yt00x7.png', 12, '2023-08-20 16:15:17', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10040, '雷·柯林斯', 'Ray Collins', 'sheyingshi/lbygr2d5bticg82o.png', 12, '2023-08-20 16:15:17', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10041, '菲利普·哈尔斯曼', 'Philippe Halsman', 'sheyingshi/jxvo1zkb6yrmf6k9.png', 12, '2023-08-20 16:15:17', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10042, '理查德·阿维顿', 'Richard Avedon', 'sheyingshi/fm2u2aopel0dgla8.png', 12, '2023-08-20 16:15:17', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10043, '罗比·卡瓦诺', 'Robby Cavanaugh', 'sheyingshi/ibljf7gu65455jcf.png', 12, '2023-08-20 16:15:17', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10044, '拉尔夫·尤金·肉亚德', 'Ralph Eugene Meatyard', 'sheyingshi/l2tci7wkn6xplhkn.png', 12, '2023-08-20 16:15:17', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10045, '雷·梅茨克', 'Ray Metzker', 'sheyingshi/avriljjz7hxnf5hz.png', 12, '2023-08-20 16:15:17', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10046, '罗伯特·卡帕', 'Robert Capa', 'sheyingshi/9lv8e4lim1r3b7db.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10047, '莎莉·曼', 'Sally Mann', 'sheyingshi/3611vfokm9sljzky.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10048, '理查德·科恩', 'Richard Kern', 'sheyingshi/7gwmaz9h3ruzddua.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10049, '莎拉·穆恩', 'Sarah Moon', 'sheyingshi/qzd8jfdbh8ojpz88.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10050, '罗德尼·史密斯', 'Rodney Smith', 'sheyingshi/dgcwllzh98f1xcrw.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10051, '罗杰·拜伦', 'Roger Ballen', 'sheyingshi/3xv0aqmq2pw7fzuq.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10052, '罗伯特·梅普尔索普', 'Robert Mapplethorpe', 'sheyingshi/xj12dzb38lqatzj0.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10053, '塞巴斯蒂奥·萨尔加多', 'Sebastiao Salgado', 'sheyingshi/gz0sc3mxu2a0edqr.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10054, '斯蒂芬·肖尔', 'Stephen Shore', 'sheyingshi/o0v5dvc8ysgn3gqk.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10055, '史蒂文·克莱因', 'Steven Klein', 'sheyingshi/nze0butkutczqq1j.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10056, '肖恩·海因里希斯', 'Shawn Heinrichs', 'sheyingshi/1ztwp4t98123fq4p.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10057, 'TJ德赖斯代尔', 'TJ Drysdale', 'sheyingshi/jcnz2oi3vunzj4cx.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10058, '托尼·弗里塞尔', 'Toni Frissell', 'sheyingshi/4n1wba0qv7556408.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10059, '塔米·博恩', 'Tami Bone', 'sheyingshi/ge8n0z9y09j8ldpq.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10060, '维克·穆尼兹', 'Vik Muniz', 'sheyingshi/n4bgzltlf6v6tmfr.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10061, '万利·伯克', 'Vanley Burke', 'sheyingshi/z6m7b6axwla1flhw.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10062, '蒂姆·弗拉赫', 'Tim Flach', 'sheyingshi/bkesr0vmuzs1l26s.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10063, '维吉', 'Weegee', 'sheyingshi/wgbtu8wwaaxq9yil.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10064, 'W·尤金·史密斯', 'W. Eugene Smith', 'sheyingshi/7abkjjn4witp7bgd.png', 12, '2023-08-20 16:15:16', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10065, '威廉·克莱因', 'William Klein', 'sheyingshi/phfir7m55nd3knek.png', 12, '2023-08-20 16:15:15', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10066, '卡梅隆', 'James Cameron', 'daoyan/id2ht8oyksl28475.png', 12, '2023-08-20 16:16:15', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10067, '维维安·迈尔', 'Vivian Maier', 'sheyingshi/ap1pd7d65pl2g1wo.png', 12, '2023-08-20 16:15:15', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10068, '沃克·埃文斯', 'Walker Evans', 'sheyingshi/b3hai09hw10bikvj.png', 12, '2023-08-20 16:15:15', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10069, '吕克贝松', 'Luc Besson', 'daoyan/ygo6c4xfihen2s4j.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10070, '佐杜洛夫斯基', 'Alejandro Jodorowsky', 'daoyan/gwtgkobz4qbro3de.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10071, '吴宇森', 'John Woo', 'daoyan/zosgadra8vwo0g58.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10072, '沃尔夫冈·苏希茨基', 'Wolfgang Suschitzky', 'sheyingshi/65gtyzm0x8dtqw8r.png', 12, '2023-08-20 16:15:15', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10073, '塔西姆辛', 'Tarsem Singh', 'daoyan/s6gqtpzc46rksmo4.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10074, '大卫林奇', 'David Lynch', 'daoyan/9re9t3rfgku852w0.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10075, '奈特沙马兰', 'M. Night Shyamalan', 'daoyan/u9vwb7ghhc0d368s.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10076, '尼尔森', 'Bertil Nilsson', 'daoyan/c9iylpsz4f09pak8.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10077, '库布里克', 'Stanley Kubrick', 'daoyan/v3nqw80hph3ur2ru.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10078, '库斯图里察', 'Emir Kusturica', 'daoyan/sdeqtflsxuoddhmc.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10079, '张克春', 'Zhang Kechun', 'sheyingshi/krcxw8xfyktiry39.png', 12, '2023-08-20 16:15:15', '2023-12-28 13:54:21', 0, 'sheyingshi', '');
INSERT INTO `df_robot_prompt` VALUES (10080, '斯图尔特', 'Robert Stromberg', 'daoyan/xjwf3z2xna2v95sj.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10081, '德尔托罗', 'Guillermo del Toro', 'daoyan/zozbi4mtb7b6ina2.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10082, '林克莱特', 'Richard Linklater', 'daoyan/uvdlq7ce3x3xzo02.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10083, '朴赞郁', 'Park Chan-wook', 'daoyan/z4cr656l7mmjd137.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10084, '明格拉', 'Anthony Minghella', 'daoyan/38olj91qvc9mh3qc.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10085, '爱德华诺顿', 'Edward Norton', 'daoyan/csr3ftbv13i0s19c.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10086, '法米克詹森', 'Maia Flore Frieke Janssens', 'daoyan/tdbqcgbb3hhwdegz.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10087, '科波拉', 'Sofia Coppola', 'daoyan/lpgkk5bhm2de5bsi.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10088, '皮埃尔热内', 'Jean-Pierre Jeunet', 'daoyan/7ow5ztfpbi9usk3y.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10089, '米歇尔冈瑞', 'Michel Gondry', 'daoyan/q8ee9d0zvstgf2jj.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10090, '约翰逊', 'Rian Johnson', 'daoyan/kkfr9i4y8dmkn4o4.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10091, '罗德里格兹', 'Robert Rodriguez', 'daoyan/654nkd7kbpodbx08.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10092, '维伦纽瓦', 'Denis Villeneuve', 'daoyan/m5yfuxk9rh2faw5j.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10093, '莱恩约翰逊', 'Rian Johnson', 'daoyan/6582azy1lafe4wkt.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10094, '范安森', 'Derek Vanlint', 'daoyan/hd7qu6ut324cx3i9.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10095, '迪多纳托', 'Brooke DiDonato', 'daoyan/7y1ouv3hw9qne52t.png', 12, '2023-08-20 16:16:14', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10096, '诺兰', 'Christopher Nolan', 'daoyan/kbtm5va9tdq4bh75.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10097, '亚历杭德罗·佐杜洛夫斯基', 'Alejandro Jodorowsky', 'daoyan/zhffrbtprl0q24zx.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10098, '阿尔弗雷德·希区柯克', 'Alfred Hitchcock', 'daoyan/jr6yfflk7l6j3cke.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10099, '黑泽明', 'Akira Kurosawa', 'daoyan/1slgyjfsqb7s69ng.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10100, '安德烈·塔可夫斯基', 'Andrei Tarkovsky', 'daoyan/hm5euypcyd72e7gg.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10101, '卡尔·西奥多·德雷尔', 'Carl Theodor Dreyer', 'daoyan/bdvwsj478e2zde7p.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10102, '奉俊昊', 'Bong Joon Ho', 'daoyan/6ldzm7mlsh656612.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10103, '布拉德福德·杨', 'Bradford Young', 'daoyan/6uzr8e9a49s4gtya.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10104, '布赖恩·德·帕尔马', 'Brian De Palma', 'daoyan/sl92spsm40clcs83.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10105, '达里奥·阿基多', 'Dario Argento', 'daoyan/o1z3n66wl6qgbnqe.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10106, '克林特·伊斯特伍德', 'Clint Eastwood', 'daoyan/b3v9df02pm8ytivr.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10107, '克里斯托弗·诺兰', 'Christopher Nolan', 'daoyan/k0ytnk3nkzp4jgqi.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10108, '查理·卓别林', 'Charlie Chaplin', 'daoyan/rtqxvtcaz0kzg5vj.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10109, '丹尼斯·维伦纽夫', 'Denis Villeneuve', 'daoyan/bjmxr7txbo72bxmr.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10110, '艾德·伍德', 'Ed Wood', 'daoyan/9f03tvac77w2i7ae.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10111, '埃默里克·普雷斯伯格', 'Emeric Pressburger', 'daoyan/lzykgqpc9ywey792.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10112, '达伦·阿罗诺夫斯基', 'Darren Aronofsky', 'daoyan/v74xo7c6xrh34wb8.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10113, 'David Finche', '', 'daoyan/8b4kuerybbegtdys.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10114, '大卫·林奇', 'David Lynch', 'daoyan/y4dlccfzv1viy076.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10115, '穆尔瑙前锋', 'F.W. Murnau', 'daoyan/9b24s3uvinlu917a.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10116, '费德里科·费里尼', 'Federico Fellini', 'daoyan/ig47lefeu1sbg5vk.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10117, '伊曼纽尔·卢贝兹基', 'Emmanuel Lubezki', 'daoyan/o60isfj65875cguv.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10118, '弗里茨·朗', 'Fritz Lang', 'daoyan/th47obdy4ocoese2.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10119, '吉列尔莫·德尔·托罗', 'Guillermo del Toro', 'daoyan/a1qwixwxvuthjg9n.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10120, '乔治·米勒', 'George Miller', 'daoyan/iba1fd8ckafj5s73.png', 12, '2023-08-20 16:16:13', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10121, '乔治·卢卡斯', 'George Lucas', 'daoyan/plgnbwmx71ler64j.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10122, '弗朗西斯·福特·科波拉', 'Francis Ford Coppola', 'daoyan/z0k60gv73p7tf7uk.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10123, '扬·斯万克梅杰', 'Jan Svankmajer', 'daoyan/kxgfxgoruh8brayz.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10124, '詹姆斯·比德古德', 'James Bidgood', 'daoyan/xke9e2rtg1wapc7u.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10125, '让·谷克托', 'Jean Cocteau', 'daoyan/uopcr648uuaa7puc.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10126, '英格玛·伯格曼', 'Ingmar Bergman', 'daoyan/rpyr34648c873kve.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10127, '盖·里奇', 'Guy Ritchie', 'daoyan/vlqvlxdlhp9tjefd.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10128, '约翰·福特', 'John Ford', 'daoyan/m01kd7vxm51m6266.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10129, '杜琪峰', 'Johnnie To', 'daoyan/lfoag0vkyh6x3d4f.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10130, '吉姆·汉森', 'Jim Henson', 'daoyan/y5pl7uh55bu9tx39.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10131, '约翰·卡索维茨', 'John Cassavetes', 'daoyan/dzzjemz8rn4x4ii4.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10132, '让-吕克·戈达尔', 'Jean-Luc Godard', 'daoyan/xzmi6ps8oo92w0b3.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10133, '卡雷尔·泽曼', 'Karel Zeman', 'daoyan/bijt28u5r5h4iawd.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10134, '吕克·贝松', 'Luc Besson', 'daoyan/u6vr2p60jav96nd2.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10135, '金基德', 'Kim Ki-Duk', 'daoyan/mh8ndtiz18sii1nk.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10136, '拉斯·冯·特里尔', 'Lars von Trier', 'daoyan/hughc8f9o1ih6tcw.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10137, '莱妮·里芬斯塔尔', 'Leni Riefenstahl', 'daoyan/0f9vy5sb0mu4w63z.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10138, '马里奥·巴瓦', 'Mario Bava', 'daoyan/xe5h81l5r5qjxlts.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10139, '马丁斯科塞斯', 'Martin Scorsese', 'daoyan/po67dy59c29di329.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10140, '朴赞郁', 'Park Chan Wook', 'daoyan/jhzbny1dn341q7tz.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10141, '米歇尔·冈德里', 'Michel Gondry', 'daoyan/9726myq9x8ixwx8e.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10142, '保罗·托马斯·安德森', 'Paul Thomas Anderson', 'daoyan/rkif9ritfcqj22x6.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10143, '昆汀·塔伦蒂诺', 'Quentin Tarantino', 'daoyan/utkj71tbbmy8myed.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10144, '保罗·范霍文', 'Paul Verhoeven', 'daoyan/mcoi87bc411971xx.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10145, '雷德利斯科特', 'Ridley Scott', 'daoyan/gqjqrhz5clvdiakp.png', 12, '2023-08-20 16:16:12', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10146, '雷切尔·莫里森', 'Rachel Morrison', 'daoyan/pt5s1i54us34puno.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10147, '雷·哈利豪森', 'Ray Harryhausen', 'daoyan/9yg2i7ighacz6p4y.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10148, '佩德罗·阿尔莫多瓦', 'Pedro Almodovar', 'daoyan/nqep896qbmh6lbe9.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10149, '拉斯·迈耶', 'Russ Meyer', 'daoyan/add1bvhkd3xmu2a6.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10150, '罗杰·狄金斯', 'Roger Deakins', 'daoyan/2tmih87sf7g87l58.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10151, '桑托什·西万', 'Santosh Sivan', 'daoyan/5ugyke7g7pyvjiq8.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10152, '斯派克·李', 'Spike Lee', 'daoyan/2wbov30sgxykhov6.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10153, '彼得·杰克逊', 'Peter Jackson', 'daoyan/7tm987rxzkfsejea.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10154, '斯坦利·库布里克', 'Stanley Kubrick', 'daoyan/1ceqx6vr2iokrzdd.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10155, '谢尔盖·爱森斯坦', 'Sergei Eisenstein', 'daoyan/mwep2vdxuk2v29jv.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10156, '斯派克·琼斯', 'Spike Jonze', 'daoyan/5mg0rgdklekg2oww.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10157, '北野武', 'Takeshi Kitano', 'daoyan/k6s5h6d8zypg5oa0.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10158, '谢尔盖·帕拉杰诺夫', 'Sergei Parajanov', 'daoyan/5r07lcr0giybsl0h.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10159, '塞尔吉奥·莱昂内', 'Sergio Leone', 'daoyan/yb99gu7w71rvs9j8.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10160, '三池崇史', 'Takashi Miike', 'daoyan/7ra7rjgx5mt6b0fb.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10161, '泰伦斯·马力克', 'Terrence Malick', 'daoyan/yoh4ocxr9n8urtrh.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10162, '史蒂文·斯皮尔伯格', 'Steven Spielberg', 'daoyan/40fanub6n1xcvdfz.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10163, '特里·吉列姆', 'Terry Gilliam', 'daoyan/14v3mwiyn2e2a0j2.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10164, '托尼·斯科特', 'Tony Scott', 'daoyan/q5i4gqsl2qcs1ccu.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10165, '科恩兄弟', 'The Coen Brothers', 'daoyan/jdxbwnrzkobmaaai.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10166, '韦斯·安德森', 'Wes Anderson', 'daoyan/d8v0zwy1vvwc2g5i.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10167, '王家卫', 'Wong Kar-wai', 'daoyan/jvq86nshffawmv4m.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10168, '兴奋', 'excited', 'renxiang/sl0xcsulx7tg5jde.png', 12, '2023-08-20 16:16:37', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10169, '泽维尔·多兰', 'Xavier Dolan', 'daoyan/u9tcldz40ak4g77d.png', 12, '2023-08-20 16:16:11', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10170, '扎克施奈德', 'Zack Snyder', 'daoyan/yty3mx2lgr08el6y.png', 12, '2023-08-20 16:16:10', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10171, '哭', 'crying', 'renxiang/dedbo75nqt7nlf4r.png', 12, '2023-08-20 16:16:37', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10172, '伍迪·艾伦', 'Woody Allen', 'daoyan/6k2nvmalavjnijfx.png', 12, '2023-08-20 16:16:10', '2023-12-28 13:54:21', 0, 'daoyan', '');
INSERT INTO `df_robot_prompt` VALUES (10173, '悲伤', 'sad', 'renxiang/zikyf8n1e2ligge9.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10174, '惊讶', 'suprised', 'renxiang/jmq5fpkhij947n5r.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10175, '开心', 'happy', 'renxiang/2lgc8l2nbpvpq8w1.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10176, '欣喜若狂', 'elated', 'renxiang/f419y4ajwulzojb3.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10177, '残酷', 'brutal', 'renxiang/sqzsep0zcgjduk4u.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10178, '讨厌', 'hateful', 'renxiang/w36u8z8plvxtc5kx.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10179, '华伦天奴', 'Valentino outfit', 'renxiang/zlah4pwwdj3pfrz7.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10180, '傻笑', 'smirk', 'renxiang/x0uo9t8vuwtph4db.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10181, '古驰', 'Gucci outfit', 'renxiang/r31yjybstdqnmaol.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10182, '生气', 'angry', 'renxiang/tj4f7qerbjnfxf5z.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10183, '噘嘴', 'pout', 'renxiang/xvumv8cwi01hr6ze.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10184, '嚣张', 'troll', 'renxiang/ceg2sc8dlbtld2is.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10185, '喝醉的', 'drunk', 'renxiang/tw7cy7kekmmjvfr6.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10186, '圣罗兰', 'saint laurent outfit', 'renxiang/1newh9g4n2jl7do7.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10187, '失望的', 'disappointed', 'renxiang/76ajluxhml3975ev.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10188, '巴宝莉', 'Burberry outfit', 'renxiang/m4qfkq58he0q2z0q.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10189, '宝缇嘉', 'Bottega Veneta outfit', 'renxiang/kwify2e9ggz1g9f5.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10190, '巴黎世家', 'Balenciagaoutfit', 'renxiang/geinbva4ikjf16cf.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10191, '开心泪水', 'happy tears', 'renxiang/5tleyzyjw0o6on1y.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10192, '异色瞳', 'heterochromia', 'renxiang/m5gisfc6ji4819g0.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10193, '恶心', 'disgust', 'renxiang/tgoeg558z2y10u5p.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10194, '张嘴', 'open mouth', 'renxiang/6n9d8vvv21ft3kyz.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10195, '恶魔眼', 'devil eyes', 'renxiang/1sqg3gba9bsaxyhv.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10196, '得意', 'Delighted', 'renxiang/ly4hx55gllud6zh9.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10197, '恶魔笑', 'evil smile', 'renxiang/3raggcowvo3yq6to.png', 12, '2023-08-20 16:16:36', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10198, '普拉达', 'prada outfit', 'renxiang/vinui0aaojag0rno.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10199, '挑眉', 'raised eyebrows', 'renxiang/72txh1m6k0wc4gpj.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10200, '泪水', 'tears', 'renxiang/lfsst4zkey4ouu8z.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10201, '爱马仕', 'hermes outfit', 'renxiang/dbwem0ao10xo5aqu.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10202, '眼下斑', 'mole under eye', 'renxiang/371t3lo2izi62mre.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10203, '疑惑', 'confused', 'renxiang/imps428hp2dwqkcf.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10204, '疼痛', 'pain', 'renxiang/w8h1e4yt8q56ew6r.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10205, '气愤', 'upset', 'renxiang/9nljpj6k7wsue0vt.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10206, '瞪大眼', 'wide eyes,', 'renxiang/4ql6p7kmn12sosh0.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10207, '疯狂', 'crazy', 'renxiang/qqcfzn3fawlaul9n.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10208, '纪梵希', 'Givenchy outfit,', 'renxiang/w38lwmzzjgvvo7ju.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10209, '脸红的', 'blush', 'renxiang/189e9qgennlqliyp.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10210, '范思哲', 'Versace outfit', 'renxiang/pytiikk8wk3kojb5.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10211, '芬迪', 'Fendi outfit', 'renxiang/sqlk5o36qdf7sm4l.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10212, '路易威登', 'Louis Vuitton outfit', 'renxiang/axou72yxenlsn79s.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10213, '蔑视', 'disdain', 'renxiang/br5smznlq5aum24m.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10214, '阿玛尼', 'Armani outfit', 'renxiang/06v6ctu35kc18i9d.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10215, '迪奥', 'dior outfit', 'renxiang/ou0hdotlue0gvvqg.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10216, '闭眼', 'closed eyes', 'renxiang/lvjw0dzriamiromx.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10217, '香奈儿', 'chanel outfit', 'renxiang/7vp13jj06d0spxm0.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10218, '露牙切齿', 'clenched teeth', 'renxiang/9i53usd4qtdubafu.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10219, 'T恤衫', 'T-shirt', 'renxiang/ezo7rbzk3o5k49km.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10220, '丸子头', 'hair bun', 'renxiang/z14jcpk4dg2z96xd.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10221, '交错刘海', 'crossed bangs', 'renxiang/x2ucvmgx8pn8ndp4.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10222, '光头', 'bald', 'renxiang/3meth21hsjtir6de.png', 12, '2023-08-20 16:16:35', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10223, '卫衣', 'Hoodie', 'renxiang/zm10ppnapjy88vri.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10224, '大衣', 'Overcoat', 'renxiang/5pdqf7dqw336lxxf.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10225, '外套', 'Coat', 'renxiang/2rxc7y815tewxdc6.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10226, '头发遮眼', 'hair over eyes', 'renxiang/yhxlkrs7rrtlbo2w.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10227, '双马尾', 'twintails', 'renxiang/qud0dcjbbae214o3.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10228, '寸头', 'buzz cut', 'renxiang/ahiwvsmsj134t7ai.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10229, '披肩发', 'hair over shoulder', 'renxiang/3s2sp1uhomrr2ypr.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10230, '夹克', 'Jacket', 'renxiang/9acg1euhbicwqlo4.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10231, '毛衣', 'Sweater', 'renxiang/ip0hfgqs32kavdyj.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10232, '湿发', 'wet hair', 'renxiang/sr6cc7ns8urwanej.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10233, '皮夹克', 'Leather jacket', 'renxiang/qloc3zlr4rcllehi.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10234, '牛仔服', 'Jeans', 'renxiang/zh8ei26va1bkb1oq.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10235, '泳装', 'Swimwear outfit', 'renxiang/ced371l7y9fbdlsd.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10236, '睡衣', 'Pajamas', 'renxiang/zaqkq143cck2sgcq.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10237, '短发', 'short hair', 'renxiang/pro13gcvzrakuh90.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10238, '童装', 'Childrenswear outfit', 'renxiang/y9qgd9ssmszparve.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10239, '短马尾', 'short ponytail', 'renxiang/2o40x0fdaxt0co2b.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10240, '耳前发', 'sidelocks', 'renxiang/s0i590hmdnns6ofn.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10241, '裙子', 'Skirt', 'renxiang/8lq5w5lhk5lwva7v.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10242, '背心', 'Vest', 'renxiang/fduyguruothjeaqk.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10243, '耳后发', 'hair behind ear', 'renxiang/ujuyliobn4ps25vb.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10244, '衬衫', 'shirt', 'renxiang/x1ahak1l6yb45adc.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10245, '脏辫', 'dreadlocks', 'renxiang/blsy8y9ddru4zhys.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10246, '运动服', 'Sportswear', 'renxiang/56hlyue13hecnfru.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10247, '辫子', 'braid', 'renxiang/481dgw3wntizixil.png', 12, '2023-08-20 16:16:34', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10248, '锅盖头', 'bowl cut', 'renxiang/wb0gyzngphdlfhex.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10249, '连衣裙', 'Dress', 'renxiang/azs5s1dk9j4gnkls.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10250, '两千年', '2000s outfit', 'renxiang/b7viqxn8kxeig96r.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10251, '齐刘海', 'blunt bangs', 'renxiang/nh3w3kubxw423pai.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10252, '马甲', 'Waistcoat', 'renxiang/di3hyjz19sltgqtw.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10253, '九十年代', '1990s outfit', 'renxiang/fdsumea4npwxiqkh.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10254, '中性装扮', 'androgynous outfit', 'renxiang/jxkhcvb4kpfx1yn1.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10255, '乡村风', 'peasant outfit', 'renxiang/cia984jv7qo4gyj5.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10256, '休闲', 'casual outfit', 'renxiang/ghc8ax21skwibwxm.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10257, '书呆子', 'nerd outfit', 'renxiang/m7i4h3j5wuw0s19m.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10258, '优雅奢华', 'posh outfit', 'renxiang/1yipaxs9h6ifo50o.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10259, '优雅风', 'bon chic bon genre outfit', 'renxiang/t9n74zgukmq7wdyk.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10260, '军装', 'military outfit', 'renxiang/blin41y037yauyta.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10261, '优雅风', 'elegant outfit', 'renxiang/s3csicr1ogxkf2iu.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10262, '八十年代', '1980s outfit', 'renxiang/8ugye5k0waxl5odj.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10263, '前沿装扮', 'vsco outfit', 'renxiang/v926p76momyxhxn2.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10264, '凯尔特', 'celtic outfit', 'renxiang/yoqqbg87y47ze8bz.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10265, '双丸子头', 'double bun', 'renxiang/f2q5z6u8dptn75nf.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10266, '原宿风', 'harajuku outfit', 'renxiang/196skyxyl8l5xffn.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10267, '可爱风', 'kawaii outfit', 'renxiang/stdxpeouzota4jyj.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10268, '哥特装', 'gothic outfit', 'renxiang/mg2d9v06krr4f6vx.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10269, '商务休闲', 'business casual outfit', 'renxiang/iptnh5f1nychkk7o.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10270, '坎帕拉风', 'kampala blend outfit', 'renxiang/tcavgenc98ib4ecm.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10271, '凯尔特', 'cottagecore outfit', 'renxiang/dbd6j4l2ephnytt5.png', 12, '2023-08-20 16:16:33', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10272, '坏女孩装扮', 'baddie outfit', 'renxiang/cukpciv9q6m6vo6l.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10273, '多可爱风', 'decora kei outfit', 'renxiang/pxd2zuul4lyuavos.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10274, '城市风', 'urban outfit', 'renxiang/hp4zxwphemmz22yp.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10275, '多彩头发', 'multicolored hair', 'renxiang/dxd5e5okzucw2ush.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10276, '太阳能未来', 'solarpunk outfit', 'renxiang/wlzpv5fhixflzlw5.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10277, '安卡拉', 'ankara outfit', 'renxiang/b6atlltw4x7dv5w0.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10278, '宝莱坞', 'bollywood outfit', 'renxiang/ghu8idalsfaoypjs.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10279, '孕妇装', 'maternity outfit', 'renxiang/5pfqql5l336e4qft.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10280, '实用风', 'utility outfit', 'renxiang/lp5ti60g3zfb26c6.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10281, '少女风', 'girly outfit', 'renxiang/2ij0l3nhsbrz0qtw.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10282, '帝国剪裁', 'empire silhouette outfit', 'renxiang/dbkcu7i8m2bxdvgf.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10283, '巴黎风', 'parisian outfit', 'renxiang/r9t1m2889lgwpcub.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10284, '女牛仔', 'cowgirl outfit', 'renxiang/pep1sgovteybdz4q.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10285, '常春藤', 'ivy league outfit', 'renxiang/kbrk12rwh2k6yoye.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10286, '嬉皮风', 'hippie outfit', 'renxiang/qn9y3xnf9xwkpe1t.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10287, '忍者装', 'Ninja outfit', 'renxiang/cas9pww3bnrc14h7.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10288, '异域风情', 'exotic outfit', 'renxiang/7iwtr0vf0ztry4k1.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10289, '恶霸风', 'chav outfit,half body', 'renxiang/2rpodczej5bkx165.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10290, '抑郁风', 'emo outfit', 'renxiang/ygfksl40rutk0y98.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10291, '折中风', 'eclectic outfit', 'renxiang/irb3471pz8qp8kgt.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10292, '文艺复兴', 'hipster outfit', 'renxiang/cvrrgpg7d8jaljqc.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10293, '拉丁风', 'latino outfit', 'renxiang/99ut9ji2hftcgd8g.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10294, '斯卡服装', 'ska outfit', 'renxiang/lwda5bbs55853v93.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10295, '时尚风', 'chic style outfit', 'renxiang/ftq0adwh2u85v6d1.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10296, '明亮的', 'vibrant outfit', 'renxiang/pjz50u0xl8vewied.png', 12, '2023-08-20 16:16:32', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10297, '新哥特装', 'nugoth outfit', 'renxiang/02v7aw6t9riocmy6.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10298, '日本街头', 'Street in Japan outfit', 'renxiang/xj4kj4v3ls0nobtn.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10299, '暴走族', 'bosozoku outfit', 'renxiang/uyfhjkj2lg1a16aj.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10300, '朋克风', 'punk outfit', 'renxiang/ar8r5bqthpz95xen.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10301, '机车装', 'biker outfit', 'renxiang/sf0he0obxcz6o6mh.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10302, '机甲装', 'Mecha outfit', 'renxiang/dv10thsq26u7i6xi.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10303, '朋克摇滚', 'punk rock outfit', 'renxiang/toq83j9wuqnbdh17.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10304, '极简主义', 'minimalist outfit', 'renxiang/hz7vnq0maz6fq7vx.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10305, '极简', 'minimal outfit', 'renxiang/ezjjh01ssydkix40.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10306, '柴油朋克', 'diesel punk outfit', 'renxiang/0zylp9zcbtqa7vn0.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10307, '正装', 'formal outfit', 'renxiang/7z1c52jf25ywieb1.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10308, '欧洲风', 'lagenlook outfit', 'renxiang/rvbdju6q6xe1en6n.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10309, '民族服装', 'ethnic outfit', 'renxiang/535mkbgy4d9fwnz5.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10310, '民间风', 'folkloric outfit', 'renxiang/nuhr34tnlv2emkfq.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10311, '波西米亚', 'boho outfit', 'renxiang/aaqsoxud19rqh60f.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10312, '沙滩装扮', 'beach outfit', 'renxiang/a8p1z3tx1dd97sdz.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10313, '流行朋克', 'poppunk outfit', 'renxiang/qb36alvcsh5zvcub.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10314, '海洋朋克', 'seapunk outfit', 'renxiang/mg62ls00omka1t0l.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10315, '海滨奶奶风', 'coastal grandmother outfit', 'renxiang/qymixfooi2dy5p4p.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10316, '海军装', 'nautical outfit', 'renxiang/9jzdccdf2va1yrvy.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10317, '温柔男孩', 'softboys outfit', 'renxiang/xzkd481n7nzg6xag.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10318, '滑板装', 'skate outfit', 'renxiang/lntopc128in0k0zw.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10319, '牛仔装', 'cowboy outfit', 'renxiang/ch7fw6fxjjk78rgx.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10320, '独立风', 'indie outfit', 'renxiang/0uhwpevtuxhok98m.png', 12, '2023-08-20 16:16:31', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10321, '热带风', 'tropical outfit', 'renxiang/e8b4j7qawb71e9yx.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10322, '男友风', 'tomboy outfit', 'renxiang/xb8nwkewtim578o5.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10323, '科技风', 'techno outfit', 'renxiang/sm45o83050c6a337.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10324, '禅风', 'Zen outfit', 'renxiang/mqik3clrwyj2nr74.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10325, '短发女装', 'garconne outfit', 'renxiang/g62xncrcgxwao393.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10326, '白发', 'white hair', 'renxiang/fxg5jlsnmbiv88aa.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10327, '灰发', 'grey hair', 'renxiang/uu2vsh828ygbsep8.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10328, '粉发', 'pink hair', 'renxiang/husfhxq28sm18l17.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10329, '精神摇滚', 'psychobilly outfit', 'renxiang/s1i7setwlzasxz26.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10330, '端庄风', 'modest outfit', 'renxiang/ii4peufxw31ttnzk.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10331, '红发', 'red hair', 'renxiang/eturuis64prd4b49.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10332, '经典风', 'classit outfit', 'renxiang/on7n0ewdxlm351h4.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10333, '编织马尾', 'braided ponytail', 'renxiang/9surjsojvr4e5y0u.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10334, '老时髦', 'shabby chic outfit', 'renxiang/yol1cfcocke0onso.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10335, '艳丽的', 'flamboyant outfit', 'renxiang/u41mk5q4w3gf1ujc.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10336, '芭蕾舞', 'balletcore outfit', 'renxiang/gjumc69s4i9459ac.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10337, '萨普尔', 'sapeurs outfit', 'renxiang/tj5po5n9b4c7p5cr.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10338, '草原服装', 'prairie outfit', 'renxiang/37fhhgwy0mjt6cui.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10339, '花花公子', 'dandy outfit', 'renxiang/bl340mxc3e4muimc.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10340, '蒸汽波', 'vaporwave outfit', 'renxiang/jcgr3alniz2ts1y4.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10341, '西南风', 'southwestern outfit', 'renxiang/6f80ud362voucmgj.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10342, '规范装', 'normcore outfit', 'renxiang/y24nxfcnohhqd0gy.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10343, '视觉系', 'visual kei outfit', 'renxiang/fhd8gx0yb2xdxaxy.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10344, '角色扮演', 'cosplay outfit', 'renxiang/w5yu91cqza0881e7.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10345, '轻学院装', 'light academia outfit', 'renxiang/xlsodpdjo61antqh.png', 12, '2023-08-20 16:16:30', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10346, '运动', 'sportswear outfit', 'renxiang/6fq5o1pil3dnhzj8.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10347, '运动休闲', 'athleisure outfit', 'renxiang/a5eizfflhgtc5iwk.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10348, '运动风', 'sporty outfit', 'renxiang/dhb74vhqhuebvd95.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10349, '贵族风', 'aristocrat outfit', 'renxiang/0or21k8yryaqydbs.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10350, '迪斯科装', 'disco outfit', 'renxiang/4iukg2k1t1nnfrjv.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10351, '部落风', 'tribal outfit', 'renxiang/v682s5k500ya13ex.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10352, '重金属', 'heavy metal outfit', 'renxiang/92ropkc26hdjg7lq.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10353, '金发', 'blonde hair', 'renxiang/komd5uh2frhzdumm.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10354, '酒会装', 'flapper outfit', 'renxiang/mom9tcp53g20z88a.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10355, '阴森装', 'macabre outfit', 'renxiang/orgxcb87890ewr6a.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10356, '银发', 'silver hair', 'renxiang/o6m9b080y1kp54v1.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10357, '韩国时尚', 'ulzzang outfit', 'renxiang/ar1vo16g7t9eg567.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10358, '阿兹特克', 'aztec outfit', 'renxiang/qxntv6w24z64jrd1.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10359, '颓废摇滚', 'grunge outfit', 'renxiang/zqnw5atggorf9a4q.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10360, '马术装', 'equestrian outfit', 'renxiang/xqq0es7yjx2vqw0d.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10361, '高级定制', 'haute couture outfit', 'renxiang/vck4lw9buxvmo7d5.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10362, '魅力风', 'glamour outfit', 'renxiang/nux0edocisl1fh7f.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10363, '黑发', 'black hair', 'renxiang/a4h60mmmw3dgzzru.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10364, '黑帮装', 'gangster outfit', 'renxiang/wo4gb0mjjfxr1r30.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10365, '医用口罩', 'Medical masks', 'renxiang/fl65bqdfo7jj33e4.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10366, '发卡', 'hairpin', 'renxiang/cf552vfhvqrny9ph.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10367, '发带', 'hair ribbon', 'renxiang/xl3ld7fe0vvzkwhf.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10368, '发花', 'hair flower', 'renxiang/zket7wex9dkyc599.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10369, '太阳镜', 'sunglasses', 'renxiang/mqgcn9xoyl3of39h.png', 12, '2023-08-20 16:16:29', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10370, '女仆头饰', 'maid headdress', 'renxiang/5699hruhm0fwfbhs.png', 12, '2023-08-20 16:16:28', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10371, '头戴护目镜', 'goggles on head', 'renxiang/okg4jtwl1c1a8mei.png', 12, '2023-08-20 16:16:28', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10372, '头戴显示', 'head mounted display', 'renxiang/7rwbba1xapyjt029.png', 12, '2023-08-20 16:16:28', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10373, '帽子护目镜', 'goggles on headwear', 'renxiang/h607tmfsmdxeq4iu.png', 12, '2023-08-20 16:16:28', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10374, '水手帽', 'sailor hat', 'renxiang/5d8i7za3oix28om5.png', 12, '2023-08-20 16:16:28', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10375, '法师帽', 'wizard hat', 'renxiang/q7hz8rnpmzzutteh.png', 12, '2023-08-20 16:16:28', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10376, '皇冠', 'crown', 'renxiang/lkqb2kykx80f3ov5.png', 12, '2023-08-20 16:16:28', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10377, '狐狸面具', 'fox mask', 'renxiang/s7ulmrcix6v3r2qt.png', 12, '2023-08-20 16:16:28', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10378, '眼罩', 'blindfold', 'renxiang/yjdjgzl18wdv3cgh.png', 12, '2023-08-20 16:16:28', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10379, '耳机', 'headphones', 'renxiang/digft17u2rfrahoe.png', 12, '2023-08-20 16:16:28', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10380, '贝雷帽', 'beret', 'renxiang/e0xmlbr7lwr3ua47.png', 12, '2023-08-20 16:16:28', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10381, '防毒面具', 'gas mask', 'renxiang/erbgctjmqsp5q721.png', 12, '2023-08-20 16:16:28', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10382, '面纱', 'mouth veil', 'renxiang/fb840egdu3u590sp.png', 12, '2023-08-20 16:16:28', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10383, '护士帽', 'nurse cap', 'renxiang/jsrq4xgtwdv30f63.png', 12, '2023-08-20 16:16:28', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10384, '面膜', 'facial mask', 'renxiang/5wjhvihxhuqhi2vf.png', 12, '2023-08-20 16:16:28', '2023-12-28 13:54:21', 0, 'renxiang', '');
INSERT INTO `df_robot_prompt` VALUES (10385, '丁达尔效应', 'Tyndall effect', 'dengguang/sx8kd5c8in6b7hw3.png', 12, '2023-08-20 16:17:17', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10386, '太阳光', 'Sun light', 'dengguang/sfykrttuevbwyf9t.png', 12, '2023-08-20 16:17:17', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10387, '斑驳光线', 'Dappled Light', 'dengguang/wpsmeqthuyepd65x.png', 12, '2023-08-20 16:17:17', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10388, '暖光', 'warm light', 'dengguang/ckmeh7c83345rw8h.png', 12, '2023-08-20 16:17:17', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10389, '明亮的', 'bright', 'dengguang/ti8dx8an6c6i8w60.png', 12, '2023-08-20 16:17:17', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10390, '梦幻灯光', 'Dreamy Glow', 'dengguang/3xdm91sbpog31y4p.png', 12, '2023-08-20 16:17:17', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10391, '氛围感照明', 'atmospheric lighting', 'dengguang/ykxmiqc9o3ycolnq.png', 12, '2023-08-20 16:17:17', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10392, '电影灯光', 'Cinematic Lighting', 'dengguang/3pomqkf0ud67uszq.png', 12, '2023-08-20 16:17:17', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10393, '伦勃朗光', 'Rembrandt Lighting', 'dengguang/0d7v8dqgsuzvz1s8.png', 12, '2023-08-20 16:17:17', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10394, '高调照明', 'High key lighting', 'dengguang/h916ig0q8d9ia9wi.png', 12, '2023-08-20 16:17:17', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10395, '体积光', 'Volumetric Lighting', 'dengguang/h0x1yko6gnt4j0ph.png', 12, '2023-08-20 16:17:17', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10396, '光粒子', 'Glowing Particle Effects', 'dengguang/7decqj21t0q85xa7.png', 12, '2023-08-20 16:17:17', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10397, '镜头光晕', ',Lens Flare', 'dengguang/hr7y40vurwkvnc0h.png', 12, '2023-08-20 16:17:17', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10398, '全局光', 'global illuminations', 'dengguang/6hvut9zgrlyzlrrm.png', 12, '2023-08-20 16:17:17', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10399, '冷光', 'Cold light', 'dengguang/mbm377josddyts9q.png', 12, '2023-08-20 16:17:17', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10400, '工作室照明', 'Studio lighting', 'dengguang/ce6g3nfrusc3z1ao.png', 12, '2023-08-20 16:17:17', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10401, '聚光灯', 'Spotlight', 'dengguang/qwn67c77e08tvb3w.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10402, '背景虚化', 'Bokeh', 'dengguang/ljt6jep15j6uq8vt.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10403, '轮廓光', 'Rim light', 'dengguang/ph3wxtjadgyv2szf.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10404, '柔光', 'Soft Lighting', 'dengguang/6cfl2f5licq405om.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10405, '晨光', 'morning light', 'dengguang/4uja6dakyyqtcipr.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10406, '重点照明', 'Accent Lighting', 'dengguang/gnmbdzuujjz1ktey.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10407, '阳光照射', 'Direct Sunlight', 'dengguang/3k4b168vzyr0t4mm.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10408, '隔光板', 'Gobo', 'dengguang/ki3i00csr4oss1yr.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10409, '自然照明', 'Natural Lighting', 'dengguang/xfxr29hsnand2p40.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10410, '三点光', '3 point lighting', 'dengguang/nx5t458kx98mwb9o.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10411, '关键照明', 'Key lighting', 'dengguang/sicm7vu5hz9zdk2n.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10412, '上方射下光', 'a beam of light came down from above', 'dengguang/4ber5wqbacti35ev.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10413, '内发光', 'Internal Glow', 'dengguang/rekrl3i2c75sbl3h.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10414, '低调照明', 'Low key lighting', 'dengguang/vuw2p585ct630w3e.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10415, '分离照明', 'Split Lighting', 'dengguang/x7xkdzinlag4gbn5.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10416, '前灯', 'front Lighting', 'dengguang/nek84xomj4nwnuck.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10417, '午夜', 'Midnight', 'dengguang/ycaux8li1gpb9zs2.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10418, '双重灯光', 'Dual Lighting', 'dengguang/2ae105wtdhsm3uky.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10419, '发光', 'Glowing', 'dengguang/l0rpgrsnqiady5ua.png', 12, '2023-08-20 16:17:16', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10420, '光追反射', 'Ray Tracing Reflections', 'dengguang/2voc2iy9zhzblggq.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10421, '夜光', 'Glow in the Dark', 'dengguang/nd4tnzl4wjauzjo4.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10422, '反射光', 'reflect lights', 'dengguang/cxxd30ihviw6k7dh.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10423, '化学发光', 'Chemiluminescence', 'dengguang/daohh87m3q7jk813.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10424, '手电筒', 'Torchlit', 'dengguang/xpdgfm4jgwh5aqd2.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10425, '夜总会照明', 'Nightclub Lighting', 'dengguang/1o0nxs67j5a1ooj7.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10426, '放射性发光', 'Glow Radioactive', 'dengguang/yuj451apstyk1uuz.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10427, '戏剧化灯光', 'Dramatic Lighting', 'dengguang/mulowwp8amkburor.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10428, '星空', 'Starry', 'dengguang/o8b6i6i5aa83wene.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10429, '月光', 'Moonlight', 'dengguang/exwydfr9an5oaf56.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10430, '激光', 'Laser', 'dengguang/k0cznv37jcwrz587.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10431, '核废料光', 'Nuclear Waste Glow', 'dengguang/widrdwdsnx0umohw.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10432, '激励照明', 'Motivated lighting', 'dengguang/nv7es5u7lz6mi98e.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10433, '泛光灯', 'Floodlight', 'dengguang/b8glzi3vacvz1dfw.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10434, '灰尘', 'dust', 'dengguang/1zzqxwuvdxpdbq69.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10435, '电发光线', 'Electroluminescent Wire', 'dengguang/uzpugpp2e8cyege4.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10436, '火光', 'flame', 'dengguang/bqchmf5q9ksstvxh.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10437, '烛光', 'Candlelight', 'dengguang/4tzb8v6hakppj1sg.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10438, '熔岩光', 'Lava Glow', 'dengguang/v7b1wcgur5256915.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10439, '环境光', 'Ambient Light', 'dengguang/3e02rfsye0ndtlta.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10440, '白昼光', 'Crepuscular Rays', 'dengguang/z42g3h0ioytv3gnu.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10441, '紫外线', 'Ultraviolet', 'dengguang/2wo16qqoyeaynewl.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10442, '硬光', 'hard lighting', 'dengguang/oklig0jvb2wq0qbj.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10443, '荧光', 'Fluorescent', 'dengguang/95rtnjzsslclm6o2.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10444, '电磁音波', 'Electromagnetic Spectrum', 'dengguang/ymrn15t1qjbim84u.png', 12, '2023-08-20 16:17:15', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10445, '背光', 'Backlight', 'dengguang/osx53qisch1wf9jv.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10446, '荧光灯', 'Fluorescent Lighting', 'dengguang/tmbnglexfvnpo8nm.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10447, '美丽的照明', 'Beautiful Lighting', 'dengguang/9d2za22ai2n4cy7i.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10448, '丁达尔效应', 'Tyndall effect', 'dengguang/f4gmn7erneos2o1d.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10449, '太阳光', 'Sun light', 'dengguang/b7z5ohmxmh4uxz2q.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10450, '明亮的', 'bright', 'dengguang/e6erec8dhk9nlv12.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10451, '电影灯光', 'Cinematic Lighting', 'dengguang/64qwlsxcd0shlks7.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10452, '氛围感照明', 'atmospheric lighting', 'dengguang/suml2e4ki0r27yel.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10453, '高调照明', 'High key lighting', 'dengguang/o7lkmo81pyj95y1w.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10454, '梦幻灯光', 'Dreamy Glow', 'dengguang/cl92mqewwr2ovbu0.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10455, '镜头光晕', ',Lens Flare', 'dengguang/u507e3g0iwt56bie.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10456, '伦勃朗光', 'Rembrandt Lighting', 'dengguang/yyxodhjdm4r41jry.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10457, '体积光', 'Volumetric Lighting', 'dengguang/9ttvy53if9gyhj51.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10458, '斑驳光线', 'Dappled Light', 'dengguang/h9tkr4vgoqwl0j80.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10459, '全局光', 'global illuminations', 'dengguang/kvaxo51vqc0b5g31.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10460, '光粒子', 'Glowing Particle Effects', 'dengguang/7ofafqim75l51byf.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10461, '冷光', 'Cold light', 'dengguang/zqe8j4meoxckmcx3.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10462, '暖光', 'warm light', 'dengguang/4enun33aj8qpkctt.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10463, '晨光', 'morning light', 'dengguang/kpfay7fq4pwh3810.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10464, '柔光', 'Soft Lighting', 'dengguang/mawh0dyx1ek58hhw.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10465, '工作室照明', 'Studio lighting', 'dengguang/cjdohr1mcrn7vkch.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10466, '聚光灯', 'Spotlight', 'dengguang/9s3ionsxsrnbbsah.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10467, '背景虚化', 'Bokeh', 'dengguang/7w34uo18tg0xsdy8.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10468, '轮廓光', 'Rim light', 'dengguang/y1cc99azy2euv6rt.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10469, '自然照明', 'Natural Lighting', 'dengguang/ksuxix2vc2qxvxp0.png', 12, '2023-08-20 16:17:14', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10470, '重点照明', 'Accent Lighting', 'dengguang/lb30wo2x5r4y3ccx.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10471, '隔光板', 'Gobo', 'dengguang/fg0eixr6ui4wd0j0.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10472, '阳光照射', 'Direct Sunlight', 'dengguang/z0qmvo4u3en1n2az.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10473, '低调照明', 'Low key lighting', 'dengguang/n9zockk4mc6biopf.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10474, '三点光', '3 point lighting', 'dengguang/quwcia9piq75s52f.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10475, '上方射下光', 'a beam of light came down from above', 'dengguang/ki07dd8k3s9su93z.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10476, '关键照明', 'Key lighting', 'dengguang/x5kmehne9f34pqgc.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10477, '光追反射', 'Ray Tracing Reflections', 'dengguang/nvr11oj91uax87nj.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10478, '内发光', 'Internal Glow', 'dengguang/lt7wgj8vxgqo4lzc.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10479, '分离照明', 'Split Lighting', 'dengguang/1twbmbeztsxavvmp.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10480, '午夜', 'Midnight', 'dengguang/x1kfa4nh8tph4mxn.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10481, '前灯', 'front Lighting', 'dengguang/0lieodsh3zlt9mep.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10482, '化学发光', 'Chemiluminescence', 'dengguang/2kdbjkk2tr5312u7.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10483, '双重灯光', 'Dual Lighting', 'dengguang/02d4v28h34n8mv8k.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10484, '反射光', 'reflect lights', 'dengguang/tnr2vo7ne7ocwxlt.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10485, '夜光', 'Glow in the Dark', 'dengguang/3l4q0yca7okpn3va.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10486, '夜总会照明', 'Nightclub Lighting', 'dengguang/xtsbf6j5xanuwt03.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10487, '发光', 'Glowing', 'dengguang/uqhynzcewlsu1cfj.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10488, '放射性发光', 'Glow Radioactive', 'dengguang/z8r2v85m74e8iz7n.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10489, '戏剧化灯光', 'Dramatic Lighting', 'dengguang/ixg5bmrep6mbowi7.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10490, '星空', 'Starry', 'dengguang/nhf4v1aowynituza.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10491, '手电筒', 'Torchlit', 'dengguang/7kbrcm8ej5rfw7uw.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10492, '月光', 'Moonlight', 'dengguang/nfzm86wznm0tmm06.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10493, '核废料光', 'Nuclear Waste Glow', 'dengguang/uzak55knvptvts3o.png', 12, '2023-08-20 16:17:13', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10494, '激光', 'Laser', 'dengguang/kvfxcc3633qlrhqa.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10495, '激励照明', 'Motivated lighting', 'dengguang/3hpinba3dr90mwgo.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10496, '泛光灯', 'Floodlight', 'dengguang/396o9zb42taq7ncc.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10497, '灰尘', 'dust', 'dengguang/9oobs5v0nlviq4kj.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10498, '火光', 'flame', 'dengguang/e6zsdgh95ddoaenu.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10499, '烛光', 'Candlelight', 'dengguang/aiayqtuex0g2hheo.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10500, '环境光', 'Ambient Light', 'dengguang/6k16grufpvvrbes8.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10501, '熔岩光', 'Lava Glow', 'dengguang/dgasd4rse2lwj3y1.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10502, '电磁音波', 'Electromagnetic Spectrum', 'dengguang/vky6x6lpfws7r24o.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10503, '白昼光', 'Crepuscular Rays', 'dengguang/rtzgz5nfdxed0l2y.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10504, '电发光线', 'Electroluminescent Wire', 'dengguang/vm3m5ixus6omjjnq.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10505, '硬光', 'hard lighting', 'dengguang/xuqv47nq50ycef43.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10506, '紫外线', 'Ultraviolet', 'dengguang/7lacfa59y7vz8nqi.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10507, '美丽的照明', 'Beautiful Lighting', 'dengguang/zk8lxzzld1g9iz4l.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10508, '背光', 'Backlight', 'dengguang/aui6bct1f1pvefa0.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10509, '荧光灯', 'Fluorescent Lighting', 'dengguang/23iz9l2rcl8w2gy6.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10510, '丁达尔效应', 'Tyndall effect', 'dengguang/4cpk7xuos9uoank7.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10511, '荧光', 'Fluorescent', 'dengguang/caui6l7bjs6izg4i.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10512, '斑驳光线', 'Dappled Light', 'dengguang/fc1ibtdsunwlxs58.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10513, '太阳光', 'Sun light', 'dengguang/ag0km1roxt5yop4t.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10514, '暖光', 'warm light', 'dengguang/2jzbtgoia321scno.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10515, '明亮的', 'bright', 'dengguang/5izr0a7al6zdw6nq.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10516, '梦幻灯光', 'Dreamy Glow', 'dengguang/yyb4r29muuezhqna.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10517, '电影灯光', 'Cinematic Lighting', 'dengguang/fyn5y721zns65m6k.png', 12, '2023-08-20 16:17:12', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10518, '氛围感照明', 'atmospheric lighting', 'dengguang/z2icwjqntuuj8uhl.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10519, '镜头光晕', ',Lens Flare', 'dengguang/8aml4yz1qvfbdjxl.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10520, '高调照明', 'High key lighting', 'dengguang/040xi45qb5h8q6qj.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10521, '光粒子', 'Glowing Particle Effects', 'dengguang/qzgu7nta9kea8c5t.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10522, '伦勃朗光', 'Rembrandt Lighting', 'dengguang/6aet6j4nxxvfxemt.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10523, '体积光', 'Volumetric Lighting', 'dengguang/nbq3ecjop0bqkwx6.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10524, '全局光', 'global illuminations', 'dengguang/zsi2d42j6nta9zp4.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10525, '柔光', 'Soft Lighting', 'dengguang/o79vv7fcsr69dy3l.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10526, '冷光', 'Cold light', 'dengguang/klkz8v3jyhx8338g.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10527, '工作室照明', 'Studio lighting', 'dengguang/eih34blv6l7z7kel.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10528, '晨光', 'morning light', 'dengguang/r27gsv90g1ey36wg.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10529, '背景虚化', 'Bokeh', 'dengguang/s6a0kvvzta9br7iv.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10530, '轮廓光', 'Rim light', 'dengguang/zl8faoj6fzc1u12i.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10531, '自然照明', 'Natural Lighting', 'dengguang/zi8d7odmkkpf97u1.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10532, '聚光灯', 'Spotlight', 'dengguang/c3q7lvmoistnbo2v.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10533, '重点照明', 'Accent Lighting', 'dengguang/l24n4p5o8k29t0t7.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10534, '隔光板', 'Gobo', 'dengguang/filwep4moebceli2.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10535, '阳光照射', 'Direct Sunlight', 'dengguang/a1nzb1kqm1cmbf37.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10536, '上方射下光', 'a beam of light came down from above', 'dengguang/wkkl06lqsfh2mk9g.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10537, '三点光', '3 point lighting', 'dengguang/uuyibohj01e8zz58.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10538, '低调照明', 'Low key lighting', 'dengguang/oq52pk9iqe9kfwd9.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10539, '关键照明', 'Key lighting', 'dengguang/z5koorwtmlkeep2r.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10540, '内发光', 'Internal Glow', 'dengguang/zuznco9053x1x38d.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10541, '光追反射', 'Ray Tracing Reflections', 'dengguang/bp263ae7tgza8ruf.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10542, '分离照明', 'Split Lighting', 'dengguang/6zp2k46lqawffahb.png', 12, '2023-08-20 16:17:11', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10543, '前灯', 'front Lighting', 'dengguang/1q7lhclt3ca7p0n2.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10544, '化学发光', 'Chemiluminescence', 'dengguang/5my8q7hlkqb06abz.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10545, '午夜', 'Midnight', 'dengguang/8kc5hn15gacoh8tm.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10546, '双重灯光', 'Dual Lighting', 'dengguang/j4y4dtao8bssblpr.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10547, '发光', 'Glowing', 'dengguang/mlswmgkza1z5ecx5.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10548, '夜总会照明', 'Nightclub Lighting', 'dengguang/uviefpxgp0il435p.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10549, '戏剧化灯光', 'Dramatic Lighting', 'dengguang/w0mlf5l6kc30fyyw.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10550, '手电筒', 'Torchlit', 'dengguang/a28cxsee363z8by5.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10551, '夜光', 'Glow in the Dark', 'dengguang/qdrwub1n02ueo3cv.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10552, '星空', 'Starry', 'dengguang/fwba41vvlkhugxkp.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10553, '反射光', 'reflect lights', 'dengguang/2qhln6fijsnbptiq.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10554, '放射性发光', 'Glow Radioactive', 'dengguang/mwtwfvhh5o7ppnlv.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10555, '月光', 'Moonlight', 'dengguang/0uvos6e183n3d1mw.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10556, '激光', 'Laser', 'dengguang/wkolv6b6ur24ufi5.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10557, '泛光灯', 'Floodlight', 'dengguang/7uhqoebcqypwm7gt.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10558, '激励照明', 'Motivated lighting', 'dengguang/4potoga0tyg3vt6r.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10559, '火光', 'flame', 'dengguang/zd1pwqgfeutvhl0n.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10560, '灰尘', 'dust', 'dengguang/k4s26g02t8ns0u81.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10561, '烛光', 'Candlelight', 'dengguang/ngt7ugk83f5xqehl.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10562, '核废料光', 'Nuclear Waste Glow', 'dengguang/kj1epib2z8pxa4ie.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10563, '熔岩光', 'Lava Glow', 'dengguang/ddgrr759gu7t0gku.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10564, '环境光', 'Ambient Light', 'dengguang/jixsvadztx7id5po.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10565, '硬光', 'hard lighting', 'dengguang/28t8l34vztqumobw.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10566, '电发光线', 'Electroluminescent Wire', 'dengguang/w17lcf8s2wpav5xh.png', 12, '2023-08-20 16:17:10', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10567, '白昼光', 'Crepuscular Rays', 'dengguang/sezp7an5voqnhroz.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10568, '紫外线', 'Ultraviolet', 'dengguang/ohjmmg82aintx4ft.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10569, '电磁音波', 'Electromagnetic Spectrum', 'dengguang/9hz45g6m2zqxetzz.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10570, '美丽的照明', 'Beautiful Lighting', 'dengguang/ul19kpb5s6m4fiup.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10571, '背光', 'Backlight', 'dengguang/0bclo2dct1m0zhaf.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10572, '荧光', 'Fluorescent', 'dengguang/wbe1rfhexbkqmj4c.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10573, '荧光霓虹灯', 'glowing neon', 'dengguang/nus5qcyruo79b05d.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10574, '荧光灯', 'Fluorescent Lighting', 'dengguang/jb295h0auwv0488w.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10575, '蓝色时间', 'Blue Hour', 'dengguang/xr76expkkgr1unx7.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10576, '边缘光', 'Edge light', 'dengguang/jku5x3sbzopwprty.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10577, '迪斯科灯光', 'Disco Lighting', 'dengguang/7dceyo56d186xg1i.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10578, '量子点', 'Quantum Dot', 'dengguang/kw102qb4nff1qchw.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10579, '镭射发光', 'Radioluminescence', 'dengguang/ti0yn3b8hdx14iia.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10580, '闪光', 'Shimmering Lights', 'dengguang/slr2ax9l2k77czhk.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10581, '闪亮', 'Flare', 'dengguang/kl2le0m60gvicy02.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10582, '闪光粉', 'Glitter', 'dengguang/gkac4lddkqp4642l.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10583, '霓虹灯', 'Neon Light', 'dengguang/volx6aztko4oa7o5.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10584, '音乐会照明', 'Concert Lighting', 'dengguang/pfybpocesyylxfbr.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10585, '频闪灯', 'Strobe light', 'dengguang/8a5dzliyl5sj1pqd.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10586, '黄昏', 'Dusk', 'dengguang/hxw6jp8i4paiw96e.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10587, '黑光', 'Blacklight', 'dengguang/w0ubnwqme71p3bqh.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10588, '黄金时段', 'Golden hour light', 'dengguang/e0ntt1fxus9md8mb.png', 12, '2023-08-20 16:17:09', '2023-12-28 13:54:21', 0, 'dengguang', '');
INSERT INTO `df_robot_prompt` VALUES (10589, '干净背景', 'clean background', 'changjing/s3djddywvit8whu2.png', 12, '2023-08-20 16:17:42', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10590, '充满阳光', 'full of sunlight', 'changjing/34s4zsug0ate0q7r.png', 12, '2023-08-20 16:17:42', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10591, '办公室', 'office', 'changjing/31dzomq66xshhxfd.png', 12, '2023-08-20 16:17:42', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10592, '医院', 'hospital', 'changjing/4ikv5hv4d22dxtd5.png', 12, '2023-08-20 16:17:42', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10593, '厨房', 'kitchen', 'changjing/p3le2b53bs19etfm.png', 12, '2023-08-20 16:17:42', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10594, '反乌托邦', 'Dystopian future', 'changjing/eh1pcnl2ddeuhw5x.png', 12, '2023-08-20 16:17:42', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10595, '卧室', 'bedroom', 'changjing/6x70g0jrh185ri4o.png', 12, '2023-08-20 16:17:42', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10596, '家庭办公室', 'home office background', 'changjing/pb3bvf2z9ei20oxp.png', 12, '2023-08-20 16:17:42', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10597, '商场', 'Shopping Mall', 'changjing/xn4kcj2voskhztwj.png', 12, '2023-08-20 16:17:42', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10598, '废弃城市群', 'deserted city buildings', 'changjing/u2tius9s7om5lqgj.png', 12, '2023-08-20 16:17:42', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10599, '废墟', 'ruins', 'changjing/ajyy9f0sjwyby339.png', 12, '2023-08-20 16:17:42', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10600, '教室', 'classroom', 'changjing/8061lo35hk18qqww.png', 12, '2023-08-20 16:17:42', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10601, '机场', 'Airport', 'changjing/8hz46kzj0j57ccwt.png', 12, '2023-08-20 16:17:42', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10602, '游乐场', 'Playground', 'changjing/ybw1x4b7zsfprv73.png', 12, '2023-08-20 16:17:42', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10603, '游戏厅', 'Game Room', 'changjing/cen3jzo6rcbtnoaa.png', 12, '2023-08-20 16:17:42', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10604, '火车站', 'Train Station', 'changjing/8of5crafhiii749x.png', 12, '2023-08-20 16:17:42', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10605, '电梯里', 'In the elevator', 'changjing/cnnj1mx1umwfjvj2.png', 12, '2023-08-20 16:17:42', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10606, '羽毛球馆', 'Badminton Court', 'changjing/6d4ccfllt6vk6j3x.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10607, '舞厅', 'dancing hall', 'changjing/p8wlq3horzrf3w3i.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10608, '赌场', 'casino', 'changjing/gc39549dacvm16gr.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10609, '赛博空间', 'Cyberspace', 'changjing/u74kpffexrrl4ale.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10610, '雨天背景', 'rain background', 'changjing/obb5bu3vplmccbhi.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10611, '游泳池', 'Swimming pool', 'changjing/4hf6bbk6esta3hjm.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10612, '冬季森林', 'white winter forest background', 'changjing/p9n4m1tpw1zyh7it.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10613, '冰山', 'Iceberg', 'changjing/ududsykddzpvcsq6.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10614, '大草原', 'Grassland', 'changjing/z5q12z842g8kr9s6.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10615, '奇幻森林', 'Enchanted forest', 'changjing/phiahbyxzbhjtru5.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10616, '冰川', 'Glacier', 'changjing/dhrlapuihk6lrvq1.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10617, '未来城市', 'Future Cities', 'changjing/za6tej6lmlyye30s.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10618, '天空', 'sky background', 'changjing/mqrac0xdrq3yh5fn.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10619, '未来都市', 'Futuristic metropolis', 'changjing/hv4n6ystahp9fksw.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10620, '森林', 'Forest', 'changjing/w8fkr2wzfot3g1k9.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10621, '海底', 'Seabed', 'changjing/1xheefmfhffy8xd4.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10622, '沙漠', 'desert background', 'changjing/x0bixulr9o3yvtr4.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10623, '湖泊', 'Lake', 'changjing/9hl1jcao7bdr6onb.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10624, '海滩', 'beach background', 'changjing/xfyepqdiq0dp96bk.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10625, '草原', 'Steppe', 'changjing/xsazfrcdpb8rmc65.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10626, '网球场', 'Tennis Court', 'changjing/k1prdciw9i1pz4b8.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10627, '草地', 'Grass field background', 'changjing/i21sfav4igkfcpbz.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10628, '街景', 'street scenery', 'changjing/quyd3sl81fgmvlps.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10629, '酒吧', 'Bar', 'changjing/obzuyk66bm38kg4i.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10630, '雪山', 'Snowy mountain', 'changjing/4zr6ayw9utshnl3m.png', 12, '2023-08-20 16:17:41', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10631, '赛博朋克城', 'Cyberpunk city', 'changjing/lj6e3d8zi26iomvi.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10632, '中世纪城堡', 'Medieval castle', 'changjing/wcv32si3cyd241pg.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10633, '近未来城市', 'near future city', 'changjing/uei9d3gty91605su.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10634, '冰雪王国', 'Ice kingdom', 'changjing/6zjd6g2z6mc06oqf.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10635, '热带雨林', 'Rainforest', 'changjing/a3ck3rqr3l0nnf86.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10636, '农田', 'Farmland', 'changjing/rgctdy191298sgdg.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10637, '北极背景', 'arctic background', 'changjing/mncbkpgpdit1rx61.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10638, '另一世界', 'Otherworld', 'changjing/aplb6gsf9zlpvyxc.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10639, '埃菲尔铁塔', 'Eiffel Tower', 'changjing/r69noel1loss8ch1.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10640, '启示录荒野', 'Post-apocalyptic wasteland', 'changjing/zafjkkt45sslbz51.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10641, '城堡内部', 'inside the castle', 'changjing/9ny0k5snopkj2jq7.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10642, '图书馆背景', 'library background', 'changjing/wlhz7ouz647ewddr.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10643, '城市', 'city', 'changjing/4bpntxs2l0jjqe84.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10644, '城市公园', 'City park', 'changjing/3ypesf4s29pu306w.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10645, '外星地貌', 'Extraterrestriallandscape', 'changjing/9f2qq7nbz7cwzyxk.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10646, '外星球', 'Alien planet', 'changjing/f2htd9lnh7e33ww7.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10647, '山脉', 'Mountain', 'changjing/to53qcs5esihhso4.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10648, '宇宙', 'universe I cosmos', 'changjing/aijd5c4k6818t1dj.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10649, '小吃街', 'Snack Street', 'changjing/se04xw615wd8q7uh.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10650, '峡谷', 'Canyon', 'changjing/cejvel0g580qt81h.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10651, '幻想', 'fantasy', 'changjing/p01ketm8438lrywe.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10652, '工业城市', 'Industrial citvscape', 'changjing/is6p532013zqaiyl.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10653, '幽灵镇', 'Ghost town', 'changjing/r9gfhu4gangkrvud.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10654, '巴比伦花园', 'Hanging Gardens of Babylon', 'changjing/awqvnnh36lsjpn4i.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10655, '手扶梯', 'Escalator', 'changjing/pws87q8y9j7rbils.png', 12, '2023-08-20 16:17:40', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10656, '时空隧道', 'Wormhole', 'changjing/g0w3qpnbro63zo99.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10657, '星空夜景', 'Starry night sky', 'changjing/urpc5ldx3l3bwapj.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10658, '教堂内', 'in a church background', 'changjing/u6qqn8l92v77ugu9.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10659, '星云', 'nebula', 'changjing/4a8xjf20bm4vz4ax.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10660, '晨雾中', 'In the morning mist', 'changjing/mv6v7fwhpoaculyg.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10661, '月球空间', 'moonscape', 'changjing/5dm5etngknvaoujd.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10662, '月球景观', 'Lunar landscape', 'changjing/slc34jdcg45wczal.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10663, '末日城市', 'Apocalyptic city', 'changjing/1f05c4zwzlc42zly.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10664, '暗黑地牢', 'dungeon', 'changjing/yt7l8fbjw8umnllm.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10665, '果园', 'Orchard', 'changjing/l6nzte48f50fnnsv.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10666, '校园', 'Campus', 'changjing/ot6zvo3oa0kc3nud.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10667, '梦境', 'Dreamland', 'changjing/x32jsh8h8x7ag5i4.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10668, '梦幻云彩', 'Dreamy clouds', 'changjing/ccij8dixq376vmpr.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10669, '杂草丛生', 'overgrown nature', 'changjing/boxlecrgpqn74k08.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10670, '水晶洞穴', 'Crystal cave', 'changjing/s7msq0vhjjd27zos.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10671, '水下洞穴', 'Underwater cave', 'changjing/iohebklc2uuinzv0.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10672, '水下世界', 'Underwater world', 'changjing/6100ueyxbr5xt8ez.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10673, '歌剧院大厅', 'opera hall', 'changjing/avrhx4kxiwim3mu6.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10674, '河口', 'Estuary', 'changjing/3bedtjofv7lmwbj1.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10675, '河流', 'River', 'changjing/jngg6re2e1dt294z.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10676, '沼泽地', 'Marshland', 'changjing/1tuvrb9bgs865v7t.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10677, '泰姬陵', 'The Taj Mahal', 'changjing/jyfle3gmmzzt88sy.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10678, '瀑布', 'Waterfall', 'changjing/9ukeb7yof37lw8wh.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10679, '洞穴', 'Cave', 'changjing/8huecj5rm5lhzusx.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10680, '炼金室', 'Alchemy Laboratory', 'changjing/ty4a17ifyllaufph.png', 12, '2023-08-20 16:17:39', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10681, '热带天堂', 'Tropical paradise', 'changjing/2degxwc4vdfcjuys.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10682, '熔岩洞穴', 'Lava cave', 'changjing/copkne7g47c4nrxx.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10683, '珠穆朗玛峰', 'Mount Everest', 'changjing/am8uiggp6k2919uq.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10684, '疯狂麦克斯', 'mad max dust scene', 'changjing/dvk1t8b11iuyndz1.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10685, '空中花园', 'Sky garden', 'changjing/94o43gmbiu0jfrsx.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10686, '珊瑚礁', 'Coral reef', 'changjing/dtgy2qovmk54k419.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10687, '美术馆', 'Fine Arts Museum', 'changjing/q87tbt1s4ke5hsur.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10688, '罗马竞技场', 'The Colosseum', 'changjing/k23kfomjo6mo6s6x.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10689, '自由女神', 'The Statue of Liberty', 'changjing/tzl7o1g1zdfpl7ss.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10690, '花园背景', 'garden background', 'changjing/p0xrzg4wmbezyogg.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10691, '篮球场', 'Basketball Court', 'changjing/wgjsvyebs35msikl.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10692, '花田', 'flower field', 'changjing/k7anmtmlyuby59th.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10693, '荒野', 'Wilderness', 'changjing/p1ietkyt11g4800l.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10694, '超现实风景', 'Surreallandscape', 'changjing/k2fbwjs5fro2c0r5.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10695, '迷失废墟', 'Lost ruins', 'changjing/ljiyh2morp9vvswp.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10696, '足球场', 'Soccer field', 'changjing/lps6e0zxj4oiqij0.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10697, '金字塔', 'The Pyramids of Giza', 'changjing/hg0se39fbdljp07y.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10698, '银河', 'galaxy', 'changjing/kmkv85lrnpf4f1gl.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10699, '长城', 'The Great Wall of China', 'changjing/hvjs1ofkaeddkxbf.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10700, '雨林', 'Cloud forest’', 'changjing/5sjylxrjes1uhohm.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10701, '雨天', 'rain', 'changjing/zrvwokmgzyccsczp.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10702, '隧道', 'tunnel', 'changjing/es387o7409wuxakq.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10703, '鬼屋森林', 'Haunted forest', 'changjing/nvyknqbkd5gg30sz.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10704, '魔法城堡', 'Magical castle', 'changjing/514bidehad61ji1h.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10705, '黑洞', 'Black hole', 'changjing/o4pj4aln5ea6au5e.png', 12, '2023-08-20 16:17:38', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10706, '魔法花园', 'Enchanted garden', 'changjing/bhdiuov2s96xqocl.png', 12, '2023-08-20 16:17:37', '2023-12-28 13:54:21', 0, 'changjing', '');
INSERT INTO `df_robot_prompt` VALUES (10707, '艾伦·弗莱彻', 'Alan Fletcher', 'shejishi/xtytvcc6rp8j71fc.png', 12, '2023-08-20 16:17:57', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10708, '阿尔文·勒斯蒂格', 'Alvin Lustig', 'shejishi/94yaa5iov4eahe30.png', 12, '2023-08-20 16:17:57', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10709, '安德烈·查尔斯·布尔', 'Andre-Charles Boulle', 'shejishi/7qu6nbiqem3bc8tf.png', 12, '2023-08-20 16:17:57', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10710, '布兰登·马布利', 'Brandon Mably', 'shejishi/mpgjth4lv4yrhg4d.png', 12, '2023-08-20 16:17:57', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10711, '阿恩·雅各布森', 'Arne Jacobsen', 'shejishi/70n4854p3hfzplp8.png', 12, '2023-08-20 16:17:57', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10712, '白羊座莫罗斯', 'Aries Moross', 'shejishi/k6tjxej2u4r5lr8v.png', 12, '2023-08-20 16:17:57', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10713, '安东尼·伯里尔', 'Anthony Burrill', 'shejishi/lc78ijqymaha5af8.png', 12, '2023-08-20 16:17:57', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10714, '布鲁诺·穆纳里', 'Bruno Munari', 'shejishi/vbxkhnply9hxx8n7.png', 12, '2023-08-20 16:17:57', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10715, '克里斯托夫·尼曼', 'Christoph Niemann', 'shejishi/bo6bq633dbqokr98.png', 12, '2023-08-20 16:17:57', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10716, '克里斯托弗·伍尔', 'Christopher Wool', 'shejishi/qw9ola8hdootv1sj.png', 12, '2023-08-20 16:17:57', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10717, '埃里克·尼切', 'Erik Nitsche', 'shejishi/3kbqjl1mzqhsu567.png', 12, '2023-08-20 16:17:57', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10718, '戴尔·奇胡利', 'Dale Chihuly', 'shejishi/xcgmks2ipppmt3e5.png', 12, '2023-08-20 16:17:57', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10719, '加埃塔诺·佩斯切', 'Gaetano Pesce', 'shejishi/tpyo8hevsj2ci6vb.png', 12, '2023-08-20 16:17:57', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10720, '布赖恩·唐纳利', 'Brian Donnelly', 'shejishi/gempoobcbahmxa50.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10721, '赫布·卢巴林', 'Herb Lubalin', 'shejishi/xjzi9awn01xkmpd4.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10722, '埃里克·斯皮克曼', 'Erik Spiekermann', 'shejishi/1lpgdd577ipmpz1m.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10723, '乔治·詹森', 'Georg Jensen', 'shejishi/t6ynvk9781mectgl.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10724, '乔恩·伯格曼', 'Jon Burgerman', 'shejishi/n9yydhd2ixal4ikz.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10725, '马塞尔·万德斯', 'Marcel Wanders', 'shejishi/nlzy640ssnqr1qw3.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10726, '马西莫·维涅利', 'Massimo Vignelli', 'shejishi/jvz0k9gqg7iupgsx.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10727, '永井一正', 'Kazumasa Nagai', 'shejishi/a6r4qa835s5uxg20.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10728, '李·布鲁姆', 'Lee Broom', 'shejishi/1r3dxuxp307egnht.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10729, '迈克尔·比鲁特', 'Michael Bierut', 'shejishi/1ito5ryn3ku2lfq7.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10730, '内里·奥克斯曼', 'Neri Oxman', 'shejishi/jrjn83lcrb2yd6r9.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10731, '保罗·兰德', 'Paul Rand', 'shejishi/23eqpjy0x1zlx4x5.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10732, '米尔顿·格拉泽', 'Milton Glaser', 'shejishi/ngs83ec0dycs562m.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10733, '保拉·谢尔', 'Paula Scher', 'shejishi/s77kjdvlrhvao71z.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10734, '奥特尔·艾歇尔', 'Otl Aicher', 'shejishi/apuvetbakkyssybj.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10735, '索尔·巴斯', 'Saul Bass', 'shejishi/xst2pz9ropj0ixoo.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10736, '菲利普·斯塔克', 'Philippe Starck', 'shejishi/w7n9cq3prf0vz1yd.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10737, '彼得·萨维尔', 'Peter Saville', 'shejishi/70pvrva6p9zyxg1n.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10738, '雷伊姆斯', 'Ray Eames', 'shejishi/8o1xe7qkpk53pl2h.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10739, '西摩·查瓦斯特', 'Seymour Chwast', 'shejishi/w24zfxl30s2qcww8.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10740, '斯特凡·萨格迈斯特', 'Stefan Sagmeister', 'shejishi/77k29mqpl21khk9w.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10741, '维尔纳·潘顿', 'Verner Panton', 'shejishi/sq4gooxotmm41ksv.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10742, '横尾忠德', 'Tadanori Yokoo', 'shejishi/687vjlor79rjh02z.png', 12, '2023-08-20 16:17:56', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10743, '沃尔夫冈·温加特', 'Wolfgang Weingart', 'shejishi/p0e7pgfthvvgcu8a.png', 12, '2023-08-20 16:17:55', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10744, '威廉·莫里斯', 'William Morris', 'shejishi/6n06serwx863e1dy.png', 12, '2023-08-20 16:17:55', '2023-12-28 13:54:21', 0, 'shejishi', '');
INSERT INTO `df_robot_prompt` VALUES (10745, '阿尔瓦罗-西扎', 'Alvaro Siza', 'jianzhusheji/921nagyia4wqqn7z.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10746, '亚历杭德罗-阿拉维纳', 'Alejandro Aravena', 'jianzhusheji/u5y9vjnf12mnp653.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10747, '伯纳德-楚米', 'Bernard Tschumi', 'jianzhusheji/56yzn320myw61qy2.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10748, '丹尼尔-里伯斯金', 'Daniel Libeskind', 'jianzhusheji/ogvpmlqwgn58j858.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10749, '比雅克-英格尔斯', 'Bjarke Ingels', 'jianzhusheji/yu6hbs33f1zq0in7.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10750, '埃托雷-索特萨斯', 'Ettore Sottsass', 'jianzhusheji/bw8y57rklnoljpot.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10751, 'Isamu Noguch', 'Isamu Noguchi', 'jianzhusheji/v08itgzcrz0vvxe3.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10752, '詹姆斯-斯特林', 'James Stirling', 'jianzhusheji/m2qi9g9bfkv8cwmd.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10753, '丹下健三', 'Kenzo Tange', 'jianzhusheji/tbp044jzfi0s1r50.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10754, '路易斯-卡恩', 'Louis Kahn', 'jianzhusheji/55uqob6313grn9xf.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10755, '勒-柯布西耶', 'Le Corbusier', 'jianzhusheji/oc38h4u1tvv737l1.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10756, '迈克尔-格雷夫斯', 'Michael Graves', 'jianzhusheji/h7c3ixfqkjq011cj.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10757, '彼得-祖姆索尔', 'Peter Zumthor', 'jianzhusheji/bn4l65s2v1c4p3jo.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10758, '史蒂文-霍尔', 'Steven Holl', 'jianzhusheji/km0vnkfd9e2rmmdw.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10759, '扎哈-哈迪德', 'Zaha Hadid', 'jianzhusheji/hdllbr4dvfwn0c3m.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10760, '里卡多-波菲', 'Ricardo Bofill', 'jianzhusheji/mewbid1uzp4dy77e.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10761, '安藤忠雄', 'Tadao Ando', 'jianzhusheji/3h49h6qdwkfssum5.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10762, '圣地亚哥-卡拉特拉瓦', 'Santiago Calatrava', 'jianzhusheji/ghatzriruku39khq.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10763, '阿道夫-卢斯', 'Adolf Loos', 'jianzhusheji/1tpnhxbb6o9h2fji.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10764, '安东尼-高迪', 'Antoni Gaudi', 'jianzhusheji/e13qwvh6wile1ulo.png', 12, '2023-08-20 16:18:05', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10765, '大卫-奇普菲尔德', 'David Chipperfield', 'jianzhusheji/vjcj1qdcwye1buoj.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10766, '巴克明斯特-富勒', 'Buckminster Fuller', 'jianzhusheji/0umtfyc0sesmeok2.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10767, '埃罗-沙里宁', 'Eero Saarinen', 'jianzhusheji/oa6ieth80yaxn7d3.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10768, '阿尔瓦-阿尔托', 'Alvar Aalto', 'jianzhusheji/kodrgry6r3bmed2t.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10769, '弗兰克-盖里', 'Frank Gehry', 'jianzhusheji/9ngjcmhi9ju3abyx.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10770, '哈里-塞德勒', 'Harry Seidler', 'jianzhusheji/miful326qr1su217.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10771, '让-努维尔', 'Jean Nouvel', 'jianzhusheji/3fomargzed0cbypu.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10772, '康斯坦丁-梅尔尼科夫', 'Konstantin Melnikov', 'jianzhusheji/m0twy2g7nhnrnbwi.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10773, '隈研吾', 'Kengo Kuma', 'jianzhusheji/dlye53jgc6aoijz5.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10774, '路德维希-密斯-凡德罗', 'Ludwig Mies van der Rohe', 'jianzhusheji/xd24g6ore3chfdb8.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10775, '路易-沙利文', 'Louis Sullivan', 'jianzhusheji/twb680yfi9m5byp6.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10776, '马塞尔-布劳尔', 'Marcel Breuer', 'jianzhusheji/zj0d82q6bnj892qm.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10777, '弗兰克-劳埃德-赖特', 'Frank Lloyd Wright', 'jianzhusheji/yx6kio1t3omcmsdl.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10778, '诺曼-福斯特', 'Norman Foster', 'jianzhusheji/etvllq72m91d2m1y.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10779, '摩西-萨夫迪', 'Moshe Safdie', 'jianzhusheji/05gqd3juyqtkoycv.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10780, '奥斯卡-尼迈耶', 'Oscar Niemeyer', 'jianzhusheji/6a5t5441s40qk6eu.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10781, '奥托-瓦格纳', 'Otto Wagner', 'jianzhusheji/uubt08z9bp1dc9ef.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10782, '保罗-索莱里', 'Paolo Soleri', 'jianzhusheji/4l3odh3yl9lq28ws.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10783, '菲利普-约翰逊', 'Philip Johnson', 'jianzhusheji/7gyl5h50i6o9f5ac.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10784, '雷姆-库哈斯', 'Rem Koolhaas', 'jianzhusheji/ducgxqtvwvbupyf9.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10785, '伦佐-皮亚诺', 'Renzo Piano', 'jianzhusheji/btiebp4prdn2vp76.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10786, '罗伯特-文丘里', 'Robert Venturi', 'jianzhusheji/6d3d4ogis554kx12.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10787, '理查德-迈尔', 'Richard Meier', 'jianzhusheji/dlvxb00n1n0sk1gt.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10788, '理查德-罗杰斯', 'Richard Rogers', 'jianzhusheji/pkh29cjqwlv0wl1m.png', 12, '2023-08-20 16:18:04', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10789, '坂茂', 'Shigeru Ban', 'jianzhusheji/l4h74gt1wej5t3lq.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10790, '伊东丰雄', 'Toyo Ito', 'jianzhusheji/bkfqq2ndfen9m8la.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10791, '瓦莱里奥-奥尔贾蒂', 'Valerio Olgiati', 'jianzhusheji/u5yynhochlxd0khl.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10792, '文森特-卡莱博特', 'Vincent Callebaut', 'jianzhusheji/ah1rxjorzk13py39.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10793, '维克托-奥尔塔', 'Victor Horta', 'jianzhusheji/rvk8n95mnq1aw5i6.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10794, '沃尔特-格罗皮乌斯', 'Walter Gropius', 'jianzhusheji/fxp5i2y15bv1j1fz.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10795, '丹麦室内', 'danish interior design', 'jianzhusheji/d0znkmuzivwh9059.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10796, '参数化室内', 'parametric interior design', 'jianzhusheji/4yemqzcqam5w7wcp.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10797, '中式赛博', 'Chinese cyberpunk architecture', 'jianzhusheji/3tmqz7do8fa5wmgo.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10798, '基克拉迪', 'cycladic interior design', 'jianzhusheji/rwnpaywiur5r59cm.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10799, '当代建筑', 'contemporary architecture', 'jianzhusheji/zbs0mq8701y8r1m5.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10800, '戈吉建筑', 'googie architecture', 'jianzhusheji/9424txi5dw0yvokc.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10801, '戈吉室内', 'googie interior design', 'jianzhusheji/1pb8ytdosbr5oby3.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10802, '复古室内', 'retro interior design', 'jianzhusheji/x66hz20s758rhbaz.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10803, '新未来主义', 'neofuturistic architecture', 'jianzhusheji/pm83v89eks3qxbba.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10804, '极简主义', 'minimal interior design', 'jianzhusheji/4zol4we1awvgs48b.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10805, '植物亲和力', 'biophilic interior design', 'jianzhusheji/t9qicxobccp4z8xs.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10806, '理性主义', 'rationalist architecture', 'jianzhusheji/ed0vf9be41n385qg.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10807, '理性主义', 'rationalist interior design', 'jianzhusheji/xsupek7th6b2tsps.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10808, '芭比室内', 'barbie interior design', 'jianzhusheji/9tyhv8o787ptsssp.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10809, '粉彩色室内', 'pastel interior design', 'jianzhusheji/mn3dxbsj3a0px4sa.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10810, '参数化建筑', 'parametric architecture', 'jianzhusheji/vehyprpb9cgp2y9f.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10811, '新未来主义', 'neo futuristic interior design', 'jianzhusheji/9m9fr2pg0mlv0iec.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10812, '包豪斯室内', 'bauhaus interior design', 'jianzhusheji/ifk527d7rm9ut3ma.png', 12, '2023-08-20 16:18:03', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10813, '新艺术运动', 'art nouveau architecture', 'jianzhusheji/p7yaumhokentfg7s.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10814, '现代中式', 'Modern Chinese architecture', 'jianzhusheji/1kmy62m0xiu7rs38.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10815, '禅宗室内', 'zen interior design', 'jianzhusheji/agrpit4jpycwy1xl.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10816, '日式园林', 'japanese garden', 'jianzhusheji/gyfmgdg4iwzepbxg.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10817, '北欧建筑', 'scandinavian architecture', 'jianzhusheji/2qk8g7ptn7dxmsuv.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10818, '北欧室内', 'scandinavian interior design', 'jianzhusheji/uotwwydn1wj7gm9i.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10819, '印度风情', 'indian vibrancy interior design', 'jianzhusheji/ujpb0f7qr6xoenkf.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10820, '华丽室内', 'splendour interior design', 'jianzhusheji/j7pi6zl9wtmcysvl.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10821, '哥特式建筑', 'gothic architecture', 'jianzhusheji/e3a7r5o6wdcftfas.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10822, '解构主义', 'deconstructivism architecture', 'jianzhusheji/q9s9he01b9yxsthq.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10823, '基克拉迪', 'cycladic architecture', 'jianzhusheji/8iit99maf29o0um9.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10824, '奥拓瓦格纳', 'otto wagner architecture', 'jianzhusheji/zgrm73dydji0oh9c.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10825, '工业风', 'industrial interior design', 'jianzhusheji/w31qaw2rbhy9d861.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10826, '折衷主义', 'eclectic interior design', 'jianzhusheji/x7svwms93fsw6l95.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10827, '日式混北欧', 'japandi architecture', 'jianzhusheji/zxs5jtmih4sche4h.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10828, '日式混北欧', 'japandi interior design', 'jianzhusheji/oqeb2o5yqgs74l07.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10829, '极限主义', 'maximalism interior design', 'jianzhusheji/bx64vbqf521tqan0.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10830, '现代中式', 'Modern Chinese interior', 'jianzhusheji/z967nlgke7wfa4o4.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10831, '草原景观', 'prairie landscape design', 'jianzhusheji/x7lnrt3uo8ymm9dh.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10832, '禅宗', 'zen architecture', 'jianzhusheji/rmjghrg8gs7npsxr.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10833, '未来主义', 'futuristic interior design', 'jianzhusheji/4fv8hcuyippujnop.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10834, '古代中式', 'Ancient Chinese Architecture', 'jianzhusheji/8fgq42qebw98f5gk.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10835, '洛可可', 'rococo interior design', 'jianzhusheji/s872i0b6uiusnxef.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10836, '地中海室内', 'mediterranean interior design', 'jianzhusheji/p45n0pl4xo3mo79k.png', 12, '2023-08-20 16:18:02', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10837, '现代农舍', 'modern farmhouse interior design', 'jianzhusheji/920pedm3gfrmynca.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10838, '乔治亚式', 'georgian interior design', 'jianzhusheji/xq1vdtznve2b6tac.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10839, '海滨室内', 'coastal interior design', 'jianzhusheji/o4faon4wj0xat6k4.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10840, '乡村小屋', 'cottage', 'jianzhusheji/akd0w0nihaaif2kn.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10841, '农舍', 'farmhouse', 'jianzhusheji/2uu2hj3md3x6jy6u.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10842, '农舍室内', 'farmhouse interior design', 'jianzhusheji/jzy1ed9id6v3hpsy.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10843, '冰屋', 'igloo', 'jianzhusheji/leqvff37k7zgq345.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10844, '克里奥尔房', 'creole cottage architecture', 'jianzhusheji/1b9n5xm0nea2ee3k.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10845, '单户住宅', 'single family house', 'jianzhusheji/9t7rxbfk28masnch.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10846, '卫所殖民地', 'garrison colonial architecture', 'jianzhusheji/nrcasnyc9tdgkrno.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10847, '印度式建筑', 'indian architecture', 'jianzhusheji/a5n5twhhh7nozznk.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10848, '地中海复兴', 'mediterranean revival architecture', 'jianzhusheji/zp7jns7gezorgyio.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10849, '印度风情', 'indian vibrancy architecture', 'jianzhusheji/ywocx86yuylrvonq.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10850, '可持续建筑', 'sustainable architecture', 'jianzhusheji/5h5z3t26vqwq5x1j.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10851, '奥斯曼式', 'ottoman architecture', 'jianzhusheji/52ac8hxm3qo4al0x.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10852, '小木屋', 'cabin', 'jianzhusheji/e8raiza4uael11as.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10853, '工匠建筑', 'craftsman architecture', 'jianzhusheji/f44ukwvbda7eyxp2.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10854, '巴洛克建筑', 'baroque architecture', 'jianzhusheji/ddkraadn27lzlooo.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10855, '山林小屋', 'lodge', 'jianzhusheji/qsy2hmgg7ymgipal.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10856, '希腊复兴式', 'greek revival interior design', 'jianzhusheji/d7jk4awcofpfw77m.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10857, '希腊复兴式', 'greek revival architecture', 'jianzhusheji/mtjms8w03m2wjcm4.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10858, '希腊式', 'greek architecture', 'jianzhusheji/ctbrgft7au741ixg.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10859, '平房', 'bungalow', 'jianzhusheji/ys0yy7kg32e7kays.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10860, '弗兰芒', 'flemish interior design', 'jianzhusheji/wn7jdu3rqri9jvhr.png', 12, '2023-08-20 16:18:01', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10861, '当代室内', 'contemporary interior design', 'jianzhusheji/7b4lmt9ituqxx3x3.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10862, '希腊式', 'greek interior design', 'jianzhusheji/ac2m885rwz9fc6g5.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10863, '德国殖民地', 'german colonial architecture', 'jianzhusheji/7wt31671mbtcmd2u.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10864, '战前建筑', 'antebellum architecture', 'jianzhusheji/8x640ypw1sssp84r.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10865, '摩尔式室内', 'moorish interior design', 'jianzhusheji/tyl9ldjbw5ldsxst.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10866, '摩尔式', 'moorish architecture', 'jianzhusheji/wcu0rcppitnip3me.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10867, '摩尔式复兴', 'moorish revival architecture', 'jianzhusheji/el3lb3nm6phrisa1.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10868, '斯大林主义', 'stalinist architecture', 'jianzhusheji/fautmzjzprpbio5j.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10869, '摩洛哥风', 'moroccan interior design', 'jianzhusheji/3fwhbb4i61rlwt12.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10870, '新石器时代', 'neolithic interior design', 'jianzhusheji/azah419nsw8sk8xj.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10871, '普韦布洛', 'pueblo architecture', 'jianzhusheji/e3f3tp7c4x3sbltj.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10872, '普韦布洛', 'pueblo interior design', 'jianzhusheji/ihxwlft3lxxpl5v9.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10873, '暗黑学风', 'dark academia interior design', 'jianzhusheji/w4qqt4fu82v9b4e8.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10874, '柱厅式', 'hypostyle architecture', 'jianzhusheji/9sjoc8ra287gr5su.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10875, '木工哥特式', 'carpenter gothic architecture', 'jianzhusheji/wh3oq77td6hhzvvy.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10876, '殖民地建筑', 'colonial architecture', 'jianzhusheji/j15p1jjrew46momz.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10877, '新石器时代', 'neolithic architecture', 'jianzhusheji/8o9le3mupejc7tn8.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10878, '法式乡村', 'french country interior design', 'jianzhusheji/w8utytvtny9cbh8m.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10879, '法式花园', 'french garden', 'jianzhusheji/1gcrgq6pbq0eyw7e.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10880, '热带景观', 'tropical landscape design', 'jianzhusheji/d5hsor925i3y04ha.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10881, '波西米亚风', 'boho interior design', 'jianzhusheji/3adghxd4h4dy8hso.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10882, '甘丹房屋', 'rumah gadang architecture', 'jianzhusheji/5a86lnyqb0kbvvsb.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10883, '洛可可', 'rococo architecture', 'jianzhusheji/eah3ya8w0pfflxa0.png', 12, '2023-08-20 16:18:00', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10884, '童话故事', 'storybook architecture', 'jianzhusheji/frw6r45tc0u49clf.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10885, '皮拉蒂安', 'palladian interior design', 'jianzhusheji/tzimswir8hmjy03g.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10886, '美术学院派', 'beauxarts architecture', 'jianzhusheji/6fltcrz5j6jx9q70.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10887, '翼子板建筑', 'bay and gable architecture', 'jianzhusheji/2rwp6n0lqixexpu4.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10888, '美院派室内', 'beauxarts interior design', 'jianzhusheji/oj72vorghud6l21w.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10889, '船舶风格', 'nautical interior design', 'jianzhusheji/c1xhrh1umi870evs.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10890, '蒙特利殖民', 'mediterranean revival architecture', 'jianzhusheji/gw313cs99cy592kr.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10891, '荷兰殖民地', 'dutch colonial architecture', 'jianzhusheji/h5bvqqbpprzpufp7.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10892, '联邦式建筑', 'federal architecture', 'jianzhusheji/7jzvwdgnpiqzd854.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10893, '蒂雷克多尔', 'directoire interior design', 'jianzhusheji/aeao9zpri7sglynd.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10894, '装饰艺术', 'art deco interior design', 'jianzhusheji/prt517kfk8p30yxi.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10895, '装饰艺术', 'art deco architecture', 'jianzhusheji/fa7m50hy2fqukyow.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10896, '里亚德式', 'riad architecture', 'jianzhusheji/ejcbl7kk3s1ognmp.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10897, '西南室内', 'southwestern interior design', 'jianzhusheji/b02egkdxja3q8cie.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10898, '金字塔', 'pyramid', 'jianzhusheji/b8op61koligu1e69.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10899, '雅各宾式', 'jacobean interior design', 'jianzhusheji/bdexb0dx71wyc3sz.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10900, '非洲中心', 'afrocentric interior design', 'jianzhusheji/1xvporn54fd71uvx.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10901, '阿拉伯室内', 'arabic interior design', 'jianzhusheji/ypba1ogq30713oyk.png', 12, '2023-08-20 16:17:59', '2023-12-28 13:54:21', 0, 'jianzhusheji', '');
INSERT INTO `df_robot_prompt` VALUES (10902, '安·德穆勒米斯特', 'Ann Demeulemeester', 'shishangsheji/ap4p0nl27zqxjazr.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10903, '比尔·布拉斯', 'Bill Blass', 'shishangsheji/4tspy3rbcag33rw4.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10904, '卡罗琳娜·海莱娜', 'Carolina Herrera', 'shishangsheji/8rzcz9bh8x04i2t1.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10905, '贝西·约翰逊', 'Betsey Johnson', 'shishangsheji/pw7d4kxpe929v47v.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10906, '亚历山大·麦昆', 'Alexander McQueen', 'shishangsheji/eew91wo1oyjlto6y.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10907, '卡尔文·克莱恩', 'Calvin Klein', 'shishangsheji/kggj9599w008smti.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10908, '克里斯托瓦尔·巴伦西亚加', 'Cristobal Balenciaga', 'shishangsheji/lj00lgtkbvr93xvm.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10909, '克里斯蒂安·拉克鲁瓦', 'Christian Lacroix', 'shishangsheji/e49afm661mbh31nm.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10910, '可可香奈儿', 'Coco Chanel', 'shishangsheji/254vhsviumaslflx.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10911, '德姆纳·格瓦萨利亚', 'Demna Gvasalia', 'shishangsheji/9frdc6ua8jp94v9h.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10912, '克里斯汀·迪奥', 'Christian Dior', 'shishangsheji/a9dmedhag2y2d2dr.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10913, '杜嘉班纳', 'Dolce Gabbana', 'shishangsheji/cy19vcy05767v7jg.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10914, '杜罗·奥洛乌', 'Duro Olowu', 'shishangsheji/p370rarikil9appw.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10915, '石冈英子', 'Eiko Ishioka', 'shishangsheji/lkapmtx9pebumuwe.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10916, '唐娜·卡兰', 'Donna Karan', 'shishangsheji/h4s24sa10kgvay24.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10917, '埃利·萨博', 'Elie Saab', 'shishangsheji/hhjwvqoqcsakqq6t.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10918, '黛安·冯芙丝汀宝', 'Diane von Furstenberg', 'shishangsheji/79okk6p31tq5ef0v.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10919, '埃米利奥·普奇', 'Emilio Pucci', 'shishangsheji/8ymxlvqcw2nnrft5.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10920, '加雷斯·普格', 'Gareth Pugh', 'shishangsheji/3axe86x2emijmt52.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10921, '埃斯特万·科塔萨尔', 'Esteban Cortazar', 'shishangsheji/4t4fv0chtsoa64nn.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10922, '詹尼·范思哲', 'Gianni Versace', 'shishangsheji/by5fk1d9lcbcxeck.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10923, '乔治·阿玛尼', 'Giorgio Armani', 'shishangsheji/4h2fjf6svlt6fvws.png', 12, '2023-08-20 16:18:30', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10924, '霍尔斯顿', 'Halston', 'shishangsheji/vs8wtzz5u1zkyvgp.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10925, '古驰', 'Gucci', 'shishangsheji/gbzeenrdg798yx6d.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10926, '郭培', 'Guo Pei', 'shishangsheji/ir4hklr19tgqvpj6.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10927, '海德尔·阿克曼', 'Haider Ackermann', 'shishangsheji/fspclasqipw77ibc.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10928, '森花惠', 'Hanae Mori', 'shishangsheji/l0l9gxjsxoyeeg07.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10929, '小筱弘子', 'Hiroko Koshino', 'shishangsheji/iathbhqj2j4f0aqu.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10930, '三宅一生', 'Issey Miyake', 'shishangsheji/nrupa7zh5q1zleli.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10931, '艾里斯·范赫本', 'Iris van Herpen', 'shishangsheji/2x81wj4d4ywg22xw.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10932, '让·保罗·高提耶', 'Jean Paul Gaultier', 'shishangsheji/4oakhm30q8q44qia.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10933, '休伯特·德·纪梵希', 'Hubert de Givenchy', 'shishangsheji/ekkj02pgmh4nygw9.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10934, '吉尔·桑德', 'Jil Sander', 'shishangsheji/f2dnfyqj5o1wh3ei.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10935, '约翰·加利亚诺', 'John Galliano', 'shishangsheji/72uysfwieuja76xw.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10936, '约翰·瓦维托斯', 'John Varvatos', 'shishangsheji/99mzkn3hu4c0qk53.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10937, '周仰杰', 'Jimmy Choo', 'shishangsheji/o4i6lzvo8fx1ahs2.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10938, '乔·凯斯利-海福德', 'Joe Casely-Hayford', 'shishangsheji/abxu7316amn681y8.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10939, '马克·雅各布斯', 'Marc Jacobs', 'shishangsheji/k35ur7nfcw2jmgzv.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10940, '卡尔·拉格菲尔德', 'Karl Lagerfeld', 'shishangsheji/jdr1jmqnlw9bfnxt.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10941, '渡边纯也', 'Junya Watanabe', 'shishangsheji/5haid6d2wb9qb5uk.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10942, '克比·吉恩·雷蒙德', 'Kerby Jean-Raymond', 'shishangsheji/urz4ykovtgbrgz9l.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10943, '玛丽·卡特兰佐', 'Mary Katrantzou', 'shishangsheji/rcxgip4tyif1pi7k.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10944, '缪西娅·普拉达', 'Miuccia Prada', 'shishangsheji/60v29p1id57hx2gq.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10945, '奥利维尔·鲁斯廷', 'Olivier Rousteing', 'shishangsheji/xdktpo9yf7l2cqj0.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10946, '迈克尔·科尔斯', 'Michael Kors', 'shishangsheji/9xjlzam5tpqlqbv3.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10947, '奥斯卡·德拉伦塔', 'Oscar de la Renta', 'shishangsheji/2jp9j2zzdgpgwiim.png', 12, '2023-08-20 16:18:29', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10948, '尼戈', 'Nigo', 'shishangsheji/g64fk45qkce37q77.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10949, '奥塔维奥·米索尼', 'Ottavio Missoni', 'shishangsheji/7xj9i2717mwq52lr.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10950, '皮埃尔·巴尔曼', 'Pierre Balmain', 'shishangsheji/twip4y36wc9e2f4h.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10951, '帕特里克·凯利', 'Patrick Kelly', 'shishangsheji/nwdoht4r2oemqje9.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10952, '菲比·菲罗', 'Phoebe Philo', 'shishangsheji/9l8t45wfhi3hxa3q.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10953, '皮尔卡丹', 'Pierre Cardin', 'shishangsheji/u0iutshtli34q7s1.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10954, '拉夫·西蒙斯', 'Raf Simons', 'shishangsheji/z2eau4zryh17vq8u.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10955, '拉尔夫·劳伦', 'Ralph Lauren', 'shishangsheji/4amjdlm2f7flmkge.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10956, '奥兹瓦尔德·博阿滕', 'Ozwald Boateng', 'shishangsheji/8opgnzh8pag9hn4w.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10957, '里卡多·蒂西', 'Riccardo Tisci', 'shishangsheji/gzhaa49g5oygxde3.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10958, '川久保玲', 'Rei Kawakubo', 'shishangsheji/kvj01f4az61ffvr4.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10959, '瑞克·欧文斯', 'Rick Owens', 'shishangsheji/wiili9qajekhqeja.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10960, '史蒂芬·伯罗斯', 'Stephen Burrows', 'shishangsheji/qdt88myk0c7i5f50.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10961, '蒂埃里·穆勒', 'Thierry Mugler', 'shishangsheji/psydbi66rh9pkeji.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10962, '汤米希尔费格', 'Tommy Hilfiger', 'shishangsheji/yslt6f7evao00w83.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10963, '斯特凡诺·嘉巴纳', 'Stefano Gabbana', 'shishangsheji/h7xi45m5j2vmr2pw.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10964, '汤姆·福特', 'Tom Ford', 'shishangsheji/qk9dsvjh0sa8u1bg.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10965, '薇薇安·韦斯特伍德', 'Vivienne Westwood', 'shishangsheji/x808t7dzv74wfpwr.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10966, '椰子', 'Yeezy', 'shishangsheji/3ckf9rlkzyxk9flh.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10967, '沃尔特·范·贝伦东克', 'Walter Van Beirendonck', 'shishangsheji/khp8lefoc6qtcd2v.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10968, '维吉尔·阿布洛', 'Virgil Abloh', 'shishangsheji/cjcppp7wdqaf63cd.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10969, '斯特拉·麦卡特尼', 'Stella McCartney', 'shishangsheji/nwk7ovihqhf7qydy.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10970, '山本耀司', 'Yohji Yamamoto', 'shishangsheji/6kxlhti3hfnf7zxy.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10971, '安东尼·利斯特', 'Anthony Lister', 'jietouyishu/x4bh6hn9b1c6hitu.png', 12, '2023-08-20 16:18:34', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10972, '伊夫圣罗兰', 'Yves Saint-Laurent', 'shishangsheji/6mlkd2gt57lcjz0s.png', 12, '2023-08-20 16:18:28', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10973, '阿图尔·博尔达洛', 'Artur Bordalo', 'jietouyishu/isc01kpr3ifds6xn.png', 12, '2023-08-20 16:18:34', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10974, '班克斯', 'Banksy', 'jietouyishu/xipu054gzijvs3mv.png', 12, '2023-08-20 16:18:34', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10975, '扎克·波森', 'Zac Posen', 'shishangsheji/fqxuovuhm01rhi6v.png', 12, '2023-08-20 16:18:27', '2023-12-28 13:54:21', 0, 'shishangsheji', '');
INSERT INTO `df_robot_prompt` VALUES (10976, '巴里·麦吉', 'Barry McGee', 'jietouyishu/oklm54bj308xq361.png', 12, '2023-08-20 16:18:34', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10977, '维尔斯', 'Vhils', 'jietouyishu/y6608ilx1441r4vw.png', 12, '2023-08-20 16:18:34', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10978, '卡米尔瓦拉拉', 'Camille Walala', 'jietouyishu/fnebdpnnapvsub2l.png', 12, '2023-08-20 16:18:34', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10979, '侵略者', 'Invader', 'jietouyishu/nwfkloy3utqpuc4m.png', 12, '2023-08-20 16:18:34', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10980, '爱德华多·科布拉', 'Eduardo Kobra', 'jietouyishu/di0x26q8f6tn964v.png', 12, '2023-08-20 16:18:34', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10981, '霍帕雷', 'Hopare', 'jietouyishu/s7zovvz3eukod14h.png', 12, '2023-08-20 16:18:34', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10982, '欧内斯特·扎查雷维奇', 'Ernest Zacharevic', 'jietouyishu/fhcjcjp3zvu2gf6f.png', 12, '2023-08-20 16:18:34', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10983, '詹姆斯·布洛', 'James Bullough', 'jietouyishu/zc3zgqzl84jdab1j.png', 12, '2023-08-20 16:18:34', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10984, 'C215', 'C215', 'jietouyishu/0oph3o4tsl5oiu68.png', 12, '2023-08-20 16:18:34', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10985, '爱丽丝·帕斯奎尼', 'Alice Pasquini', 'jietouyishu/eqb7sram22nby8ke.png', 12, '2023-08-20 16:18:34', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10986, '奥戴斯', 'Odeith', 'jietouyishu/k9skwmo2tz53x0bs.png', 12, '2023-08-20 16:18:33', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10987, '尼克·沃克', 'Nick Walker', 'jietouyishu/v8iiretkist85xgh.png', 12, '2023-08-20 16:18:33', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10988, '马丁·沃特森', 'Martin Whatson', 'jietouyishu/urafmgcsz9m47bgf.png', 12, '2023-08-20 16:18:33', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10989, '资产回报率', 'ROA', 'jietouyishu/lfggydxbp1lee4uk.png', 12, '2023-08-20 16:18:33', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10990, '勒瓦莱特', 'Levalet', 'jietouyishu/thnvqfrn9kpxq0sn.png', 12, '2023-08-20 16:18:33', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10991, '罗恩·英格利希', 'Ron English', 'jietouyishu/mhzqj0zjyxjvmk46.png', 12, '2023-08-20 16:18:33', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10992, '雷特纳', 'Retna', 'jietouyishu/6tedtnebx0yljyzf.png', 12, '2023-08-20 16:18:33', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10993, '谢泼德·费尔雷', 'Shepard Fairey', 'jietouyishu/qj086opd5yxk7po9.png', 12, '2023-08-20 16:18:33', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10994, '塔蒂亚娜·苏亚雷斯', 'Tatiana Suarez', 'jietouyishu/miberkeeck7zxr8n.png', 12, '2023-08-20 16:18:33', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10995, '特里斯坦·伊顿', 'Tristan Eaton', 'jietouyishu/ajqmz9cpjhqyloam.png', 12, '2023-08-20 16:18:33', '2023-12-28 13:54:21', 0, 'jietouyishu', '');
INSERT INTO `df_robot_prompt` VALUES (10996, '抽象表现主义', 'Abstract expressionism', 'yishuliupai/94camihr6k5ck66t.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (10997, '艺术装饰', 'Art Deco', 'yishuliupai/iiry0lp0h5fkr3o2.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (10998, '天文朋克', 'Astropunk', 'yishuliupai/ycu5p0ribsbjozks.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (10999, '非洲未来主义', 'Afrofuturism', 'yishuliupai/sse7adds4a6fkkd5.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11000, '装饰艺术建筑', 'Art Deco architecture', 'yishuliupai/efq9xmcnwkwp1x56.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11001, '赛博朋克', 'Cyberpunk', 'yishuliupai/uvvggd556exmseig.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11002, '故障艺术', 'Glitch art', 'yishuliupai/f94smbggzu3xe9q8.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11003, '数字拼贴', 'Digital collage', 'yishuliupai/vq3pcji3wjj056f4.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11004, '未来主义', 'Futurism', 'yishuliupai/dlcc2vu0b3cyz76i.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11005, '戈普尼克时尚', 'Gopnik fashion', 'yishuliupai/a8k0egie2e1lzmoo.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11006, '高科技建筑', 'High-tech architecture', 'yishuliupai/da0p8gtpxhbv8tch.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11007, '字母主义', 'Letterism', 'yishuliupai/xttmy5v1uvbdjznh.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11008, '极简主义建筑', 'Minimalist architecture', 'yishuliupai/w359tz0nhy4aifus.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11009, '爱奥尼亚建筑', 'Ionian architecture', 'yishuliupai/8ch417cms1wuu7my.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11010, '极简主义', 'Minimalism', 'yishuliupai/kryuywaqqg8fdzoo.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11011, '后极简主义', 'Postminimalism', 'yishuliupai/dkdpfxvpkgiony5w.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11012, '现代主义', 'Modernism', 'yishuliupai/r6d9i8ccjpguhi6x.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11013, '超现实主义', 'Surrealism', 'yishuliupai/eu41bb1q2vb5msp0.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11014, '后现代建筑', 'Postmodern architecture', 'yishuliupai/rmgkjli0jdiv4dsk.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11015, '1910 年代时尚', '1910s fashion', 'yishuliupai/9a12cd8d3yn6kqe7.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11016, '20 年代时尚', '1920s fashion', 'yishuliupai/q3mv1a9q64i5w2os.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11017, '20世纪30年代时尚', '1930s fashion', 'yishuliupai/wpf4uzk8a1m48xkc.png', 12, '2023-08-20 16:18:43', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11018, '20 世纪 40 年代时', '1940s fashion', 'yishuliupai/v5c5psocahvgcjr9.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11019, '20 世纪 50 年代时', '1950s fashion', 'yishuliupai/bkl6ry4a2yh8n3qm.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11020, '20 世纪 70 年代时', '1970s fashion', 'yishuliupai/3xbt7pc3b0g59zgv.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11021, '20世纪90年代时尚', '1990s fashion', 'yishuliupai/fcr3er271ib640jn.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11022, '20 世纪 60 年代时', '1960s fashion', 'yishuliupai/6fgiqhfojb1ylj86.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11023, '20 世纪 80 年代时', '1980s fashion', 'yishuliupai/5jpn1tkd7qtv6wa1.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11024, '2000 年代时尚', '2000s fashion', 'yishuliupai/40ve4q1y90ct0hk1.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11025, '2020年代时尚', '2020s fashion', 'yishuliupai/fflnaje4zkcj26me.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11026, '2010年代时尚', '2010s fashion', 'yishuliupai/wxk3qhfh7j5z4frx.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11027, '建筑摄影', 'Architectural photography', 'yishuliupai/6wdl3kh61decp2w7.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11028, '生态学', 'Arcology', 'yishuliupai/7n6c2ulgno2y1gfv.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11029, 'ASCII 艺术', 'ASCII art', 'yishuliupai/44gonc52cyx2whbd.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11030, '现代艺术建筑', 'Art Moderne architecture', 'yishuliupai/sshg5aikpq1melld.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11031, '前卫时尚', 'Avant-garde fashion', 'yishuliupai/w09rpp84bhu4f7gt.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11032, '生物朋克', 'Biopunk', 'yishuliupai/iwskgf5we2ufnn7c.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11033, '概念艺术', 'Concept art', 'yishuliupai/sdcqq7loza3g8eca.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11034, '野蛮主义', 'Brutalism', 'yishuliupai/0igiwjr43qkii9jz.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11035, '风格派', 'De Stijl', 'yishuliupai/kfsk4eij0ta73vbj.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11036, '建构主义建筑', 'Constructivist architecture', 'yishuliupai/7gfdp1c4fi0ilupf.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11037, '折衷主义建筑', 'Eclectic architecture', 'yishuliupai/ux2pds31lqpyihyl.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11038, '嘻哈时尚', 'Hip Hop fashion', 'yishuliupai/es3sq63fub13g7sc.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11039, '垃圾时尚', 'Grunge fashion', 'yishuliupai/09tk0h243bcqavq5.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11040, '高级时装时尚', 'Haute couture fashion', 'yishuliupai/cj341ecc7hsc6ocm.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11041, '原宿时尚', 'Harajuku fashion', 'yishuliupai/egcsjybso2eqsp6d.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11042, '韩国流行时尚', 'K-pop fashion', 'yishuliupai/g7agtzxkspszy9aq.png', 12, '2023-08-20 16:18:42', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11043, '抽象主义', 'Abstract art', 'yishuliupai/gwc33504qjo7f6rb.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11044, '航拍', 'Aerial photography', 'yishuliupai/5trsybs3oclu3kd0.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11045, '古代艺术', 'Ancient art', 'yishuliupai/w8u04vw2c5uk72br.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11046, '新艺术风格', 'Art Nouveau', 'yishuliupai/nog2e21aitwqfbs8.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11047, '新艺术风格建筑', 'Art Nouveau architecture', 'yishuliupai/mdt1ci5jr9wcc20s.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11048, '原子朋克', 'Atompunk', 'yishuliupai/qxl1fitxbqrr9f1f.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11049, '天文摄影', 'Astrophotography', 'yishuliupai/wej1q3tjmptsn23a.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11050, '巴洛克式建筑', 'Baroque architecture', 'yishuliupai/b9vja70wkhv2gvs8.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11051, '包豪斯', 'Bauhaus', 'yishuliupai/11i2g57dgp49rb0i.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11052, '垮掉的一代时尚', 'Beatnik fashion', 'yishuliupai/qczf2tak202yx26c.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11053, '巴洛克风格', 'Baroque', 'yishuliupai/wjntuxkv5k5z1w80.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11054, '波西米亚风时尚', 'Boho fashion', 'yishuliupai/crxeqj09uy3gk68y.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11055, '铸铁结构', 'Cast-iron architecture', 'yishuliupai/kj50ebe6rjqh60e9.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11056, '拜占庭式建筑', 'Byzantine architecture', 'yishuliupai/f3wcrpymckbql1p6.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11057, '骑车时尚', 'Biker fashion', 'yishuliupai/jplejb6sge4b2n8w.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11058, '石洞壁画', 'Cave painting', 'yishuliupai/27gadbl7le0qb2b7.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11059, '天主教图标', 'Catholic icon', 'yishuliupai/n0i28tz5qk8l6uuz.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11060, '景泰蓝主义', 'Cloisonnism', 'yishuliupai/mo444yvskhcii0t1.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11061, '建构主义', 'Constructivism', 'yishuliupai/1jevos8v16u5ljey.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11062, '角色扮演时尚', 'Cosplay fashion', 'yishuliupai/d4pcb8q1a9ve2dwp.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11063, '当代艺术', 'Contemporary art', 'yishuliupai/6800lludu0thbmtr.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11064, '黑暗学院时尚', 'Dark Academia fashion', 'yishuliupai/z66u3xi3fbwx2kqt.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11065, '达达运动', 'Dada movement', 'yishuliupai/6h98j793eucacqwv.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11066, '赛博哥特时尚', 'Cybergoth fashion', 'yishuliupai/ga4o9p4zbhtunmmy.png', 12, '2023-08-20 16:18:41', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11067, '水晶立体主义', 'Crystal Cubism', 'yishuliupai/fzy6wlk8ujd8n80v.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11068, '解构主义', 'Deconstructivism', 'yishuliupai/niwuexnuuyphzd7b.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11069, '情绪时尚', 'Emo fashion', 'yishuliupai/hkeyrukiepme6xnu.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11070, '表现主义建筑', 'Expressionist architecture', 'yishuliupai/7l2jicxg48j7fzau.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11071, '仙女凯时尚', 'Fairy Kei fashion', 'yishuliupai/bbuxx2qjvtn3ym4f.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11072, '表现主义', 'Expressionism', 'yishuliupai/j2o122bon4vns1qi.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11073, '柴油朋克', 'Dieselpunk', 'yishuliupai/28r4fxvlcbhni23x.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11074, '野兽派', 'Fauvism', 'yishuliupai/sp9dgjh6niiw8046.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11075, '时尚摄影', 'Fashion photography', 'yishuliupai/q405pxgzglpsxaad.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11076, '法尤姆肖像', 'Fayum portrait', 'yishuliupai/ejmx7y68947dez0x.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11077, '法医摄影', 'Forensic photography', 'yishuliupai/o941hby1arssva0z.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11078, '魅力时尚', 'Glamour fashion', 'yishuliupai/jag0rt74p5uijq7k.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11079, '民间艺术', 'Folk art', 'yishuliupai/fkxsb8bj0kp6ti6m.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11080, '放克艺术', 'Funk art', 'yishuliupai/qbhdapbs10z9ypit.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11081, '哥特时尚', 'Goth fashion', 'yishuliupai/zys4iuk1ld0fsexc.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11082, '分形艺术', 'Fractal art', 'yishuliupai/vw4elmyf0m4o7v7t.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11083, '哥特式建筑', 'Gothic architecture', 'yishuliupai/pwv84ql03r6ze2ql.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11084, '贡德画', 'Gond painting', 'yishuliupai/ltiu9yod7qyn44t8.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11085, '哥特式艺术', 'Gothic art', 'yishuliupai/xo8k1as9qfsypmof.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11086, '格里姆达克', 'Grimdark', 'yishuliupai/it19o4g8gli8gg8i.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11087, '希腊建筑', 'Greek architecture', 'yishuliupai/nb4mj077t89ngr20.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11088, '超现代主义', 'Hypermodernism', 'yishuliupai/y662lpqwdc0p51nr.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11089, '嬉皮时尚', 'Hippie fashion', 'yishuliupai/d2v58o2jcpo5xuxu.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11090, '印象派', 'Impressionism', 'yishuliupai/rtrykj3yisb6imp1.png', 12, '2023-08-20 16:18:40', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11091, '工业摄影', 'Industrial photography', 'yishuliupai/xc8glzbhk7g6z16c.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11092, '卡利亚特绘画', 'Kalighat painting', 'yishuliupai/6ulddprqonrij79i.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11093, '詹姆士一世时期的建筑', 'Jacobean architecture', 'yishuliupai/cfvpfn2l2zo38dec.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11094, '伊斯兰建筑', 'Islamic architecture', 'yishuliupai/8gbmjm0ganmtua2e.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11095, '超现实主义', 'Hyperrealism', 'yishuliupai/08f1pfvmqim9cw6i.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11096, '低保真摄影', 'Lo-fi photography', 'yishuliupai/9zlleukkk7p6nrp9.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11097, '马杜巴尼绘画', 'Madhubani painting', 'yishuliupai/jm8i7vk39w1ajqyp.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11098, '大地艺术', 'Land art', 'yishuliupai/6629wt44pk8oarez.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11099, '魔幻现实主义', 'Magic realism', 'yishuliupai/ng22kt0lojgodpqv.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11100, '洛莫摄影', 'Lomography', 'yishuliupai/73kx6z064x3umjk8.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11101, '巨型结构', 'Megastructure', 'yishuliupai/9iycnljc2e6p4wc3.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11102, '中世纪艺术', 'Medieval art', 'yishuliupai/33hfiwek66z5nylu.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11103, '中世纪建筑', 'Medieval architecture', 'yishuliupai/7p9kuho5i1stekse.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11104, '金属头时尚', 'Metalhead fashion', 'yishuliupai/a14iw6tfibrnkahq.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11105, '现代建筑', 'Modern architecture', 'yishuliupai/y6vkhssnx6jew7rr.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11106, '摩登时尚', 'Mod fashion', 'yishuliupai/yjhl8sodjf959rn2.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11107, '莫卧儿建筑', 'Mughal architecture', 'yishuliupai/9238x7rsv1c1mvd9.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11108, '摩尔式建筑', 'Moorish architecture', 'yishuliupai/bz5wuwp0megly6r0.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11109, '照片', 'Mugshot', 'yishuliupai/kgrvv4tngphvhnfy.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11110, '穆德哈尔建筑', 'Mudejar architecture', 'yishuliupai/54uk1utxqls9m1yl.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11111, '死灵朋克', 'Necropunk', 'yishuliupai/m2pp8gz4d8mm1iom.png', 12, '2023-08-20 16:18:39', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11112, '朴素的艺术', 'Naive art', 'yishuliupai/o4uv8n3py7um6s12.png', 12, '2023-08-20 16:18:38', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11113, '新浪漫主义', 'Neo-romanticism', 'yishuliupai/xlmuyca7zgbrw8pp.png', 12, '2023-08-20 16:18:38', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11114, '新未来主义建筑', 'Neofuturist architecture', 'yishuliupai/j7kipn4teu8b5aov.png', 12, '2023-08-20 16:18:38', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11115, '新古典主义', 'Neoclassicism', 'yishuliupai/w3zi3cgj8ae82p50.png', 12, '2023-08-20 16:18:38', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11116, '新古典主义建筑', 'Neoclassical architecture', 'yishuliupai/ococwcxkaqhz9fcx.png', 12, '2023-08-20 16:18:38', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11117, '规范核心时尚', 'Normcore fashion', 'yishuliupai/hddqfvi8a2463wk1.png', 12, '2023-08-20 16:18:38', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11118, '东方主义', 'Orientalism', 'yishuliupai/sinbi1j5x7khlgox.png', 12, '2023-08-20 16:18:38', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11119, '奥弗斯教', 'Orphism', 'yishuliupai/8lb3wcw8xxyx2icp.png', 12, '2023-08-20 16:18:38', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11120, '有机建筑', 'Organic architecture', 'yishuliupai/4p9cm3n7znlvhu7y.png', 12, '2023-08-20 16:18:38', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11121, '奥斯曼建筑', 'Ottoman architecture', 'yishuliupai/lq1q6dcp7yg8h6su.png', 12, '2023-08-20 16:18:38', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11122, '泛未来主义', 'Panfuturism', 'yishuliupai/xe8f1t08pabz2dhx.png', 12, '2023-08-20 16:18:38', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11123, '帕塔奇特拉绘画', 'Patachitra painting', 'yishuliupai/3rggd7doncet7o6j.png', 12, '2023-08-20 16:18:38', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11124, '皮奇瓦伊绘画', 'Pichwai painting', 'yishuliupai/plsiw2fobmgcyovp.png', 12, '2023-08-20 16:18:38', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11125, '帕德绘画', 'Phad painting', 'yishuliupai/1yncg0vad4uca1xy.png', 12, '2023-08-20 16:18:38', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11126, '东正教图标', 'Orthodox icon', 'yishuliupai/9phhmk6lmdwwo4ac.png', 12, '2023-08-20 16:18:37', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11127, '针孔摄影', 'Pinhole photography', 'yishuliupai/l572to8d2f0ucumy.png', 12, '2023-08-20 16:18:37', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11128, '像素艺术', 'Pixel art', 'yishuliupai/ddrio0ytecn5nhyl.png', 12, '2023-08-20 16:18:37', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11129, '绘画主义', 'Pictorialism', 'yishuliupai/vb5poktiyd2dup6t.png', 12, '2023-08-20 16:18:37', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11130, '点画派', 'Pointillism', 'yishuliupai/yr2y6b4jrb4ehvj5.png', 12, '2023-08-20 16:18:37', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11131, '流行艺术', 'Pop art', 'yishuliupai/trswa5ta10mbzf1p.png', 12, '2023-08-20 16:18:37', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11132, '宝丽来', 'Polaroid', 'yishuliupai/yblm9sw0eil0p9vj.png', 12, '2023-08-20 16:18:37', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11133, '后印象派', 'Post-impressionism', 'yishuliupai/lmvg9ahqsq4ap9yk.png', 12, '2023-08-20 16:18:37', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11134, '迷幻艺术', 'Psychedelic art', 'yishuliupai/sdjdcm40dzcypg5p.png', 12, '2023-08-20 16:18:37', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11135, '拉斐尔前派', 'Pre-Raphaelitism', 'yishuliupai/4hnpryd8yl3kyh88.png', 12, '2023-08-20 16:18:37', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11136, '心理比利时尚', 'Psychobilly fashion', 'yishuliupai/vd5dykgjtaalluea.png', 12, '2023-08-20 16:18:37', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11137, '朋克时尚', 'Punk fashion', 'yishuliupai/05zq7j6qhyyfkvtr.png', 12, '2023-08-20 16:18:37', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11138, '古兰经艺术', 'Quranic art', 'yishuliupai/ed3vzevb1vscgphe.png', 12, '2023-08-20 16:18:37', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11139, '卡扎尔艺术', 'Qajar art', 'yishuliupai/l5bvhanztkcikodt.png', 12, '2023-08-20 16:18:37', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11140, '现实主义', 'Realism', 'yishuliupai/i85u45hp7805cyij.png', 12, '2023-08-20 16:18:37', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11141, '文艺复兴时期的建筑', 'Renaissance architecture', 'yishuliupai/coaintv1r9r4vuvl.png', 12, '2023-08-20 16:18:37', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11142, '狂欢时尚', 'Rave fashion', 'yishuliupai/v8y44lck0bne7r1u.png', 12, '2023-08-20 16:18:37', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11143, '再生', 'Renaissance', 'yishuliupai/hi9rngenj0ngpf1o.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11144, '复古未来主义', 'Retrofuturism', 'yishuliupai/68bo1rwus0z2jtwn.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11145, '摇滚时尚', 'Rocker fashion', 'yishuliupai/osrj8sz471002qtc.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11146, '洛可可', 'Rococo', 'yishuliupai/oqpvjkwdi0lx5bdh.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11147, '罗马建筑', 'Roman architecture', 'yishuliupai/hp1n66idtc8y7t4j.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11148, '罗马式建筑', 'Romanesque architecture', 'yishuliupai/s7bpievluw2unayg.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11149, '斯堪的纳维亚建筑', 'Scandinavian architecture', 'yishuliupai/16tqj6dyd7t0m7b4.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11150, '场景时尚', 'Scene fashion', 'yishuliupai/d8tk1s3j0u1d66ug.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11151, '社会主义现实主义', 'Socialist realism', 'yishuliupai/oxxyr53hn2qfyjbd.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11152, '科学摄影', 'Scientific photography', 'yishuliupai/fo2ikvftri0e27j8.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11153, '太阳朋克', 'Solarpunk', 'yishuliupai/pl6whbcuo147af5e.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11154, '浪漫主义', 'Romanticism', 'yishuliupai/h6jlypfc01bc7cv6.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11155, '光头党时尚', 'Skinhead fashion', 'yishuliupai/cpw83q9pto4mv8b6.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11156, '斯大林主义建筑', 'Stalinist architecture', 'yishuliupai/z4mfu67jl40r8y6y.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11157, '蒸汽朋克', 'Steampunk', 'yishuliupai/2lttmfa2sfc7phui.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11158, '流线型现代建筑', 'Streamline Moderne architecture', 'yishuliupai/eqovemdt07wogm6m.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11159, '街头摄影', 'Street photography', 'yishuliupai/mk0rmjucaiwc0w3f.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11160, '街头艺术', 'Street Art', 'yishuliupai/zsz9qb5b75g6geca.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11161, '至上主义', 'Suprematism', 'yishuliupai/bdn4apntpclfzb32.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11162, '合成波', 'Synthwave', 'yishuliupai/a0x61uknakxny47s.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11163, '科技服装时尚', 'Techwear fashion', 'yishuliupai/u0ro9iu67vrbmccb.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11164, '中国传统建筑', 'Traditional Chinese architecture', 'yishuliupai/a9cwng7f6mx9hxpr.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11165, '蒸汽波时尚', 'Vaporwave fashion', 'yishuliupai/gokyj6ml6zuloie1.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11166, '日本传统建筑', 'Traditional Japanese architecture', 'yishuliupai/wfxquxigwmm7o5xb.png', 12, '2023-08-20 16:18:36', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11167, '韩国传统建筑', 'Traditional Korean architecture', 'yishuliupai/ctgnt7r50k9hefua.png', 12, '2023-08-20 16:18:35', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11168, '乡土建筑', 'Vernacular architecture', 'yishuliupai/gpgl17wfni8hghw3.png', 12, '2023-08-20 16:18:35', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11169, '复古时尚', 'Vintage fashion', 'yishuliupai/7gqofoxzyhqp2iv8.png', 12, '2023-08-20 16:18:35', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11170, '维多利亚时代的建筑', 'Victorian architecture', 'yishuliupai/467rhcd2bracpxjj.png', 12, '2023-08-20 16:18:35', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11171, '复古照片', 'Vintage photograph', 'yishuliupai/mh71kyb7iyrkf1lz.png', 12, '2023-08-20 16:18:35', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11172, '战争摄影', 'War photography', 'yishuliupai/5v9ico0ctwsoneb1.png', 12, '2023-08-20 16:18:35', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11173, '侧身', 'profile', 'goutujiqiao/zu6ahfb89ygdfqap.png', 12, '2023-08-20 16:18:54', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11174, '半身', 'Half Body', 'goutujiqiao/48zar9ave1pzntpp.png', 12, '2023-08-20 16:18:54', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11175, '西部朋克', 'Westernpunk', 'yishuliupai/upig5ncmbujymo2d.png', 12, '2023-08-20 16:18:35', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11176, '瓦里绘画', 'Warli painting', 'yishuliupai/2p3rq7vopyg5rxvx.png', 12, '2023-08-20 16:18:35', '2023-12-28 13:54:21', 0, 'yishuliupai', '');
INSERT INTO `df_robot_prompt` VALUES (11177, '并列构图', 'Juxtaposition composition', 'goutujiqiao/v5g0s8no2eadfguj.png', 12, '2023-08-20 16:18:54', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11178, '胸部以上', 'chest shot', 'goutujiqiao/fsbd1v940njr21c1.png', 12, '2023-08-20 16:18:54', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11179, '腰部以上', 'waist shot', 'goutujiqiao/bvl44sz7zdoqfj9m.png', 12, '2023-08-20 16:18:54', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11180, '极限特写', 'Extreme closeup', 'goutujiqiao/3ylnzfsfo612adme.png', 12, '2023-08-20 16:18:54', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11181, '360度全景', '360 Panorama', 'goutujiqiao/562xog9mflz60fvn.png', 12, '2023-08-20 16:18:54', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11182, 'DSLR拍摄', 'Shot by DSLR', 'goutujiqiao/9ohlzwhj7d3ddhw4.png', 12, '2023-08-20 16:18:54', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11183, '主观视角', 'Subjective view', 'goutujiqiao/ep3lbiypfemggtke.png', 12, '2023-08-20 16:18:54', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11184, '七分身', 'cowboy shot', 'goutujiqiao/e6l27w2dehg5nv80.png', 12, '2023-08-20 16:18:54', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11185, '全身', 'Full body', 'goutujiqiao/7p5n3hosbezrsw3d.png', 12, '2023-08-20 16:18:54', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11186, '三分法构图', 'Rule of Thirds composition', 'goutujiqiao/2s8mirjt198mhe7z.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11187, '俯视', 'Top view', 'goutujiqiao/pctjzjnath28jpcz.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11188, '人物视角', 'Character perspective', 'goutujiqiao/u3uvinb0jz5bfete.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11189, '仰视视角', 'Low angle view', 'goutujiqiao/4l5nw4jfijxrij7h.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11190, '低角度', 'low angle view', 'goutujiqiao/dv8lj6d4hxw95ouu.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11191, '倾斜视角', 'Tilted view', 'goutujiqiao/6yv9vx47eqfoiixy.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11192, '全景', 'panorama', 'goutujiqiao/nrpl8ilzzp94adfd.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11193, '卫星图像', 'satellite imagery', 'goutujiqiao/0f3nhhv6stu97sri.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11194, '头部特写', 'Headshot', 'goutujiqiao/y0c887lzurfz2f3l.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11195, '孤立构图', 'Isolation composition', 'goutujiqiao/5wxg6n8jmh807v5d.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11196, '对称构图', 'Symmetrical composition', 'goutujiqiao/xlrv34o1elwny41n.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11197, '宽景', 'Wide view', 'goutujiqiao/y6mxj1qaqreraj9h.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11198, '对角线构图', 'Diagonal composition', 'goutujiqiao/nnf1civtef06vj5l.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11199, '室外看室内', 'from outside', 'goutujiqiao/g6nxdy9dg0s7qiaz.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11200, '微距', 'Macro shot', 'goutujiqiao/qvlxf5cb6bnf9ahy.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11201, '微观视角', 'microscopic view', 'goutujiqiao/nffcz04tsc8au7h4.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11202, '居中构图', 'Center the composition', 'goutujiqiao/f8hma2442lggdh8m.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11203, '正视', 'Front view', 'goutujiqiao/ch7u54yym7ylq2su.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11204, '特写', 'Close up', 'goutujiqiao/m9gehb5blnk22zjp.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11205, '汇聚线构图', 'Converging lines composition', 'goutujiqiao/hlbcu2r4rmbf7qcy.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11206, '等距视角', 'isometric view', 'goutujiqiao/f7jgvumwdklf5ap8.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11207, '虚化', 'bokeh', 'goutujiqiao/ffeuemad2r4a6x5z.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11208, '第一人视角', 'First-person view', 'goutujiqiao/9a8oxuh68t9kxbda.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11209, '航拍视角', 'Aerial view', 'goutujiqiao/j6sgdgdroyq38vc5.png', 12, '2023-08-20 16:18:53', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11210, '消失点构图', 'Vanishing point composition', 'goutujiqiao/u7c45r2awvst482v.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11211, '超广角', 'Ultra Wide Angle', 'goutujiqiao/che639f9qzrzf9rz.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11212, '径向构图', 'Radial composition', 'goutujiqiao/lw7mvhnp8b9vv2l2.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11213, '远景透视', 'vanishing point', 'goutujiqiao/tz5jabaqvg193qqf.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11214, '非对称构图', 'Asymmetrical composition', 'goutujiqiao/uydtsumqe9yna9rv.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11215, '长焦拍摄', 'extra long shot', 'goutujiqiao/sebv8nr3njf84lno.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11216, '顶视图', 'top view', 'goutujiqiao/jpvti5qijf0evntr.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11217, '鸟瞰', 'Bird view', 'goutujiqiao/8kqslgmie2n0ezqw.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11218, '鱼眼视角', 'Fisheye view', 'goutujiqiao/q1rm3bv8uocnkjui.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11219, '信息图表', 'infographic', 'goutujiqiao/h8wbewht58qndyt0.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11220, '黄金比例构图', 'Golden Ratio composition', 'goutujiqiao/1b13r0t3a33k6hz1.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11221, '全身角色', 'full body character design', 'goutujiqiao/0arob20cylagnett.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11222, '参考表', 'reference sheet', 'goutujiqiao/irw3ggpb1ux5ic3s.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11223, '图表设计', 'chart design', 'goutujiqiao/l7xxaeczit7eusnq.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11224, '图标集设计', 'icon set design', 'goutujiqiao/lb58rax4nappiesb.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11225, '多姿势角色', 'character design multiple poses', 'goutujiqiao/k6x1slw514wbu424.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11226, '娃娃屋', 'doll house', 'goutujiqiao/k6zvlik4ok8j4uen.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11227, '房屋平面图', 'house plan', 'goutujiqiao/nuyi043xtdh8qbmw.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11228, '幻想四季', 'illstration split circle four seasons', 'goutujiqiao/m2ooa58795t4m2b4.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11229, '房屋剖面图', 'house cutaway', 'goutujiqiao/7ecrfyqhyeeju8i6.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11230, '整理法', 'knolling', 'goutujiqiao/kkqgmkvkn00q0ql5.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11231, '平面摄影', 'flat lay photography', 'goutujiqiao/kbicue9ir0nc65gm.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11232, '标志设计', 'logo design', 'goutujiqiao/quogbl16qpb97d9r.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11233, '时尚情绪版', 'fashion moodboard', 'goutujiqiao/ofvzx59cdta9y2cl.png', 12, '2023-08-20 16:18:52', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11234, '游戏界面', 'game ui', 'goutujiqiao/wiqebkiwscfwumad.png', 12, '2023-08-20 16:18:51', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11235, '游戏素材', 'game assets', 'goutujiqiao/yjobbtmr533ickso.png', 12, '2023-08-20 16:18:51', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11236, '移动界面', 'mobile app ui design', 'goutujiqiao/6cuq468ttn0vwgup.png', 12, '2023-08-20 16:18:51', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11237, '立体书', 'popup book', 'goutujiqiao/oxg6mf1dd6yj5d45.png', 12, '2023-08-20 16:18:51', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11238, '百科全书', 'encyclopedia page', 'goutujiqiao/8eijyzvu94ykt33y.png', 12, '2023-08-20 16:18:51', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11239, '解剖图绘制', 'Anatomical drawing', 'goutujiqiao/1pq915hdnoxmlsq9.png', 12, '2023-08-20 16:18:51', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11240, '角色卡', 'character sheet', 'goutujiqiao/nsbcy2l6qpdf2w4r.png', 12, '2023-08-20 16:18:51', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11241, '角色设计', 'character design', 'goutujiqiao/x50e05n53hmya15r.png', 12, '2023-08-20 16:18:51', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11242, '调色板', 'color palette', 'goutujiqiao/nf0aoqp9usxjo4bc.png', 12, '2023-08-20 16:18:51', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11243, '连环漫画', 'comic strips', 'goutujiqiao/i2nj33u7nl9cng1n.png', 12, '2023-08-20 16:18:51', '2023-12-28 13:54:21', 0, 'goutujiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11244, '丙烯颜料', 'Acrylic paint', 'biaoxianjiqiao/zmyxqc9eskmevcit.png', 12, '2023-08-20 16:19:43', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11245, '奥布松挂毯', 'Aubusson tapestry', 'biaoxianjiqiao/4rez8r87aw6jufar.png', 12, '2023-08-20 16:19:43', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11246, '动画', 'Animation', 'biaoxianjiqiao/gig0rya800ltxx1o.png', 12, '2023-08-20 16:19:43', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11247, 'Anaglyph', 'Anaglyph', 'biaoxianjiqiao/vp8uqmsvjcq1jvk6.png', 12, '2023-08-20 16:19:43', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11248, '解剖插图', 'Anatomical illustration', 'biaoxianjiqiao/qf7wifrnh3fm3l52.png', 12, '2023-08-20 16:19:43', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11249, '黑光涂料', 'Blacklight paint', 'biaoxianjiqiao/o9iri1rddstkx15x.png', 12, '2023-08-20 16:19:43', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11250, '蓝图', 'Blueprint', 'biaoxianjiqiao/y571lhqfu5omsxln.png', 12, '2023-08-20 16:19:43', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11251, '卡通风格', 'Cartoon style', 'biaoxianjiqiao/58jtopzotfwa54rq.png', 12, '2023-08-20 16:19:43', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11252, '化学图谱', 'Chemigram', 'biaoxianjiqiao/vvwq55msprescf6e.png', 12, '2023-08-20 16:19:43', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11253, '钢笔画', 'Brush pen drawing', 'biaoxianjiqiao/7ekp5kkw0lpmdr6l.png', 12, '2023-08-20 16:19:43', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11254, '生物图解', 'Biological illustration', 'biaoxianjiqiao/3gu4anw1adb145k9.png', 12, '2023-08-20 16:19:43', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11255, '黏土动画', 'Claymation', 'biaoxianjiqiao/j5mdkhj08jjtcxrr.png', 12, '2023-08-20 16:19:43', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11256, '漫画风格', 'Comic strip style', 'biaoxianjiqiao/75q4qgcye3nkii4b.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11257, '拼贴画', 'Collage', 'biaoxianjiqiao/et6p6yqmtxk0jlk9.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11258, '高动态范围', 'HDR', 'biaoxianjiqiao/jz9sgd5kkzqrh998.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11259, '埃布鲁', 'Ebru', 'biaoxianjiqiao/1u54itdq2vqxbelr.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11260, '全息术', 'Holography', 'biaoxianjiqiao/jdpoyo6x2x9yjx05.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11261, '半色调打印', 'Halftone print', 'biaoxianjiqiao/e9eeu6d7nx3icf3o.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11262, '故意移动相机', 'Intentional camera movement', 'biaoxianjiqiao/rztvcr0sw75ks6lv.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11263, '诺林', 'Knolling', 'biaoxianjiqiao/lxevhobf7pd23k1a.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11264, '雾神', 'Kirigami', 'biaoxianjiqiao/ycs7cya7tocoldcv.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11265, '乐高风格', 'LEGO style', 'biaoxianjiqiao/le3gfiza1s46rvo5.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11266, '发光图', 'Luminogram', 'biaoxianjiqiao/rjt338x9b86qmpd5.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11267, '从百叶窗透过光影拍摄的人', 'Portrait shot with light and shadow from window blinds', 'biaoxianjiqiao/6lf87admj2cg0nv2.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11268, '由毛毡制成', 'Made of felt', 'biaoxianjiqiao/woimppwfatws5b8i.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11269, '转描动画', 'Rotoscope animation', 'biaoxianjiqiao/npix3inu7t8cav97.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11270, '慢快门速度', 'Slow shutter speed', 'biaoxianjiqiao/r03w2vz181w4q6yt.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11271, '喷绘', 'Airbrush drawing', 'biaoxianjiqiao/axtxhk7nvgmvnnz9.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11272, '温度计', 'Thermograph', 'biaoxianjiqiao/hpo7ei8bstjfo6fj.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11273, '点画', 'Stippling', 'biaoxianjiqiao/mywa9t0oo9zxw98k.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11274, '酒精墨水', 'Alcohol ink', 'biaoxianjiqiao/kdexyqikrkr3tpyw.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11275, '盆景', 'Bonsai', 'biaoxianjiqiao/6pnk3y0u0htdpn5c.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11276, '雕刻', 'Carving', 'biaoxianjiqiao/kixhhc79y1ue44r4.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11277, '蜡染', 'Batik', 'biaoxianjiqiao/f8ildqtyrnkti6zn.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11278, '西布拉克瓷器', 'Cibulak porcelain', 'biaoxianjiqiao/5xxusdchxr6zbd58.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11279, '中国墨笔', 'Chinese ink brush', 'biaoxianjiqiao/rtokk5lqjv4uv94d.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11280, 'CineStill 50', 'CineStill 50', 'biaoxianjiqiao/m306mr5a43pfa6r5.png', 12, '2023-08-20 16:19:42', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11281, '光刻技术', 'Chromolithography', 'biaoxianjiqiao/ewu6wbkpnh1zl0o7.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11282, 'Close-up', 'portrait', 'biaoxianjiqiao/uf5jzjpujbj9j32x.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11283, '故事绘画', 'Conte drawing', 'biaoxianjiqiao/gj2hm0niekj2xyk8.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11284, '八比特', '8-bit', 'biaoxianjiqiao/kn5vojush4wy5o8l.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11285, '镀金', 'Gilded', 'biaoxianjiqiao/x1tpkav5f37xrz2e.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11286, '双重接触', 'Double exposure', 'biaoxianjiqiao/6508utb3xa67zv55.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11287, '贴花', 'Decals', 'biaoxianjiqiao/9fvfs5z561tw2fci.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11288, '动画艺术', 'Anime', 'biaoxianjiqiao/kpq5zapp8qbxhnki.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11289, '日本海报', 'poster of japanese graphic design', 'biaoxianjiqiao/446bktjc9tbt3w85.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11290, '吉卜力', 'Ghibli-like colours', 'biaoxianjiqiao/1pq5crstyfz8gv8d.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11291, '抽象派', 'Abstractionist', 'biaoxianjiqiao/qtxnuf24bpjeb3l9.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11292, '宫崎骏', 'Miyazaki Hayao Style', 'biaoxianjiqiao/j4i5x9cvvemzhkpi.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11293, '新艺术风格', 'Art Nouveau', 'biaoxianjiqiao/1ve0jvgrf1i384ql.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11294, '极简主义', 'Minimalist', 'biaoxianjiqiao/201j2pl3w0adusgg.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11295, '超扁平', '2D graphic superflat', 'biaoxianjiqiao/m764yeejqjic0byz.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11296, '波普艺术', 'Pop art', 'biaoxianjiqiao/62e93bdlzwo78jf8.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11297, '胶版画', 'Collodion print', 'biaoxianjiqiao/e2aayx58f7fysxk4.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11298, '时尚肖像', 'Fashion portrait', 'biaoxianjiqiao/1pf8zvwox866n6en.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11299, '明暗对比', 'Chiaroscuro', 'biaoxianjiqiao/2w6oqkza532szgah.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11300, '炭笔画', 'Charcoal drawing', 'biaoxianjiqiao/bthjgehgo4so5exf.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11301, '福马潘400', 'Fomapan 400', 'biaoxianjiqiao/sjnjai7jn07dan2n.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11302, '富士Chrome Pro', 'Fujichrome Provia 100F', 'biaoxianjiqiao/ojjimfl7axqscb39.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11303, '富士彩色C200', 'Fujicolor C200', 'biaoxianjiqiao/rxuh7y0fsrkl2j5f.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11304, '富士彩色 Fujichr', 'Fujicolor Fujichrome Velvia 100', 'biaoxianjiqiao/mquj143eyr5yp97x.png', 12, '2023-08-20 16:19:41', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11305, '毕加索', 'Pablo Picasso Style', 'biaoxianjiqiao/p46gbbwj4c4jmg2j.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11306, '富士彩色Pro 400H', 'Fujicolor Pro 400H', 'biaoxianjiqiao/rdk7upf6ihjuya78.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11307, 'OC渲染器', 'Octane Render', 'biaoxianjiqiao/qkomo6o2tqq5pgx4.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11308, '富士彩色 Superia', 'Fujicolor Superia X-TRA 400', 'biaoxianjiqiao/ym5trgvxzk4v0h2c.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11309, '富士胶片 Neopan ', 'Fujifilm Neopan 100', 'biaoxianjiqiao/af7jwvp5mmn7mn4y.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11310, '针孔透镜', 'Pinhole lens', 'biaoxianjiqiao/qmohe3g8wlluqrcm.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11311, '越过肩膀拍摄的肖像', 'Portrait shot over the shoulder', 'biaoxianjiqiao/hbajy40nsnhjjt1t.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11312, '底部照明的人像拍摄', 'Portrait shot with bottom lighting', 'biaoxianjiqiao/17ei3zf04oxasprn.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11313, '逆光人像拍摄', 'Portrait shot with back lighting', 'biaoxianjiqiao/m3aptdx6t5dfidnk.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11314, '强光下的人像拍摄', 'Portrait shot with hard lighting', 'biaoxianjiqiao/vxe6rsjd991fjm5t.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11315, '对比光下的人像拍摄', 'Portrait shot with contrasty lighting', 'biaoxianjiqiao/a88ig06tivadaibm.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11316, '霓虹灯下的人像拍摄', 'Portrait shot with neon lighting', 'biaoxianjiqiao/s42233bex30b6g8k.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11317, '使用桃色和青色灯光拍摄的', 'Portrait shot with peach and cyan lighting', 'biaoxianjiqiao/0pv0dv7ykl2o9xb1.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11318, '红光下拍摄的人像', 'Portrait shot with red light', 'biaoxianjiqiao/fmsdce2x7n2t3ncg.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11319, '侧光人像拍摄', 'Portrait shot with side lighting', 'biaoxianjiqiao/5e0qtpx3l8gus61h.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11320, '坐像', 'Sitting portrait', 'biaoxianjiqiao/mnmus7h1aghl9ok2.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11321, '阳光下拍摄的人像', 'Portrait shot with sunlight', 'biaoxianjiqiao/7l4nglqagnsjo8fa.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11322, '柔和灯光下的人像拍摄', 'Portrait shot with soft lighting', 'biaoxianjiqiao/dmeeique8ntwr5zk.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11323, '倾斜移位', 'Tilt-Shift', 'biaoxianjiqiao/t1ktntkhvrqvqnnt.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11324, '顶光人像拍摄', 'Portrait shot with top lighting', 'biaoxianjiqiao/l33g44woh7nfkenb.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11325, '泰国木偶剧', 'Thai puppet theater', 'biaoxianjiqiao/1ya5w8o996gi7l5v.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11326, '通过取景器拍摄', 'Through-the-Viewfinder photography', 'biaoxianjiqiao/r04emljds1faalr1.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11327, '长焦镜头', 'Telephoto lens', 'biaoxianjiqiao/tnrfw36rus8yl4zj.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11328, '撕碎的纸拼贴', 'Torn paper collage', 'biaoxianjiqiao/qwnzvwuo6lq97rsj.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11329, '锡版印刷', 'Tintype print', 'biaoxianjiqiao/zsgrtcotvrq4xatw.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11330, '超广角镜头', 'Ultra wide lens', 'biaoxianjiqiao/xiiawurlw325myy2.png', 12, '2023-08-20 16:19:40', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11331, '错视画', 'Trompe l\'oeil', 'biaoxianjiqiao/v2zbyp7lbpohz8we.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11332, '紫外线摄影', 'Ultraviolet photography', 'biaoxianjiqiao/itk103l4hkzuqkvk.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11333, '水下摄影', 'Underwater photography', 'biaoxianjiqiao/o5pc0jfdq5vnjypv.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11334, '翠绿挂毯', 'Verdure tapestry', 'biaoxianjiqiao/ydyv2i4puihcll14.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11335, '浮世绘', 'Ukiyo-e', 'biaoxianjiqiao/92nuobmrp1ok4zqt.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11336, '复古镜头', 'Vintage lens', 'biaoxianjiqiao/wbginnwpmvog0f59.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11337, '视频装置', 'Video installation', 'biaoxianjiqiao/4qaih1z4epm016cg.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11338, '广角镜头', 'Wide angle lens', 'biaoxianjiqiao/eopn5gd2xcl9j90h.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11339, '维特拉尔', 'Vitrail', 'biaoxianjiqiao/3mlbmnawks2m7rm0.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11340, '釉质', 'Vitreous enamel', 'biaoxianjiqiao/e592nudg4m22c0df.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11341, '编织', 'Weaving', 'biaoxianjiqiao/7y70sit4jpcx6zzg.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11342, '木雕', 'Wood carving', 'biaoxianjiqiao/85cqugd3oaa3bepo.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11343, '小麦糊', 'Wheatpaste', 'biaoxianjiqiao/skl6gpzy4gn5hvyf.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11344, '线框图', 'Wireframe drawing', 'biaoxianjiqiao/65nxwcuz7ynwsdo6.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11345, 'X射线', 'X-ray', 'biaoxianjiqiao/6813wv2dybfm9pbe.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11346, '三维', '3D', 'biaoxianjiqiao/vvrq4848gdj5skqz.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11347, '木雕', 'Wood engraving', 'biaoxianjiqiao/tpi6hlkh7dv1cw4t.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11348, '静电复印', 'Xerography', 'biaoxianjiqiao/85fld8l7ywzbpmxg.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11349, '木刻版画', 'Woodblock print', 'biaoxianjiqiao/3zleul8uxx44da52.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11350, '中国水墨', 'Tradition Chinese Ink Painting style', 'biaoxianjiqiao/o0f9b1wqbzyv8s3q.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11351, '中式宣传画', 'Chinese propaganda', 'biaoxianjiqiao/xsnjng6fim2nh06n.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11352, '伏尼契手稿', 'Voynich manuscript', 'biaoxianjiqiao/m8fn6ys8ef5a9r9k.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11353, '手绘涂鸦', 'doodle', 'biaoxianjiqiao/nd9ueyzwt9vwhgxk.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11354, '剪纸工艺', 'Paper cut craft', 'biaoxianjiqiao/uyxf8jm50i9q3hz8.png', 12, '2023-08-20 16:19:39', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11355, '摄影纪实', 'documentary photography', 'biaoxianjiqiao/k32imlyhy64d3tn3.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11356, '数码绘画digital', 'painting', 'biaoxianjiqiao/i47j5otm0dvd4qid.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11357, '未来主义', 'Futuristic', 'biaoxianjiqiao/nh70shb2dh894too.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11358, '日本墨水', 'Japanese ink', 'biaoxianjiqiao/iw8ne1iff87qo9vu.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11359, '水墨插画', 'Ink illustration', 'biaoxianjiqiao/fbrph9ex1l4kkfha.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11360, '梵高', 'Vincent Van Gogh', 'biaoxianjiqiao/anhbgqhrwe2hsz31.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11361, '标志', 'Logo', 'biaoxianjiqiao/4jc2fcvbqnhdbcqb.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11362, '油画', 'oil painting', 'biaoxianjiqiao/xfz75dzi20ltslqn.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11363, '海报风格', 'Soviet Propaganda Poster', 'biaoxianjiqiao/dd5iped4n5fv6jwe.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11364, '电影风格', 'film art', 'biaoxianjiqiao/fe6r781qzot1xlkr.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11365, '蒙德里安', 'Piet Cornelies Mondrian', 'biaoxianjiqiao/uldduzxmjhc1qrck.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11366, '涂色书', 'coloring book page', 'biaoxianjiqiao/uaw3nbw6iwjyvwe0.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11367, '虚幻引擎', '虚幻引擎', 'biaoxianjiqiao/2ex9zlm8uc0eobnd.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11368, '蒸汽波', 'vaporwave', 'biaoxianjiqiao/s66lpyje9qvwoyjj.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11369, '衔缝纸', 'Paper quilling', 'biaoxianjiqiao/nrstmbcb1lehg2lc.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11370, '蓝图', 'Blueprints', 'biaoxianjiqiao/0btjam8tprulorv1.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11371, '解刨学绘图', 'Anatomical Drawing', 'biaoxianjiqiao/7m8raqex44vuqh7p.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11372, '赛博迪利克', 'cyberdelic', 'biaoxianjiqiao/wybf9yuqpapk2opq.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11373, '超现实主义', 'Surrealism style', 'biaoxianjiqiao/x9rvq7k9nqx6988j.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11374, '野兽派', 'fauvism', 'biaoxianjiqiao/kj5wiwcl2tcqtyzs.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11375, '广告肖像', 'Advertising portrait', 'biaoxianjiqiao/34ab9soi306l7wyp.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11376, '风格派', 'de stijl', 'biaoxianjiqiao/0j2lkf8t0bh8ij9p.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11377, '3d 涂鸦', '3d graffiti', 'biaoxianjiqiao/gjx69xqqnhtzr4lv.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11378, '阿莱布里耶', 'Alebrije', 'biaoxianjiqiao/59xjrm35v0mbcqyo.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11379, '浮雕', 'Bas-relief', 'biaoxianjiqiao/grv3lzzphygv573l.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11380, 'Cartonnage', 'Cartonnage', 'biaoxianjiqiao/r3fyc1x140b1txop.png', 12, '2023-08-20 16:19:38', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11381, '鸟瞰图', 'Bird\'s eye view', 'biaoxianjiqiao/fig9ruh9hajd67oy.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11382, '西洋镜', 'Diorama', 'biaoxianjiqiao/ao0rjgtxzjngwoji.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11383, '蓝晒版印刷', 'Cyanotype print', 'biaoxianjiqiao/a3hlwalz1fzrfjly.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11384, '压花', 'Embossing', 'biaoxianjiqiao/1rqhce1niqp6d58q.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11385, 'Azulejo', 'Azulejo', 'biaoxianjiqiao/dk7xl53w1bgtfeoi.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11386, '极端特写肖像', 'Extreme close-up portrait', 'biaoxianjiqiao/ogradhvku5swyj2g.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11387, '刺绣', 'Embroidery', 'biaoxianjiqiao/abdcy16kwlpw9kx5.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11388, '鱼眼镜头', 'Fisheye lens', 'biaoxianjiqiao/2rq0qe7zndef9zsx.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11389, '全身高度肖像', 'Full body height portrait', 'biaoxianjiqiao/wd7mgspookazluhe.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11390, '格拉尔玻璃', 'Graal glass', 'biaoxianjiqiao/bhbp3qn9etf0ad9f.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11391, '快门速度快', 'Fast shutter speed', 'biaoxianjiqiao/i3elcjzx5tgan7xm.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11392, '花道', 'Ikebana', 'biaoxianjiqiao/6new4f3cdgmxqqn6.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11393, '针织', 'Knitted', 'biaoxianjiqiao/yyor2m3k6720sroy.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11394, '柯达 Ektachrom', 'Kodak Ektachrome E100', 'biaoxianjiqiao/fxoc5d7359doh02c.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11395, '柯达 Ektar 100', 'Kodak Ektar 100', 'biaoxianjiqiao/a2jn93n58t79uq8i.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11396, '柯达 Portra 16', 'Kodak Portra 160', 'biaoxianjiqiao/efyt6636ltg94gww.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11397, '柯达 Tri-X 400', 'Kodak Tri-X 400', 'biaoxianjiqiao/v8lsqlve71wvlx69.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11398, '柯达 Portra 40', 'Kodak Portra 400', 'biaoxianjiqiao/2ft5rttvb3hy66hn.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11399, '新海诚风格', 'Makoto Shinkai Style', 'biaoxianjiqiao/wdqtwg3r4ntmnv8a.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11400, '柯达 UltraMax ', 'Kodak UltraMax 400', 'biaoxianjiqiao/0x4b67gfnkfgsff7.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11401, '卡通', 'Cartoon', 'biaoxianjiqiao/ix6tffvklsk4l55d.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11402, '毛线制成', 'Made of Wool', 'biaoxianjiqiao/v6xk2ebu5yombnq1.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11403, '漫画', 'Manga', 'biaoxianjiqiao/yatiooolw1q32wda.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11404, '浮世绘', 'Japanese Ukiyo-e', 'biaoxianjiqiao/helh2uq1neu2fzat.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11405, '构建主义', 'Constructivist', 'biaoxianjiqiao/rrv7sj686pe27wzb.png', 12, '2023-08-20 16:19:37', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11406, '皮克斯', 'Pixar', 'biaoxianjiqiao/x9k7hsxegnhjvo11.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11407, '蒸汽朋克', 'Steampunk', 'biaoxianjiqiao/zs9c4fn7cl9zx90i.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11408, '粗狂主义', 'Brutalist', 'biaoxianjiqiao/0ph08m1o4xjlfmpn.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11409, '黏土', 'Claymotion', 'biaoxianjiqiao/057k520341cuvqq4.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11410, '迪士尼', 'disney', 'biaoxianjiqiao/psvo1tpy5iz4l400.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11411, '黑光', 'Blacklight', 'biaoxianjiqiao/o0zo1senscb5bi8w.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11412, '漫画风格', 'Comic book style', 'biaoxianjiqiao/m5pz8pky13w76zqv.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11413, '书法', 'Calligraphy', 'biaoxianjiqiao/648vtoth7562nhxa.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11414, '彩色速写风格', 'Color sketchnote style', 'biaoxianjiqiao/t3fimp3xrmk0oxyx.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11415, '极宽肖像', 'Extreme wide portrait', 'biaoxianjiqiao/xxxrbvq15pmtls4o.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11416, '十字绣', 'Cross-stitching', 'biaoxianjiqiao/07qe3h0baa617ukc.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11417, '金箔', 'Gold leafing', 'biaoxianjiqiao/8fjon5nbie2txncp.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11418, '全家福', 'Family portrait', 'biaoxianjiqiao/20v82wngumgbjyli.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11419, '霍尔加摄影', 'Holga photography', 'biaoxianjiqiao/kety8cumqb48x2ou.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11420, '集体照', 'Group portrait', 'biaoxianjiqiao/yqxv8y9gta4nvitv.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11421, '高快门速度', 'High shutter speed', 'biaoxianjiqiao/mncc1ff0xviey7da.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11422, '伊尔福德 FP4 125', 'Ilford FP4 125', 'biaoxianjiqiao/h3tuoxzip59ugrnl.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11423, '伊尔福德 HP5+ 40', 'Ilford HP5+ 400', 'biaoxianjiqiao/w0hnngkb6kmwm0ey.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11424, '水墨画', 'Ink drawing', 'biaoxianjiqiao/15agmnrw5hdmtb4d.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11425, '凹版印刷', 'Intaglio print', 'biaoxianjiqiao/xee33svjhhw3ia5v.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11426, '伊尔福德 XP2 400', 'Ilford XP2 400', 'biaoxianjiqiao/arud8b2k2amnl6gp.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11427, '剖面图', 'Profile view', 'biaoxianjiqiao/yqqelb13apy5u383.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11428, '低角度', 'Low angle', 'biaoxianjiqiao/e83t0ew6htevn0b4.png', 12, '2023-08-20 16:19:36', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11429, '热凹版印刷', 'Pyrogravure', 'biaoxianjiqiao/fala2ls4ajkgvcgg.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11430, '纸浆艺术', 'Pulp art', 'biaoxianjiqiao/wxjuujk244wcl20s.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11431, '太阳能图', 'Solargram', 'biaoxianjiqiao/70qjt3za7eexbi50.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11432, '日照仪', 'Solargraph', 'biaoxianjiqiao/ada34lexbb71jkpl.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11433, '模板画', 'Stencil painting', 'biaoxianjiqiao/rt3ejtnyh7qq2msz.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11434, '定格动画', 'Stop-motion animation', 'biaoxianjiqiao/azog07umkfvv6dqx.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11435, '一八零零', '1800s', 'biaoxianjiqiao/wp9kfbbiut6crif9.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11436, '一九八零', '1980s', 'biaoxianjiqiao/9ibjfbs2gvbtfmbe.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11437, '上古卷轴', 'The Elder Scrolls', 'biaoxianjiqiao/o4v2huuwi68yupwz.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11438, '技术图纸', 'Technical drawing', 'biaoxianjiqiao/uvmiqelplirgd04e.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11439, '墨绘', 'Sumi-e drawing', 'biaoxianjiqiao/1nxt1zlwxrft35xo.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11440, '二维插图', '2D illustration', 'biaoxianjiqiao/c1c3m7554m1s8x82.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11441, '光绘', 'Light Painting', 'biaoxianjiqiao/aj782y8coab3yns1.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11442, '低模', 'low poly', 'biaoxianjiqiao/fyzmhzfd1e1ttj0l.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11443, '几何风格', 'geometric', 'biaoxianjiqiao/nvqsmillb87vrabm.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11444, '创风格', 'Tron style', 'biaoxianjiqiao/02ckbcnaw97pd585.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11445, '像素风格', 'Pixel Art', 'biaoxianjiqiao/ipky927gulbrjz1t.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11446, '副岛成记', 'Soejima Shigenori', 'biaoxianjiqiao/46xjaktkybsycdsz.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11447, '分形艺术', 'Fractal', 'biaoxianjiqiao/38uf8nwloi6cqqb0.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11448, '包豪斯风格', 'Bauhaus Style', 'biaoxianjiqiao/66p9c2p1t7tares5.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11449, '单线图', 'One-line drawing', 'biaoxianjiqiao/xywssanrdg2aw66q.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11450, '印刷风格risograp', 'Style', 'biaoxianjiqiao/wu7m5m9mfmoly6iu.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11451, '喷漆风格', 'Splatter Paint', 'biaoxianjiqiao/t82ahoamcaliknxt.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11452, '古代', 'Ancient', 'biaoxianjiqiao/xlwzcx2eu4w4a5yu.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11453, '宝可梦风格', 'Pokemon Style', 'biaoxianjiqiao/6u7i5z349z6h7nrl.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11454, '合成波', 'Synth-wave', 'biaoxianjiqiao/csidgkcpdduwvvpq.png', 12, '2023-08-20 16:19:35', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11455, '宣传海报', 'propaganda poster', 'biaoxianjiqiao/alg99dx9dmuq0rpv.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11456, '局部解剖', 'partial anatomy', 'biaoxianjiqiao/8ili0vszstwxl9jl.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11457, '尼克斯爆炸', 'Exploded a cat by Nychos', 'biaoxianjiqiao/jvgeadphpk6ny2fs.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11458, '平面复古', 'Graphic design Retro style', 'biaoxianjiqiao/f0kl58ap72aty3gu.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11459, '山田章博', 'Yamada Akihiro', 'biaoxianjiqiao/l7ut4r6mrzhvbqup.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11460, '库波卡', 'F.Kupka  style', 'biaoxianjiqiao/cnznsb9q5tefm8k2.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11461, '平面小说', 'Graphic Novel', 'biaoxianjiqiao/67oqar23r7p75uqr.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11462, '彩色玻璃', 'Stained Glass', 'biaoxianjiqiao/rzx6tw5ghcj66z6y.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11463, '扁平风格', 'flat design', 'biaoxianjiqiao/5hxhyodgpn87e40z.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11464, '折纸', 'Origami Style', 'biaoxianjiqiao/ry969it28vz43gen.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11465, '抽象表现主义', 'Abstract', 'biaoxianjiqiao/mvggt7jv0j3se5pe.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11466, '拜占庭', 'byzantine Style', 'biaoxianjiqiao/2xqgnuv3sprlbk5f.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11467, '拼布拼贴画', 'Patchwork collage', 'biaoxianjiqiao/5rwk5mw2jv6ckpfe.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11468, '文艺复兴', 'Renaissance', 'biaoxianjiqiao/dcozh26fucoaho02.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11469, '日本版画', 'Old Japanese Woodblock Print', 'biaoxianjiqiao/ji68i6w9w1qq9cbe.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11470, '斯格格勒斯', 'Squiggles Style', 'biaoxianjiqiao/hceqdq1p8r52vr9v.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11471, '旷野之息', 'botw Style', 'biaoxianjiqiao/wudz0ji9wpx44xcs.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11472, '日记本风格', 'Risograph Style', 'biaoxianjiqiao/sy5a2sfhnqcu22ml.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11473, '暗黑复古', 'retro dark vintage', 'biaoxianjiqiao/kbbrsqgpfa70hwwz.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11474, '梅卡巴风格', 'Merkaba Style', 'biaoxianjiqiao/2ulqalrrhxtz1987.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11475, '曼陀罗风格', 'Mandala style', 'biaoxianjiqiao/7yo3mt0y56zzp7sq.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11476, '欧普艺术', 'Op art', 'biaoxianjiqiao/aassv5f21zdzdj5e.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11477, '水彩', 'Watercolour', 'biaoxianjiqiao/iuctupwzbbvwunvt.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11478, '水彩儿童画', 'Watercolor Children\'s illustration', 'biaoxianjiqiao/sa1af1f2lalhimi0.png', 12, '2023-08-20 16:19:34', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11479, '油漆滴落', 'Dripping Paint', 'biaoxianjiqiao/ufybm0lf8aswf976.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11480, '水粉画', 'Gouache', 'biaoxianjiqiao/w66b9ziyqera1h3x.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11481, '法国艺术', 'french art', 'biaoxianjiqiao/yy6weyfm0a2s5wz5.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11482, '波尔卡风格', 'polka style', 'biaoxianjiqiao/xhv572terc8yq0ar.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11483, '游戏场景图', 'Game scene graph', 'biaoxianjiqiao/7u1gagne8l0uiruo.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11484, '滴漆艺术', 'Dripping art', 'biaoxianjiqiao/nbiuind7b4ahm3lm.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11485, '漫威漫画', 'Front Cover of a Marvel Comic', 'biaoxianjiqiao/im7at8evyj2irrno.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11486, '漫画书', 'Comicbook', 'biaoxianjiqiao/gjw4pc0cyq8qawj9.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11487, '点彩派', 'Pointillism', 'biaoxianjiqiao/1g6hhwsp5hydddyn.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11488, '炭色风格', 'Charcoal Style', 'biaoxianjiqiao/gicftba003n0seuf.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11489, '照片写实', 'Photorealistic', 'biaoxianjiqiao/ysgu3dzaoa9dn59a.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11490, '点状风格', 'Dots style', 'biaoxianjiqiao/vvvqzjh85tugq1dh.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11491, '珐琅徽章', 'enamel pin', 'biaoxianjiqiao/pmwl8dg3bvtvsztd.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11492, '粉彩', 'Pastel', 'biaoxianjiqiao/wn3l97mruvn4gnof.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11493, '粉笔画', 'Pastel drawing', 'biaoxianjiqiao/11sekq3813un0qvu.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11494, '素描', 'Sketching', 'biaoxianjiqiao/k7sjy8z6m7nb8aln.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11495, '纤维素', 'Cellulose', 'biaoxianjiqiao/o9fizhe1td2e7q0z.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11496, '纹身艺术', 'Tattoo art', 'biaoxianjiqiao/dxoqu3nhnf4fkr5d.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11497, '绗缝艺术', 'Quilted Art', 'biaoxianjiqiao/f6pnf8nzyy4clafm.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11498, '维多利亚', 'Victorian', 'biaoxianjiqiao/jmir5ywa2u5e16mm.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11499, '英雄联盟', 'League of Legends', 'biaoxianjiqiao/qkv6me6yauubui67.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11500, '莫奈', 'Claude Monet', 'biaoxianjiqiao/go0i6hn9ytf6vous.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11501, '蚀刻', 'Etching', 'biaoxianjiqiao/olzlbym2txgy345i.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11502, '色度风格', 'Chromatic style', 'biaoxianjiqiao/ikflq0km3622s0hf.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11503, '街头涂鸦风格', 'Street craffiti Style', 'biaoxianjiqiao/xvnb0fasqa9hj56v.png', 12, '2023-08-20 16:19:33', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11504, '解剖学', 'anatomy', 'biaoxianjiqiao/6bwtprobgmr6vvxy.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11505, '贴纸', 'sticker', 'biaoxianjiqiao/2z6adet8yxv48qm5.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11506, '跑跑姜饼人', 'Cookie Run Kingdom', 'biaoxianjiqiao/4e7s7qtrzkbj3q0z.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11507, '赛博朋克', 'Cyberpunk', 'biaoxianjiqiao/i1ww5p656i9ufesq.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11508, '达芬奇', 'Leonardo Da Vinci Style', 'biaoxianjiqiao/wqv3ma0en1adg0e9.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11509, '达达风格', 'dada style', 'biaoxianjiqiao/tfk6k2txpfsq256u.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11510, '通感艺术', 'synesthesia', 'biaoxianjiqiao/hpb6mbh7xfsbyvmd.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11511, '霓虹风格', 'Neon Style', 'biaoxianjiqiao/zh97iwegbq4ewjlu.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11512, '酸性电子', 'acidwave', 'biaoxianjiqiao/wqomc28d79faq5nz.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11513, '气溶胶涂料', 'Aerosol paint', 'biaoxianjiqiao/ixpe5vvpurg2wz1e.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11514, '相纸印刷', 'Albumen print', 'biaoxianjiqiao/13x730mq2uf0asqr.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11515, '炭印', 'Anthotype print', 'biaoxianjiqiao/1a0mb3qp2kl0zj6d.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11516, '水印版画', 'Aquatint print', 'biaoxianjiqiao/ngwmrzkw35isd6or.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11517, '阿拉伯风情', 'Arabesque', 'biaoxianjiqiao/3zi12je25ai1ex7c.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11518, '阿拉伯书法', 'Arabic calligraphy', 'biaoxianjiqiao/hbr8dvkgyw84djod.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11519, '酸妖艺术', 'acid pixie', 'biaoxianjiqiao/el2vkrbinma5mtn5.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11520, 'Calotype 印刷品', 'Calotype print', 'biaoxianjiqiao/5fxq6729ye0ofggy.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11521, 'Bromoil 印花', 'Bromoil print', 'biaoxianjiqiao/1hobdf7cqyz3ysk0.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11522, '尚蒂伊蕾丝', 'Chantilly lace', 'biaoxianjiqiao/3l3x21pbxgq3y6iw.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11523, '中国书法', 'Chinese calligraphy', 'biaoxianjiqiao/ojkm05o7gagp16el.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11524, '粉笔画', 'Chalk drawing', 'biaoxianjiqiao/hk3x0s4r499w5hc1.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11525, '胶印版画', 'Collotype print', 'biaoxianjiqiao/kd592440kf4kdqx2.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11526, '嘉年华玻璃', 'Carnival glass', 'biaoxianjiqiao/ize270x78bdksvy4.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11527, '蜡笔画', 'Crayon drawing', 'biaoxianjiqiao/olb9uklhhtgs31x5.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11528, '黄昏射线', 'Crepuscular rays', 'biaoxianjiqiao/mav28zr7pc2i7rro.png', 12, '2023-08-20 16:19:32', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11529, '钩编', 'Crocheted', 'biaoxianjiqiao/iepshqh75e3b1xyp.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11530, '抠图动画', 'Cutout animation', 'biaoxianjiqiao/rhsy01pg9f3135ri.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11531, '交叉处理打印', 'Cross processing print', 'biaoxianjiqiao/7e63k8t41g5imqhu.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11532, '银版照相法', 'Daguerreotype', 'biaoxianjiqiao/6cwmkt43dae0g0id.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11533, '装饰', 'Decoupage', 'biaoxianjiqiao/fptrzd5tlpm5u0ej.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11534, '干刷绘图', 'Dry brush drawing', 'biaoxianjiqiao/7ib4rnjc4gp6owd0.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11535, '杜菲彩色照片', 'Dufaycolor photograph', 'biaoxianjiqiao/8dgh3yn509bfupjz.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11536, '彩漆', 'Encaustic paint', 'biaoxianjiqiao/5ievf5n7amb2l7kp.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11537, '蚀刻', 'Etching', 'biaoxianjiqiao/d3165ndoxw5muada.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11538, '雕刻', 'Engraving', 'biaoxianjiqiao/xobeelsamnsc12oa.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11539, '时尚素描', 'Fashion sketch', 'biaoxianjiqiao/o7b4w463089uvaa5.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11540, '时尚插画', 'Fashion illustration', 'biaoxianjiqiao/2z93gmn9197yem8g.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11541, '闪光绘图', 'Glitter drawing', 'biaoxianjiqiao/tpbaww50g44oqs91.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11542, '熔融玻璃', 'Fused glass', 'biaoxianjiqiao/ussqq40jej7yti1u.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11543, '佛兰德挂毯', 'Flemish tapestry', 'biaoxianjiqiao/eejrn5uo77dwusv4.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11544, '戈布兰挂毯', 'Gobelin tapestry', 'biaoxianjiqiao/ej4lc093c4c0etxd.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11545, '涂鸦', 'Graffiti', 'biaoxianjiqiao/cyu96d56qdtf1qzf.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11546, '水粉颜料', 'Gouache paint', 'biaoxianjiqiao/y6h8bg71a225gwhs.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11547, '石墨拉丝', 'Graphite drawing', 'biaoxianjiqiao/iay1u57hkgcsuptl.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11548, '灰度', 'Grayscale', 'biaoxianjiqiao/3lamwp9d3r1pctpu.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11549, '灰色画', 'Grisaille', 'biaoxianjiqiao/so9vtf5wkotps7yw.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11550, '手绘彩色照片', 'Hand-colored photograph', 'biaoxianjiqiao/xy6nzrl6918guwb4.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11551, '胶印', 'Gumoil print', 'biaoxianjiqiao/007uanrmgrv4c56e.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11552, '怪诞挂毯', 'Grotesque tapestry', 'biaoxianjiqiao/6bliiuguzlz8peui.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11553, '植物标本室', 'Herbarium', 'biaoxianjiqiao/qllo5rc9jty95sdo.png', 12, '2023-08-20 16:19:31', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11554, '格热尔陶瓷', 'Gzhel ceramic', 'biaoxianjiqiao/e4f88oybgyha8w2y.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11555, '红外摄影', 'Infrared photography', 'biaoxianjiqiao/o3pobh5ca4qg4e1q.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11556, '高角度', 'High angle', 'biaoxianjiqiao/8nt8z4o4uumxbg33.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11557, '镶嵌', 'Inlay', 'biaoxianjiqiao/muneze9t2bnelsp6.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11558, '象牙雕刻', 'Ivory carving', 'biaoxianjiqiao/n32k8if7sy06gwbp.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11559, '信息图', 'Infographic', 'biaoxianjiqiao/waq4ons95n8gy9tg.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11560, '日本复古海报', 'Japanese vintage poster', 'biaoxianjiqiao/jthdlf5fsytsasv8.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11561, '金继', 'Kintsugi', 'biaoxianjiqiao/0zw7uhbs8oyl4uvb.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11562, '伊兹尼克瓷砖', 'Iznik tiles', 'biaoxianjiqiao/nnkocx0uc3hx5t7u.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11563, '激光雕刻', 'Laser engraving', 'biaoxianjiqiao/5guuu05coq5s1kz7.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11564, '宝石厂', 'Lapidary', 'biaoxianjiqiao/f730o2z6iq473sjb.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11565, '拿铁艺术', 'Latte art', 'biaoxianjiqiao/xmca8yv0dlr1fnyt.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11566, '光场摄影', 'Light field photography', 'biaoxianjiqiao/a2wqr10k81fxj4qr.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11567, '光追迹', 'Light tracing', 'biaoxianjiqiao/xdiz3hlkw7156xf1.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11568, '光画', 'Light painting', 'biaoxianjiqiao/joap24q3dp407uiv.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11569, '凸版印刷', 'Letterpress print', 'biaoxianjiqiao/78y4cm2aujn42vdj.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11570, '平版印刷', 'Lithography print', 'biaoxianjiqiao/fdx8jrbwxmbg6ccf.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11571, '低聚', 'Low-poly', 'biaoxianjiqiao/x8aegpddtkqnvlgu.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11572, 'Lomography 色', 'Lomography Color 100', 'biaoxianjiqiao/h3xr09u55ohuy7zf.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11573, '油毡印刷', 'Linocut print', 'biaoxianjiqiao/dvbc3x174dxh0zay.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11574, '蕾丝材质', 'Made of lace', 'biaoxianjiqiao/81jffitvf6z445pr.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11575, '由虹彩箔制成', 'Made of iridescent foil', 'biaoxianjiqiao/fjnd9l78daea1jg9.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11576, '曼陀罗', 'Mandala', 'biaoxianjiqiao/mch42440vqo6jfw7.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11577, '花边', 'Macrame', 'biaoxianjiqiao/49ycp2osu80shruo.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11578, '大理石花纹', 'Marbling', 'biaoxianjiqiao/stsnxhagk4ojtiu3.png', 12, '2023-08-20 16:19:30', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11579, '标记绘图', 'Marker drawing', 'biaoxianjiqiao/w10rx5hsokxs2fu8.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11580, '俄罗斯套娃', 'Matryoshka', 'biaoxianjiqiao/lk6muunlcqcpfaoe.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11581, '镶嵌细工', 'Marquetry', 'biaoxianjiqiao/25o32zm5w9yv78i3.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11582, '黑色素印刷', 'Melainotype print', 'biaoxianjiqiao/d5ht6x5b3ccbxz9b.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11583, '熔蜡', 'Melting wax', 'biaoxianjiqiao/qencna73qxwr1tgq.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11584, '网版印刷', 'Mezzotint print', 'biaoxianjiqiao/58iyks3syha233du.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11585, '千花玻璃', 'Millefiori glass', 'biaoxianjiqiao/aubxi5c8ibdpnigt.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11586, '木目金', 'Mokume-gane', 'biaoxianjiqiao/m3bczaoxy8mzm21i.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11587, '布偶风格', 'Muppet style', 'biaoxianjiqiao/7kkiit2mdt8s7dso.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11588, '单色印刷', 'Monotype print', 'biaoxianjiqiao/p47hfsy7urtaduz5.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11589, '千花挂毯', 'Millefleurs tapestry', 'biaoxianjiqiao/17sinu9e9rk9jsu1.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11590, '马赛克', 'Mosaic', 'biaoxianjiqiao/g2hwvetsgsqiqwwr.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11591, '一幅线条艺术', 'One line art', 'biaoxianjiqiao/nqrv8ykse5690ig9.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11592, '迈布里奇序列', 'Muybridge sequence', 'biaoxianjiqiao/3yo517xb04dpfo1y.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11593, '油漆', 'Oil paint', 'biaoxianjiqiao/hido1lcm5wmoen44.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11594, '折纸', 'Origami', 'biaoxianjiqiao/sqhwwlfn5j83sg27.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11595, '装饰品', 'Ornament', 'biaoxianjiqiao/forytqd5agvl684y.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11596, '针尖', 'Needlepoint', 'biaoxianjiqiao/c1kjhoh40755ddlc.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11597, '纸型', 'Papier-mache', 'biaoxianjiqiao/c9ohwgsi4ssk9rrl.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11598, '帕莱克', 'Palekh', 'biaoxianjiqiao/ngzdrf1t7rfv2tbe.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11599, '剪纸', 'Paper cutout', 'biaoxianjiqiao/tvs07k97gnknkbfp.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11600, '调色刀绘图', 'Palette knife drawing', 'biaoxianjiqiao/12ijgblzx9leekx9.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11601, '卵石艺术', 'Pebble art', 'biaoxianjiqiao/htctm23u9u5zy6p6.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11602, '钢笔画', 'Pen drawing', 'biaoxianjiqiao/efr6fszk6ro8h42r.png', 12, '2023-08-20 16:19:29', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11603, '粉彩画', 'Pastel drawing', 'biaoxianjiqiao/jcql9ryhih5he0uq.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11604, '拼布', 'Patchwork', 'biaoxianjiqiao/id2m2xw346up1ix8.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11605, '铅笔画', 'Pencil drawing', 'biaoxianjiqiao/o7vmvtjr463rqk38.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11606, '摄影作品', 'Photogram', 'biaoxianjiqiao/vxx8y3zm7zbn9bwz.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11607, '像素绘图', 'Pixel drawing', 'biaoxianjiqiao/e1ji1cbn57jsn8xk.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11608, '凹版印刷', 'Photogravure', 'biaoxianjiqiao/07oxeub7f07x4wt7.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11609, '橡皮泥', 'Plasticine', 'biaoxianjiqiao/iqtxmxfcmbqr2e4y.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11610, '烫画', 'Pyrography', 'biaoxianjiqiao/7ul1abmx4z0zxb2a.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11611, '绗缝', 'Quilted', 'biaoxianjiqiao/pbyq0kivovgw43wl.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11612, '红标打印', 'Redscale print', 'biaoxianjiqiao/4m0wiw0oxrdghsqt.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11613, '刮板艺术', 'Scratchboard art', 'biaoxianjiqiao/rmsljd04uy3m45f0.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11614, '剪贴板艺术', 'Scraperboard art', 'biaoxianjiqiao/zcctombhc4uj14m9.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11615, '斯克林肖', 'Scrimshaw', 'biaoxianjiqiao/qfeysqo4vgxllmvl.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11616, '丝网印刷', 'Screenprint', 'biaoxianjiqiao/sg6uymcw91zl7vxf.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11617, '雪球', 'Snowglobe', 'biaoxianjiqiao/laxlqs7woc5rybty.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11618, '袜子木偶风格', 'Sock puppet style', 'biaoxianjiqiao/v0wmf0j9e5dcb3z4.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11619, '扎堀', 'Shibori', 'biaoxianjiqiao/wreq7kuckoevavxr.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11620, '索塔什', 'Soutache', 'biaoxianjiqiao/oo0ft0ijo3vamp19.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11621, '素描笔记风格', 'Sketchnote style', 'biaoxianjiqiao/zbokdxqdbopfa3su.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11622, '墨流', 'Suminagashi', 'biaoxianjiqiao/5y2ixfjetbo1faxs.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11623, '手鞠', 'Temari', 'biaoxianjiqiao/4lv0cgfcd4yrh08t.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11624, '红陶', 'Terracotta', 'biaoxianjiqiao/7sxqmh8fopqg93xp.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11625, '挂毯', 'Tapestry', 'biaoxianjiqiao/9bnbun149e45kyn5.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11626, '扎染', 'Tie-dye', 'biaoxianjiqiao/0si0fg1brt7chifh.png', 12, '2023-08-20 16:19:28', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11627, '彩色玻璃', 'Stained glass', 'biaoxianjiqiao/6wonbot8i25xgsa2.png', 12, '2023-08-20 16:19:27', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11628, '水彩颜料', 'Watercolor paint', 'biaoxianjiqiao/6ipkjo62yfcoil49.png', 12, '2023-08-20 16:19:27', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11629, '用墨水笔水彩画轮廓', 'Watercolor with ink pen outline', 'biaoxianjiqiao/7q43xiehk4hpj8gh.png', 12, '2023-08-20 16:19:27', '2023-12-28 13:54:21', 0, 'biaoxianjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11630, '全身高度肖像', 'Full body height portrait', 'sheyingjiqiao/k1t9x34aaqfjkb34.png', 12, '2023-08-20 16:20:53', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11631, '高角度', 'High angle', 'sheyingjiqiao/b501kpwf2qmvl7b5.png', 12, '2023-08-20 16:20:53', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11632, '极端特写肖像', 'Extreme close-up portrait', 'sheyingjiqiao/pr0qc8ni0arlyk0e.png', 12, '2023-08-20 16:20:53', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11633, '低角度', 'Low angle', 'sheyingjiqiao/qwzkc6nsjwsauevp.png', 12, '2023-08-20 16:20:53', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11634, '鱼眼镜头', 'Fisheye lens', 'sheyingjiqiao/978783bwfcxvu1pg.png', 12, '2023-08-20 16:20:53', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11635, '极宽肖像', 'Extreme wide portrait', 'sheyingjiqiao/ss1fha182gljxdf5.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11636, '微距拍摄', 'Macro shot', 'sheyingjiqiao/2xa94smodxk5li9q.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11637, '针孔摄影', 'Pinhole photography', 'sheyingjiqiao/pwek0x217exntcq2.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11638, '照片', 'Mugshot', 'sheyingjiqiao/fx1v9efvxxnrxj3c.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11639, '航拍', 'Aerial photography', 'sheyingjiqiao/fdhniawjpnhm8ghf.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11640, '坐像', 'Sitting portrait', 'sheyingjiqiao/38oyaqigsf8ywhxn.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11641, '越过肩膀拍摄的肖像', 'Portrait shot over the shoulder', 'sheyingjiqiao/zfcjfn8e4jaz45uy.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11642, '剖面图', 'Profile view', 'sheyingjiqiao/w9zjgscmf8z211is.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11643, '超广角镜头', 'Ultra wide lens', 'sheyingjiqiao/1c5lhkhk520plvw0.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11644, '长焦镜头', 'Telephoto lens', 'sheyingjiqiao/v7dv4klv8x98slrr.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11645, '倾斜移位', 'Tilt-Shift', 'sheyingjiqiao/5edlhpw594l1ystp.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11646, '半身中弹', 'half body shot', 'sheyingjiqiao/uwa0ow5bup1bku9b.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11647, '明暗对比', 'Chiaroscuro', 'sheyingjiqiao/fyaq32kopkmprf3a.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11648, '特写镜头', 'close up shot', 'sheyingjiqiao/hqbvsty5l9chkjic.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11649, '广角镜头', 'Wide angle lens', 'sheyingjiqiao/9bslobo2eta77dzl.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11650, '逆光人像拍摄', 'Portrait shot with back lighting', 'sheyingjiqiao/yfa4dl4v619q9icn.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11651, '底部照明的人像拍摄', 'Portrait shot with bottom lighting', 'sheyingjiqiao/8opjf5k3vc3md64l.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11652, '对比光下的人像拍摄', 'Portrait shot with contrasty lighting', 'sheyingjiqiao/s77whfyagjrtxdo2.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11653, '强光下的人像拍摄', 'Portrait shot with hard lighting', 'sheyingjiqiao/2sdzw7nzw6fe8236.png', 12, '2023-08-20 16:20:52', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11654, '从百叶窗透过光影拍摄的人', 'Portrait shot with light and shadow from window blinds', 'sheyingjiqiao/adwfmz255luqzhv2.png', 12, '2023-08-20 16:20:51', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11655, '红光下拍摄的人像', 'Portrait shot with red light', 'sheyingjiqiao/h23l7rr8vpdj1jdi.png', 12, '2023-08-20 16:20:51', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11656, '使用桃色和青色灯光拍摄的', 'Portrait shot with peach and cyan lighting', 'sheyingjiqiao/yggcz935v6ae3zn6.png', 12, '2023-08-20 16:20:51', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11657, '霓虹灯下的人像拍摄', 'Portrait shot with neon lighting', 'sheyingjiqiao/ms8jaad4cn4snqv6.png', 12, '2023-08-20 16:20:51', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11658, '侧光人像拍摄', 'Portrait shot with side lighting', 'sheyingjiqiao/b4zziw3vhudiep4l.png', 12, '2023-08-20 16:20:51', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11659, '柔和灯光下的人像拍摄', 'Portrait shot with soft lighting', 'sheyingjiqiao/xgiugg78gi13xwwb.png', 12, '2023-08-20 16:20:51', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11660, '顶光人像拍摄', 'Portrait shot with top lighting', 'sheyingjiqiao/fulv0q0x38sm0w1k.png', 12, '2023-08-20 16:20:51', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11661, '阳光下拍摄的人像', 'Portrait shot with sunlight', 'sheyingjiqiao/1jizd9xrizcut15j.png', 12, '2023-08-20 16:20:51', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11662, '银版照相法', 'Daguerreotype', 'sheyingjiqiao/itzi4vp3ynwu0aol.png', 12, '2023-08-20 16:20:51', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11663, '全家福', 'Family portrait', 'sheyingjiqiao/tps74t1sqc4k18xb.png', 12, '2023-08-20 16:20:51', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11664, '双重接触', 'Double exposure', 'sheyingjiqiao/tmmyj48aw2kih3z2.png', 12, '2023-08-20 16:20:51', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11665, '快门速度快', 'Fast shutter speed', 'sheyingjiqiao/v2owx0azixs7oce9.png', 12, '2023-08-20 16:20:51', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11666, '法医摄影', 'Forensic photography', 'sheyingjiqiao/zfib8o5s8tbtzof0.png', 12, '2023-08-20 16:20:51', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11667, '集体照', 'Group portrait', 'sheyingjiqiao/y2apafo2qvbiydpo.png', 12, '2023-08-20 16:20:51', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11668, '高动态范围', 'HDR', 'sheyingjiqiao/wll3kbrdckhdsmva.png', 12, '2023-08-20 16:20:51', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11669, '故意移动相机', 'Intentional camera movement', 'sheyingjiqiao/tofdxcfc2n2jbp0f.png', 12, '2023-08-20 16:20:51', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11670, '霍尔加摄影', 'Holga photography', 'sheyingjiqiao/0gpvw9ow76c17c8f.png', 12, '2023-08-20 16:20:50', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11671, '洛莫摄影', 'Lomography', 'sheyingjiqiao/7t322e9b00c0p2cj.png', 12, '2023-08-20 16:20:50', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11672, '诺林', 'Knolling', 'sheyingjiqiao/m2ror971ew8abymg.png', 12, '2023-08-20 16:20:50', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11673, '光场摄影', 'Light field photography', 'sheyingjiqiao/1d0nkjl48f96sids.png', 12, '2023-08-20 16:20:50', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11674, '慢快门速度', 'Slow shutter speed', 'sheyingjiqiao/i9vab5i4waj40rwl.png', 12, '2023-08-20 16:20:50', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11675, '低保真摄影', 'Lo-fi photography', 'sheyingjiqiao/0idjnh269189ugwk.png', 12, '2023-08-20 16:20:50', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11676, '光画', 'Light painting', 'sheyingjiqiao/jlpw1o0gfa93qken.png', 12, '2023-08-20 16:20:50', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11677, '日照仪', 'Solargraph', 'sheyingjiqiao/euvxdwls6bmn7xlt.png', 12, '2023-08-20 16:20:50', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11678, '街头摄影', 'Street photography', 'sheyingjiqiao/ur4mg1n568rmj6a3.png', 12, '2023-08-20 16:20:50', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11679, '紫外线摄影', 'Ultraviolet photography', 'sheyingjiqiao/sp514ssqgbb3qvz6.png', 12, '2023-08-20 16:20:50', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11680, '太阳能图', 'Solargram', 'sheyingjiqiao/0o9v225fo84qvn33.png', 12, '2023-08-20 16:20:50', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11681, '复古镜头', 'Vintage lens', 'sheyingjiqiao/g74cb600gusgvsro.png', 12, '2023-08-20 16:20:50', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11682, 'Vogue时尚', 'Vogue', 'sheyingjiqiao/y5jrop2o710nxp2o.png', 12, '2023-08-20 16:20:50', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11683, '水下摄影', 'Underwater photography', 'sheyingjiqiao/8m6xoss2famc2bq9.png', 12, '2023-08-20 16:20:50', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11684, '复古照片', 'Vintage photograph', 'sheyingjiqiao/ayxzq84nn0wolj06.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11685, 'V杂志', 'V Magazine', 'sheyingjiqiao/41xeqytrdul3un7a.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11686, 'X射线', 'X-ray', 'sheyingjiqiao/k6nyvhxuilccvfc9.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11687, '战争摄影', 'War photography', 'sheyingjiqiao/xb2moaxddeyfqzy4.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11688, 'W杂志', 'W Magazine', 'sheyingjiqiao/tc712rqrw1oqlxpr.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11689, '哈珀时尚', 'Harper\'s Bazaar', 'sheyingjiqiao/lgqom7be2mjjd6ve.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11690, '福马潘400', 'Fomapan 400', 'sheyingjiqiao/0ptvuf7f7xl8oa9c.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11691, '富士彩色 Fujichr', 'Fujicolor Fujichrome Velvia 100', 'sheyingjiqiao/qcr1eyc6ma06tx1q.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11692, '富士彩色Pro 400H', 'Fujicolor Pro 400H', 'sheyingjiqiao/gpseoiu8xfi4vd59.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11693, '富士彩色C200', 'Fujicolor C200', 'sheyingjiqiao/dwf2p4cp709ew6bn.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11694, '富士胶片 Neopan ', 'Fujifilm Neopan 100', 'sheyingjiqiao/mu2sibqy9s8517j3.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11695, '富士Chrome Pro', 'Fujichrome Provia 100F', 'sheyingjiqiao/2zow7knebxpj0o9g.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11696, '富士彩色 Superia', 'Fujicolor Superia X-TRA 400', 'sheyingjiqiao/4xuqfaf4gbnsf0jn.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11697, '柯达 Ektar 100', 'Kodak Ektar 100', 'sheyingjiqiao/dnahu69bvhts963m.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11698, '柯达 Portra 16', 'Kodak Portra 160', 'sheyingjiqiao/jqlpghj6sbc0qxfn.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11699, '柯达 Ektachrom', 'Kodak Ektachrome E100', 'sheyingjiqiao/veclzqsesu75dtdv.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11700, '柯达 Portra 40', 'Kodak Portra 400', 'sheyingjiqiao/8nje5c9cyvpteuxl.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11701, '柯达 UltraMax ', 'Kodak UltraMax 400', 'sheyingjiqiao/q1yys60w0kvokbha.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11702, 'Lomography 色', 'Lomography Color 100', 'sheyingjiqiao/1cvtyvaa33cjwfyx.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11703, '柯达 Tri-X 400', 'Kodak Tri-X 400', 'sheyingjiqiao/4npv19kuxfggjs06.png', 12, '2023-08-20 16:20:49', '2023-12-28 13:54:21', 0, 'sheyingjiqiao', '');
INSERT INTO `df_robot_prompt` VALUES (11704, '阿尔贝托·贾科梅蒂', 'Alberto Giacometti', 'zhanlandiaosu/eu3ahqqyxddeage3.png', 12, '2023-08-20 16:19:03', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11705, '亚历山大·考尔德', 'Alexander Calder', 'zhanlandiaosu/hnivhctbze4q2q5d.png', 12, '2023-08-20 16:19:03', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11706, '阿尔弗雷多·贾尔', 'Alfredo Jaar', 'zhanlandiaosu/twl197i1bxz0o5df.png', 12, '2023-08-20 16:19:03', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11707, '安尼什·卡普尔', 'Anish Kapoor', 'zhanlandiaosu/rod7ix6wun9f27fe.png', 12, '2023-08-20 16:19:03', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11708, '安妮特鲁伊特', 'Anne Truitt', 'zhanlandiaosu/xlr3a6emm6u1iw9e.png', 12, '2023-08-20 16:19:03', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11709, '比尔·维奥拉', 'Bill Viola', 'zhanlandiaosu/9q3waectz73nki5s.png', 12, '2023-08-20 16:19:03', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11710, '伯恩诺特·斯米尔德', 'Berndnaut Smilde', 'zhanlandiaosu/t04km3m59l6mdx2y.png', 12, '2023-08-20 16:19:03', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11711, '布赖恩·容根', 'Brian Jungen', 'zhanlandiaosu/7o2xogzqkyws517j.png', 12, '2023-08-20 16:19:03', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11712, '蔡国强', 'Cai Guo-Qiang', 'zhanlandiaosu/ovj94muirihcrjxv.png', 12, '2023-08-20 16:19:03', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11713, '布鲁斯·瑙曼', 'Bruce Nauman', 'zhanlandiaosu/4qoubmeupm20ojkk.png', 12, '2023-08-20 16:19:03', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11714, '盐田千春', 'Chiharu Shiota', 'zhanlandiaosu/ngfahcvu4hix6rs6.png', 12, '2023-08-20 16:19:03', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11715, '克里斯蒂安·波尔坦斯基', 'Christian Boltanski', 'zhanlandiaosu/ce6p9ob6wdrwgu8r.png', 12, '2023-08-20 16:19:03', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11716, '科里大天使', 'Cory Arcangel', 'zhanlandiaosu/mytm1tqt7dkp425w.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11717, '科妮莉亚·帕克', 'Cornelia Parker', 'zhanlandiaosu/0vpz3denih0cu4kz.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11718, '丹·科伦', 'Dan Colen', 'zhanlandiaosu/rpyx1ltjvuk9f11l.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11719, '爱德华·金霍尔兹', 'Edward Kienholz', 'zhanlandiaosu/w8st5qc1asg4bf0t.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11720, '大卫·斯普里格斯', 'David Spriggs', 'zhanlandiaosu/8dmdan5e6ypxxl7h.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11721, '徐道浩', 'Do Ho Suh', 'zhanlandiaosu/cojj2slu3tspvr9d.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11722, '艾伦·朱厄特', 'Ellen Jewett', 'zhanlandiaosu/kaznz36hhyjcs47p.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11723, '欧文·沃姆', 'Erwin Wurm', 'zhanlandiaosu/be1jyyctzc847xly.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11724, '埃内斯托·内托', 'Ernesto Neto', 'zhanlandiaosu/ksxd5dmh490tfhjy.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11725, '弗朗茨·韦斯特', 'Franz West', 'zhanlandiaosu/ynkvua4m80fl1f3e.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11726, '加布里埃尔·道维', 'Gabriel Dawe', 'zhanlandiaosu/hd4tv7ovb9esl1jq.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11727, '汉斯·哈克', 'Hans Haacke', 'zhanlandiaosu/meqa2gebtp0buysw.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11728, '格哈德·里希特', 'Gerhard Richter', 'zhanlandiaosu/zrsstx7eem3xsyzl.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11729, '艾萨克·朱利安', 'Isaac Julien', 'zhanlandiaosu/u9i7dr2gz3m37n0h.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11730, '亨利·摩尔', 'Henry Moore', 'zhanlandiaosu/5de5u6njzaj0f1vz.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11731, '雅各布·桥本', 'Jacob Hashimoto', 'zhanlandiaosu/evsk97sag996hugi.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11732, '詹姆斯·李·拜尔斯', 'James Lee Byars', 'zhanlandiaosu/6lm0w6o9f4t70mw7.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11733, '贾森·罗德斯', 'Jason Rhoades', 'zhanlandiaosu/ojexjw0fc3k0t01u.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11734, '乔安娜·瓦斯康塞洛斯', 'Joana Vasconcelos', 'zhanlandiaosu/30t6itfid6n9560p.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11735, '路易丝·布尔乔亚', 'Louise Bourgeois', 'zhanlandiaosu/xzv3e3n2jll4bvou.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11736, '莱安德罗·埃利希', 'Leandro Erlich', 'zhanlandiaosu/nztqkb70lymn3b53.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11737, '马克·奎因', 'Marc Quinn', 'zhanlandiaosu/cm07qtvjwcnhg7s8.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11738, '马丁·克里德', 'Martin Creed', 'zhanlandiaosu/10wi6jia980kwwvj.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11739, '马修·巴尼', 'Matthew Barney', 'zhanlandiaosu/w3aplhikcsbwoozi.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11740, '毛里齐奥·卡特兰', 'Maurizio Cattelan', 'zhanlandiaosu/3gtbhb68re0fv487.png', 12, '2023-08-20 16:19:02', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11741, '迈克·凯利', 'Mike Kelley', 'zhanlandiaosu/mrzq7z22ujpr1vh7.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11742, '莫娜·哈图姆', 'Mona Hatoum', 'zhanlandiaosu/hpwc2ynl64ijejk8.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11743, '帕特里夏·皮奇尼尼', 'Patricia Piccinini', 'zhanlandiaosu/z32lc3hft3iaz91t.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11744, '白南准', 'Nam June Paik', 'zhanlandiaosu/gvjyv7cyp1i5w2y3.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11745, '保罗·麦卡锡', 'Paul McCarthy', 'zhanlandiaosu/mw7yqlyms6fz58dz.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11746, '雷切尔·怀特雷德', 'Rachel Whiteread', 'zhanlandiaosu/pa87v2wdti3mvw6e.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11747, '拉沙德·阿拉克巴罗夫', 'Rashad Alakbarov', 'zhanlandiaosu/4gg8c9a1ww4jnlq3.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11748, '彼得·费施利', 'Peter Fischli', 'zhanlandiaosu/64fbpm9svgmqk0dr.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11749, '丽贝卡·路易斯·劳', 'Rebecca Louise Law', 'zhanlandiaosu/ser3as1sif18517k.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11750, '理查德·塞拉', 'Richard Serra', 'zhanlandiaosu/hn2lspsvo5de5s0k.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11751, '池田良二', 'Ryoji Ikeda', 'zhanlandiaosu/2o78vfia9t48bhce.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11752, '乌尔苏拉·冯·雷丁斯瓦德', 'Ursula von Rydingsvard', 'zhanlandiaosu/4kptxvj0wuzdbz17.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11753, '施莎拉', 'Sarah Sze', 'zhanlandiaosu/3yrpg21zxwmsdc9w.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11754, '凡妮莎·比克罗夫特', 'Vanessa Beecroft', 'zhanlandiaosu/0nzj0p1gg5mvlfra.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11755, '团队实验室', 'teamLab', 'zhanlandiaosu/ezltolm0jdjmfaku.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11756, '雅科夫·阿甘', 'Yaacov Agam', 'zhanlandiaosu/uun1dyrliqn3wark.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11757, '徐冰', 'Xu Bing', 'zhanlandiaosu/9nqwagjhyui75p82.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11758, '草间弥生', 'Yayoi Kusama', 'zhanlandiaosu/0xau0zuewux50mox.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11759, '亚当·马丁纳基斯', 'Adam Martinakis', 'zhanlandiaosu/qpeyf548uqkq1ku9.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11760, '亚历山大·阿奇彭科', 'Alexander Archipenko', 'zhanlandiaosu/74uv4l07ordlju6c.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11761, '艾未未', 'Ai Weiwei', 'zhanlandiaosu/1wo9uhf8suzqmuqa.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11762, '安东尼奥·卡诺瓦', 'Antonio Canova', 'zhanlandiaosu/qiqg4823vj2odbne.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11763, '安东尼·葛姆雷', 'Antony Gormley', 'zhanlandiaosu/u8hrdsftz1noummb.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11764, '奥古斯塔·萨维奇', 'Augusta Savage', 'zhanlandiaosu/23dqigqwg481dxqw.png', 12, '2023-08-20 16:19:01', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11765, '阿里斯蒂德·马约尔', 'Aristide Maillol', 'zhanlandiaosu/amar4krnlbqvjuv7.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11766, '奥古斯特·罗丹', 'Auguste Rodin', 'zhanlandiaosu/tb23iow54pqdjpv6.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11767, '安迪·戈兹沃西', 'Andy Goldsworthy', 'zhanlandiaosu/dpa3cirw4ri5a647.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11768, '芭芭拉·赫普沃斯', 'Barbara Hepworth', 'zhanlandiaosu/om268t35di3tjjpr.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11769, '布鲁斯·芒罗', 'Bruce Munro', 'zhanlandiaosu/emiy2m9r1d70xnsd.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11770, '阿伦·德梅茨', 'Aron Demetz', 'zhanlandiaosu/906mrvl7byou4461.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11771, '布鲁诺·沃尔波特', 'Bruno Walpoth', 'zhanlandiaosu/wr8h3cwvmn01az97.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11772, '布鲁诺·卡塔拉诺', 'Bruno Catalano', 'zhanlandiaosu/m1cmghbe39pzeqpg.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11773, '卡米尔·克洛岱尔', 'Camille Claudel', 'zhanlandiaosu/rdmlef1t0k01l146.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11774, '卡尔·安德烈', 'Carl Andre', 'zhanlandiaosu/eu5utu7tjv7t41zi.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11775, '塞里斯·温·埃文斯', 'Cerith Wyn Evans', 'zhanlandiaosu/x34jodelpwvx9kev.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11776, '卡斯滕·尼古拉', 'Carsten Nicolai', 'zhanlandiaosu/bk7j76l2inq1wyh6.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11777, '达米恩·赫斯特', 'Damien Hirst', 'zhanlandiaosu/pqhc01nw1fkfzmx3.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11778, '崔正花', 'Choi Jeong-Hwa', 'zhanlandiaosu/xy8yuvso03beexl8.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11779, '丹·弗莱文', 'Dan Flavin', 'zhanlandiaosu/p89krv9r2wna3y09.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11780, '达安·罗斯加德', 'Daan Roosegaarde', 'zhanlandiaosu/zou5c8rnjwmlt7i5.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11781, '丹尼尔·阿尔轩', 'Daniel Arsham', 'zhanlandiaosu/bmrn7ajqecq0ldrr.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11782, '埃德蒙妮娅·刘易斯', 'Edmonia Lewis', 'zhanlandiaosu/mfn0tgcvgv6c2f88.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11783, '古斯塔夫·维格兰', 'Gustav Vigeland', 'zhanlandiaosu/clc5i2iiam0lp72s.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11784, '加斯顿·拉雪兹', 'Gaston Lachaise', 'zhanlandiaosu/69djir0setyayevy.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11785, '费利佩·潘通', 'Felipe Pantone', 'zhanlandiaosu/9tyykwemriph8rs5.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11786, '埃尔阿纳苏伊', 'El Anatsui', 'zhanlandiaosu/ogw0p73chc6gklhs.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11787, '杰夫·昆斯', 'Jeff Koons', 'zhanlandiaosu/rjp1vapbwxht8b0r.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11788, '詹姆斯·普拉迪尔', 'James Pradier', 'zhanlandiaosu/rrw6jmrtbwi02iy6.png', 12, '2023-08-20 16:19:00', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11789, '以赛亚扎加尔', 'Isaiah Zagar', 'zhanlandiaosu/pc2ublh6v1x33mpe.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11790, '珍妮·霍尔泽', 'Jenny Holzer', 'zhanlandiaosu/rw7x9azse11zrwxz.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11791, '约瑟夫·康奈尔', 'Joseph Cornell', 'zhanlandiaosu/nd7s5saovkkhuck7.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11792, '约瑟夫·博伊斯', 'Joseph Beuys', 'zhanlandiaosu/pissp30297f89cy1.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11793, '金子淳', 'Jun Kaneko', 'zhanlandiaosu/ypghmskyhu8chjc4.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11794, '劳尔·普罗沃斯特', 'Laure Prouvost', 'zhanlandiaosu/0wo08fp7ihmklqbo.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11795, '琳达·本格里斯', 'Lynda Benglis', 'zhanlandiaosu/zfl1e3tyy2emo0il.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11796, '克里斯·库克西', 'Kris Kuksi', 'zhanlandiaosu/dycbhwbohxp7j1di.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11797, '刘伟', 'Liu Wei', 'zhanlandiaosu/xok18zyo543e8xdt.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11798, '洛伦佐·奎因', 'Lorenzo Quinn', 'zhanlandiaosu/07trg1kyglyoiszh.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11799, '李·邦特库', 'Lee Bontecou', 'zhanlandiaosu/yarqmalb29q4dp79.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11800, '玛丽娜·阿布拉莫维奇', 'Marina Abramovic', 'zhanlandiaosu/g6mzh58vygnug64w.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11801, '奥西普·扎德金', 'Ossip Zadkine', 'zhanlandiaosu/oqrddryi2veapjcs.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11802, '马丁·普尔伊尔', 'Martin Puryear', 'zhanlandiaosu/je1fhwuxg9dma6ht.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11803, '拉斐尔·洛扎诺·赫默', 'Rafael Lozano-Hemmer', 'zhanlandiaosu/h364l8cw46qtxc3f.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11804, '奥拉维尔·埃利亚松', 'Olafur Eliasson', 'zhanlandiaosu/6ljf02ql46v9j5va.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11805, '拉格纳·基亚坦森', 'Ragnar Kjartansson', 'zhanlandiaosu/awuvznq49ay1r652.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11806, '帕特里克·多尔蒂', 'Patrick Dougherty', 'zhanlandiaosu/66jpffb74jscb0gt.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11807, '雷菲克·阿纳多尔', 'Refik Anadol', 'zhanlandiaosu/0u8nf8lcxvf85a1e.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11808, '理查德·朗', 'Richard Long', 'zhanlandiaosu/5yhhgfxpa8c7p0nb.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11809, '雷蒙·杜尚·维庸', 'Raymond Duchamp-Villon', 'zhanlandiaosu/dtfb1a5r7vmvx52h.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11810, '理查德·麦克唐纳', 'Richard MacDonald', 'zhanlandiaosu/a4x4zvg9bio4vq8k.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11811, '黑川良一', 'Ryoichi Kurokawa', 'zhanlandiaosu/m40zqvmldm06gv18.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11812, '托尼·克拉格', 'Tony Cragg', 'zhanlandiaosu/btwkpiqm2bo5jx3n.png', 12, '2023-08-20 16:18:59', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11813, '西奥·詹森', 'Theo Jansen', 'zhanlandiaosu/3n18q92po7jisv91.png', 12, '2023-08-20 16:18:58', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11814, '托尼·奥斯勒', 'Tony Oursler', 'zhanlandiaosu/vu306h33hyhurd4e.png', 12, '2023-08-20 16:18:58', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11815, '宫岛达夫', 'Tatsuo Miyajima', 'zhanlandiaosu/fzarz54ufhy8wfv5.png', 12, '2023-08-20 16:18:58', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11816, '斯坦尼斯瓦夫·苏卡尔斯基', 'Stanislaw Szukalski', 'zhanlandiaosu/er97drhrjkatv892.png', 12, '2023-08-20 16:18:58', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11817, '维托·阿孔奇', 'Vito Acconci', 'zhanlandiaosu/9sur2e8026w3gjt5.png', 12, '2023-08-20 16:18:58', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11818, '威廉·佐拉克', 'William Zorach', 'zhanlandiaosu/i7vhdgpsi169k8of.png', 12, '2023-08-20 16:18:58', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11819, '韦德·盖顿', 'Wade Guyton', 'zhanlandiaosu/xwc77uopr63mf5ps.png', 12, '2023-08-20 16:18:58', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11820, '因卡·绍尼巴尔', 'Yinka Shonibare', 'zhanlandiaosu/i8yqei834r6j91e7.png', 12, '2023-08-20 16:18:58', '2023-12-28 13:54:21', 0, 'zhanlandiaosu', '');
INSERT INTO `df_robot_prompt` VALUES (11821, '某魔法指数', 'A Certain Magical Index', 'dongman/r5zdthy7upp1o3xc.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11822, '爆炸头武士', 'Afro Samurai', 'dongman/tivtkjcw864tw5sk.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11823, '阿尔诺亚零', 'Aldnoah.Zero', 'dongman/klaar4uqmgz2r9og.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11824, '王牌律师', 'Ace Attorney', 'dongman/qnzbzu02s6prau76.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11825, '阿基拉', 'Akira', 'dongman/88kwqtjqibwk71o3.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11826, '天使节拍', 'Angel Beats', 'dongman/twfgurdl0lsf2lc7.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11827, '阿童木', 'Astro Boy', 'dongman/im02x0zvxlafc5p9.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11828, '动漫风格', 'Anime style', 'dongman/5ps02hzecuz3ausl.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11829, '进击的泰坦', 'Attack on Titan', 'dongman/2lcpm6l9roj5y3xa.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11830, '最后的气宗阿凡达', 'Avatar the Last Airbender', 'dongman/nnako28o7cnd4ibq.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11831, '东漫画大王', 'Azumanga Daioh', 'dongman/utvk18gqe4c28wnk.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11832, '化物语', 'Bakemonogatari', 'dongman/e5svcz8p6dmwcvfo.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11833, '巴卡诺', 'Baccano', 'dongman/vz6vn5diphhbj2th.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11834, '小岛彩美', 'Ayami Kojima', 'dongman/n4bzcwml3e2mpmxq.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11835, '赤脚一代', 'Barefoot Gen', 'dongman/wkh78qsre4rupjhe.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11836, '黑执事', 'Black Butler', 'dongman/zglpemj7xun6jsnw.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11837, '责备', 'Blame', 'dongman/ycglc81yibsw6yw4.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11838, '狂暴', 'Berserk', 'dongman/b930zy2s70y30vcj.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11839, '黑泻湖', 'Black Lagoon', 'dongman/x3iymztqfm9xowpj.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11840, '漂白', 'Bleach', 'dongman/4x24021huqnc0fiq.png', 12, '2023-08-20 16:19:14', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11841, '血源诅咒', 'Bloodborne', 'dongman/53uav2bhphuj7ix5.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11842, '赤壁动漫风格', 'Chibi anime style', 'dongman/dnuejm4xvzx6dkyc.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11843, '电锯人', 'Chainsaw Man', 'dongman/6v9p7pt8gcustufx.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11844, '恶魔城', 'Castlevania', 'dongman/g1us9shu0knjth61.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11845, '追逐失落声音的孩子们', 'Children Who Chase Lost Voices', 'dongman/ko9j3vbd7lxry1cv.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11846, '克兰纳德', 'Clannad', 'dongman/o7ymr85bqcmn18cs.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11847, '反叛鲁斯', 'Code Geass', 'dongman/0wpomxgvfituabxv.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11848, '星际牛仔', 'Cowboy Bebop', 'dongman/0xb1zpvzs8zcrx4d.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11849, '黑暗的灵魂', 'Dark Souls', 'dongman/u73ed3lcrwoquubh.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11850, '恶魔杀手', 'Demon Slayer', 'dongman/i10cgbh52xpukl1s.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11851, '死亡笔记', 'Death Note', 'dongman/n76vsw5s3sxle58e.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11852, '恶魔人爱哭鬼', 'Devilman Crybaby', 'dongman/dou5ea0wr5v086vz.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11853, '哆啦A梦', 'Doraemon', 'dongman/8kbkmfzsaufj941m.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11854, '多罗埃多罗', 'Dorohedoro', 'dongman/0rtdfr682z5pv2ho.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11855, '名侦探柯南', 'Detective Conan', 'dongman/4acecj4fp5otpyt9.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11856, '龙珠Z', 'Dragon Ball Z', 'dongman/h9oiuv6ojtxwryhv.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11857, '龙珠Z 卡卡罗特', 'Dragon Ball Z Kakarot', 'dongman/vgf3d6epavvk2xwx.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11858, '精灵之歌', 'Elfen Lied', 'dongman/pkx09bhv97anibww.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11859, '因此代理', 'Ergo Proxy', 'dongman/3ijm5cxqjus2nwjw.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11860, '尤里卡七号', 'Eureka Seven', 'dongman/ykvhyc8js7q7gr33.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11861, '福音战士', 'Evangelion', 'dongman/0224whyn5crqms0n.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11862, 'FLCL', 'FLCL', 'dongman/6y613pu3urrko3ja.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11863, '命运零', 'FateZero', 'dongman/ozngmem0x0ryl1d1.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11864, '命运', 'Fate', 'dongman/d6dweeg6kecep78w.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11865, '甘茨', 'Gantz', 'dongman/z39fqi3cnsgvh249.png', 12, '2023-08-20 16:19:13', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11866, '最终幻想VII', 'Final Fantasy VII', 'dongman/ppgmpevkw37ygbmi.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11867, '学园动漫风格', 'Gakuen anime style', 'dongman/ayeg05l9bxtqypgi.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11868, '全金属炼金术士', 'Fullmetal Alchemist', 'dongman/z8ud7j6ufslac16o.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11869, '高盖噶尔', 'GaoGaiGar', 'dongman/xs17458dv185mmjr.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11870, '银河铁道999', 'Galaxy Express 999', 'dongman/e4032bzftm44fra9.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11871, '剧画动漫风格', 'Gekiga anime style', 'dongman/s9ukctt7moempdfo.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11872, '原神', 'Genshin', 'dongman/5oob8pw7n0qnbsn1.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11873, '盖奇曼', 'Gatchaman', 'dongman/r9vyb32dwz6nt8pu.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11874, '攻壳机动队', 'Ghost In The Shell', 'dongman/d6fokscnwobuf8t9.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11875, '银魂', 'Gintama', 'dongman/ah8tloz8d69w7f18.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11876, '萤火虫之墓', 'Grave of the Fireflies', 'dongman/m1tzmk95tyxpysd7.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11877, '《罪恶装备》Xrd RE', 'Guilty Gear Xrd REV 2', 'dongman/08q3pudv92uef70h.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11878, '永井刚', 'Go Nagai', 'dongman/8cls6lzp5oalkotv.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11879, '天元螺岩', 'Gurren Lagann', 'dongman/z9kcvuts14lexd6d.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11880, '高达', 'Gundam', 'dongman/ooaphaz0f9t35xx3.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11881, '一炮一炮', 'Hajime no Ippo', 'dongman/3lillr0n8myj7mir.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11882, '赫尔辛', 'Helsing', 'dongman/g4l9upsyk8p125m5.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11883, '荒川弘', 'Hiromu Arakawa', 'dongman/pbx35ev512pzm4af.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11884, '地狱警察', 'Inferno Cop', 'dongman/trsusjxamktoxbcl.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11885, '犬夜叉', 'Inuyasha', 'dongman/431ol2si17glt94j.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11886, 'J恐怖动漫风格', 'J Horror anime style', 'dongman/ubwn4m8nbeknbbpr.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11887, '全职猎人', 'Hunter x Hunter', 'dongman/jkm2en4fcmt12i7l.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11888, '哈尔的移动城堡', 'Howl\'s Moving Castle', 'dongman/8bcjikdyxj8yj11d.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11889, '时代物动漫风格', 'Jidaimono anime style', 'dongman/h5c4huybf9ryc3hc.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11890, '星际5555', 'Interstella 5555', 'dongman/ab7nimkcg24gctsn.png', 12, '2023-08-20 16:19:12', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11891, '犬屋敷', 'Inuyashiki', 'dongman/vr5l86s971h1do9b.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11892, '地狱少女', 'Jigoku Shoujo', 'dongman/pvrsrxxvofbpa459.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11893, '城圣动漫风格', 'Josei anime style', 'dongman/1aib7yesl3tipqyb.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11894, 'JoJo的奇妙冒险', 'JoJos Bizarre Adventure', 'dongman/vtwrstjtbjyh3t7i.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11895, '卡哇伊动漫风格', 'Kawaii anime style', 'dongman/oe5cfuhdcuexc07k.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11896, '柔术海战', 'Jujutsu Kaisen', 'dongman/6tls5jd04nqmr5lj.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11897, '兽之友', 'Kemono Friends', 'dongman/7slbrkkhymqp741l.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11898, 'Kodomomuke动漫', 'Kodomomuke anime style', 'dongman/90lwqg42bbeq6z1b.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11899, '琪琪的送货服务', 'Kiki\'s Delivery Service', 'dongman/fp15ph1bjlmaz2g9.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11900, 'Kemonomimi 动', 'Kemonomimi anime style', 'dongman/nqq58tg6jb6dzivk.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11901, '骗子游戏', 'Liar Game', 'dongman/nckf9fmmo6al8ogr.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11902, '小魔女学园', 'Little Witch Academia', 'dongman/td5cbcn6tdskghzq.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11903, '深渊制造', 'Made in Abyss', 'dongman/me2n8duu7pudbt73.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11904, '幸运星', 'Lucky Star', 'dongman/g7irenzy9ue1allk.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11905, '鲁邦三世', 'Lupin the Third', 'dongman/e9yf8al90vctr6t9.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11906, '魔法小圆', 'Madoka Magica', 'dongman/ebgxrjmdaklai3m0.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11907, '新海诚', 'Makoto Shinkai', 'dongman/369kcm5c18ihmuq1.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11908, '超时空要塞', 'Macross', 'dongman/katq53jcx0nipa72.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11909, '车田雅美', 'Masami Kurumada', 'dongman/8wnx6pelak224o0u.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11910, '回转企鹅罐', 'Mawaru Penguindrum', 'dongman/yjzo76gw4mxf7a04.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11911, '灵能百分百', 'Mob Psycho 100', 'dongman/lj4xfv9qhbka1kow.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11912, '机甲动漫风格', 'Mecha anime style', 'dongman/22d8ciwfbgh9il9l.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11913, '幽灵', 'Mononoke', 'dongman/61ro6wen0pzhb05b.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11914, '萌动漫风格', 'Moe anime style', 'dongman/acu6qfwavj740bov.png', 12, '2023-08-20 16:19:11', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11915, '虫师', 'Mushishi', 'dongman/knsbv2k80ykcf2lm.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11916, '七太在', 'Nanatsu no Taizai', 'dongman/bo39anrltv0e78gw.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11917, '我的英雄学院', 'My Hero Academia', 'dongman/83iwiwm9xng1b8dn.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11918, '鸣人', 'Naruto', 'dongman/a45f7fn6sw72dqaq.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11919, '夏目友人帐', 'Natsume Yuujinchou', 'dongman/pj30wcgwzoqftc9g.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11920, '竹内直子', 'Naoko Takeuchi', 'dongman/t4w21ig95xvnachw.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11921, '新世纪福音战士', 'Neon Genesis Evangelion', 'dongman/plvbm3zbqqdwpprg.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11922, '风之谷', 'Nausica', 'dongman/0hfalehsp4y8rfp4.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11923, '没有游戏就没有生活', 'No Game No Life', 'dongman/t6g2xrqzegrzti9l.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11924, '一拳超人', 'One-Punch Man', 'dongman/4nqkm8vj40oen2hm.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11925, '尼尔机械纪元', 'Nier Automata', 'dongman/ko1uw7oqdssn18oh.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11926, '一块', 'One Piece', 'dongman/bzv1ouwqch1vpl0d.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11927, '手冢小三', 'Ozamu Tezuka', 'dongman/e816smtxxiglfehg.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11928, '完美的蓝色', 'Perfect Blue', 'dongman/23ywthlcz11m014h.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11929, '神奇宝贝', 'Pokemon', 'dongman/r8u11gx6y2f9uv96.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11930, '波姆波科', 'Pom Poko', 'dongman/8x44u98svnm5ver5.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11931, '女神异闻录5前锋', 'Persona 5 Strikers', 'dongman/j32oam0pyti9kt9f.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11932, '波妞', 'Ponyo', 'dongman/9iaqvm9f9xoqy6ka.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11933, '红猪', 'Porco Rosso', 'dongman/q6i1a4pdc11k3hqv.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11934, '心理通行证', 'Psycho-Pass', 'dongman/jbu2yknc4ym32h8s.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11935, '写实动漫风格', 'Realistic anime style', 'dongman/jkbw5y3ky8gclty1.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11936, '革命少女乌蒂娜', 'Revolutionary Girl Utena', 'dongman/26gfst7okxg6t2tk.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11937, '拉赫·色丰', 'RahXephon', 'dongman/a222arz1mvbuxthk.png', 12, '2023-08-20 16:19:10', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11938, '归零', 'ReZero', 'dongman/w03pb75ehf5oox5u.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11939, '蔷薇少女', 'Rozen Maiden', 'dongman/a391nykcptrnhvjz.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11940, '高桥留美子', 'Rumiko Takahashi', 'dongman/fmieaiid7gil0t1r.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11941, '美少女战士', 'Sailor Moon', 'dongman/427287u8y7q1bzx9.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11942, '武士杰克', 'Samurai Jack', 'dongman/a28ewlhjo1j5yt61.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11943, '今敏', 'Satoshi Kon', 'dongman/n22yiaohfhsnalzh.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11944, '巨人的影子', 'Shadow of the Colossus', 'dongman/0nrsqy95234sz54l.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11945, '半写实动漫风格', 'Semi-realistic anime style', 'dongman/1fdqk7og570dx8oc.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11946, '青年动漫风格', 'Seinen anime style', 'dongman/sd5purd2j09d9g2c.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11947, '系列实验 Lain', 'Serial Experiments Lain', 'dongman/avvl6apiq7fd8ht2.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11948, '少女动漫风格', 'Shojo anime style', 'dongman/fnojh7wdbd3rob7m.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11949, '少年动漫风格', 'Shonen anime style', 'dongman/cse4jmqxfrabqcf1.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11950, '寂静岭', 'Silent Hill', 'dongman/93mpalrk0vc8uvp9.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11951, '宇宙战舰大和号', 'Space Battleship Yamato', 'dongman/n7swzuoof6ppo5b7.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11952, '太空花花公子', 'Space Dandy', 'dongman/78t2fai3o5lnoy7a.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11953, '命运石之门', 'SteinsGate', 'dongman/u44o4lwgi61evx70.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11954, '千与千寻', 'Spirited Away', 'dongman/e2j3s18c26idiae6.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11955, '地海传说', 'Tales from Earthsea', 'dongman/ridwnoxic4kc5fjh.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11956, '小畑刚', 'Takeshi Obata', 'dongman/tpemv15k5elufuus.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11957, '铁拳', 'Tekken', 'dongman/ww8eyjuowsf3qdr4.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11958, '特康金克里特', 'Tekkonkinkreet', 'dongman/u83mms2qnzo8kt7w.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11959, '动画师', 'The Animatrix', 'dongman/t0fnj30wq8zhbyx9.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11960, '世界因你而终结', 'The World Ends With You', 'dongman/dlt3jr8uh9ys53jd.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11961, '言叶之庭', 'The Garden of Words', 'dongman/2ibh7hh4qz0ns3tx.png', 12, '2023-08-20 16:19:09', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11962, '塞尔达传说', 'The Legend of Zelda', 'dongman/z8ye32gt7pgbl5bk.png', 12, '2023-08-20 16:19:08', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11963, '久保蒂特', 'Tite Kubo', 'dongman/eo7l1xpeh4ti5p9v.png', 12, '2023-08-20 16:19:08', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11964, '龙猫', 'Totoro', 'dongman/rai7hpu5bjl6oo04.png', 12, '2023-08-20 16:19:08', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11965, 'Escaflowne的愿', 'The Vision of Escaflowne', 'dongman/jwcp3j7hsxahhupr.png', 12, '2023-08-20 16:19:08', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11966, '变形金刚', 'Transformers', 'dongman/4sb52etf0p3qkvod.png', 12, '2023-08-20 16:19:08', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11967, '三枪', 'Trigun', 'dongman/ts1ccpkklljz2ty3.png', 12, '2023-08-20 16:19:08', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11968, '冰', 'Ice', 'caizhi/pl52m4mwynk9w4uj.png', 12, '2023-08-20 16:19:24', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11969, '塑料', 'Plastic material', 'caizhi/pvevi2fnqgvc3pbb.png', 12, '2023-08-20 16:19:24', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11970, '文兰传奇', 'Vinland Saga', 'dongman/k7jynvwy3vutl93w.png', 12, '2023-08-20 16:19:08', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11971, '战神金刚', 'Voltron', 'dongman/tua28v4q4u8gneff.png', 12, '2023-08-20 16:19:08', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11972, '彩色玻璃', 'Stained Glass', 'caizhi/k7ypzgottvyfdzen.png', 12, '2023-08-20 16:19:24', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11973, '彩虹色', 'Iridescent', 'caizhi/92ner5hveeenfmqc.png', 12, '2023-08-20 16:19:24', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11974, '毛茸茸', 'Fluffy', 'caizhi/t5rca4vm0sesccf6.png', 12, '2023-08-20 16:19:24', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11975, 'xxxHolic', 'xxxHolic', 'dongman/v9shlaj5tnpgh2t7.png', 12, '2023-08-20 16:19:08', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11976, '黑客标志', 'hackSign', 'dongman/5yk8mrf9b0c8uf0m.png', 12, '2023-08-20 16:19:08', '2023-12-28 13:54:21', 0, 'dongman', '');
INSERT INTO `df_robot_prompt` VALUES (11977, '流体', 'Fluid', 'caizhi/jedxcv68loj23mwl.png', 12, '2023-08-20 16:19:24', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11978, '液体黄金', 'Liquid Gold', 'caizhi/t1ef26it88mn45cj.png', 12, '2023-08-20 16:19:24', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11979, '珐琅', 'Enamel', 'caizhi/s5tjhzm4coj86r76.png', 12, '2023-08-20 16:19:24', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11980, '玻璃', 'glass material', 'caizhi/d1mo3o91z7rfhraw.png', 12, '2023-08-20 16:19:24', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11981, '粘液', 'Slime material', 'caizhi/gijnxykpb2pehr4l.png', 12, '2023-08-20 16:19:24', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11982, '纸雕', 'paper carving', 'caizhi/tt501y2c5knxhpqb.png', 12, '2023-08-20 16:19:24', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11983, '紫水晶', 'Amethyst material', 'caizhi/4mnbkxvj93b4wr3j.png', 12, '2023-08-20 16:19:24', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11984, '腐朽衰败', 'Decayed', 'caizhi/1eapjye4ffqbqegf.png', 12, '2023-08-20 16:19:24', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11985, '金属漆', 'Metallicpaint texture', 'caizhi/4fg4afk1glkutmqx.png', 12, '2023-08-20 16:19:24', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11986, '青瓷', 'Celadon', 'caizhi/4yw46gu2539r123w.png', 12, '2023-08-20 16:19:24', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11987, '黄金', 'gold material', 'caizhi/smmzl1hli38rhi1k.png', 12, '2023-08-20 16:19:24', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11988, '黄铜', 'Brass', 'caizhi/41o9f4ck3cn2bi7w.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11989, '光粒子', 'Light Particles', 'caizhi/ckuje88svk3sbmtn.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11990, '光纤', 'fiber optic material', 'caizhi/nxt6ziyzb0jxao4w.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11991, '全息', 'Holographic', 'caizhi/6no2tet9pbj9ufs1.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11992, '哑光', 'Matte', 'caizhi/gqer7o4h4c4czb2w.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11993, '冰冷', 'Icy', 'caizhi/es4tqgtf4u412i0t.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11994, '天鹅绒', 'Velvet', 'caizhi/39a06sbwtc722u3v.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11995, '木制', 'wooden material', 'caizhi/ie370ljxi0oaotxk.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11996, '布料', 'fabric material', 'caizhi/f996gv355g1a5smt.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11997, '松木', 'Pine material', 'caizhi/8fkabktf36jw6v3v.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11998, '木纹', 'Wood grain', 'caizhi/3vemt5u77cq50w2w.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (11999, '玄武岩', 'Basalt material', 'caizhi/jabcrqnoauz20jp0.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12000, '环氧树脂', 'Epoxy', 'caizhi/m2n643hnusufk4r6.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12001, '石英', 'Quartz material', 'caizhi/esnbrm09bl3c7w5w.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12002, '砖块', 'Brick material', 'caizhi/03kkf397wnmno9p9.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12003, '瓷', 'Porcelain', 'caizhi/2t35kw2bxz9e78yk.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12004, '果冻质感', 'Jelly', 'caizhi/hl9kfpl24pir101v.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12005, '纱线', 'yarn material', 'caizhi/47u27s0fc16c9i7d.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12006, '红宝石', 'Ruby Takram material', 'caizhi/aoueq6b3v8qiqxxx.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12007, '纱绸', 'Gauze texture', 'caizhi/w1399ai5u62ksdlk.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12008, '箔', 'foil material', 'caizhi/b1waxr84f12z7los.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12009, '软糖', 'gummies material', 'caizhi/6osmuc2c138zjkh7.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12010, '钻石', 'Diamond material', 'caizhi/k51yx8z7crb7dlhp.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12011, '菌丝', 'Mycelium', 'caizhi/egrozsqy6omf8m64.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12012, '铂金', 'Platinum', 'caizhi/3myo5n26nuvtyzaq.png', 12, '2023-08-20 16:19:23', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12013, '镍', 'Nickel material', 'caizhi/s8xamcsyjc0ze3s5.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12014, '黄水晶', 'Citrine', 'caizhi/r6t4w7txfqlxxfmh.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12015, '雕刻', 'Carved texture', 'caizhi/gq5oionrega3y9pv.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12016, '黏土', 'Clay texture', 'caizhi/eizlzdjppibf6kil.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12017, '刚玉', 'Corundum', 'caizhi/6olel1x5a450oebm.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12018, '乳胶', 'latex material', 'caizhi/dr4bop2tsnlkzcg2.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12019, '乌木', 'ebony material', 'caizhi/07vgthwtxlg97why.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12020, '铜', 'Bronze material', 'caizhi/igw8all7yizb8nwp.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12021, '华丽的', 'Ornate', 'caizhi/mm3cdtdlb6ely81c.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12022, '刷铝', 'Brushed Aluminum', 'caizhi/nlfmwwsf27rx26hj.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12023, '孔雀石', 'Malachite', 'caizhi/qhf5yj0kkm20gafu.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12024, '岩石', 'Rock', 'caizhi/kf0i4iuv8zfmtssh.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12025, '彩虹大理石', 'Rainbow Marble', 'caizhi/hlg6b3yuf0s5sg61.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12026, '抛光', 'High polished material', 'caizhi/3y5ykfrxcqhwq9me.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12027, '拉丝金属', 'Brushed matel', 'caizhi/icy5io3bpidz0vvl.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12028, '橄榄石', 'Peridot', 'caizhi/o923imy6dg67xcmg.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12029, '氧化钛', 'Anodized Titanium', 'caizhi/dmssl2obty3zwgxc.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12030, '液体秘', 'Liquid Bismuth', 'caizhi/q68xr1gjbrwuol4p.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12031, '波斯花纹', 'Paisley', 'caizhi/gg48hpu1xua1cw89.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12032, '水磨石', 'Terrazzo', 'caizhi/p4tjrmfxxzssi61b.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12033, '煤', 'Coal', 'caizhi/o1oq8jzcdw61supp.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12034, '琥珀', 'Amber', 'caizhi/0vrdu2wad7phwylw.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12035, '皮毛', 'Fur texture', 'caizhi/tgkujtufqo704nge.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12036, '皮革', 'leather material', 'caizhi/ym2kyorsm9k7lu6h.png', 12, '2023-08-20 16:19:22', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12037, '碧玉', 'Jasper', 'caizhi/l2tcr7lhfyvn1cnx.png', 12, '2023-08-20 16:19:21', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12038, '碳纤维', 'Carbon Fiber', 'caizhi/i49lvnmauf2trr3i.png', 12, '2023-08-20 16:19:21', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12039, '玉', 'Jade', 'caizhi/oj59pifn8qrz2tj8.png', 12, '2023-08-20 16:19:21', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12040, '祖母绿', 'Emerald', 'caizhi/x67vxsy1qtnmqt5x.png', 12, '2023-08-20 16:19:21', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12041, '纸板', 'Cardboard material', 'caizhi/5ajzf49bl2s388ey.png', 12, '2023-08-20 16:19:21', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12042, '蓝宝石', 'Sapphire', 'caizhi/6tab586mftvoslkt.png', 12, '2023-08-20 16:19:21', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12043, '纤维素', 'Cellulose material', 'caizhi/rwcmv37u3jwgqspx.png', 12, '2023-08-20 16:19:21', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12044, '蓝晶石', 'Kyanite', 'caizhi/2l1sev095t1k83bi.png', 12, '2023-08-20 16:19:21', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12045, '象牙', 'lvory material', 'caizhi/w07gkt47myquehfx.png', 12, '2023-08-20 16:19:21', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12046, '陶瓷', 'Ceramic material', 'caizhi/3w4bgqmkl3dho6yu.png', 12, '2023-08-20 16:19:21', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12047, '金属质感', 'Metallic material', 'caizhi/zv5io498d6qvakel.png', 12, '2023-08-20 16:19:21', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12048, '铝合金', 'Aluminum material', 'caizhi/3ekmndhcdvwwklhg.png', 12, '2023-08-20 16:19:21', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12049, '阳极氧化', 'Anodized', 'caizhi/pdwyf81z4reyx6qc.png', 12, '2023-08-20 16:19:21', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12050, '雷莫石', 'Tourmaline', 'caizhi/k4nf5y0wp08fkpn7.png', 12, '2023-08-20 16:19:21', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12051, '青金石', 'Lapis', 'caizhi/yf3pxdsbxliw68qs.png', 12, '2023-08-20 16:19:21', '2023-12-28 13:54:21', 0, 'caizhi', '');
INSERT INTO `df_robot_prompt` VALUES (12052, '约瑟夫·阿尔伯斯', 'Josef Albers', 'qitayisu/sc2jw2m5e16ikf7r.png', 12, '2023-08-20 16:21:06', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12053, '安妮·阿尔伯斯', 'Anni Albers', 'qitayisu/xuzyn6tc9fmvzbhn.png', 12, '2023-08-20 16:21:06', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12054, '帕特里克·考菲尔德', 'Patrick Caulfield', 'qitayisu/0zi13xbmvjdjzle1.png', 12, '2023-08-20 16:21:06', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12055, '伊藤信水', 'Ito Shinsui', 'qitayisu/e2vo7wwb7zgfkkbr.png', 12, '2023-08-20 16:21:06', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12056, '斯坦利·威廉·海特', 'Stanley William Hayter', 'qitayisu/q9hi6pm7558iwr7x.png', 12, '2023-08-20 16:21:06', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12057, '阿尔布雷希特·丢勒', 'Albrecht Durer', 'qitayisu/h1t7hpnme8a1kj7r.png', 12, '2023-08-20 16:21:06', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12058, '川边恭斋', 'Kawanabe Kyosai', 'qitayisu/e6i6bxwl5515of0c.png', 12, '2023-08-20 16:21:06', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12059, '葛饰北斋', 'Katsushika Hokusai', 'qitayisu/orzklliigcwsxjje.png', 12, '2023-08-20 16:21:06', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12060, '拉维·祖帕', 'Ravi Zupa', 'qitayisu/a8qkce6upj594mtc.png', 12, '2023-08-20 16:21:06', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12061, '歌川国贞', 'Utagawa Kunisada', 'qitayisu/h3y3zhua1x3ed1rh.png', 12, '2023-08-20 16:21:06', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12062, '阿尔弗雷德·库宾', 'Alfred Kubin', 'qitayisu/l6bsl0382qhicavc.png', 12, '2023-08-20 16:21:06', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12063, '伊丽莎白·卡特莱特', 'Elizabeth Catlett', 'qitayisu/kinajzqk82oi3w35.png', 12, '2023-08-20 16:21:06', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12064, '弗兰克·斯特拉', 'Frank Stella', 'qitayisu/21lrf8xj5odbwf60.png', 12, '2023-08-20 16:21:06', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12065, '恩斯特·巴拉克', 'Ernst Barlach', 'qitayisu/4d25as1m7blwg6ei.png', 12, '2023-08-20 16:21:06', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12066, '古斯塔夫·多尔', 'Gustave Dore', 'qitayisu/8hff2lqcyr5x0lsj.png', 12, '2023-08-20 16:21:06', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12067, '乔纳森·巴恩布鲁克', 'Jonathan Barnbrook', 'qitayisu/gfzeij5bfsd9yinz.png', 12, '2023-08-20 16:21:06', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12068, '雅克·卡洛', 'Jacques Callot', 'qitayisu/fch7mkj7tlc54436.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12069, '丰塔纳', 'Lucio Fontana style', 'qitayisu/cg0vyv8864n1eiri.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12070, '凯瑟·珂勒惠支', 'Kathe Kollwitz', 'qitayisu/08zzrv96ia0leqte.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12071, '歌川广重', 'Utagawa Hiroshige', 'qitayisu/0pdow08scsavah08.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12072, '伊万', 'Ivan Kramskoy style', 'qitayisu/vhiyh5f3z7l0q9jo.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12073, '昏厥', 'Swoon', 'qitayisu/uifzchltn3lbje8b.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12074, '保罗勒尔', 'Paul Lehr style', 'qitayisu/nnmowtof8p1uul27.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12075, '塩田千春', 'Chiharu Shiota style', 'qitayisu/jxk28s895ck138qf.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12076, '哈林', 'keith haring style', 'qitayisu/woujrzi09ed1mq3r.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12077, '奈良美智', 'Yoshitomo Nara style', 'qitayisu/4hymuj0z01hq7che.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12078, '安德森', 'Wes Anderson style', 'qitayisu/u1r5j4wulmjjxjzv.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12079, '博奇尔', 'Butcher Billy style', 'qitayisu/weflf5da7wfytnxw.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12080, '彼得萨维尔', 'by Peter Saville', 'qitayisu/0zy194rjxhpdx4ex.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12081, '弗里斯', ' kelly freas style', 'qitayisu/1rvmkm8tgyboosm2.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12082, '威吉', 'Weegee style', 'qitayisu/rvi2xsothr89ircb.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12083, '弗兰克', ' Lisa Frank style', 'qitayisu/lw40t63qrigjjkjy.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12084, '梅杰', 'akos major style', 'qitayisu/r42dndrfk1sglwww.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12085, '林德伯格', 'Peter Lindbergh style', 'qitayisu/1hbqpgatemn8pzo5.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12086, '梵高', 'Van Gogh style', 'qitayisu/wzr0v3stv6h79kmz.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12087, '村上隆', 'Takashi Murakami style', 'qitayisu/tjbgduplxq751sfl.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12088, '欧文沃姆', 'Erwin Wurm', 'qitayisu/gchjv3wlyrftq5q2.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12089, '毕加索', 'Pablo Picasso style', 'qitayisu/p236jazudl76jzrl.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12090, '润二', ' junji ito style', 'qitayisu/2th5b5gkzzbrkbmd.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12091, '森山大道', 'Daido Moriyama style', 'qitayisu/mk5dsp4w2n3v8lkg.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12092, '洛伊什', 'Loish style', 'qitayisu/tticophws7r4ws96.png', 12, '2023-08-20 16:21:05', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12093, '玛格丽特', 'Rene Magritte style', 'qitayisu/ad9gjh85kgvzfvme.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12094, '莫拉', 'Antonio Mora style', 'qitayisu/n973exezm609kux1.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12095, '草芥弥生', 'Yayoi Kusama style', 'qitayisu/nx7hueiao09fsvro.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12096, '莫奈', ' Claude Monet style', 'qitayisu/i1hpxfqmpun5grxw.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12097, '艾佛里', 'Milton Avery style', 'qitayisu/62ys3d9rvkwu6lxm.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12098, '白南淳', 'Nam June Paik style', 'qitayisu/z1f2paojyw44ufed.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12099, '达芬奇', 'leonardo da vinci style', 'qitayisu/pdnoxhvmsmjnxl58.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12100, '马蒂斯', 'Matisse style', 'qitayisu/4izps7q5hnqv4ma3.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12101, '蒙德里安', 'Piet Mondrian style', 'qitayisu/s2yzrohmyq46n7rw.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12102, '蔡国强', 'Cai Guo-Qiang style', 'qitayisu/2p4mtp52yja1wtch.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12103, '霍克尼', 'david hockney style', 'qitayisu/doa9olu1w53chh72.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12104, '保罗克利', ' Paul Klee style', 'qitayisu/i6zk4tpikgbxnty3.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12105, '伊利亚', 'Ilya Kuvshinov style', 'qitayisu/371f9dyvqqaz3ot1.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12106, '伯顿', 'Tim Burton style', 'qitayisu/qk1tb7jip1qru9nf.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12107, '克拉斯纳', ' lee krasner style', 'qitayisu/0m3hlsbn80it89ac.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12108, '多纳泰罗', 'donatello style', 'qitayisu/vwlthq3xf9va7wox.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12109, '彼得巴吉', 'Peter Bagge style', 'qitayisu/7pboov614xljtim6.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12110, '巴斯奎特', 'basquiat style', 'qitayisu/6s75zbnbiif1198f.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12111, '拉斯罗普', ' dorothy lathrop style', 'qitayisu/kjs8d5fl5u2mt0sx.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12112, '新川洋司', 'Yoji Shinkawa style', 'qitayisu/w7ismvcqbk4zuj97.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12113, '惠特摩尔', ' Coby Whitmore style', 'qitayisu/5kkqrt5286xn9s69.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12114, '曼特洛', 'Bill Mantlo style', 'qitayisu/ib4zomzz129r32nw.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12115, '波斯', 'Hieronymus Bosch style', 'qitayisu/zra4vh57vmbzpioc.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12116, '格里菲斯', 'Jasmine Becket-Griffith style', 'qitayisu/5ve8qyi7pgvrvjpi.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12117, '盖伦', 'atey ghailan style', 'qitayisu/rqxj9gzaem1udyih.png', 12, '2023-08-20 16:21:04', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12118, '比尔斯里', 'aubrey beardsley style', 'qitayisu/b9ifjua2433wdrjp.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12119, '科拉森', 'Jon Klassen style', 'qitayisu/op5ax72exd9041mk.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12120, '波洛克', 'Jackson Pollock style', 'qitayisu/6aly2v98butxmqql.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12121, '爱舍尔', 'Escher style', 'qitayisu/nqhxw5t6tned2dvs.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12122, '罗塞特', 'Conrad Roset style', 'qitayisu/d0toy5mf876c30wo.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12123, '肖恩坦', 'Shaun Tan style', 'qitayisu/m7nvd08qbg8m1w22.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12124, '迪克斯', 'Otto Dix style', 'qitayisu/o5690bldvvxxava5.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12125, '葛饰北斋', 'Hokusai style', 'qitayisu/29qpubmbebplrj9j.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12126, '蒂默曼斯', 'Alex Timmermans style', 'qitayisu/2hn1isngk1yt6cwu.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12127, '高桥留美子', 'Rumiko Takahashi style', 'qitayisu/6u8467dt49rwy340.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12128, '霍沃尔', 'Warhol style', 'qitayisu/muax9456pisbqz0q.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12129, '切克利', 'Nicoletta Ceccoli style', 'qitayisu/6fmbv6e06zpqbyjd.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12130, '伊顿', 'Johannes Itten', 'qitayisu/9vhbmamisqs7fdyw.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12131, '加梅尔', 'Stephen Gammell style', 'qitayisu/qs0f77byrkszx04d.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12132, '阿普', 'Hans Arp style', 'qitayisu/c0kzgrfxvwm9el3u.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12133, '巴斯奎特', 'Jean Michel Basquiat style', 'qitayisu/5owgas7sxblc96nc.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12134, '天野喜孝', 'Yoshitaka Amano style', 'qitayisu/dwixe5thhsnkba3j.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12135, '勒维特', 'Sol LeWitt style', 'qitayisu/u0weulhb7ozfgiof.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12136, '洛夫克拉夫', 'Howard Philips Lovecraft style', 'qitayisu/akue01zt1a4nxqoy.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12137, '朱艾特', 'ellen jewett style', 'qitayisu/76yishmf4tvms2hc.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12138, '康定斯基', ' kandinsky style', 'qitayisu/ixqvtbw1xmxqt798.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12139, '真昼', 'Masaaki Sasamoto style', 'qitayisu/6e5yy3uozl2jzoi7.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12140, '聂利', 'Francoise Nielly style', 'qitayisu/0qsbaocz9duzabob.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12141, '米勒', ' Frank Miller style', 'qitayisu/brs2h4b8yl0b4iug.png', 12, '2023-08-20 16:21:03', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12142, '艾尔特', 'erte style', 'qitayisu/y8ofro5tm0h7brru.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12143, '迪特曼', 'Anna Dittmann style', 'qitayisu/y19edenyxoxxg8hy.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12144, '休莱特', 'Jamie Hewlett style', 'qitayisu/l6ncm47u6zgseyrw.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12145, '亨特', 'William Holman Hunt style', 'qitayisu/y30sjmlg6npfonss.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12146, '克拉姆', ' Arthur Rackham style', 'qitayisu/0wutwo500goz5lqq.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12147, '马克莱登', 'Mark Ryden style', 'qitayisu/kpnesqe0wnx69iyw.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12148, '凯新格', 'Brian Kesinger style', 'qitayisu/l9rthe2ovj20k6ro.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12149, '卡拉瓦乔', 'Caravaggio style', 'qitayisu/8gc7l9htzkx1urp2.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12150, '前拉斐尔派', 'Pre-Raphaelite style', 'qitayisu/xu6t3ij7huzk7azs.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12151, '卡洛', 'Frida Kahlo style', 'qitayisu/ymct9t8qfi9jrjoc.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12152, '佛劳德', 'Brian Froud style', 'qitayisu/yq03vezxw29kn1e5.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12153, '吉田明彦', 'akihiko yoshida', 'qitayisu/r8vqptvxoril870n.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12154, '哈里斯', 'John Harris style', 'qitayisu/plc1mbcereii4e2q.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12155, '图尔', 'Georges de La Tour style', 'qitayisu/296yw518h1qlvgq0.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12156, '声之形', 'koe no katachi style', 'qitayisu/htsxpocawg0bpibl.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12157, '塞韦索', 'alberto seveso style', 'qitayisu/q47np4dlrz6bpy3h.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12158, '埃格尔顿', ' Bob Eggleton style', 'qitayisu/2c75nxkl6pur46of.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12159, '安娜图', ' el anatsui style', 'qitayisu/i5uzlzg1t31mgjh4.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12160, '巴舍利耶', 'Anne Bachelier style', 'qitayisu/2dc7im5hffmd6fwv.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12161, '巴泽利茨', 'Georg Baselitz style', 'qitayisu/rg16tnfez0fqpys4.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12162, '布兰德兄弟', 'Brothers Hildebrandt', 'qitayisu/xmzlh81u6891uq3g.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12163, '布鲁盖尔', 'Pieter Bruegel style', 'qitayisu/gyng6h8ugbz6ah8e.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12164, '广重', 'Hiroshige style', 'qitayisu/ppqnxise0p70ljiy.png', 12, '2023-08-20 16:21:02', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12165, '库沙特', 'krenz cushart style', 'qitayisu/nya2a4uurnmhg8u2.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12166, '弗朗切斯卡', 'Piero della Francesca', 'qitayisu/fskew18uxjjfhwfb.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12167, '彭宁顿', 'Bruce Pennington style', 'qitayisu/8qhm52m7110jac9j.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12168, '德拉纳', 'Sonia Delaunay style', 'qitayisu/qt2yocmn7d2hyh0e.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12169, '康定斯基', 'Wassily Handinsky style', 'qitayisu/yevpnqpx1gzm59fr.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12170, '思穆克', 'Solly Smook style', 'qitayisu/3vrylsvbi3dqzdid.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12171, '惠斯勒', 'James McNeill Whistler style', 'qitayisu/z37wq0rqsvk7477t.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12172, '戈尔基', 'Arshile Gorky style', 'qitayisu/8anygsjkdlz9sk7e.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12173, '托米尼', 'adrian tomine style', 'qitayisu/brr5nmw8dtdni7gt.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12174, '戈雅', 'Francisco de Goya style', 'qitayisu/j33ivvr1qtsp29sf.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12175, '斯特鲁赞', 'drew struzan style', 'qitayisu/j7ou99un7ez1mrfn.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12176, '村田雄介', 'Yusuke Murata style', 'qitayisu/kyfstze6id56owjj.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12177, '杰里米曼', 'Jeremy Mann style', 'qitayisu/g47uwejilq4v37t0.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12178, '格尔', 'H.R. Giger style', 'qitayisu/kveifn71xnzypf5b.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12179, '柯比', 'Jack Kirby style', 'qitayisu/77rsmlzlmlkxyir6.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12180, '格雷', 'Alex Grey style', 'qitayisu/0xnbgpdyyzrxr4xr.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12181, '比拉尔', ' enki bilal style', 'qitayisu/tp7g71i44s7gls55.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12182, '沃森', 'albert watson style', 'qitayisu/dybkdqmc8ysm49eq.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12183, '歌川国定', 'Utagawa Kunisada style', 'qitayisu/wxkwnvdqaeydz149.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12184, '沃尔', 'Josephine Wall style', 'qitayisu/8lu7vwxgj6on59qx.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12185, '波提切利', 'Sandro Botticelli style', 'qitayisu/jkyjt9c0mi66btkw.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12186, '波提切利', 'Andro Botticelli style', 'qitayisu/s2xa4dkdsfw5jmzf.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12187, '特兰', 'Ross Tran style', 'qitayisu/7pti7c0ys7761kyj.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12188, '瓦罗', 'Remedios Varo style', 'qitayisu/gow5k5xi998qupgq.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12189, '福克斯', 'bernie fuchs style', 'qitayisu/1ghiymd2evu4bv2y.png', 12, '2023-08-20 16:21:01', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12190, '盖伊', 'Rebecca Guay style', 'qitayisu/acf1ccswwvyfw3hr.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12191, '穆查', 'Alphonse Mucha', 'qitayisu/27c9mlg34el4dox4.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12192, '米开朗基罗', 'Michelangelo style', 'qitayisu/fqkln28rumfo2wh9.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12193, '罗约', 'Luis Royo style', 'qitayisu/x8o47rohd1t7lhoy.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12194, '索恩', 'Frank Thorne style', 'qitayisu/xb6g34irsb1h2rw3.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12195, '艾伦李', 'alan lee', 'qitayisu/lx9vge65yqrt666y.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12196, '莫比乌斯', 'Moebius', 'qitayisu/f9bddz25e1hxb1nd.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12197, '萨良', 'Martiros Saryan style', 'qitayisu/7vffqobw7s835jh7.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12198, '让杰罗', 'Jean Giraud style', 'qitayisu/nnh4ts7ht4r7awpe.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12199, '莫里斯', 'William Morris style', 'qitayisu/gnmj4ilc3bzu2sbv.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12200, '詹姆斯琼', 'James Jean style', 'qitayisu/8hn9x3tzwtpce07w.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12201, '贝尔尼尼', 'Bernini style', 'qitayisu/teb91r2h32tjjbtb.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12202, '贝诺瓦', 'benoit mandelbrot style', 'qitayisu/vsessob8ebe6jqp2.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12203, '费里', 'Roberto Ferri style', 'qitayisu/iu0uilej7a9hbs75.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12204, '金凯德', 'Thomas Kinkade style', 'qitayisu/twv9vvuvpwfs4yc7.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12205, '达利', 'Salvador Dali style', 'qitayisu/gnnw6wa4fyq9zu9x.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12206, '马克', 'august macke style', 'qitayisu/m79i4off9plt5lv7.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12207, '马恩斯', '马恩斯', 'qitayisu/1cmbhtfdvbzkvuvk.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12208, '鲍尔', 'John Bauer style', 'qitayisu/dycgsw11y2kq5qsk.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12209, '鸟山明', ' akira toriyama style', 'qitayisu/lfvpgtblzux9u88i.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12210, '鲁本斯', 'Peter Paul Rubens style', 'qitayisu/p5lxdra4w5l88z3d.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12211, '麦克西姆斯', 'Max Maximus style', 'qitayisu/1zyw3utic7rmenbq.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12212, '高更', 'Paul Gauguin style', 'qitayisu/unr9hrz5tx525vib.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12213, '奇异博士', 'Dr. Strange', 'qitayisu/2t87ysxyvxyp9jan.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12214, '天堂电影院', 'Cinema Paradiso style', 'qitayisu/kqp9so7isrtccl1k.png', 12, '2023-08-20 16:21:00', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12215, '千与千寻', 'Spirited Away style', 'qitayisu/510iqrlebmuler2t.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12216, '怪奇物语', 'Stranger Things', 'qitayisu/0o2i0g9l2p47d48j.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12217, '少年派', 'Life of Pi style', 'qitayisu/qigfz7w1atrn6cqf.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12218, '放牛班春天', 'The Chorus style', 'qitayisu/ud4b6fwticop8uoy.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12219, '星际迷航', 'Star Trek', 'qitayisu/l35su3wmnpyufayp.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12220, '水形物语', 'The Shape of Water style', 'qitayisu/uqvw2crsblscqs8t.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12221, '沙丘', 'Dune Style', 'qitayisu/u7qg1ykgz4iki60s.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12222, '摔跤爸爸', 'Dangal style', 'qitayisu/m4mwcie7hhbk51xu.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12223, '泰坦尼克号', 'Titanic style', 'qitayisu/sdzubq6h81jh9wh3.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12224, '银翼杀手', 'Blade Runnerstyle', 'qitayisu/ip45gnykjr63ot7g.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12225, '白底梦想家', 'The Secret Life of Walter Mitty style', 'qitayisu/c941saofani32wpz.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12226, '疯狂麦克斯', 'Mad Max Fury Road style', 'qitayisu/7989fy5t2gg80xp1.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12227, '一拳超人', 'One Punch Man', 'qitayisu/fm1ybif0qtbqa4xz.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12228, '乐高', 'lego', 'qitayisu/wc8kal41iyzj1vjr.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12229, '你的名字', 'kimi no nawa', 'qitayisu/b3l3ez9c3ql5t77v.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12230, '元神', 'Genshin Impact', 'qitayisu/4swt5q7roinf27k4.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12231, '使命召唤', 'Call of Duty', 'qitayisu/mdg7hwt2kjfof0g1.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12232, '侠盗猎车', 'Grand Theft Auto', 'qitayisu/zr89sykejceztcdw.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12233, '光速龙卷风', 'Hyper Light Drifter', 'qitayisu/s50y3x7xwlm9jweg.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12234, '动物之森', 'Animal Crossing', 'qitayisu/76qpg3omdcz2z6ku.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12235, '堡垒之夜', 'Fortnite', 'qitayisu/qicfqcn5fy99by7n.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12236, '守望先锋', 'Overwatch', 'qitayisu/1o3wwduywbjn46bh.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12237, '史瑞克', 'Shrek', 'qitayisu/lq6s0e8osli4n6mc.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12238, '宝可梦', 'Pokemon', 'qitayisu/9thi0707vnvy4ey8.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12239, '我的世界', 'Minecraft', 'qitayisu/5ynfwf7yuhibx7qg.png', 12, '2023-08-20 16:20:59', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12240, '星际争霸', 'Starcraft', 'qitayisu/2xmd2w06fsbkl8gf.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12241, '洛克斯', 'Roblox', 'qitayisu/h2y0nk1erzaducgo.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12242, '海贼王', 'One Piece', 'qitayisu/xrsmmh1vx780bs43.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12243, '暗黑破坏神', ' Diablo', 'qitayisu/kvrjmi195puyh4ok.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12244, '最终幻想', 'Final Fantasy', 'qitayisu/fiehhpzsu0jq8p7s.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12245, '火影', 'Naruto', 'qitayisu/12cvfxsrh626sddj.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12246, '死亡笔记', 'Death Note Style', 'qitayisu/11ev2se09c070r1p.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12247, '星露谷物语', 'Stardew Valley', 'qitayisu/kuldtnr2f73snypd.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12248, '神通瑞姆', 'invader zim', 'qitayisu/8uxl4xze62xy6sp4.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12249, '瑞克和莫蒂', 'Rick and Morty', 'qitayisu/zfe4z2m6zay684mw.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12250, '生化危机', 'Resident Evil', 'qitayisu/wveqer2wrjiw698c.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12251, '绝地求生', 'PUBG', 'qitayisu/vixowljyxtds8jcf.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12252, '纸钞屋', 'Money Heist', 'qitayisu/yaabk4jq8a5oduew.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12253, '荒野大镖客', 'Red Dead Redemption', 'qitayisu/yvguikx8uy221ga4.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12254, '超级马里奥', 'Super Mario Bros', 'qitayisu/wn60ud2bwvqwq8gr.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12255, '英雄联盟', 'league of legends', 'qitayisu/mmspz1t8jwl171m7.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12256, '赛博2077', 'Cyberpunk 2077', 'qitayisu/ii0uu5gzygk4gqhe.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12257, '辐射系列', 'Fallout', 'qitayisu/1pow3cshwnkc4dqj.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12258, '铁拳', 'Tekken', 'qitayisu/c3iobu3rc3gs9mky.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12259, '顶级英雄', 'Apex Legends Style', 'qitayisu/0ghec8bxz0zt10d2.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12260, '进击巨人', 'Shingeki no Kyoji', 'qitayisu/mdng9oozbvp44nzg.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12261, '龙与地下城', 'Dungeons and Dragons', 'qitayisu/uzwlg5nv9i79k5b4.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');
INSERT INTO `df_robot_prompt` VALUES (12262, '辛普森', 'The Simpsons', 'qitayisu/cdim29uc2icoaj5y.png', 12, '2023-08-20 16:20:58', '2023-12-28 13:54:21', 0, 'qitayisu', '');




SET FOREIGN_KEY_CHECKS = 1;
