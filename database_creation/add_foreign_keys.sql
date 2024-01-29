use data_mart_airbnb;



alter table Listings add constraint foreign key (address_id) references Listing_addresses(id);

alter table Listings add constraint foreign key (user_id) references Users(id);

alter table Reservations add constraint foreign key (listing_id) references Listings(id);

alter table Reviews add constraint foreign key (listing_id) references Listings(id);

alter table Reviews add constraint foreign key (user_id) references Users(id);

alter table Amenities add constraint foreign key (listing_id) references Listings(id);

alter table Messages add constraint users_id_fk_sender_id foreign key (sender_id) references Users(id);

alter table Messages add constraint users_id_fk_recipient_id foreign key (recipient_id) references Users(id);




alter table ListingsAmenities add constraint Amenities_id_ListingAmenities_amenities_id foreign key (amenities_id) references Amenities(id);

alter table ListingsAmenities add constraint Listings_id_ListingAmenities_listings_id foreign key (listing_id) references Listings(id);




