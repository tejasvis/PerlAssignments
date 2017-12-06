#!/usr/bin/perl -w
use strict;
use List::Util qw ( min max);
&driver();
sub nxtMove
{
	my ($index,$n) = @_;
	if((($index) lt 0)||($index ge ($n*$n)))
	{
		return 1;
	}
	return 0;
}
sub myKnight
{
	my $index = $_[0];print "index = $index\n";
	my $n = $_[1]; print "n = $n\n";
	my @board = @{$_[2]};print "@board\n";
	my $row = int($index/$n);
	my $col = $index % $n;
	my @horz = qw( 2 1 -1 -2 -2 -1 1 2);
	my @vert = qw(-1 -2 -2 -1 1 2 2 1);
	my $count = 0;
	my @posIndex=();
	foreach my $m(0..7)
	{
		my $temprow = $row + $vert[$m];
		my $tempcol = $col + $horz[$m];
		my $tempIndex = ($temprow*$n)+$tempcol;
		if(nxtMove($tempIndex,$n))
		{
			my @posIndex;		
			if($board[$tempIndex] eq 0)
			{
				push(@posIndex, $tempIndex);
			}			
	}
	}
	if($#posIndex)
	{
		my $num = int(rand($#posIndex + 1));
		my $ind = $posIndex[$num];
		$board[$ind]=1;
	$count++;
		myKnight($ind,$n,\@board);
	}
	else{return $count;}		
return $count;
}
#sub getStart
#{
	#srand(1); 

#	my $n = $_[0];print "n = $n\n";
	#	my $s=int(rand(16));
	
#my $N = $_[1];print "N= $N\n";
#	my $F = $_[2];print "F = $F\n";
#	my $iter=1;
#	my @count_list=();
#	my $M=0;
#	if($N<$F){$M = $N;}
#	else{$M = int($N / $F);}
#print (rand($n*$n));print"\n";
#	while($iter le $N)
#	{
	
#	my $rand_value=int( rand ($n*$n ));
#		my @board = 1..($n*$n);
#		@board = (0) x @board;
#		$board[$start] = 1;
#print "$rand_value\n";
#		my $value= myKnight($start, $n, \@board);
#		if(($iter % $M) eq 0)
#		{	
     #			my $new_start = $start + 1;
#			my $row = int($start/$n);
#			my $col = $start%$n;
#			print "Trial Number: $iter \n";
#			print "Random starting point: ($row, $col)\n";
#			print "Total num of squares touched: $value \n"
#		}
#		push(@count_list, $value);
#		$iter = $iter + 1;
#	}
#	return @count_list;
#}
sub printResults
{
	my ($N,$min_value,$max_value,$avg) = @_;
	print "Total number of trails: $N\n";
	print "Minimum number of squares touched: $min_value\n";
	print "Maximum number of squares touched: $max_value\n";
	print "Average number of sqares touched: $avg\n";
}
sub driver
{
	my $n = $ARGV[0];
	my $N = $ARGV[1];
	my $F = $ARGV[2];
	$n = 1 unless(defined($n));
	$N = 1 unless(defined($N));
	$F = 10 unless(defined($F));
	srand(1);
	my @new_list = &getStart($n,$N,$F);
	my $min =0;
$min= min(@new_list);
	my $max =0;
$max= max(@new_list);	
	my $sum = 0;
	my $avg=0;
	foreach my $m (@new_list)
	{
		$sum = $sum + $m;

	}
	$avg = $sum/$N;
	printResults($N,$min,$max,$avg);
}
sub getStart{
my @count_list=();
my $n=$_[0];print "$n\n";
my $value=int(rand($n*$n));
print "$value\n";
return @count_list;
}
