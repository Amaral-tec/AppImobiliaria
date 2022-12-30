<!-- Search Section Begin -->
<section class="search-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-7">
                <div class="section-title">
                    <h4>Let Us Help You Find a Place to Call Home</h4>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="change-btn">
                    <div class="cb-item">
                        <label for="cb-rent" class="active">
                            For rent
                            <input type="radio" id="cb-rent">
                        </label>
                    </div>
                    <div class="cb-item">
                        <label for="cb-sale">
                            For sale
                            <input type="radio" id="cb-sale">
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <div class="search-form-content">
            <form action="#" class="filter-form">
                <select class="sm-width">
                    <option value="">City</option>
                </select>
                <select class="sm-width">
                    <option value="">State</option>
                </select>
                <select class="sm-width">
                    <option value="">Property status</option>
                    <option value="New">New</option>
                    <option value="Construction">Under Construction</option>
                    <option value="Used">Used</option>
                </select>
                <select class="sm-width">
                    <option value="">Property Type</option>
                    <option value="apartament">Apartment</option>
                    <option value="house">House</option>
                    <option value="office">Office</option>
                    <option value="ground">Land</option>
                </select>
                <select class="sm-width">
                    <option value="">Number of bedrooms</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="more">More</option>
                </select>
                <select class="sm-width">
                    <option value="">Parking spaces</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="more">More</option>
                </select>
                <div class="room-size-range-wrap sm-width">
                    <div class="price-text">
                        <label for="roomsizeRange">Size m²:</label>
                        <input type="text" id="roomsizeRange" readonly>
                    </div>
                    <div id="roomsize-range" class="slider"></div>
                </div>
                <!-- to change the range edit the file ../js/main -->
                <div id="priceRent" class="price-range-wrap sm-width">
                    <div class="price-text">
                        <label for="priceRange">Value:</label>
                        <input type="text" id="priceRangeRent" readonly>
                    </div>
                    <div id="price-range-rent" class="slider"></div>
                </div>
                <div id="priceSale" class="price-range-wrap sm-width">
                    <div class="price-text">
                        <label for="priceRange">Value:</label>
                        <input type="text" id="priceRangeSale" readonly>
                    </div>
                    <div id="price-range-sale" class="slider"></div>
                </div>
                <button type="button" class="search-btn sm-width">Search</button>
            </form>
        </div>
        <div class="more-option">
            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-heading active">
                        <a data-toggle="collapse" data-target="#collapseOne">
                            More Search Options
                        </a>
                    </div>
                    <div id="collapseOne" class="collapse" data-parent="#accordionExample">
                        <div class="card-body">
                            <div class="mo-list">
                                <div class="ml-column">
                                    <label for="air">Air conditioning
                                        <input type="checkbox" id="air">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="microwave">Microwave
                                        <input type="checkbox" id="microwave">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="wifi">Wifi
                                        <input type="checkbox" id="wifi">
                                        <span class="checkbox"></span>
                                    </label>
                                </div>
                                <div class="ml-column">
                                    <label for="sports">Multi-sports court
                                        <input type="checkbox" id="sports">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="tv">Tv Cable
                                        <input type="checkbox" id="tv">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="hiking">Hiking trail
                                        <input type="checkbox" id="hiking">
                                        <span class="checkbox"></span>
                                    </label>
                                </div>
                                <div class="ml-column">
                                    <label for="pool">Swimming Pool
                                        <input type="checkbox" id="pool">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="gourmet">Gourmet space
                                        <input type="checkbox" id="gourmet">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="bike">Bike rack
                                        <input type="checkbox" id="bike">
                                        <span class="checkbox"></span>
                                    </label>
                                </div>
                                <div class="ml-column last-column">
                                    <label for="hall">Events Hall
                                        <input type="checkbox" id="hall">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="barbeque">Barbeque
                                        <input type="checkbox" id="barbeque">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="gym">Gym
                                        <input type="checkbox" id="gym">
                                        <span class="checkbox"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Search Section End -->
