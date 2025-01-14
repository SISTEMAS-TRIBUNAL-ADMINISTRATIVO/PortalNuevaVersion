


<body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="clearfix"></div>

            <!-- Foto, Nombre del usuario -->
            <div class="profile clearfix">
              <div class="profile_pic">
              <img src="<?php echo $_SESSION["fotoBase64"]; ?>" alt="Foto de usuario" style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover; margin-left: 50px; margin-top: 10%;">
              </div>
              <div class="profile_info" style="margin-left: 5px; margin-top: -10px;">
                <a href="" id="NombreLink">
                <h2 id="Nombre1"><?php echo $_SESSION["nombre"]; ?></h2>
                </a>
                <h8 id="Email"><?php echo $_SESSION["email"]; ?></h8>
              </div>

            </div>
            <br />

            <!-- Menu principal lateral izquierda -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-user"></i> Inicio <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                    <li><a href="../Home/home.php">Inicio</a></li>
                      <li><a href="../MiPerfil/miperfil.php">Datos Personales</a></li>
                      <li><a href="../MiPerfil/laboral.php">Datos laboral</a></li>
                      <li><a href="../FormatosAreaInformatic/FormatosInfoUsuario.php">Formatos del area de informatica</a></li>
                      <li><a href="../Cursos/CursosUsu.php">Cursos</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-list-alt"></i> Nóminas <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="../Nomina/nomina.php">Mis nóminas</a></li>
                    </ul>
                  </li>
                  <li>
                      <a><i class="fa fa-edit"></i> Declaraciones <span class="fa fa-chevron-down"></span></a>
                      <ul class="nav child_menu">
                          <li>
                              <?php if (isset($_SESSION['url_declaracion']) && !empty($_SESSION['url_declaracion'])): ?>
                                  <a href="<?php echo $_SESSION['url_declaracion']; ?>">
                                      <i class="fa fa-edit"></i> Ir a Declaraciones
                                  </a>
                              <?php else: ?>
                                  <a href="#">
                                      <i class="fa fa-edit"></i> Declaraciones no disponibles
                                  </a>
                              <?php endif; ?>
                          </li>
                      </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> Resguardos <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="../Resguardo/ResguardosBienesInformaticos.php">Resguardos Bienes Informaticos</a></li>

                      <!-- <li><a href="tables_dynamic.html">Mobiliario</a></li> -->
                    </ul>
                  </li>
                  <!-- <li><a><i class="fa fa-table"></i> Calendario <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="chartjs.html">Avisos</a></li>
                      <li><a href="chartjs2.html">Calendario Oficial</a></li>
                    </ul>
                  </li> -->
                  <li><a><i class="fa fa-wrench"></i>Ayuda y soporte técnico <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a id="UrlHelp" href="<?php echo $_SESSION['UrlAutorizacion']; ?>">Solicitar asistencia técnica</a></li>
                     <!-- <li><a href="fixed_footer.html">Reportar un error</a></li>-->
                     <!-- <li><a href="fixed_footer.html">Sugerencias del sistema</a></li>-->
                    </ul>
                  </li>
                </ul>
              </div>
               <!-- Solo para administradores -->
               <?php if ($_SESSION["rol"] === "Administrador del Portalta") : ?>
              <div class="menu_section" id="adminSection">
                <h3>Administrador</h3>
                <ul class="nav side-menu">
         <!--          <li><a><i class="fa fa-users"></i> Administrador de usuarios<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="e_commerce.html">Usuarios del sistema</a></li>
                    </ul>
                  </li> -->

                  <li><a><i class="fa fa-group"></i> Empleados <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="../Empleados/empleados.php">Activos</a></li>
                      <!-- <li><a href="page_404.html">Baja</a></li> -->
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> Informática <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="../Informatic/BienesInformaticos.php">Bienes Informáticos</a></li>
                      <li><a href="../Informatic/DetallesBienInformatico.php">Préstamos</a></li>
                      <li><a href="../Facturas/facturas.php">Facturas</a></li>
                      <li><a href="../FichasTecnicas/Fichastecnicas.php">Fichas tecnicas</a></li>
                    </ul>
                  </li>
                  <!-- <li><a><i class="fa fa-bell-o"></i> Catalogos<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                        <li><a href="#level1_1">Level One</a>
                        <li><a>Level One<span class="fa fa-chevron-down"></span></a>
                          <ul class="nav child_menu">
                            <li class="sub_menu"><a href="level2.html">Level Two</a>
                            </li>
                            <li><a href="#level2_1">Level Two</a>
                            </li>
                            <li><a href="#level2_2">Level Two</a>
                            </li>
                          </ul>
                        </li>
                        <li><a href="#level1_2">Level One</a>
                        </li> -->
                    </ul>
                  </li>                  
                </ul>
              </div>
              <?php endif; ?>
            </div>
          </div>
        </div>

        <!-- Ménu inferior derecha -->
        <div class="top_nav">
            <div class="nav_menu">
                <div class="nav toggle">
                  <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                </div>
                <nav class="nav navbar-nav">
                <ul class=" navbar-right">
                  <li class="nav-item dropdown open" style="padding-left: 15px;">
                    <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
                      <img id="profile_img" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"  alt="">
                      <h10 id="Nombre1"><?php echo $_SESSION["nombre"]; ?></h10>
                    </a>
                    <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item"  href="../MiPerfil/miperfil.php"> Perfil</a>

                    <a class="dropdown-item"  href="<?php echo $_SESSION['UrlAutorizacion']; ?>">Ayuda</a>
                    <a class="dropdown-item" href="../../logout.php"><i class="fa fa-sign-out pull-right"></i> Salir</a>

                    </div>
                  </li>
  
                  <!-- <li role="presentation" class="nav-item dropdown open">
                    <a href="javascript:;" class="dropdown-toggle info-number" id="navbarDropdown1" data-toggle="dropdown" aria-expanded="false">
                      <i class="fa fa-envelope-o"></i>
                      <span class="badge bg-green">6</span>
                    </a>
                    <ul class="dropdown-menu list-unstyled msg_list" role="menu" aria-labelledby="navbarDropdown1">
                      <li class="nav-item">
                        <a class="dropdown-item">
                          <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                          <span>
                            <span>John Smith</span>
                            <span class="time">3 mins ago</span>
                          </span>
                          <span class="message">
                            Film festivals used to be do-or-die moments for movie makers. They were where...
                          </span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="dropdown-item">
                          <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                          <span>
                            <span>John Smith</span>
                            <span class="time">3 mins ago</span>
                          </span>
                          <span class="message">
                            Film festivals used to be do-or-die moments for movie makers. They were where...
                          </span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="dropdown-item">
                          <span class="image"><img id="profile_img" alt="Profile Image" /></span>
                          <span>
                            <span>John Smith</span>
                            <span class="time">3 mins ago</span>
                          </span>
                          <span class="message">
                            Film festivals used to be do-or-die moments for movie makers. They were where...
                          </span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="dropdown-item">
                          <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                          <span>
                            <span>John Smith</span>
                            <span class="time">3 mins ago</span>
                          </span>
                          <span class="message">
                            Film festivals used to be do-or-die moments for movie makers. They were where...
                          </span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <div class="text-center">
                          <a class="dropdown-item">
                            <strong>See All Alerts</strong>
                            <i class="fa fa-angle-right"></i>
                          </a>
                        </div>
                      </li> -->
                    </ul>
                  </li>
                </ul>
              </nav>
            </div>
          </div>

          <script src="../../public/vendors/jquery/dist/jquery.min.js"></script>
          <script type="text/javascript" src="../Menu/MenuPrincipal.js"></script>