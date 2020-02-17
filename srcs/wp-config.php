<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'nsimon' );

/** MySQL database password */
define( 'DB_PASSWORD', 'ft_server' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'j59K%taU3}fB4x{a/T<;z+V(Jt#J^vqbf2xX883-kf+-=SA5]luh)]`74]DclGBG' );
define( 'SECURE_AUTH_KEY',  'xdR_Er ?@V!nFAIUg/nj$zQ|*R]gqoGk4gbWM7!%rzG}Km@E.Ykdc>AC}5w|bcFz' );
define( 'LOGGED_IN_KEY',    '<==ZCBlCKk?$NV*$C66V(,<V mHRq+`M`6Np;_nt2# JAk_fcdzQpCv*) &Lm<z&' );
define( 'NONCE_KEY',        'Mv4FaW/)>W`V7ta<%z}JWeXNIlp_$&rMJ?`:#It]*1EC&[?(U0c$1(<Qr+M4i{<c' );
define( 'AUTH_SALT',        '&.PJW71b.XE.iR}4-c l&M]<  V%)Q+Fq5y8u7@GsDB.E*)Pa-j4f++m]pnlhVB3' );
define( 'SECURE_AUTH_SALT', '!Kx&$`z=Ep2Q(-9G;.d&.Bk}sr|;i2Nh@Hl#iU7L3aB?>6CItrG VnH!hU|P1i;.' );
define( 'LOGGED_IN_SALT',   'o3qc$SvUJNw^.j:Th#Eg/j*(EpcgY0=&<gtk@M#3#uj{Etv.rd^lO{`S7l(LC]{M' );
define( 'NONCE_SALT',       'OM-w`Z`39(?1YmI/Ew(A@0]1L,`p|&2|p8DBompz)LSU#Ku-9?&O t${}YX`[}wI' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );

