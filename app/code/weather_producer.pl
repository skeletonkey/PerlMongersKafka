#!/usr/bin/perl

use strict;
use warnings;

use Erik;
use File::Slurp;
use JSON::XS;
use Kafka::Producer;

# data downloaded from openweathermap.org
# http://bulk.openweathermap.org/sample/hourly_14.json.gz
my $data = decode_json(read_file('data/fountain_hills_hourly_temps.json'));
my $time_delay = 2; # seconds between publishing

my $topic = 'weather';
my $partition = 0;

Erik::log("data count: " . scalar(@{$data->{data}}));
Erik::log($data->{data}[0]{dt_txt} . ' to ' . $data->{data}[-1]{dt_txt});

my $producer = Kafka::Producer->new( Connection => Kafka::Connection->new(host => 'kafka'));

my $count = 1;
my $time_inc = 5 * 60; # break data into 5 minute increments for demo
INDEX: for (my $i = 1; $i < @{$data->{data}} - 1; $i++) {
  my $offset = 1;
  my $temp_delta = ($data->{data}[$i+1]{main}{temp} - $data->{data}[$i]{main}{temp}) / $time_inc;
  my $time = $data->{data}[$i]->{dt} + $time_inc * $offset;
  while ($time < $data->{data}[$i+1]->{dt}) {
    my $temp = $temp_delta * $offset + $data->{data}[$i]{main}{temp};
    Erik::log("\tPublish: " . join(' - ', k_to_f($temp), $data->{data}[$i]{weather}[0]{description}));
    $producer->send($topic, $partition, join(' - ', k_to_f($temp), $data->{data}[$i]{weather}[0]{description}));

    $offset++;
    $time = $data->{data}[$i]->{dt} + $time_inc * $offset;
    sleep $time_delay;
  }
}


sub k_to_f {
  my $kelvin = shift;
  return sprintf('%.02f', $kelvin * 9 / 5 - 459.67);
}
