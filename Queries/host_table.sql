WITH HostAggregates AS (
  SELECT
    host_id,
    host_name,
    COUNT(DISTINCT id) AS listing_count,
    SUM(proj_rev_30) AS total_proj_rev_30,
    MAX(latitude) AS latitude,
    MAX(longitude) AS longitude
  FROM
    `airbnb.antwerp_listings`
  GROUP BY
    host_id, host_name
)

SELECT
  host_id,
  host_name,
  listing_count,
  total_proj_rev_30,
  latitude,
  longitude
FROM
  HostAggregates;