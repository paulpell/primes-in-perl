#!/usr/bin/env perl
use strict;
use warnings;

my @primes = (2,3,5,7,11,13);
my $extension_num = 100;

# a function that computes new primes, bigger than the ones we knew.
sub extendPrimes {
	my $i = $primes[$#primes]; #the current last prime
	foreach( 1 .. $extension_num ) {
		$i += 2;
		@primes = (@primes, $i) if(isPrime($i));
	}
}

# this function just checks, for all the primes we know now,
# if the argument is divisible by one of them.
sub isPrime {
	my $arg = shift;
	my $bound = sqrt($arg);
	my $j = 0;
	my $i = 0;
	while( $i <= $bound){
		extendPrimes if($j > $#primes);
		$i = $primes[$j];
		return 0 if($arg % $i == 0);
		$j++;
	}
	return 1;
}

my $foo = 1;
foreach (@primes) {
	$foo *= $_;
}
$foo++; # we now know it IS prime =)

print "hehe\n" if(isPrime($foo));

print "$foo\n";
print "1009\n" if(isPrime(1009));
