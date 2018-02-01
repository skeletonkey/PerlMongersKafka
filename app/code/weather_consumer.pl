#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use Erik;

use Kafka::Consumer;
use Scalar::Util qw(blessed);
use Try::Tiny;

my $topic     = 'weather';
my $partition = 0;

my ($connection, $consumer);
try {
  $connection = Kafka::Connection->new(host => 'kafka');
  $consumer   = Kafka::Consumer->new(Connection => $connection);

  my $next_offset = $consumer->offset_earliest($topic, $partition);
  while (1) {
    foreach my $message (@{$consumer->fetch($topic, $partition, $next_offset)}) {
      if ($message->valid) {
        Erik::log("current weather is => " . $message->payload);
        $next_offset = $message->next_offset;
      }
      else {
        die($message->error . "\n");
      }
    }
  }
}
catch {
  my $error = $_;
  if ( blessed( $error ) && $error->isa( 'Kafka::Exception' ) ) {
    warn 'Error: (', $error->code, ') ',  $error->message, "\n";
    exit;
  } else {
    die $error;
  }
};

# cleaning up
undef $consumer;
$connection->close;
undef $connection;

