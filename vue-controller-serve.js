const fs = require( 'fs' );

module.exports = {
  serve( req, res ) {
    fs.createReadStream( __dirname + '/../../assets/index.html' ).pipe( res );
  }
}
