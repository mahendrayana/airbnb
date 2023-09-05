UPDATE `airbnb.antwerp_listings`
SET proj_rev_30 = Price * (30 - availability_30)
WHERE availability_30 > 0;
