sub display_pic {
	$r->content_type('image/gif');
	$r->headers_out->set("Expires" => "Mon, 26 Jul 2005 05:00:00 GMT");
	$r->headers_out->set("Cache-Control" => "no-store, no-cache, must-revalidate");
	$r->headers_out->set("Pragma" => "no-cache");
	if ( $ENV{'DNT'} eq '1' ) { 
		$r->headers_out->set("DNT" => "1");
	}
	$r->headers_out->set("Content-Length" => "43");
	printf "GIF89a\1\0\1\0%c\0\0%c%c%c\0\0\0%s,\0\0\0\0\1\0\1\0\0%c%c%c\1\0;",
	  144,255,0,0,1?pack("C8",33,249,4,5,16,0,0,0):"",2,2,4;
	+0;
	return Apache2::Const::OK;
}

use strict;

#these modules are now loaded in apache config
use Apache2::RequestRec ();
use Apache2::RequestIO ();
use Apache2::Const -compile => qw(OK);
use Apache2::RequestUtil;
use APR::Table;

use POSIX qw(strftime);
use URI::Escape;
use Digest::MD5 qw(md5_hex);
use Data::Validate::URI qw(is_uri);

sub display_pic {
	$r->content_type('image/gif');
	$r->headers_out->set("Expires" => "Mon, 26 Jul 2005 05:00:00 GMT");
	$r->headers_out->set("Cache-Control" => "no-store, no-cache, must-revalidate");
	$r->headers_out->set("Pragma" => "no-cache");
	if ( $ENV{'DNT'} eq '1' ) { 
		$r->headers_out->set("DNT" => "1");
	}
	$r->headers_out->set("Content-Length" => "43");
	printf "GIF89a\1\0\1\0%c\0\0%c%c%c\0\0\0%s,\0\0\0\0\1\0\1\0\0%c%c%c\1\0;",
	  144,255,0,0,1?pack("C8",33,249,4,5,16,0,0,0):"",2,2,4;
	+0;
	return Apache2::Const::OK;
}
