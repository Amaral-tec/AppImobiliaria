<!-- Search Section Begin -->
<section class="search-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-7">
                <div class="section-title">
                    <h4>Aonde voc� gostaria de morar?</h4>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="change-btn">
                    <div class="cb-item">
                        <label for="cb-rent" class="active">
                            Alugar
                            <input type="radio" id="cb-rent">
                        </label>
                    </div>
                    <div class="cb-item">
                        <label for="cb-sale">
                            Comprar
                            <input type="radio" id="cb-sale">
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <div class="search-form-content">
            <form action="#" class="filter-form">
                <select class="sm-width">
                    <option value="">Cidade</option>
                </select>
                <select class="sm-width">
                    <option value="">Bairro</option>
                </select>
                <select class="sm-width">
                    <option value="">Status do Im�vel</option>
                    <option value="Novo">Novo</option>
                    <option value="Planta">Planta</option>
                    <option value="Usado">Usado</option>
                </select>
                <select class="sm-width">
                    <option value="">Tipo de Im�vel</option>
                </select>
                <select class="sm-width">
                    <option value="">N�mero de Quartos</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="mais">Mais de 3</option>
                </select>
                <select class="sm-width">
                    <option value="">Vagas de Garagem</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="mais">Mais de 3</option>
                </select>
                <div class="room-size-range-wrap sm-width">
                    <div class="price-text">
                        <label for="roomsizeRange">Tamanho m�:</label>
                        <input type="text" id="roomsizeRange" readonly>
                    </div>
                    <div id="roomsize-range" class="slider"></div>
                </div>
                <!-- para alterar o intervalo edite o arquivo ../js/main -->
                <div id="priceRent" class="price-range-wrap sm-width">
                    <div class="price-text">
                        <label for="priceRange">Valor:</label>
                        <input type="text" id="priceRangeRent" readonly>
                    </div>
                    <div id="price-range-rent" class="slider"></div>
                </div>
                <div id="priceSale" class="price-range-wrap sm-width">
                    <div class="price-text">
                        <label for="priceRange">Valor:</label>
                        <input type="text" id="priceRangeSale" readonly>
                    </div>
                    <div id="price-range-sale" class="slider"></div>
                </div>
                <button type="button" class="search-btn sm-width">Buscar</button>
            </form>
        </div>
        <div class="more-option">
            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-heading active">
                        <a data-toggle="collapse" data-target="#collapseOne">
                            Mais Opi��es de Busca
                        </a>
                    </div>
                    <div id="collapseOne" class="collapse" data-parent="#accordionExample">
                        <div class="card-body">
                            <div class="mo-list">
                                <div class="ml-column">
                                    <label for="air">Ar condicionado
                                        <input type="checkbox" id="air">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="refrigerator">Refrigerador
                                        <input type="checkbox" id="refrigerator">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="washer">M�quina de Lavar
                                        <input type="checkbox" id="washer">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="shower">Chuveiro El�trico
                                        <input type="checkbox" id="shower">
                                        <span class="checkbox"></span>
                                    </label>
                                </div>
                                <div class="ml-column">
                                    <label for="tv">Tv � Cabo
                                        <input type="checkbox" id="tv">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="microwave">Microondas
                                        <input type="checkbox" id="microwave">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="wifi">Wifi
                                        <input type="checkbox" id="wifi">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="pista">Pista de Caminhada
                                        <input type="checkbox" id="wifi">
                                        <span class="checkbox"></span>
                                    </label>
                                </div>
                                <div class="ml-column">
                                    <label for="quadra">Quadra Poliesportiva
                                        <input type="checkbox" id="pool">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="pool">Piscina
                                        <input type="checkbox" id="pool">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="gourmet">Espa�o Gourmet
                                        <input type="checkbox" id="window">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="bicicletario">Biciclet�rio
                                        <input type="checkbox" id="window">
                                        <span class="checkbox"></span>
                                    </label>
                                </div>
                                <div class="ml-column last-column">
                                    <label for="salao">Sal�o de Eventos
                                        <input type="checkbox" id="gym">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="barbeque">Churrasqueira
                                        <input type="checkbox" id="barbeque">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="gym">Academia
                                        <input type="checkbox" id="sauna">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="baby">Espa�o Baby
                                        <input type="checkbox" id="sauna">
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
