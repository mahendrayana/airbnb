-- Add a new column to the antwerp_host table to store the count of dirty comments
ALTER TABLE `airbnb.antwerp_host`
ADD COLUMN num_dirty_comments INT64;

-- Update the new column with the count of dirty comments
UPDATE `airbnb.antwerp_host` AS ah
SET num_dirty_comments = (
  SELECT COUNT(*)
  FROM `airbnb.antwerp_reviews` AS ar
  JOIN `airbnb.antwerp_listings` AS al ON ar.listing_id = al.id
  WHERE (al.host_id = ah.host_id OR al.host_name = ah.host_name)
    AND ar.comments LIKE "%dirty%"
)
WHERE TRUE;