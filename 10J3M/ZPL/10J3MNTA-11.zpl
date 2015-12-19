set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.8292, <2> 22.0882, <3> 23.3741, <4> 25.2308, <5> 8.893, <6> 22.6353, <7> 29.2045, <8> 25.6799, <9> 33.1932, <10> 26.2276;
param workload[JOB] := <1> 950.4396, <2> 487.8886, <3> 546.3486, <4> 636.5933, <5> 79.0854, <6> 512.3568, <7> 852.9028, <8> 659.4573, <9> 1101.7885, <10> 687.887;
param capacity[MACHINE] := <1> 1628.687, <2> 1628.687, <3> 1628.687;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
