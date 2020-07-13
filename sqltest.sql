SELECT
    onhandqtydelta,
    SUM (onhandqtydelta)
FROM
    deliverr
GROUP BY
    eventtype = 'SHIPPED';