DROP VIEW label_twitter;
CREATE VIEW label_twitter AS SELECT r.id AS raw_id, r.info, r.t_time, k.id AS kind_id, c.id AS classification_id, c.name AS classification_name, e.id AS respondent_id, e.name AS respondent_name FROM raws r LEFT JOIN respondents e ON r.respondent_id = e.id LEFT JOIN denominations d ON r.id = d.raw_id LEFT JOIN kinds k ON r.id = k.raw_id LEFT JOIN classifications c ON k.classification_id = c.id WHERE r.active = true AND d.id IS NULL ORDER BY r.t_time DESC;
DROP VIEW data_twitter_old;
CREATE VIEW data_twitter_old AS SELECT r.id AS raw_id, r.info, r.t_time, k.id AS kind_id, c.id AS classification_id, c.name AS classification_name, e.id AS respondent_id, e.name AS respondent_name FROM raws r LEFT JOIN respondents e ON r.respondent_id = e.id LEFT JOIN kinds k ON r.id = k.raw_id LEFT JOIN classifications c ON k.classification_id = c.id WHERE r.active = true ORDER BY r.t_time DESC;
DROP VIEW train_twitter;
CREATE VIEW train_twitter AS SELECT d.id as denomination_id, c.id AS classification_id, c.name AS classification_name, u.id AS user_id, u.username AS user_name, r.id AS raw_id, r.info, r.t_time, e.id AS respondent_id, e.name AS respondent_name FROM denominations d LEFT JOIN raws r ON r.id = d.raw_id LEFT JOIN classifications c ON d.classification_id = c.id LEFT JOIN users u ON d.user_id = u.id LEFT JOIN respondents e ON r.respondent_id = e.id WHERE d.active = true ORDER BY r.t_time DESC;
DROP VIEW data_twitter;
CREATE VIEW data_twitter AS SELECT r.id AS raw_id, r.info, r.t_time, k.id AS kind_id, k.classification_id AS at_classification_id, d.id AS denomination_id, d.classification_id AS mt_classification_id, c.id AS classification_id, c.name AS classification_name, e.id AS respondent_id, e.name AS respondent_name FROM raws r LEFT JOIN respondents e ON r.respondent_id = e.id LEFT JOIN kinds k ON r.id = k.raw_id LEFT JOIN denominations d ON r.id = d.raw_id LEFT JOIN classifications c ON k.classification_id = c.id WHERE r.active = true ORDER BY r.t_time DESC;
DROP VIEW data_word_old;
CREATE VIEW data_word_old AS SELECT r.id AS raw_id, r.info, r.t_time, k.id AS kind_id, k.classification_id AS classification_id, c.name AS classification_name, w.id AS word_id, w.sequence AS sequence, w.name AS word_name, t.id AS tag_id, t.name AS tag_name, t.description AS tag_description FROM raws r LEFT JOIN kinds k ON r.id = k.raw_id LEFT JOIN classifications c ON k.classification_id = c.id LEFT JOIN words w ON r.id = w.raw_id LEFT JOIN tags t ON w.tag_id = t.id WHERE r.active = true ORDER BY r.t_time DESC;
DROP VIEW data_syllable_old;
CREATE VIEW data_syllable_old AS SELECT r.id AS raw_id, r.info, r.t_time, k.id AS kind_id, k.classification_id AS classification_id, c.name AS classification_name, s.id AS syllable_id, s.sequence AS sequence, s.name AS syllable_name, t.id AS tag_id, t.name AS tag_name, t.description AS tag_description FROM raws r LEFT JOIN kinds k ON r.id = k.raw_id LEFT JOIN classifications c ON k.classification_id = c.id LEFT JOIN syllables s ON r.id = s.raw_id LEFT JOIN tags t ON s.tag_id = t.id WHERE r.active = true ORDER BY r.t_time DESC;
DROP VIEW data_word;
CREATE VIEW data_word AS SELECT r.id AS raw_id, r.info, r.t_time, k.id AS kind_id, k.classification_id AS classification_id, c.name AS classification_name, w.id AS word_id, w.sequence AS sequence, w.name AS word_name, t.id AS tag_id, t.name AS tag_name, t.description AS tag_description FROM words w LEFT JOIN raws r ON w.raw_id = r.id LEFT JOIN kinds k ON r.id = k.raw_id LEFT JOIN classifications c ON k.classification_id = c.id LEFT JOIN tags t ON w.tag_id = t.id WHERE w.active = true ORDER BY r.t_time DESC;
DROP VIEW data_syllable;
CREATE VIEW data_syllable AS SELECT r.id AS raw_id, r.info, r.t_time, k.id AS kind_id, k.classification_id AS classification_id, c.name AS classification_name, s.id AS syllable_id, s.sequence AS sequence, s.name AS syllable_name, s.verified, t.id AS tag_id, t.name AS tag_name, t.description AS tag_description FROM syllables s LEFT JOIN raws r ON s.raw_id = r.id LEFT JOIN kinds k ON r.id = k.raw_id LEFT JOIN classifications c ON k.classification_id = c.id LEFT JOIN tags t ON s.tag_id = t.id WHERE s.active = true ORDER BY r.t_time DESC;
DROP VIEW process_chunking;
CREATE VIEW process_chunking AS SELECT r.id AS raw_id, r.info, r.t_time, e.id AS respondent_id, e.name AS respondent_name, e.t_user_id, k.id AS kind_id, k.processed AS kind_processed, k.chunked AS kind_chunked, c.id AS classification_id, c.name AS classification_name FROM kinds k LEFT JOIN raws r ON k.raw_id = r.id LEFT JOIN respondents e ON r.respondent_id = e.id LEFT JOIN classifications c ON k.classification_id = c.id WHERE k.active = true ORDER BY r.t_time DESC;
DROP VIEW process_locating;
CREATE VIEW process_locating AS SELECT r.id AS raw_id, r.info, r.t_time, e.id AS respondent_id, e.name AS respondent_name, e.t_user_id, k.id AS kind_id, w.id AS word_id, w.sequence, w.name, t.id AS tag_id, t.name AS tag_name FROM words w LEFT JOIN raws r ON w.raw_id = r.id LEFT JOIN respondents e ON r.respondent_id = e.id LEFT JOIN kinds k ON r.id = k.raw_id LEFT JOIN tags t ON w.tag_id = t.id WHERE w.active = true AND k.processed = true AND k.chunked = false;
