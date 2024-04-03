UPDATE ti_updated SET ti_updated.data_cecha_df = found_dates.dc_df
FROM
tow_info ti_updated
INNER JOIN 
(
	SELECT ti.tow_id AS fin_id, search.latest_date AS dc_df 
	FROM
	tow_info ti
	LEFT JOIN 
	(
		SELECT l.tow_id AS latest_id, MAX(data_m) AS latest_date
		FROM log_tow l
		INNER JOIN 
		(
			SELECT tow.id
			FROM tow
			WHERE cechy_list LIKE '%DF%'
		) tow
		ON tow.id = l.tow_id
		WHERE l.cechy_list LIKE '%DF%'
	GROUP BY l.tow_id
	) search
	ON ti.tow_id= search.latest_id
) found_dates

ON ti_updated.tow_id = found_dates.fin_id;