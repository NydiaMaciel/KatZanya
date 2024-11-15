<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8" />
  <xsl:param name="Menu_Selection" select="Menu_Selection"></xsl:param>


  <xsl:template match="katzanya">

    <html lang="es">

      <head>
        <title>KatZanya</title>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>


        <script src="js/miJs.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="css/miEstilo.css"/>
        <link rel="stylesheet" type="text/css" href="css/vendor.css"/>
        <link rel="stylesheet" type="text/css" href="css/style.css"/>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"/>
        <link rel="preconnect" href="https://fonts.googleapis.com"/>
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""/>
        <link href="https://fonts.googleapis.com/css2?family=Chilanka&amp;family=Montserrat:wght@300;400;500&amp;display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet"></link>


        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <!--////////////////////////////-->

        <script src="../google.js" type="text/javascript"></script>

        <link rel="stylesheet" type="text/css" href="css/vendor.css"/>


        <!--<script src="https://maps.googleapis.com/maps/api/js?key=TU_API_KEY&amp;callback=initMap" async="" defer=""></script>-->
        <!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />-->
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"/>-->
        <!--<link rel="preconnect" href="https://fonts.googleapis.com"/>-->
        <!--<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""/>-->
        <!--<link href="https://fonts.googleapis.com/css2?family=Chilanka&amp;family=Montserrat:wght@300;400;500&amp;display=swap" rel="stylesheet"/>-->

        <!--<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>-->
        <!--<script src="js/google.js" type="text/javascript"></script>-->

        <!-- Google Fonts -->
        <!--<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet"></link>-->

        <!-- Vendor CSS Files -->
        <!--<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet"></link>-->
        <!--<link href="assets/vendor/aos/aos.css" rel="stylesheet"></link>-->
        <!--<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"></link>-->
        <!--<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"></link>-->
        <!--<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"></link>-->
        <!--<link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet"></link>-->
        <!--<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"></link>-->

        <!-- Template Main CSS File -->
        <!--<link href="assets/css/style.css" rel="stylesheet"></link>-->
        <!--<script type="text/javascript" src="assets/js/jquery-1.11.2.min.js"></script>-->
      </head>

      <body>
        <!-- ======= Header ======= -->
        <header>
          <div class="container py-2">
            <div class="row py-4 pb-0 pb-sm-4 align-items-center ">

              <!--Logo-->
              <div class="col-sm-4 col-lg-3 text-center text-sm-start">
                <div class="main-logo">
                  <a href="index.html">
                    <img src="assets/katlogo.png" alt="logo" class="img-fluid"/>
                  </a>
                </div>
              </div>

              <!--Menu Superior-->
              <div class="col-sm-6 offset-sm-2 offset-md-0 col-lg-5 d-none d-lg-block">
                <nav class="main-menu d-flex navbar navbar-expand-lg ">
                  <ul class="navbar-nav menu-list list-unstyled d-flex gap-md-3 mb-0">
                    <xsl:for-each select="opciones/opcion">
                      <xsl:choose>
                        <xsl:when test="Menu_Selection = @Id">
                          <li class="nav-item " >
                            <a href="{@Url}" style="background-color:#fff;" class="nav-link">
                              <xsl:value-of select="@Texto"/>
                            </a>
                          </li>
                        </xsl:when>
                        <xsl:otherwise>
                          <li class="nav-item">
                            <a href="{@Url}" class="nav-link">
                              <xsl:value-of select="@Texto"/>
                            </a>
                          </li>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                  </ul>
                </nav>
              </div>



            </div>
          </div>
        </header>

        <!-- ======= Choose Section ======= -->
        <div id="contenido">
          <xsl:choose>
            <xsl:when test="$Menu_Selection = 0">
              <xsl:call-template name="Home"></xsl:call-template>
            </xsl:when>
            <xsl:when test="$Menu_Selection = 1">
              <xsl:call-template name="Servicios"></xsl:call-template>
            </xsl:when>
            <xsl:when test="$Menu_Selection = 2">
              <xsl:call-template name="Tienda"></xsl:call-template>
            </xsl:when>
            <xsl:when test="$Menu_Selection = 3">
              <xsl:call-template name="Hablemos"></xsl:call-template>
            </xsl:when>
            <xsl:when test="$Menu_Selection = 4">
              <xsl:call-template name="Contacto"></xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="Home"></xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </div>

        <!-- ======= Footer ======= -->
        <footer>
        </footer>

      </body>
    </html>
  </xsl:template>


  <!--Templates Section-->
  <!--Section Home-->
  <xsl:template name="Home">

    <!-- Slider principal -->
    <div class="slider">
      <div class="slider-container">
        <!-- Iteración sobre los elementos de la lista -->
        <xsl:for-each select="/katzanya/servicios/tipo">
          <div class="slider-item">
            <h1 class="h1-slider">
              <xsl:value-of select="@nombre"/>
            </h1>
            <div class="slider-content">
              <div class="slider-img">
                <img>
                  <xsl:attribute name="src">
                    <xsl:value-of select="servicio/imagen"/>
                  </xsl:attribute>
                </img>
              </div>
              <div class="slider-text">
                <p>
                  <xsl:value-of select="servicio/anuncio"/>
                </p>
              </div>
            </div>
          </div>
        </xsl:for-each>
      </div>
    </div>
    <!-- Botones de paginación -->
    <div class="pagination">
      <xsl:for-each select="/katzanya/opciones/opcion">
        <button>
          <xsl:attribute name="onclick">
            <xsl:text>goToSlide(</xsl:text>
            <xsl:value-of select="position() - 1" />
            <xsl:text>)</xsl:text>
          </xsl:attribute>
        </button>

      </xsl:for-each>
    </div>


    <!-- video -->
    <div class="row mt-5">
      <div class="section-header d-md-flex justify-content-between align-items-center mb-3">
        <h2 class="display-3 fw-normal">Multimedia</h2>
      </div>
    </div>

    <div class="multimedia-Div">
      <div class="media-Div">
        <div>
          <h2>Videito chill   :3</h2>
          <!-- Incrustar video de YouTube -->
          <iframe width="560" height="315"
              src="https://www.youtube.com/embed/sR6tjNq8Ywk?autoplay=1&amp;mute=0"
              title="YouTube video player"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
              allowfullscreen="">
          </iframe>

        </div>
      </div>
      <div class="media-Div">
        <!-- audio -->
        <div>
          <h2>Lista de Audios</h2>
          <div class="audio-list">
            <xsl:for-each select="../katzanya/audios/audio">
              <div class="audio-item">
                <h4>
                  <xsl:value-of select="titulo"/>
                </h4>
                <audio controls="">
                  <source type="audio/mpeg">
                    <xsl:attribute name="src">
                      <xsl:value-of select="ubi" />
                    </xsl:attribute>
                  </source>
                  Tu navegador no soporta el elemento de audio.
                </audio>
              </div>
            </xsl:for-each>


            <!-- Agrega más elementos de audio según sea necesario -->
          </div>

        </div>
      </div>
    </div>






  </xsl:template>

  <!--Section Servicio-->
  <xsl:template name="Servicios">
    <div class="section-titulo">
      <h2 class="display-5 fw-normal" style="color:#b37c1e">Servicios</h2>
    </div>

    <xsl:for-each select="servicios/tipo/servicio">
      <div class="servicios-content">
        <div class="servicios-card">
          <img class="servicios-img">
            <xsl:attribute name="src">
              <xsl:value-of select="imagen" />
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="@titulo" />
            </xsl:attribute>
          </img>
          <div class="servicios-cont">
            <h2>
              <xsl:value-of select="@label" />
            </h2>
            <h6 class="ptipo">
              <xsl:value-of select="../@nombre" />
            </h6>
            <p class="ppdescripp">
              <xsl:value-of select="substring(descripccion, 1, 150)" />
            </p>
            <a href="#">Ver más....</a>
          </div>
        </div>
      </div>
    </xsl:for-each>

  </xsl:template>

  <!--Section Tienda-->
  <xsl:template name="Tienda">
    <div class="section-titulo">
      <h2 class="display-5 fw-normal" style="color:#b37c1e">Tienda</h2>
    </div>
    
    <section id="menuF" class="menuF section-bg">
      <!--<div class="container" data-aos="fade-up">-->
      <div class="container">

        <!--<div class="row" data-aos="fade-up" data-aos-delay="100">-->
        <div class="row" data-aos-delay="100">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="menu-fltersF">

              <li data-filter="*" class="filter-active">All</li>
              <xsl:for-each select="tienda/tipo">
                <li data-filter=".filter-{@nombre}">
                  <xsl:value-of select="@nombre"/>
                </li>
              </xsl:for-each>
            </ul>
          </div>
        </div>

        <!--<div class="row menu-container" data-aos="fade-up" data-aos-delay="200">-->
        <div class="row menu-containerF" data-aos-delay="200">

          <xsl:for-each select ="tienda/tipo/producto">
            <div class="col-lg-6 menu-itemF filter-{../@nombre}">
              <img src="{imagen}" class="menu-imgF" alt=""/>
              <div class="menu-contentF">
                <a href="#">
                  <xsl:value-of select="@nombre"/>
                </a>
                <span>
                  <xsl:value-of select="precio"/>
                </span>
              </div>
              <div class="menu-ingredientsF">
                <xsl:value-of select="descripcion"/>
              </div>
            </div>
          </xsl:for-each>
        </div>

      </div>
    </section>
  </xsl:template>

  <!--Section Hablemos-->
  <xsl:template name="Hablemos">
    <div class="section-titulo">
      <h2 class="display-5 fw-normal" style="color:#b37c1e">Hablemos de Gatos..</h2>
    </div>
    <!--Hablemos de-->
    <section id="latest-blog" class="my-5">
      <div class="container py-5 my-5">
        <div class="row mt-5">
          <div class="section-header d-md-flex justify-content-between align-items-center mb-3">
          </div>
        </div>
        <div class="row">
          <xsl:for-each select="hablemos/tipo/articulo">
            <div class="col-md-4 my-4 my-md-0">
              <div class="z-1 position-absolute rounded-3 m-2 px-3 pt-1 bg-light">
                <h3 class="secondary-font text-primary m-0">
                  <xsl:value-of select="dia" />
                </h3>
                <p class="secondary-font fs-6 m-0">
                  <xsl:value-of select="mes" />
                </p>

              </div>
              <div class="card position-relative">
                <img class="img-art">
                  <xsl:attribute name="src">
                    <xsl:value-of select="imagen" />
                  </xsl:attribute>
                  <xsl:attribute name="alt">
                    <xsl:value-of select="@titulo" />
                  </xsl:attribute>
                </img>
                <div class="card-body p-0">
                  <a href="#">
                    <h3 class="card-title pt-4 pb-3 m-0">
                      <xsl:value-of select="@titulo" />
                    </h3>
                  </a>
                  <p id="categoria">
                    <xsl:value-of select="../@nombre" />
                  </p>
                  <div class="card-text">
                    <p class="blog-paragraph fs-6">
                      <xsl:value-of select="substring(descripccion, 1, 150)" />...
                    </p>
                    <a href="#" class="blog-read">read more</a>
                  </div>

                </div>
              </div>
            </div>
          </xsl:for-each>
        </div>
      </div>
    </section>
  </xsl:template>

  <!--Section Contacto-->
  <xsl:template name="Contacto">

    <div class="section-titulo">
      <h2 class="display-5 fw-normal" style="color:#b37c1e">Contacto</h2>
    </div>

    <!--API de Google-->

    <script>
      // Definir la función initMap globalmente
      function initMap() {
      // Asegúrate de que aquí inicializas el mapa correctamente
      const mapOptions = {
      center: { lat: -34.397, lng: 150.644 },  // Cambia estas coordenadas por las deseadas
      zoom: 8
      };
      const map = new google.maps.Map(document.getElementById('map'), mapOptions);
      }
    </script>

    <script>
      <![CDATA[
			(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="_ib",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>""+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=https://maps.${c}apis.com/maps/api/js?+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
			key: "AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs",
			// Add other bootstrap parameters as needed, using camel case.
			// Use the 'v' parameter to indicate the version to load (alpha, beta, weekly, etc.)
			});]]>
    </script>

    <!--Referencia a mi archivo JS-->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs&amp;callback=initMap"
        async="" defer=""></script>

    <script type="module" src="js/google.js"></script>
    <script src="js/miScript.js" type="text/javascript"></script>

    <!-- SweetAlert reference -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <div class="section">

      <!-- Map -->
      <div data-aos="fade-up" style="padding: 25px 200px; padding-bottom: 400px;">
        <style>
          #map{
          border: 0;
          width: 100%;
          height: 350px;
          }
        </style>
        <div id="google-map">
          <div id="map"></div>
        </div>
        <text id="address">This is a text tag.</text>
        <div class="col-lg-12 margin-bottom-30" id="street" style="height:400px; width:100%;"></div>

      </div>
    </div>



  </xsl:template>

</xsl:stylesheet>