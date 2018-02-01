#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use Erik;

use Kafka::Consumer;

my $topic = 'weather';
my $partition = 0;

my $consumer = Kafka::Consumer->new( Connection  => Kafka::Connection->new(host => 'kafka'));
my $next_offset = 0;
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
