use data_mart_airbnb;


alter table Listing_addresses add primary key (id);

alter table Listings add primary key (id);

alter table User_addresses add primary key(id);

alter table Users add primary key (id);

alter table Reviews add primary key (id);

alter table Amenities add primary key (id);

alter table Messages add primary key (id);

alter table Payments add primary key (id);

alter table ListingsAmenities add primary key (id);