{% docs aeroplane_id %} A unique identifie of the aeroplane {% enddocs %}

{% docs aeroplane_model_id %} A unique identifie of the aeroplane model {% enddocs %}

{% docs customer_id %} A unique identifie of the customer {% enddocs %}

{% docs customer_group_id %} A unique identifie of the customer group {% enddocs %}

{% docs order_id %} A unique identifie of the order {% enddocs %}

{% docs trip_id %} A unique identifie of the trip {% enddocs %}

{% docs max_seats %} Maximum seats allowed in the plane {% enddocs %}

{% docs is_successful_order %} determine whether the seat is booked, by observing orders with status "Booked" or "Finished" {% enddocs %}

{% docs started_at %} start timestamp of the trip {% enddocs %}

{% docs ended_at %} start timestamp of the trip. for rows with started_at < ended_at, we assume it is an error, and shift ended_at 1 day onward {% enddocs %}
