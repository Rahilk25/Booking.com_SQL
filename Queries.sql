--What is the overall cancellation rate for hotel bookings?

Select
  round(sum(case when is_canceled = 1 then 1 else 0 end ) / count(*) * 100,2) as cancellation_rate
From bookings


--Which countries are the top contributors to hotel bookings?

Select country, count(*) as cnt
From bookings
Group by country
Order by cnt desc
limit 10 --top 10 countries.



--What are the main market segments booking the hotels, such as leisure or corporate?

Select market_segment, count(*) as no_of_booking
From bookings
Group by market_segment
order by no_of_booking desc

--Is there a relationship between deposit type (e.g., non-refundable, refundable) and the likelihood of cancellation?

Select deposit_type,
  sum(case when is_canceled = 1 then 1 else 0 end) / count(*) over() as cancellation_rate
From bookings
Group by deposit_type

--What meal options are most preferred by guests?

Select meal, count(*) / count(*) over() * 100 as preference
From bookings 
Group by meal
Order by preference desc

--Do bookings made through agents exhibit different cancellation rates compared to direct bookings?









