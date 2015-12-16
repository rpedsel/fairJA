set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.0075, <2> 32.0819, <3> 35.1923, <4> 32.6011, <5> 36.9326, <6> 40.6703, <7> 6.0785, <8> 28.5565, <9> 44.7719, <10> 16.8876;
param workload[JOB] := <1> 729.4051, <2> 1029.2483, <3> 1238.498, <4> 1062.8317, <5> 1364.0169, <6> 1654.0733, <7> 36.9482, <8> 815.4737, <9> 2004.523, <10> 285.191;
param capacity[MACHINE] := <1> 10220.2092, <2> 10220.2092, <3> 10220.2092;

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
