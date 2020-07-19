SELECT
    SUM(
        CASE
            WHEN eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
            AND DATE_PART('day', NOW() - created) BETWEEN 0
            AND 90
            AND (
                SELECT 
                    SUM(onhandqtydelta)
                FROM
                    deliverr
                WHERE 
                    eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
                    AND DATE_PART('day', NOW() - created) > 90
            ) > (
                SELECT
                    SUM(ABS(onhandqtydelta))
                FROM 
                    deliverr
                WHERE 
                    eventtype = 'SHIPPED'
            ) THEN onhandqtydelta

            WHEN eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
            AND DATE_PART('day', NOW() - created) BETWEEN 0
            AND 90
            AND (
                SELECT 
                    SUM(onhandqtydelta)
                FROM
                    deliverr
                WHERE 
                    eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
                    AND DATE_PART('day', NOW() - created) > 90
            ) < (
                SELECT
                    SUM(ABS(onhandqtydelta))
                FROM 
                    deliverr
                WHERE 
                    eventtype = 'SHIPPED'
            ) THEN onhandqtydelta - (
                (
                    SELECT
                        SUM(ABS(onhandqtydelta))
                    FROM 
                        deliverr
                    WHERE
                        eventtype = 'SHIPPED'
                ) - (
                    SELECT
                        SUM(onhandqtydelta)
                    FROM
                        deliverr
                    WHERE
                        eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
                        AND DATE_PART('day', NOW() - created) > 90
                )
            )
            ELSE 0
            
        END
    ) AS "0-90 days old",
    SUM(
        CASE
            WHEN eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
            AND DATE_PART('day', NOW() - created) BETWEEN 91
            AND 180
            AND (
                SELECT 
                    SUM(onhandqtydelta)
                FROM
                    deliverr
                WHERE 
                    eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
                    AND DATE_PART('day', NOW() - created) > 180
            ) > (
                SELECT
                    SUM(ABS(onhandqtydelta))
                FROM 
                    deliverr
                WHERE 
                    eventtype = 'SHIPPED'
            ) THEN onhandqtydelta

            WHEN eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
            AND DATE_PART('day', NOW() - created) BETWEEN 91
            AND 180
            AND (
                SELECT 
                    SUM(onhandqtydelta)
                FROM
                    deliverr
                WHERE 
                    eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
                    AND DATE_PART('day', NOW() - created) > 180
            ) < (
                SELECT
                    SUM(ABS(onhandqtydelta))
                FROM 
                    deliverr
                WHERE 
                    eventtype = 'SHIPPED'
            ) THEN onhandqtydelta - (
                (
                    SELECT
                        SUM(ABS(onhandqtydelta))
                    FROM 
                        deliverr
                    WHERE
                        eventtype = 'SHIPPED'
                ) - (
                    SELECT
                        SUM(onhandqtydelta)
                    FROM
                        deliverr
                    WHERE
                        eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
                        AND DATE_PART('day', NOW() - created) > 180
                )
            )
            ELSE 0
            
        END
    ) AS "91-180 days old",
    SUM(
        CASE
            WHEN eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
            AND DATE_PART('day', NOW() - created) BETWEEN 181
            AND 270
            AND (
                SELECT 
                    SUM(onhandqtydelta)
                FROM
                    deliverr
                WHERE 
                    eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
                    AND DATE_PART('day', NOW() - created) > 270
            ) > (
                SELECT
                    SUM(ABS(onhandqtydelta))
                FROM 
                    deliverr
                WHERE 
                    eventtype = 'SHIPPED'
            ) THEN onhandqtydelta

            WHEN eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
            AND DATE_PART('day', NOW() - created) BETWEEN 181
            AND 270
            AND (
                SELECT 
                    SUM(onhandqtydelta)
                FROM
                    deliverr
                WHERE 
                    eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
                    AND DATE_PART('day', NOW() - created) > 270
            ) < (
                SELECT
                    SUM(ABS(onhandqtydelta))
                FROM 
                    deliverr
                WHERE 
                    eventtype = 'SHIPPED'
            ) THEN onhandqtydelta - (
                (
                    SELECT
                        SUM(ABS(onhandqtydelta))
                    FROM 
                        deliverr
                    WHERE
                        eventtype = 'SHIPPED'
                ) - (
                    SELECT
                        SUM(onhandqtydelta)
                    FROM
                        deliverr
                    WHERE
                        eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
                        AND DATE_PART('day', NOW() - created) > 270
                )
            )
            ELSE 0
            
        END
    ) AS "181-270 days old",
    SUM(
        CASE
            WHEN eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
            AND DATE_PART('day', NOW() - created) BETWEEN 271
            AND 365
            AND (
                SELECT 
                    SUM(onhandqtydelta)
                FROM
                    deliverr
                WHERE 
                    eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
                    AND DATE_PART('day', NOW() - created) > 365
            ) > (
                SELECT
                    SUM(ABS(onhandqtydelta))
                FROM 
                    deliverr
                WHERE 
                    eventtype = 'SHIPPED'
            ) THEN onhandqtydelta

            WHEN eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
            AND DATE_PART('day', NOW() - created) BETWEEN 271
            AND 365
            AND (
                SELECT 
                    SUM(onhandqtydelta)
                FROM
                    deliverr
                WHERE 
                    eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
                    AND DATE_PART('day', NOW() - created) > 365
            ) < (
                SELECT
                    SUM(ABS(onhandqtydelta))
                FROM 
                    deliverr
                WHERE 
                    eventtype = 'SHIPPED'
            ) THEN onhandqtydelta - (
                (
                    SELECT
                        SUM(ABS(onhandqtydelta))
                    FROM 
                        deliverr
                    WHERE
                        eventtype = 'SHIPPED'
                ) - (
                    SELECT
                        SUM(onhandqtydelta)
                    FROM
                        deliverr
                    WHERE
                        eventtype = 'WAREHOUSE_POOL_INVENTORY_MOVEMENT'
                        AND DATE_PART('day', NOW() - created) > 365
                )
            )
            ELSE 0
            
        END
    ) AS "271-365 days old"

FROM
    deliverr;